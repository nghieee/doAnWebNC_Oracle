-- =============================================================================
-- ĐỒ ÁN MÔN HỌC: CÁC HỆ QUẢN TRỊ CƠ SỞ DỮ LIỆU (ORACLE 19C)
-- SCRIPT 05: KỊCH BẢN KIỂM THỬ (TEST CASES FOR PROCEDURES & TRIGGERS)
-- Hệ thống: Nhà thuốc trực tuyến Long Châu
-- =============================================================================

SET SERVEROUTPUT ON;
SET DEFINE OFF;

-- =============================================================================
-- TEST CASE 1: ĐỒNG BỘ TỒN KHO TỰ ĐỘNG (Trigger: trg_WarehouseStock_Sync)
-- Mục tiêu: Kiểm tra xem khi sửa tồn kho trong WarehouseStocks thì StockQuantity ở Products có tự nhảy không.
-- =============================================================================
PROMPT === TEST CASE 1: TRIGGER TRG_WAREHOUSESTOCK_SYNC ===;

-- Bước 1: Xem tồn kho trước khi test
SELECT "ProductId", "ProductName", "StockQuantity" 
FROM "Products" WHERE "ProductId" = 6;

-- Bước 2: Thay đổi số lượng tồn kho trong kho 1
UPDATE "WarehouseStocks" 
SET "QuantityOnHand" = 88 
WHERE "ProductId" = 6 AND "WarehouseId" = 1;

-- Bước 3: Xem lại bảng Products (StockQuantity phải tự động thành 88)
SELECT "ProductId", "ProductName", "StockQuantity" 
FROM "Products" WHERE "ProductId" = 6;

-- Bước 4: Khôi phục dữ liệu ban đầu
ROLLBACK;


-- =============================================================================
-- TEST CASE 2: TÍCH ĐIỂM LOYALTY TỰ ĐỘNG KHI GIAO HÀNG (Trigger: trg_Order_EarnPoints)
-- Mục tiêu: Chuyển trạng thái đơn hàng sang 'Đã giao', điểm thưởng phải tự động cộng vào UserRankInfos.
-- =============================================================================
PROMPT === TEST CASE 2: TRIGGER TRG_ORDER_EARNPOINTS ===;

-- Bước 1: Xem điểm và tổng chi tiêu trước khi test
SELECT "UserId", "LoyaltyPoints", "TotalSpent" 
FROM "UserRankInfos" WHERE "UserId" = 'USER_CUST_01';

-- Bước 2: Đổi trạng thái đơn hàng 101 thành 'Đã giao'
UPDATE "Orders" 
SET "Status" = 'Đã giao' 
WHERE "OrderId" = 101;

-- Bước 3: Kiểm tra điểm đã tự động tăng chưa (1.000đ = 1 điểm)
SELECT "UserId", "LoyaltyPoints", "TotalSpent" 
FROM "UserRankInfos" WHERE "UserId" = 'USER_CUST_01';

-- Bước 4: Khôi phục dữ liệu ban đầu
ROLLBACK;


-- =============================================================================
-- TEST CASE 3: RÀNG BUỘC HẠN SỬ DỤNG LÔ THUỐC (Trigger: trg_ValidateExpiryDate)
-- Mục tiêu: Thử nhập lô thuốc HSD < 90 ngày -> Oracle phải chặn và phát lỗi ORA-20003.
-- =============================================================================
PROMPT === TEST CASE 3: TRIGGER TRG_VALIDATEEXPIRYDATE ===;

BEGIN
    INSERT INTO "ProductBatches" ("ProductId", "WarehouseId", "BatchNo", "ExpiryDate", "QuantityOnHand", "UnitCost")
    VALUES (6, 1, 'BATCH_TEST_FAIL', SYSDATE + 10, 100, 2000);
    DBMS_OUTPUT.PUT_LINE('LỖI: Trigger không hoạt động!');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('THÀNH CÔNG: Oracle đã chặn và báo lỗi -> ' || SQLERRM);
END;
/


-- =============================================================================
-- TEST CASE 4: THỰC THI HÀM TÍNH VOUCHER (Function: FUNC_CALCULATE_DISCOUNT)
-- Mục tiêu: Kiểm tra hàm tính số tiền giảm giá cho đơn hàng.
-- =============================================================================
PROMPT === TEST CASE 4: FUNCTION FUNC_CALCULATE_DISCOUNT ===;

SELECT FUNC_CALCULATE_DISCOUNT('LONGCHAU10', 500000) AS SO_TIEN_GIAM_500K FROM DUAL;
SELECT FUNC_CALCULATE_DISCOUNT('LONGCHAU10', 100000) AS SO_TIEN_GIAM_100K_THIEU_DK FROM DUAL;


-- =============================================================================
-- TEST CASE 5: THÊM MỚI SẢN PHẨM QUA PROCEDURE (Procedure: PROC_INSERT_PRODUCT)
-- Mục tiêu: Thêm sản phẩm mới và lấy ra ProductId tự sinh.
-- =============================================================================
PROMPT === TEST CASE 5: PROCEDURE PROC_INSERT_PRODUCT ===;

DECLARE
    v_NewId NUMBER;
