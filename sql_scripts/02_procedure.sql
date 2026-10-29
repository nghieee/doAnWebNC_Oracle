-- =============================================================================
-- ĐỒ ÁN MÔN HỌC: CÁC HỆ QUẢN TRỊ CƠ SỞ DỮ LIỆU (ORACLE 19C)
-- SCRIPT 02: LẬP TRÌNH STORED PROCEDURES VÀ FUNCTIONS
-- Hệ thống: Nhà thuốc trực tuyến Long Châu
-- =============================================================================

-- =============================================================================
-- 1. NHÓM THAO TÁC CRUD SẢN PHẨM
-- =============================================================================

-- 1.1. Procedure thêm mới sản phẩm
CREATE OR REPLACE PROCEDURE PROC_INSERT_PRODUCT (
    p_ProductName IN NVARCHAR2,
    p_Sku IN VARCHAR2,
    p_Barcode IN VARCHAR2,
    p_Price IN NUMBER,
    p_CategoryId IN NUMBER,
    p_SupplierId IN NUMBER,
    p_ProductId OUT NUMBER
) AS
BEGIN
    INSERT INTO "Products" ("ProductName", "Sku", "Barcode", "Price", "CategoryId", "SupplierId")
    VALUES (p_ProductName, p_Sku, p_Barcode, p_Price, p_CategoryId, p_SupplierId)
    RETURNING "ProductId" INTO p_ProductId;
    
    COMMIT;
END;
/

-- 1.2. Procedure cập nhật thông tin sản phẩm
CREATE OR REPLACE PROCEDURE PROC_UPDATE_PRODUCT (
    p_ProductId IN NUMBER,
    p_ProductName IN NVARCHAR2,
    p_Price IN NUMBER,
    p_IsActive IN NUMBER
) AS
BEGIN
    UPDATE "Products"
    SET "ProductName" = p_ProductName,
        "Price" = p_Price,
        "IsActive" = p_IsActive
    WHERE "ProductId" = p_ProductId;
    
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Khong tim thay san pham can cap nhat.');
    END IF;
    
    COMMIT;
END;
/

-- =============================================================================
-- 2. NHÓM NGHIỆP VỤ BÁN HÀNG VÀ VOUCHER
-- =============================================================================

-- 2.1. Function tính số tiền giảm giá từ Voucher
CREATE OR REPLACE FUNCTION FUNC_CALCULATE_DISCOUNT (
    p_VoucherCode IN VARCHAR2,
    p_OrderAmount IN NUMBER
) RETURN NUMBER AS
    v_Discount NUMBER(18, 2) := 0;
    v_MinOrder NUMBER(18, 2);
    v_DiscountAmount NUMBER(18, 2);
    v_Percent NUMBER(5, 2);
    v_ExpiryDate DATE;
    v_MaxUsage NUMBER(10);
    v_UsedCount NUMBER(10);
    v_IsActive NUMBER(1);
BEGIN
    SELECT "MinOrderAmount", "DiscountAmount", "PercentValue", "ExpiryDate", "MaxUsage", "UsedCount", "IsActive"
    INTO v_MinOrder, v_DiscountAmount, v_Percent, v_ExpiryDate, v_MaxUsage, v_UsedCount, v_IsActive
    FROM "Vouchers"
    WHERE "Code" = p_VoucherCode;
    
    -- Kiểm tra tính hợp lệ
    IF v_IsActive = 0 OR v_ExpiryDate < SYSDATE THEN
        RETURN 0;
    END IF;
    
    IF v_MaxUsage IS NOT NULL AND v_UsedCount >= v_MaxUsage THEN
        RETURN 0;
    END IF;
    
    IF p_OrderAmount < v_MinOrder THEN
        RETURN 0;
    END IF;
    
    -- Tính tiền khấu trừ
    IF v_DiscountAmount > 0 THEN
        v_Discount := v_DiscountAmount;
    ELSIF v_Percent > 0 THEN
        v_Discount := p_OrderAmount * (v_Percent / 100);
    END IF;
    
    RETURN v_Discount;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        RETURN 0;
END;
/

-- 2.2. Procedure khởi tạo đơn hàng và thông tin y tế
CREATE OR REPLACE PROCEDURE PROC_CREATE_ORDER (
    p_UserId IN VARCHAR2,
    p_TotalAmount IN NUMBER,
    p_ShippingAddress IN NVARCHAR2,
    p_FullName IN NVARCHAR2,
    p_Phone IN VARCHAR2,
    p_PrescriptionNote IN NVARCHAR2,
    p_OrderId OUT NUMBER
) AS
BEGIN
    IF p_ShippingAddress IS NULL OR p_FullName IS NULL THEN
        RAISE_APPLICATION_ERROR(-20002, 'Thieu thong tin giao hang.');
    END IF;
    
    INSERT INTO "Orders" ("UserId", "TotalAmount", "Status", "ShippingAddress", "PaymentStatus", "FullName", "Phone", "PrescriptionNote")
    VALUES (p_UserId, p_TotalAmount, N'Chờ xác nhận', p_ShippingAddress, N'Chưa thanh toán', p_FullName, p_Phone, p_PrescriptionNote)
    RETURNING "OrderId" INTO p_OrderId;
    
    COMMIT;
END;
/

-- =============================================================================
-- 3. NHÓM BATCH PROCESSING VÀ BÁO CÁO THỐNG KÊ
-- =============================================================================

-- 3.1. Procedure chốt sổ doanh số và đồng bộ lượng bán hàng tháng
CREATE OR REPLACE PROCEDURE PROC_MONTHLY_CLOSE AS
BEGIN
    FOR r IN (
        SELECT "ProductId", SUM("Quantity") AS TotalSold
        FROM "OrderItems" oi
        JOIN "Orders" o ON oi."OrderId" = o."OrderId"
        WHERE o."Status" = N'Đã giao' AND o."OrderDate" >= ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -1)
        GROUP BY "ProductId"
    ) LOOP
        UPDATE "Products"
        SET "SoldQuantity" = NVL("SoldQuantity", 0) + r.TotalSold
        WHERE "ProductId" = r."ProductId";
    END LOOP;
    
    INSERT INTO "DbActivityLogs" ("UserId", "Action", "EntityName", "Description", "CreatedAt")
    VALUES ('SYSTEM', 'BATCH_JOB_COMPLETED', 'PROC_MONTHLY_CLOSE', 'Chot so ban hang dinh ky hang thang hoan tat.', SYSTIMESTAMP);
    
    COMMIT;
END;
/

-- 3.2. Procedure xuất báo cáo doanh thu, giá vốn và lợi nhuận gộp theo tháng
CREATE OR REPLACE PROCEDURE PROC_REVENUE_BY_MONTH (
    p_Year IN NUMBER,
    p_Cursor OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_Cursor FOR
        SELECT 
            TO_CHAR(o."OrderDate", 'MM') AS Month,
            SUM(o."TotalAmount") AS TotalRevenue,
            SUM(oi."Quantity" * NVL(p."CostPrice", 0)) AS TotalCOGS,
            SUM(o."TotalAmount") - SUM(oi."Quantity" * NVL(p."CostPrice", 0)) AS GrossProfit
        FROM "Orders" o
        JOIN "OrderItems" oi ON o."OrderId" = oi."OrderId"
        JOIN "Products" p ON oi."ProductId" = p."ProductId"
        WHERE o."Status" = N'Đã giao' AND TO_CHAR(o."OrderDate", 'YYYY') = TO_CHAR(p_Year)
        GROUP BY TO_CHAR(o."OrderDate", 'MM')
        ORDER BY Month ASC;
END;
/
