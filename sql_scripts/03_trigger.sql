-- =============================================================================
-- ĐỒ ÁN MÔN HỌC: CÁC HỆ QUẢN TRỊ CƠ SỞ DỮ LIỆU (ORACLE 19C)
-- SCRIPT 03: LẬP TRÌNH DATABASE TRIGGERS
-- Hệ thống: Nhà thuốc trực tuyến Long Châu
-- =============================================================================

-- 1. Trigger tự động đồng bộ tổng số lượng tồn kho của sản phẩm khi thay đổi tồn kho ở các kho
CREATE OR REPLACE TRIGGER trg_WarehouseStock_Sync
AFTER INSERT OR UPDATE OR DELETE ON "WarehouseStocks"
FOR EACH ROW
DECLARE
    v_ProductId NUMBER(10);
    v_TotalStock NUMBER(10);
BEGIN
    IF INSERTING OR UPDATING THEN
        v_ProductId := :NEW."ProductId";
    ELSE
        v_ProductId := :OLD."ProductId";
    END IF;
    
    SELECT NVL(SUM("QuantityOnHand"), 0) INTO v_TotalStock
    FROM "WarehouseStocks"
    WHERE "ProductId" = v_ProductId;
    
    UPDATE "Products"
    SET "StockQuantity" = v_TotalStock
    WHERE "ProductId" = v_ProductId;
END;
/

-- 2. Trigger tự động cộng điểm tích lũy (Loyalty Points) và cập nhật tổng chi tiêu khi đơn hàng chuyển sang 'Đã giao'
CREATE OR REPLACE TRIGGER trg_Order_EarnPoints
AFTER UPDATE OF "Status" ON "Orders"
FOR EACH ROW
DECLARE
    v_EarnPoints NUMBER(10);
BEGIN
    IF :NEW."Status" = N'Đã giao' AND (:OLD."Status" IS NULL OR :OLD."Status" <> N'Đã giao') THEN
        v_EarnPoints := TRUNC(:NEW."TotalAmount" / 1000);
        
        IF v_EarnPoints > 0 AND :NEW."UserId" IS NOT NULL THEN
            UPDATE "UserRankInfos"
            SET "LoyaltyPoints" = "LoyaltyPoints" + v_EarnPoints,
                "TotalSpent" = "TotalSpent" + :NEW."TotalAmount",
                "TotalSpent6Months" = "TotalSpent6Months" + :NEW."TotalAmount"
            WHERE "UserId" = :NEW."UserId";
            
            INSERT INTO "DbActivityLogs" ("UserId", "Action", "EntityName", "EntityId", "Description", "CreatedAt")
            VALUES (:NEW."UserId", 'EARN_LOYALTY_POINTS', 'Orders', TO_CHAR(:NEW."OrderId"), 
                    'Tich luy +' || TO_CHAR(v_EarnPoints) || ' diem tu don hang ID ' || TO_CHAR(:NEW."OrderId"), SYSTIMESTAMP);
        END IF;
    END IF;
END;
/

-- 3. Trigger kiểm tra ràng buộc hạn sử dụng của lô thuốc khi nhập kho (Còn tối thiểu 90 ngày)
CREATE OR REPLACE TRIGGER trg_ValidateExpiryDate
BEFORE INSERT OR UPDATE ON "ProductBatches"
FOR EACH ROW
BEGIN
    IF :NEW."ExpiryDate" < SYSDATE + 90 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Loi nghiep vu: Han su dung cua lo duoc pham nhap kho phai con toi thieu 90 ngay.');
    END IF;
END;
/
