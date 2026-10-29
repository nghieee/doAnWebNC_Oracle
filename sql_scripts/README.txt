=============================================================================
HƯỚNG DẪN THỰC THI HỆ THỐNG SCRIPT CƠ SỞ DỮ LIỆU ORACLE 19C
Đồ án: Nhà thuốc trực tuyến Long Châu
Môn học: Các Hệ Quản Trị Cơ Sở Dữ Liệu
=============================================================================

Để khởi tạo toàn bộ CSDL trên Oracle Database (bằng SQL*Plus, Oracle SQL Developer, hoặc DBeaver), vui lòng chạy các file script theo ĐÚNG THỨ TỰ sau:

-----------------------------------------------------------------------------
THỨ TỰ THỰC THI CHUẨN:
-----------------------------------------------------------------------------

Step 1: Run 01_schema_ddl.sql
  - Khởi tạo 17 bảng dữ liệu (Tables), các ràng buộc PK, FK, CHECK, UNIQUE.
  - Tạo Views báo cáo (V_ProductCatalog, V_MonthlyRevenue).
  - Tạo Indexes tối ưu truy vấn (IDX_Products_Name, IDX_Orders_OrderDate, IDX_Batches_ExpiryDate).

Step 2: Run 01b_sample_data.sql
  - Chèn Dữ liệu Mẫu Thực Tế (Master Data & Transactions): Categories, Suppliers, Products, AspNetUsers, UserRankInfos, Vouchers, Warehouses, WarehouseStocks, ProductBatches, Orders, OrderItems, Payments.
  - Tạo Stored Procedure `PROC_GENERATE_LARGE_DATA` tự động sinh dữ liệu lớn.

Step 3: Run 02_procedure.sql
  - Tạo các Stored Procedures & Functions xử lý nghiệp vụ:
    + PROC_INSERT_PRODUCT, PROC_UPDATE_PRODUCT
    + FUNC_CALCULATE_DISCOUNT
    + PROC_CREATE_ORDER
    + PROC_MONTHLY_CLOSE
    + PROC_REVENUE_BY_MONTH

Step 4: Run 03_trigger.sql
  - Tạo các Database Triggers tự động hóa & kiểm soát ràng buộc:
    + trg_WarehouseStock_Sync (Đồng bộ tồn kho)
    + trg_Order_EarnPoints (Tích điểm Loyalty)
    + trg_ValidateExpiryDate (Kiểm tra HSD lô thuốc nhập kho)

Step 5: Run 04_security_transaction.sql
  - Tạo thủ tục giao tác bán hàng nguyên tử (PROC_TRANSACTION_CHECKOUT).
  - Tạo Profile bảo mật (PROFILE_STAFF).
  - Tạo các Roles (R_ADMIN, R_WAREHOUSE, R_SALES, R_CSKH) và cấp quyền (GRANT).
  - Tạo các tài khoản người dùng (admin_lc, warehouse_lc, support_lc) và gán Roles.

Step 6: Run 05_test_cases.sql (KIỂM THỬ HE THỐNG)
  - Chạy kịch bản test 8 Test Cases kiểm tra tự động các Triggers, Stored Procedures, Functions và Transaction Checkout.
  - Tất cả các lệnh test đều có sẵn lệnh `ROLLBACK;` để đảm bảo KHÔNG LÀM HỎNG dữ liệu hiện tại của bạn.

=============================================================================
KHI THI VẤN ĐÁP (NẾU GIẢNG VIÊN YÊU CẦU DỮ LIỆU LỚN >= 100.000 BẢN GHI):
=============================================================================
Theo yêu cầu đồ án môn học, các bảng giao dịch nghiệp vụ phải có số liệu lớn (tối thiểu 100.000 records).

Trong file 01b_sample_data.sql đã có sẵn thủ tục sinh dữ liệu siêu tốc.
Chỉ cần thực thi 1 câu lệnh sau trong Oracle SQL Developer / SQL*Plus / DBeaver:

    EXEC PROC_GENERATE_LARGE_DATA(100000);

Hệ thống sẽ tự động tạo 100.000 đơn hàng & chi tiết đơn hàng chỉ trong 5-10 giây!

=============================================================================
LƯU Ý KHI CHẠY TRÊN ORACLE:
- Chạy các script bằng tài khoản có quyền SYSDBA hoặc User Schema có đủ quyền DDL/DCL.
- Ký tự `/` ở cuối các khối lệnh PL/SQL (Procedure, Function, Trigger) là bắt buộc trong Oracle.
=============================================================================
