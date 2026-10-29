-- =============================================================================
-- ĐỒ ÁN MÔN HỌC: CÁC HỆ QUẢN TRỊ CƠ SỞ DỮ LIỆU (ORACLE 19C)
-- SCRIPT 04: GIÁO TÁC (TRANSACTION) VÀ PHÂN QUỀN BẢO MẬT (SECURITY)
-- Hệ thống: Nhà thuốc trực tuyến Long Châu
-- =============================================================================

-- =============================================================================
-- 1. QUẢN LÝ GIAO TÁC (TRANSACTION CONTROL & ACCORDING TO FEFO & RACE CONDITION)
-- =============================================================================

-- Procedure thực hiện Checkout đặt hàng nguyên tử (Atomic Transaction)
CREATE OR REPLACE PROCEDURE PROC_TRANSACTION_CHECKOUT (
    p_UserId IN VARCHAR2,
    p_ShippingAddress IN NVARCHAR2,
    p_FullName IN NVARCHAR2,
    p_Phone IN VARCHAR2,
    p_PrescriptionNote IN NVARCHAR2,
    p_VoucherCode IN VARCHAR2,
    p_ProductId IN NUMBER,
    p_Quantity IN NUMBER,
    p_Price IN NUMBER
) AS
    v_OrderId NUMBER(10);
    v_VoucherId NUMBER(10);
    v_MaxUsage NUMBER(10);
    v_UsedCount NUMBER(10);
    v_DiscountAmount NUMBER(18, 2) := 0;
    v_DiscountPercent NUMBER(5, 2) := 0;
    v_TotalAmount NUMBER(18, 2);
    v_StockOnHand NUMBER(10);
    v_VoucherValid NUMBER(1) := 1;
BEGIN
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    -- Khóa dòng dữ liệu của sản phẩm tránh Race condition
    SELECT "StockQuantity" INTO v_StockOnHand
    FROM "Products"
    WHERE "ProductId" = p_ProductId
    FOR UPDATE;

    IF v_StockOnHand < p_Quantity THEN
        RAISE_APPLICATION_ERROR(-20010, 'San pham da het hang hoac khong du ton kho.');
    END IF;

    v_TotalAmount := p_Quantity * p_Price;

    SAVEPOINT sp_voucher_processing;

    BEGIN
        IF p_VoucherCode IS NOT NULL THEN
            SELECT "VoucherId", "MaxUsage", "UsedCount", "DiscountAmount", "PercentValue"
            INTO v_VoucherId, v_MaxUsage, v_UsedCount, v_DiscountAmount, v_DiscountPercent
            FROM "Vouchers"
            WHERE "Code" = p_VoucherCode AND "IsActive" = 1 AND "ExpiryDate" >= SYSDATE
            FOR UPDATE;

            IF v_MaxUsage IS NOT NULL AND v_UsedCount >= v_MaxUsage THEN
                v_VoucherValid := 0;
            ELSE
                IF v_DiscountAmount > 0 THEN
                    v_TotalAmount := v_TotalAmount - v_DiscountAmount;
                ELSIF v_DiscountPercent > 0 THEN
                    v_TotalAmount := v_TotalAmount - (v_TotalAmount * (v_DiscountPercent / 100));
                END IF;
                IF v_TotalAmount < 0 THEN v_TotalAmount := 0; END IF;
            END IF;
        END IF;

        IF v_VoucherValid = 0 THEN
            ROLLBACK TO sp_voucher_processing;
            v_TotalAmount := p_Quantity * p_Price;
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            ROLLBACK TO sp_voucher_processing;
            v_TotalAmount := p_Quantity * p_Price;
    END;

    INSERT INTO "Orders" ("UserId", "TotalAmount", "Status", "ShippingAddress", "PaymentStatus", "FullName", "Phone", "VoucherCode", "VoucherDiscount", "PrescriptionNote")
    VALUES (p_UserId, v_TotalAmount, N'Đã xác nhận', p_ShippingAddress, N'Chưa thanh toán', p_FullName, p_Phone, p_VoucherCode, (p_Quantity * p_Price) - v_TotalAmount, p_PrescriptionNote)
    RETURNING "OrderId" INTO v_OrderId;

    INSERT INTO "OrderItems" ("OrderId", "ProductId", "Quantity", "Price")
    VALUES (v_OrderId, p_ProductId, p_Quantity, p_Price);

    -- Trừ tồn kho lô theo nguyên tắc FEFO (Hạn ngắn hơn xuất trước)
    DECLARE
        v_QtyNeeded NUMBER(10) := p_Quantity;
    BEGIN
        FOR batch_rec IN (
            SELECT "ProductBatchId", "QuantityOnHand"
            FROM "ProductBatches"
            WHERE "ProductId" = p_ProductId AND "QuantityOnHand" > 0
            ORDER BY "ExpiryDate" ASC
        ) LOOP
            IF v_QtyNeeded <= 0 THEN
                EXIT;
            END IF;

            IF batch_rec."QuantityOnHand" >= v_QtyNeeded THEN
                UPDATE "ProductBatches"
                SET "QuantityOnHand" = "QuantityOnHand" - v_QtyNeeded
                WHERE "ProductBatchId" = batch_rec."ProductBatchId";
                
                INSERT INTO "InventoryTransactions" ("ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId")
                VALUES (p_ProductId, 1, 'BatchSale', v_QtyNeeded, batch_rec."QuantityOnHand", batch_rec."QuantityOnHand" - v_QtyNeeded, v_OrderId);
                
                v_QtyNeeded := 0;
            ELSE
                UPDATE "ProductBatches"
                SET "QuantityOnHand" = 0
                WHERE "ProductBatchId" = batch_rec."ProductBatchId";
                
                INSERT INTO "InventoryTransactions" ("ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId")
                VALUES (p_ProductId, 1, 'BatchSale', batch_rec."QuantityOnHand", batch_rec."QuantityOnHand", 0, v_OrderId);
                
                v_QtyNeeded := v_QtyNeeded - batch_rec."QuantityOnHand";
            END IF;
        END LOOP;

        IF v_QtyNeeded > 0 THEN
            RAISE_APPLICATION_ERROR(-20011, 'Loi thuc te: Cac lo hang khong du de dap ung nguyen tac FEFO.');
        END IF;
    END;

    UPDATE "WarehouseStocks"
    SET "QuantityOnHand" = "QuantityOnHand" - p_Quantity
    WHERE "ProductId" = p_ProductId AND "WarehouseId" = 1;

    IF p_VoucherCode IS NOT NULL AND v_VoucherValid = 1 THEN
        UPDATE "Vouchers"
        SET "UsedCount" = "UsedCount" + 1
        WHERE "Code" = p_VoucherCode;

        INSERT INTO "VoucherRedemptions" ("VoucherId", "UserId", "OrderId", "DiscountAmount")
        VALUES (v_VoucherId, p_UserId, v_OrderId, (p_Quantity * p_Price) - v_TotalAmount);
    END IF;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/