BEGIN
    PROC_INSERT_PRODUCT(
        p_ProductName => N'Sản phẩm Test Procedure Oracle',
        p_Sku => 'SKU_TEST_01',
        p_Barcode => '893999888777',
        p_Price => 99000,
        p_CategoryId => 19,
        p_SupplierId => 1,
        p_ProductId => v_NewId
    );
    DBMS_OUTPUT.PUT_LINE('THÀNH CÔNG: Đã thêm mới sản phẩm thành công với ID = ' || v_NewId);
END;
/
ROLLBACK;


-- =============================================================================
-- TEST CASE 6: CẬP NHẬT SẢN PHẨM QUA PROCEDURE (Procedure: PROC_UPDATE_PRODUCT)
-- Mục tiêu: Cập nhật giá bán và trạng thái sản phẩm ID = 6.
-- =============================================================================
PROMPT === TEST CASE 6: PROCEDURE PROC_UPDATE_PRODUCT ===;

BEGIN
    PROC_UPDATE_PRODUCT(
        p_ProductId => 6,
        p_ProductName => N'Kẹo con vịt C10 Domesco (Đã cập nhật giá)',
        p_Price => 6000,
        p_IsActive => 1
    );
    DBMS_OUTPUT.PUT_LINE('THÀNH CÔNG: Đã cập nhật sản phẩm ID = 6');
END;
/
SELECT "ProductId", "ProductName", "Price" FROM "Products" WHERE "ProductId" = 6;
ROLLBACK;


-- =============================================================================
-- TEST CASE 7: BÁO CÁO DOANH THU HÀNG THÁNG (Procedure: PROC_REVENUE_BY_MONTH)
-- Mục tiêu: Gọi Procedure trả về Cursor báo cáo doanh thu/lợi nhuận theo tháng năm 2026.
-- =============================================================================
PROMPT === TEST CASE 7: PROCEDURE PROC_REVENUE_BY_MONTH ===;

DECLARE
    v_Cursor SYS_REFCURSOR;
    v_Month VARCHAR2(10);
    v_Revenue NUMBER;
    v_COGS NUMBER;
    v_Profit NUMBER;
BEGIN
    PROC_REVENUE_BY_MONTH(2026, v_Cursor);
    LOOP
        FETCH v_Cursor INTO v_Month, v_Revenue, v_COGS, v_Profit;
        EXIT WHEN v_Cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Tháng: ' || v_Month || ' | Doanh thu: ' || v_Revenue || ' | Giá vốn: ' || v_COGS || ' | Lợi nhuận: ' || v_Profit);
    END LOOP;
    CLOSE v_Cursor;
END;
/


-- =============================================================================
-- TEST CASE 8: XỬ LÝ GIAO TÁC ĐẶT HÀNG NGUYÊN TỬ & XUẤT KHO FEFO
-- (Procedure: PROC_TRANSACTION_CHECKOUT)
-- Mục tiêu: Đặt hàng thử nghiệm, tự trừ kho lô theo FEFO và áp dụng Voucher trong 1 giao tác nguyên tử.
-- =============================================================================
PROMPT === TEST CASE 8: PROCEDURE PROC_TRANSACTION_CHECKOUT ===;

BEGIN
    PROC_TRANSACTION_CHECKOUT(
        p_UserId => 'USER_CUST_01',
        p_ShippingAddress => N'123 Đường Test, Q.1, TP.HCM',
        p_FullName => N'Người Dùng Test Checkout',
        p_Phone => '0999888777',
        p_PrescriptionNote => NULL,
        p_VoucherCode => 'LONGCHAU10',
        p_ProductId => 6,
        p_Quantity => 2,
        p_Price => 5000
    );
    DBMS_OUTPUT.PUT_LINE('THÀNH CÔNG: Giao tác Checkout bán hàng & trừ kho FEFO nguyên tử thành công!');
END;
/
ROLLBACK;


-- =============================================================================
-- TEST CASE 9: KIỂM TRA CÁC VAI TRÒ (ROLES), PROFILE VÀ TÀI KHOẢN (USERS)
-- Mục tiêu: Kiểm tra xem các Roles, Profile bảo mật và Users đã được tạo và gán quyền đúng chưa.
-- =============================================================================
PROMPT === TEST CASE 9: BẢO MẬT & PHÂN QUỀN ROLES / USERS / PROFILES ===;

-- 1. Xem danh sách các Roles đã khởi tạo trong Oracle
SELECT ROLE FROM ALL_ROLES WHERE ROLE LIKE 'R_%';

-- 2. Xem danh sách các Tài khoản nhân viên (Dùng ALL_USERS hoặc DBA_USERS nếu có quyền DBA)
SELECT USERNAME, CREATED FROM ALL_USERS WHERE USERNAME LIKE '%_LC';
-- Nếu đăng nhập bằng quyền Admin/SYSDBA có thể dùng câu dưới để xem cả PROFILE và ACCOUNT_STATUS:
-- SELECT USERNAME, PROFILE, ACCOUNT_STATUS, CREATED FROM DBA_USERS WHERE USERNAME LIKE '%_LC';

-- 3. Xem chi tiết các quyền Hạn (Privileges) cấp cho từng Role
SELECT ROLE, TABLE_NAME, PRIVILEGE FROM USER_TAB_PRIVS WHERE ROLE LIKE 'R_%' ORDER BY ROLE;