-- =============================================================================
-- 2. QUẢN TRỊ BẢO MẬT: PROFILE, ROLES VÀ USERS
-- =============================================================================

-- 2.1. Cài đặt Profile bảo mật cho nhân viên
CREATE PROFILE PROFILE_STAFF LIMIT
    FAILED_LOGIN_ATTEMPTS 5
    PASSWORD_LIFE_TIME 90
    PASSWORD_LOCK_TIME 1/24
    PASSWORD_GRACE_TIME 7;

-- 2.2. Tạo lập các vai trò (Roles) trong hệ thống
CREATE ROLE R_ADMIN;
CREATE ROLE R_WAREHOUSE;
CREATE ROLE R_SALES;
CREATE ROLE R_CSKH;

-- 2.3. Cấp phát quyền hạn (Privileges) cho các Roles
-- a) Vai trò Admin
GRANT ALL PRIVILEGES TO R_ADMIN;

-- b) Vai trò Quản lý kho (R_WAREHOUSE)
GRANT SELECT ON "Products" TO R_WAREHOUSE;
GRANT SELECT ON "Categories" TO R_WAREHOUSE;
GRANT SELECT ON "Suppliers" TO R_WAREHOUSE;
GRANT SELECT, INSERT, UPDATE, DELETE ON "Warehouses" TO R_WAREHOUSE;
GRANT SELECT, INSERT, UPDATE, DELETE ON "WarehouseStocks" TO R_WAREHOUSE;
GRANT SELECT, INSERT, UPDATE, DELETE ON "ProductBatches" TO R_WAREHOUSE;
GRANT SELECT, INSERT ON "InventoryTransactions" TO R_WAREHOUSE;
GRANT SELECT ON "DbActivityLogs" TO R_WAREHOUSE;
GRANT EXECUTE ON PROC_MONTHLY_CLOSE TO R_WAREHOUSE;

-- c) Vai trò Bán hàng trực tuyến (R_SALES)
GRANT SELECT ON "Products" TO R_SALES;
GRANT SELECT ON "Categories" TO R_SALES;
GRANT SELECT, INSERT, UPDATE ON "Orders" TO R_SALES;
GRANT SELECT, INSERT, UPDATE ON "OrderItems" TO R_SALES;
GRANT SELECT, INSERT, UPDATE ON "Payments" TO R_SALES;
GRANT SELECT, INSERT, UPDATE ON "VoucherRedemptions" TO R_SALES;
GRANT SELECT, UPDATE ON "Vouchers" TO R_SALES;
GRANT EXECUTE ON PROC_TRANSACTION_CHECKOUT TO R_SALES;

-- d) Vai trò Hỗ trợ khách hàng (R_CSKH)
GRANT SELECT ON "Orders" TO R_CSKH;
GRANT SELECT ON "Products" TO R_CSKH;

-- 2.4. Khởi tạo tài khoản Người dùng (Users) và gán Roles
-- 1. Tài khoản Admin (Mật khẩu: 12345)
CREATE USER admin_lc IDENTIFIED BY "12345" PROFILE PROFILE_STAFF;
GRANT CREATE SESSION TO admin_lc;
GRANT R_ADMIN TO admin_lc;

-- 2. Tài khoản Trưởng kho (Mật khẩu: 12345)
CREATE USER warehouse_lc IDENTIFIED BY "12345" PROFILE PROFILE_STAFF;
GRANT CREATE SESSION TO warehouse_lc;
GRANT R_WAREHOUSE TO warehouse_lc;

-- 3. Tài khoản CSKH (Mật khẩu: 12345)
CREATE USER support_lc IDENTIFIED BY "12345" PROFILE PROFILE_STAFF;
GRANT CREATE SESSION TO support_lc;
GRANT R_CSKH TO support_lc;
