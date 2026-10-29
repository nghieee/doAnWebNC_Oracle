-- =============================================================================
-- ĐỒ ÁN MÔN HỌC: CÁC HỆ QUẢN TRỊ CƠ SỞ DỮ LIỆU (ORACLE 19C)
-- SCRIPT 01B: DỮ LIỆU THỰC TẾ TRÍCH XUẤT TỪ CSDL HỆ THỐNG
-- =============================================================================

SET DEFINE OFF;

-- 1. BẢNG Categories (40 ban ghi)
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (5, N'Cải thiện tăng cường chức năng', NULL, 'tpcn_cai_thien_tang_cuong_chuc_nang_level_2.png', 19, 1, '2', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (6, N'Chăm sóc cơ thể', NULL, 'dmp_cham_soc_co_the_level_2.png', 20, 1, '2', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (9, N'Chăm sóc da mặt', NULL, 'dmp_cham_soc_da_mat_level_2.png', 20, 1, '2', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (10, N'Chăm sóc tóc - Da đầu', NULL, 'dmp_cham_soc_toc_da_dau_level_2.png', 20, 1, '2', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (11, N'Dụng cụ sơ cứu', NULL, 'tbyt_dung_cu_so_cuu_level_2.png', 22, 1, '2', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (12, N'Dụng cụ y tế', NULL, 'tbyt_dung_cu_y_te_level_2.png', 22, 1, '2', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (13, N'Hỗ trợ tiêu hóa', NULL, 'tpcn_ho_tro_tieu_hoa_level_2.png', 19, 1, '2', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (14, N'Mỹ phẩm trang điểm', NULL, 'dmp_my_pham_trang_diem_level_2.png', 20, 1, '2', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (15, N'Sinh lý - Nội tiết tố', NULL, 'tpcn_sinh_li_noi_tiet_to_level_2.png', 19, 1, '2', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (16, N'Sức khỏe tim mạch', NULL, 'tpcn_suc_khoe_tim_mach_level_2.png', 19, 1, '2', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (17, N'Vitamin - Khoáng chất', NULL, 'tpcn_vitamin_khoang_chat_level_2.png', 19, 1, '2', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (19, N'Thực phẩm chức năng', NULL, NULL, NULL, 0, '1', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (20, N'Dược mỹ phẩm', NULL, NULL, NULL, 0, '1', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (21, N'Chăm sóc cá nhân', NULL, NULL, NULL, 0, '1', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (22, N'Thiết bị y tế', NULL, NULL, NULL, 0, '1', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (23, N'Hỗ trợ làm đẹp', NULL, 'tpcn_ho_tro_lam_dep_level_2.png', 19, 1, '2', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (24, N'Vitamin C các loại', NULL, 'vitamin_c_cac_loai_level_3.png', 17, 0, '3', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (25, N'Vitamin tổng hợp', NULL, 'vitamin_tong_hop_level_3.png', 17, 0, '3', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (26, N'Bổ sung Canxi & Vitamin D', NULL, 'bo_sung_canxi_vitamin_d_level_3.png', 17, 0, '3', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (27, N'Dầu cá, Omega 3, DHA', NULL, 'dau_ca_omega_3_dha_level_3.png', 17, 0, '3', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (28, N'Bổ sung sắt & Axit Folic', NULL, 'bo_sung_sat_axit_folic_level_3.png', 17, 0, '3', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (29, N'Sinh lý nam', NULL, 'sinh_ly_nam_level_3.png', 15, 0, '3', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (30, N'Sinh lý nữ', NULL, 'sinh_ly_nu_level_3.png', 15, 0, '3', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (31, N'Chức năng gan', NULL, 'chuc_nang_gan_level_3.png', 5, 0, '3', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (33, N'Đại tràng', NULL, 'dai_trang_level_3.png', 13, 0, '3', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (34, N'Hỗ trợ trao đổi chất', NULL, 'ho_tro_trao_doi_chat_level_3.png', 13, 0, '3', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (35, N'Huyết áp', NULL, 'huyet_ap_level_3.png', 16, 0, '3', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (36, N'Táo bón', NULL, 'tao_bon_level_3.png', 13, 0, '3', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (37, N'Chăm sóc răng miệng', NULL, 'cscn_cham_soc_rang_mieng_level_2.png', 21, 0, '2', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (38, N'Hỗ trợ tình dục', NULL, 'cscn_ho_tro_tinh_duc_level_2.png', 21, 0, '2', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (39, N'Tinh dầu các loại', NULL, 'cscn_tinh_dau_cac_loai_level_2.png', 21, 0, '2', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (40, N'Vệ sinh cá nhân', NULL, 'cscn_ve_sinh_ca_nhan_level_2.png', 21, 0, '2', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (41, N'Bàn chải đánh răng', NULL, 'ban_chai_danh_rang_level_3.png', 37, 0, '3', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (42, N'Băng y tế', NULL, 'bang_y_te_level_3.png', 37, 0, '3', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (43, N'Bao cao su', NULL, 'bao_cao_su_level_3.png', 38, 0, '3', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (44, N'Bổ mắt - Bảo vệ mắt', NULL, 'bo_mat_bao_ve_mat_level_3.png', 6, 0, '3', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (45, N'Kem đánh răng', NULL, 'kem_danh_rang_level_3.png', 37, 0, '3', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (47, N'Khẩu trang y tế', NULL, 'khau_trang_y_te_level_3.png', 12, 0, '3', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (48, N'Nước rửa tay', NULL, 'nuoc_rua_tay_level_3.png', 40, 0, '3', 0);
INSERT INTO "Categories" ("CategoryId", "CategoryName", "Description", "ImageUrl", "ParentCategoryId", "IsFeature", "CategoryLevel", "ProductCount") VALUES (49, N'Khẩu trang y tế', NULL, 'tbyt_khau_trang_level_2.png', 22, 0, '2', 0);

-- 2. BẢNG Suppliers (3 ban ghi)
INSERT INTO "Suppliers" ("SupplierId", "Code", "Name", "Phone", "Email", "Address", "TaxCode", "IsActive") VALUES (1, 'NCC1', N'Nhà cung cấp 1', '123456789', 'ncc1@gmail.com', N'ncc1, Tân Định, Tp.HCM', NULL, 1);
INSERT INTO "Suppliers" ("SupplierId", "Code", "Name", "Phone", "Email", "Address", "TaxCode", "IsActive") VALUES (4, 'NCC2', N'Nhà cung cấp 2', '0987654321', 'ncc2@gmail.com', N'ncc2. Tân Định, Tp.HCM', NULL, 1);
INSERT INTO "Suppliers" ("SupplierId", "Code", "Name", "Phone", "Email", "Address", "TaxCode", "IsActive") VALUES (6, 'NCC3', N'Nhà cung cấp 3', '123123123', 'ncc3@gmail.com', N'ncc3. Tân Định, Tp.HCM', NULL, 1);

-- 3. BẢNG Products (10 ban ghi)
INSERT INTO "Products" ("ProductId", "ProductName", "Sku", "Barcode", "RegistrationNumber", "RequiresPrescription", "CostPrice", "Price", "Brand", "Package", "CategoryId", "SupplierId", "Ingredients", "Uses", "Dosage", "Contraindications", "IngredientUnit", "IsFeature", "Origin", "StockQuantity", "MinStockLevel", "IsActive", "Slug", "SoldQuantity") VALUES (6, N'Kẹo con vịt hỗ trợ tăng cường đề kháng Vitamin C 10mg Domesco (12 viên)', 'B052300000396', NULL, '1002/2023/ĐKSP', 0, 2000, 5000, N'Domesco', N'Chai 12 Viên', 24, 4, N'[{"name":"Vitamin C","amount":"10mg"}]', N'Kẹo con vịt Vitamin C 10mg hỗ trợ giúp tăng cường đề kháng cho cơ thể.', N'Ngậm cho tan từ từ trong miệng.
Trẻ em ≥ 4 tuổi: 3 viên/ngày.
Người lớn trên 18 tuổi: 7 viên/ngày.', N'Người lớn hãy hướng dẫn trẻ ngậm sản phẩm cho tan từ từ trong miệng đến khi hết để tránh bị nghẹn.
Không sử dụng cho người mẫn cảm với bất cứ thành phần nào của sản phẩm.
Người đang sử dụng thuốc, điều trị bệnh, phụ nữ mang thai, cho con bú, người viêm loét dạ dày, tá tràng tham khảo chuyên gia y tế.
Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.
Đọc kỹ hướng dẫn sử dụng trước khi dùng.', NULL, 1, N'Việt Nam', 48, 0, 1, NULL, 3);
INSERT INTO "Products" ("ProductId", "ProductName", "Sku", "Barcode", "RegistrationNumber", "RequiresPrescription", "CostPrice", "Price", "Brand", "Package", "CategoryId", "SupplierId", "Ingredients", "Uses", "Dosage", "Contraindications", "IngredientUnit", "IsFeature", "Origin", "StockQuantity", "MinStockLevel", "IsActive", "Slug", "SoldQuantity") VALUES (7, N'Viên uống hỗ trợ giải độc gan, bảo vệ gan Liver Tonic 17500 GoodHealth (60 viên)', '00502185', NULL, '10874/2021/ĐKSP', 0, 550000, 738000, N'Good Health', N'Chai 60 Viên', 31, 4, N'[{"name":"Taurine","amount":"200mg"},{"name":"Chiết xuất lá actiso","amount":"100mg"},{"name":"Chiết xuất rễ bồ công anh","amount":"125mg"},{"name":"Chiết xuất quả ngũ vị tử","amount":"50mg"},{"name":"Chiết xuất hạt kế sữa","amount":"250mg"}]', N'Liver Tonic Goodhealth hỗ trợ giải độc gan, giúp bảo vệ gan và tăng cường chức năng gan.', N'Người lớn: Dùng 1 viên/ngày hoặc theo ý kiến tư vấn của chuyên gia y tế.', N'Không sử dụng sản phẩm nếu dị ứng với bất cứ thành phần nào của sản phẩm.
Không sử dụng cho phụ nữ có thai và cho con bú.
Không sử dụng sản phẩm nếu màng bọc trên miệng hộp bị hỏng.
Sản phẩm không có hương liệu, chất tạo ngọt, chất bảo quản hoặc phẩm màu.
Sản phẩm không bổ sung gluten, trứng, sữa, đậu nành và lúa mì.
Không dùng quá liều khuyến cáo.
Thực phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.
Đọc kỹ hướng dẫn sử dụng trước khi dùng.', NULL, 1, N'New Zealand', 50, 0, 1, NULL, 1);
INSERT INTO "Products" ("ProductId", "ProductName", "Sku", "Barcode", "RegistrationNumber", "RequiresPrescription", "CostPrice", "Price", "Brand", "Package", "CategoryId", "SupplierId", "Ingredients", "Uses", "Dosage", "Contraindications", "IngredientUnit", "IsFeature", "Origin", "StockQuantity", "MinStockLevel", "IsActive", "Slug", "SoldQuantity") VALUES (8, N'Viên uống giúp bổ thận, tráng dương, tăng cường sinh lực nam Maca M Male Power (60 viên)', '00028718', NULL, '5407/2020/ÐKSP', 0, 550000, 660000, N'Nature''s Supplements', N'Hộp 60 viên', 29, 4, N'[{"name":"maca root extract","amount":"250mg"},{"name":"American Ginseng","amount":"30mg"},{"name":"Angelica Root","amount":"30mg"}]', N'Maca M Male Power giúp bổ thận, tráng dương, tăng cường sinh lực, tăng cảm xúc ham muốn tình dục. 
Giúp tăng cường chức năng thận, điều hòa lượng đường và ngăn ngừa hủy hoại thận. Giảm nguy cơ rối loạn tuyến tiền liệt, giảm tiểu đêm, đái rắt. 
Tăng năng lượng và sức chịu đựng cho cơ thể, phục hồi trương lực cơ, giảm bớt mệt mỏi. ', N'Ngày dùng 2 lần, mỗi lần 1 viên, tốt nhất là sau bữa trưa và bữa tối. 
Đối với người mới sử dụng lần đầu có thể uống 4 viên ngày chia 2 lần trong 1 - 2 tuần đầu tiên để có hiệu quả nhanh hơn. ', N'Không dùng trong các trường hợp:
- Người dưới 18 tuổi.
- Người mẫn cảm với bất kỳ thành phần nào của sản phẩm.
- Tham khảo ý kiến bác sĩ trước khi dùng nếu có hoặc nghi ngờ có bệnh, đang dùng thuốc.
Ngưng dùng và tham khảo ý kiến bác sĩ nếu xảy ra phản ứng bất lợi.
Thực phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.
Đọc kỹ hướng dẫn sử dụng trước khi dùng.', NULL, 1, N'Hoa Kỳ', 50, 0, 1, NULL, 1);
INSERT INTO "Products" ("ProductId", "ProductName", "Sku", "Barcode", "RegistrationNumber", "RequiresPrescription", "CostPrice", "Price", "Brand", "Package", "CategoryId", "SupplierId", "Ingredients", "Uses", "Dosage", "Contraindications", "IngredientUnit", "IsFeature", "Origin", "StockQuantity", "MinStockLevel", "IsActive", "Slug", "SoldQuantity") VALUES (9, N'Viên uống hỗ trợ tăng sinh lý nữ, tăng cường nội tiết tố nữ Maca F Female Empower (60 viên)', '00028719', NULL, '5408/2020/ÐKSP', 0, 550000, 660000, N'Nature''s Supplements', N'Hộp 60 viên', 30, 4, N'[{"name":"maca root extract","amount":"300mg"},{"name":"Dong Quai","amount":"100mg"},{"name":"Tá dược vừa đủ","amount":""},{"name":"Common Wild Yam","amount":"100mg"}]', N'Maca F Female Empower hỗ trợ tăng cường nội tiết tố nữ, giúp làm giảm các triệu chứng tiền mãn kinh.', N'Ngày dùng 2 viên chia 2 lãn trước hoặc sau bữa trưa và bữa tối. 
Đối với người mới sử dụng lần đầu có thể uống 4 viên chia 2 lần trong ngày, sử dụng liên tục trong 1 - 2 tuần đầu tiên. 
Nên sử dụng thường xuyên để tránh hao hụt lượng estrogen và/hoặc progesterone do cơ thể sản sinh không đủ. ', N'Tham khảo ý kiến bác sĩ trước khi dùng nếu có hoặc nghi ngờ có bệnh, đang dùng thuốc, có thai hoặc cho con bú.
Ngưng dùng và tham khảo ý kiến bác sĩ nếu xảy ra phản ứng bất lợi xảy ra.
Không dùng cho người mẫn cảm với bất kỳ thành phần nào của sản phẩm.
Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.
Đọc kỹ hướng dẫn sử dụng trước khi dùng.', NULL, 1, N'Hoa Kỳ', 50, 0, 1, NULL, 1);
INSERT INTO "Products" ("ProductId", "ProductName", "Sku", "Barcode", "RegistrationNumber", "RequiresPrescription", "CostPrice", "Price", "Brand", "Package", "CategoryId", "SupplierId", "Ingredients", "Uses", "Dosage", "Contraindications", "IngredientUnit", "IsFeature", "Origin", "StockQuantity", "MinStockLevel", "IsActive", "Slug", "SoldQuantity") VALUES (10, N'Viên uống bổ sung Vitamin và khoáng chất, giúp tăng đề kháng Complete Daily Multivitamin(Hộp 200 viên)', '00051047', NULL, '3652/2024/ĐKSP', 0, 400000, 486000, N'Nature''s way', N'Hộp 200 Viên', 25, 6, N'[{"name":"Retinol Acetate","amount":"258.7mcg"},{"name":"Thiamin nitrate","amount":"700mcg"},{"name":"Vitamin B2","amount":"1.3mg"},{"name":"Nicotinamide","amount":"16mg"}]', N'Hỗ trợ bổ sung một số vitamin, khoáng chất cho cơ thể. Hỗ trợ chống oxy hóa, giúp nâng cao sức đề kháng cho cơ thể.', N'Uống 1 - 2 viên mỗi ngày với thức ăn hoặc theo hướng dẫn của chuyên gia y tế.', N'Không dùng cho người cường giáp, người có mẫn cảm, kiêng kỵ với bất cứ thành phần nào của sản phẩm.
Phụ nữ có thai và cho con bú, người đang dùng thuốc, điều trị bệnh cần hỏi ý kiến chuyên gia y tế trước khi dùng.
Nếu các triệu chứng vẫn còn, trao đổi với chuyên gia y tế. Vitamin và khoáng chất chỉ có thể hỗ trợ nếu chế độ ăn uống không đầy đủ. Hàm lượng khuyến cáo của vitamin A từ tất cả các nguồn là tương đương 700mcg retinol cho phụ nữ và tương đương 900mcg retinol cho nam giới. Không dùng sản phẩm này để điều trị tình trạng thiếu sắt.
Nếu đang mang thai hoặc dự định có thai, không nên bổ sung vitamin A mà không hỏi ý kiến bác sĩ hoặc dược sĩ. Nếu sử dụng quá 3000mcg retinol tương đương, vitamin A có thể gây dị tật bẩm sinh.
Sản phẩm chứa sulfit.
Không sử dụng sản phẩm đồng thời với chế độ ăn giàu sắt và các sản phẩm có chứa sắt khác.
Không dùng cho người mắc bệnh Thalassemia.', NULL, 1, N'Úc', 50, 0, 1, NULL, 1);
INSERT INTO "Products" ("ProductId", "ProductName", "Sku", "Barcode", "RegistrationNumber", "RequiresPrescription", "CostPrice", "Price", "Brand", "Package", "CategoryId", "SupplierId", "Ingredients", "Uses", "Dosage", "Contraindications", "IngredientUnit", "IsFeature", "Origin", "StockQuantity", "MinStockLevel", "IsActive", "Slug", "SoldQuantity") VALUES (11, N'Viên uống bổ sung vitamin C, tăng cường sức đề kháng C 500mg Nature''s Bounty (100 viên)', '00031901', NULL, ' 910/2021/ÐKSP', 0, 250000, 325000, N'Nature''s Bounty', N'Hộp 100 viên', 24, 6, N'[{"name":"Vitamin C","amount":"500mg"}]', N'Nature''s Bounty C 500mg bổ sung vitamin C cho cơ thể giúp tăng cường sức đề kháng.', N'Uống 1 viên/lần x 4 lần/ngày, có thể uống cùng bữa ăn.', N'Không sử dụng cho người có mẫn cảm với bất kỳ thành phần nào của sản phẩm.
Thực phẩm này không phải là thuốc, không có tác dụng thay thế thuốc chữa bệnh.
Nếu bạn đang mang thai, đang cho con bú, sử dụng bất kỳ loại thuốc nào, lên kế hoạch cho bất kỳ thủ tục y tế nào hoặc có bất kỳ tình trạng y tế nào, hãy tham khảo ý kiến bác sĩ trước khi sử dụng.
Ngừng sử dụng và tham khảo ý kiến bác sĩ nếu có bất kỳ phản ứng bất lợi nào xảy ra.
Không sử dụng nếu màng niêm phong dưới nắp bị vỡ hoặc mất.
Đọc kỹ hướng dẫn sử dụng trước khi dùng.', NULL, 1, N'Hoa Kỳ', 55, 0, 1, NULL, 0);
INSERT INTO "Products" ("ProductId", "ProductName", "Sku", "Barcode", "RegistrationNumber", "RequiresPrescription", "CostPrice", "Price", "Brand", "Package", "CategoryId", "SupplierId", "Ingredients", "Uses", "Dosage", "Contraindications", "IngredientUnit", "IsFeature", "Origin", "StockQuantity", "MinStockLevel", "IsActive", "Slug", "SoldQuantity") VALUES (12, N'Viên uống bổ sung vitamin và khoáng chất cho phụ nữ mang thai và sau sinh Prenatal One Vitamins For Life (60 viên)', '00503294', NULL, ' 4860/2018/ĐKSP', 0, 550000, 770000, N'Vitamins For Life', N'Hộp 60 Viên', 25, 6, N'[{"name":"Folic Acid","amount":"1mg"},{"name":"Vitamin B6","amount":"1.9mg"},{"name":"Vitamin B5","amount":"6mg"},{"name":"Vitamin E","amount":"10iu"}]', N'Prenatal One giúp bổ sung DHA, vitamin và khoáng chất thiết yếu, giúp cân bằng dinh dưỡng cho phụ nữ đang mang thai và sau khi sinh.', N'Uống 1 viên/ngày.', N'Không sử dụng cho người mẫn cảm với bất cứ thành phần nào của sản phẩm.

Phụ nữ đang cho con bú hoặc đang dùng bất kỳ loại thuốc nào, cần tham khảo ý kiến bác sĩ trước khi sử dụng.
Không dùng quá liều khuyến cáo hằng ngày.
Thực phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.
Đọc kỹ hướng dẫn sử dụng trước khi dùng.', NULL, 1, N'Hoa Kỳ', 55, 0, 1, NULL, 1);
INSERT INTO "Products" ("ProductId", "ProductName", "Sku", "Barcode", "RegistrationNumber", "RequiresPrescription", "CostPrice", "Price", "Brand", "Package", "CategoryId", "SupplierId", "Ingredients", "Uses", "Dosage", "Contraindications", "IngredientUnit", "IsFeature", "Origin", "StockQuantity", "MinStockLevel", "IsActive", "Slug", "SoldQuantity") VALUES (1, N'Viên uống hỗ trợ giải độc gan, tăng cường chức năng gan Active Liver Plus New Nordic (2 vỉ x 15 viên)', '00038645', NULL, '4056/2023/ĐKSP', 0, 350000, 420000, N'NEW NORDIC', N'Hộp 2 Vỉ x 15 Viên', 31, 1, N'[{"name":"Atisô","amount":"222mg"},{"name":"Kế sữa","amount":"200mg"},{"name":"Nghệ","amount":"150mg"}]', N'Active Liver Plus hỗ trợ tăng cường chức năng gan.
Hỗ trợ bảo vệ, giải độc gan, cung cấp dưỡng chất cho gan.', N'Ngày uống 01 viên, uống trong lúc ăn hoặc sau khi ăn no.', N'Không thích hợp dùng cho trẻ em dưới 12 tuổi. Phụ nữ mang thai và cho con bú, các đối tượng đang được giám sát y tế hoặc đang sử dụng thuốc nên tham khảo ý kiến chuyên gia chăm sóc sức khỏe trước khi sử dụng.', NULL, 1, N'Thụy Điển', 99, 0, 1, NULL, 3);
INSERT INTO "Products" ("ProductId", "ProductName", "Sku", "Barcode", "RegistrationNumber", "RequiresPrescription", "CostPrice", "Price", "Brand", "Package", "CategoryId", "SupplierId", "Ingredients", "Uses", "Dosage", "Contraindications", "IngredientUnit", "IsFeature", "Origin", "StockQuantity", "MinStockLevel", "IsActive", "Slug", "SoldQuantity") VALUES (4, N'Siro bổ sung canxi & vitamin D3, K2 cho cơ thể Canxi-D3-K2 Kingphar (6 vỉ x 5 ống x 5ml)', '00045449', NULL, '1399/2023/ĐKSP', 0, 95000, 115000, N'Kingphar', N'Hộp 6 Vỉ x 5 Ống x 5ml', 26, 1, N'[{"name":"Calci glucoheptonat","amount":"550mg"},{"name":"Vitamin D3","amount":"100iu"},{"name":"Vitamin K2","amount":"10mcg"}]', N'Canxi-D3-K2 Kingphar hỗ trợ bổ sung canxi, vitamin D3, K2 cho cơ thể, hỗ trợ giảm nguy cơ thiếu hụt canxi, vitamin D3, K2.', N'Trẻ em 1 - 6 tuổi: Uống 5ml/lần, ngày 2 lần.
Trẻ em từ 7 tuổi và người lớn: Uống 10ml/lần, ngày 2 lần.
Nên uống vào buổi sáng hoặc trưa.
Lắc đều trước khi sử dụng.', N'Không sử dụng đối với những người mẫn cảm, dị ứng với bất kỳ thành phần của sản phẩm.

Không sử dụng cho người bị tăng canxi huyết, canxi niệu, sỏi thận, sỏi tiết niệu.

Người đang dùng thuốc, điều trị bệnh, người tiểu đường tham khảo ý kiến chuyên gia y tế trước khi sử dụng.

Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.

Đọc kỹ hướng dẫn sử dụng trước khi dùng.', NULL, 1, N'Việt Nam', 99, 0, 1, NULL, 1);
INSERT INTO "Products" ("ProductId", "ProductName", "Sku", "Barcode", "RegistrationNumber", "RequiresPrescription", "CostPrice", "Price", "Brand", "Package", "CategoryId", "SupplierId", "Ingredients", "Uses", "Dosage", "Contraindications", "IngredientUnit", "IsFeature", "Origin", "StockQuantity", "MinStockLevel", "IsActive", "Slug", "SoldQuantity") VALUES (5, N'Viên uống bổ sung vitamin và khoáng chất cho cơ thể, tăng sức khỏe Immuvita Easylife (100 viên)', '00045954', NULL, '638/2023/ĐKSP', 0, 50000, 410000, N'EASYLIFE', N'Hộp 100 Viên', 25, 1, N'[{"name":"Canxi hydrogen phosphat","amount":""},{"name":"Magie oxide","amount":""},{"name":"Canxi carbonat","amount":""},{"name":"Vitamin C","amount":""},{"name":"Vitamin E","amount":""},{"name":"Niacin","amount":""},{"name":"Sắt fumarate","amount":""}]', N'Easylife Immuvita bổ sung vitamin và khoáng chất cho cơ thể, giúp tăng cường sức khỏe.', N'Người trưởng thành: Uống 1 viên ngày với 1 lượng nước vừa đủ.', N'Không dùng cho người mẫn cảm, kiêng kỵ với bất kỳ thành phần nào của sản phẩm.
Người đang sử dụng thuốc, phụ nữ có thai và cho con bú tham khảo ý kiến bác sĩ dược sĩ trước khi dùng.
Không sử dụng vượt quá hàm lượng khuyến cáo hằng ngày.
Thực phẩm bổ sung không thay thế một chế độ ăn uống cân bằng và đa dạng cũng như một lối sống lành mạnh.
Sản phẩm có chứa kẽm, vui lòng tham khảo ý kiến bác sĩ trước khi sử dụng cho trẻ em và thanh thiếu niên.

Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.
Đọc kỹ hướng dẫn sử dụng trước khi dùng.', NULL, 1, N'Đức', 150, 0, 1, NULL, 3);

-- 4. BẢNG ProductImages (57 ban ghi)
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (1, 1, 'active_liver_plus_1.png', , 1);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (2, 1, 'active_liver_plus_2.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (3, 1, 'active_liver_plus_3.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (4, 1, 'active_liver_plus_4.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (5, 1, 'active_liver_plus_5.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (6, 1, 'active_liver_plus_6.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (7, 1, 'active_liver_plus_7.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (8, 1, 'active_liver_plus_8.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (9, 4, 'canxi_d3k2_1.png', , 1);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (10, 4, 'canxi_d3k2_2.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (11, 4, 'canxi_d3k2_3.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (12, 4, 'canxi_d3k2_4.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (13, 4, 'canxi_d3k2_5.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (14, 4, 'canxi_d3k2_6.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (15, 5, 'immuvita_easylife_1.png', , 1);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (16, 5, 'immuvita_easylife_2.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (17, 5, 'immuvita_easylife_3.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (18, 5, 'immuvita_easylife_4.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (19, 5, 'immuvita_easylife_5.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (20, 6, 'keo_con_vit_1.png', , 1);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (21, 6, 'keo_con_vit_2.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (22, 6, 'keo_con_vit_3.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (23, 6, 'keo_con_vit_4.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (24, 6, 'keo_con_vit_5.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (25, 7, 'liver_tonic_1.png', , 1);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (26, 7, 'liver_tonic_2.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (27, 7, 'liver_tonic_3.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (28, 7, 'liver_tonic_4.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (29, 7, 'liver_tonic_5.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (30, 8, 'maca_m_male_ power_1.png', , 1);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (31, 8, 'maca_m_male_ power_2.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (32, 8, 'maca_m_male_ power_3.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (33, 8, 'maca_m_male_ power_4.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (34, 8, 'maca_m_male_ power_5.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (35, 9, 'macaf_female_1.png', , 1);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (36, 9, 'macaf_female_2.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (37, 9, 'macaf_female_3.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (38, 9, 'macaf_female_4.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (39, 9, 'macaf_female_5.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (40, 10, 'multivitamin_1.png', , 1);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (41, 10, 'multivitamin_2.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (42, 10, 'multivitamin_3.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (43, 10, 'multivitamin_4.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (44, 10, 'multivitamin_5.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (45, 11, 'natures_bounty_1.png', , 1);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (46, 11, 'natures_bounty_2.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (47, 11, 'natures_bounty_3.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (48, 11, 'natures_bounty_4.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (49, 11, 'natures_bounty_5.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (50, 12, 'prenatal_one_1.png', , 1);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (51, 12, 'prenatal_one_2.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (52, 12, 'prenatal_one_3.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (53, 12, 'prenatal_one_4.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (54, 12, 'prenatal_one_5.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (55, 12, 'prenatal_one_6.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (56, 12, 'prenatal_one_7.png', , 0);
INSERT INTO "ProductImages" ("ProductImageId", "ProductId", "ImageUrl", "SortOrder", "IsMain") VALUES (57, 12, 'prenatal_one_8.png', , 0);

-- 5. BẢNG AspNetUsers (4 ban ghi)
INSERT INTO "AspNetUsers" ("Id", "UserName", "Email", "PasswordHash", "PhoneNumber") VALUES ('250fc9e4-0aa9-429a-8b0d-1da4eafed36a', N'support@longchau.local', 'support@longchau.local', 'AQAAAAIAAYagAAAAEIRBb6mYCaQgIBQ83q8wLr6IziMQqYuax2PiVjamzEXRApya44mGeVtA3ZDQez/xtw==', NULL);
INSERT INTO "AspNetUsers" ("Id", "UserName", "Email", "PasswordHash", "PhoneNumber") VALUES ('3377a7a2-8102-4dda-939e-dde88bd4fa67', N'warehouse@longchau.local', 'warehouse@longchau.local', 'AQAAAAIAAYagAAAAEOmlT1Az83e+MW7BfdSA2B5A5kkG8Rb8stte7ZZ1nfNYUY+P06WOCAgXyeEsIi39Kg==', NULL);
INSERT INTO "AspNetUsers" ("Id", "UserName", "Email", "PasswordHash", "PhoneNumber") VALUES ('5a01d682-bead-4910-bf02-3ab73a706f82', N'hieutrung201.work@gmail.com', 'hieutrung201.work@gmail.com', 'AQAAAAIAAYagAAAAEIbBOHDWNW9QzPzEORbggcdMmNohq+b+gH++4acyTIrWgUf0yFqeFk9pw8eb5gnJhw==', '0987908800');
INSERT INTO "AspNetUsers" ("Id", "UserName", "Email", "PasswordHash", "PhoneNumber") VALUES ('8b07a88a-0b38-46af-ba80-055edc4ca6f0', N'admin@gmail.com', 'admin@gmail.com', 'AQAAAAIAAYagAAAAEJ1Y73T6EDrfzYXdSajoAulzJv3kmUmJ4mpMcg42Bghy0vpatgn05nRjHGv+GQOUYA==', NULL);

-- 6. BẢNG UserRankInfos (2 ban ghi)
INSERT INTO "UserRankInfos" ("UserId", "TotalSpent", "TotalSpent6Months", "Rank", "LoyaltyPoints") VALUES ('5a01d682-bead-4910-bf02-3ab73a706f82', 4361550, 4361550, 'Bạc', 4771);
INSERT INTO "UserRankInfos" ("UserId", "TotalSpent", "TotalSpent6Months", "Rank", "LoyaltyPoints") VALUES ('8b07a88a-0b38-46af-ba80-055edc4ca6f0', 0, 0, 'Bạc', 0);

-- 7. BẢNG Vouchers (1 ban ghi)
INSERT INTO "Vouchers" ("VoucherId", "Code", "Description", "ExpiryDate", "DiscountAmount", "PercentValue", "DiscountType", "MinOrderAmount", "RequiredRank", "MaxUsage", "UsedCount", "IsPublic", "IsActive", "CategoryId") VALUES (1, 'BACFQCQS7', N'Voucher giảm 5% tổng đơn cho thành viên Bạc (đơn đầu tiên)', TO_DATE('2026-07-08 11:29:30', 'YYYY-MM-DD HH24:MI:SS'), 0, 5, 'FullOrder', 0, NULL, NULL, 1, 0, 1, NULL);

-- 8. BẢNG UserVouchers (1 ban ghi)
INSERT INTO "UserVouchers" ("UserVoucherId", "UserId", "VoucherId", "IsUsed", "UsedDate") VALUES (1, '5a01d682-bead-4910-bf02-3ab73a706f82', 1, 1, TO_DATE('2026-06-10 00:28:12', 'YYYY-MM-DD HH24:MI:SS'));

-- 9. BẢNG Warehouses (2 ban ghi)
INSERT INTO "Warehouses" ("WarehouseId", "Name", "Address", "IsDefault", "IsActive") VALUES (1, N'Kho chính', N'Kho trung tâm', 1, 1);
INSERT INTO "Warehouses" ("WarehouseId", "Name", "Address", "IsDefault", "IsActive") VALUES (2, N'Kho quận 10', N'830 Sư Vạn Hạnh', 0, 1);

-- 10. BẢNG WarehouseStocks (11 ban ghi)
INSERT INTO "WarehouseStocks" ("WarehouseStockId", "WarehouseId", "ProductId", "QuantityOnHand", "QuantityReserved") VALUES (1, 1, 4, 0, 0);
INSERT INTO "WarehouseStocks" ("WarehouseStockId", "WarehouseId", "ProductId", "QuantityOnHand", "QuantityReserved") VALUES (2, 1, 5, 99, 0);
INSERT INTO "WarehouseStocks" ("WarehouseStockId", "WarehouseId", "ProductId", "QuantityOnHand", "QuantityReserved") VALUES (3, 1, 1, 98, 0);
INSERT INTO "WarehouseStocks" ("WarehouseStockId", "WarehouseId", "ProductId", "QuantityOnHand", "QuantityReserved") VALUES (4, 1, 11, 55, 0);
INSERT INTO "WarehouseStocks" ("WarehouseStockId", "WarehouseId", "ProductId", "QuantityOnHand", "QuantityReserved") VALUES (5, 1, 12, 54, 0);
INSERT INTO "WarehouseStocks" ("WarehouseStockId", "WarehouseId", "ProductId", "QuantityOnHand", "QuantityReserved") VALUES (1004, 1, 6, 47, 0);
INSERT INTO "WarehouseStocks" ("WarehouseStockId", "WarehouseId", "ProductId", "QuantityOnHand", "QuantityReserved") VALUES (1005, 1, 8, 49, 0);
INSERT INTO "WarehouseStocks" ("WarehouseStockId", "WarehouseId", "ProductId", "QuantityOnHand", "QuantityReserved") VALUES (1006, 1, 7, 49, 0);
INSERT INTO "WarehouseStocks" ("WarehouseStockId", "WarehouseId", "ProductId", "QuantityOnHand", "QuantityReserved") VALUES (1007, 1, 9, 49, 0);
INSERT INTO "WarehouseStocks" ("WarehouseStockId", "WarehouseId", "ProductId", "QuantityOnHand", "QuantityReserved") VALUES (1008, 1, 10, 49, 0);
INSERT INTO "WarehouseStocks" ("WarehouseStockId", "WarehouseId", "ProductId", "QuantityOnHand", "QuantityReserved") VALUES (1009, 2, 5, 50, 0);

-- 11. BẢNG ProductBatches (15 ban ghi)
INSERT INTO "ProductBatches" ("ProductBatchId", "ProductId", "WarehouseId", "BatchNo", "ExpiryDate", "QuantityOnHand", "UnitCost") VALUES (1, 4, 1, 'LOT-4-20260607', NULL, 0, 95000);
INSERT INTO "ProductBatches" ("ProductBatchId", "ProductId", "WarehouseId", "BatchNo", "ExpiryDate", "QuantityOnHand", "UnitCost") VALUES (2, 5, 1, 'LOT-5-20260607', NULL, 98, 50000);
INSERT INTO "ProductBatches" ("ProductBatchId", "ProductId", "WarehouseId", "BatchNo", "ExpiryDate", "QuantityOnHand", "UnitCost") VALUES (3, 1, 1, 'LOT-1-20260607', NULL, 98, 350000);
INSERT INTO "ProductBatches" ("ProductBatchId", "ProductId", "WarehouseId", "BatchNo", "ExpiryDate", "QuantityOnHand", "UnitCost") VALUES (4, 11, 1, 'LOT-11-20260608', TO_DATE('2026-06-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 50, 250000);
INSERT INTO "ProductBatches" ("ProductBatchId", "ProductId", "WarehouseId", "BatchNo", "ExpiryDate", "QuantityOnHand", "UnitCost") VALUES (5, 11, 1, 'LOT-11-20260608', NULL, 5, 250000);
INSERT INTO "ProductBatches" ("ProductBatchId", "ProductId", "WarehouseId", "BatchNo", "ExpiryDate", "QuantityOnHand", "UnitCost") VALUES (6, 12, 1, 'LOT-12-20260608', TO_DATE('2026-06-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 49, 550000);
INSERT INTO "ProductBatches" ("ProductBatchId", "ProductId", "WarehouseId", "BatchNo", "ExpiryDate", "QuantityOnHand", "UnitCost") VALUES (7, 12, 1, 'LOT-12-20260608', TO_DATE('2026-06-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 550000);
INSERT INTO "ProductBatches" ("ProductBatchId", "ProductId", "WarehouseId", "BatchNo", "ExpiryDate", "QuantityOnHand", "UnitCost") VALUES (1004, 6, 1, 'LOT-6-20260608', NULL, 47, 2000);
INSERT INTO "ProductBatches" ("ProductBatchId", "ProductId", "WarehouseId", "BatchNo", "ExpiryDate", "QuantityOnHand", "UnitCost") VALUES (1005, 8, 1, 'LOT-8-20260608', NULL, 49, 550000);
INSERT INTO "ProductBatches" ("ProductBatchId", "ProductId", "WarehouseId", "BatchNo", "ExpiryDate", "QuantityOnHand", "UnitCost") VALUES (1006, 7, 1, 'LOT-7-20260608', NULL, 49, 550000);
INSERT INTO "ProductBatches" ("ProductBatchId", "ProductId", "WarehouseId", "BatchNo", "ExpiryDate", "QuantityOnHand", "UnitCost") VALUES (1007, 9, 1, 'LOT-9-20260608', NULL, 49, 550000);
INSERT INTO "ProductBatches" ("ProductBatchId", "ProductId", "WarehouseId", "BatchNo", "ExpiryDate", "QuantityOnHand", "UnitCost") VALUES (1008, 10, 1, 'LOT-10-20260608', NULL, 49, 400000);
INSERT INTO "ProductBatches" ("ProductBatchId", "ProductId", "WarehouseId", "BatchNo", "ExpiryDate", "QuantityOnHand", "UnitCost") VALUES (1009, 5, 1, 'LOT-5-20260608', NULL, 1, 50000);
INSERT INTO "ProductBatches" ("ProductBatchId", "ProductId", "WarehouseId", "BatchNo", "ExpiryDate", "QuantityOnHand", "UnitCost") VALUES (1010, 5, 1, 'LOT-5-20260609', TO_DATE('2026-06-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 50000);
INSERT INTO "ProductBatches" ("ProductBatchId", "ProductId", "WarehouseId", "BatchNo", "ExpiryDate", "QuantityOnHand", "UnitCost") VALUES (1011, 5, 2, 'LOT-5-20260707', TO_DATE('2026-08-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 50, 500000);

-- 12. BẢNG Orders (13 ban ghi)
INSERT INTO "Orders" ("OrderId", "UserId", "OrderDate", "TotalAmount", "Status", "ShippingAddress", "PaymentStatus", "FullName", "Phone", "VoucherCode", "VoucherDiscount", "PrescriptionNote") VALUES (1, '5a01d682-bead-4910-bf02-3ab73a706f82', TO_DATE('2026-06-08 10:25:09', 'YYYY-MM-DD HH24:MI:SS'), 420000, N'Đã giao', N'Tan Binh District, Ho Chi Minh City', N'Đã thanh toán', N'Hieu Nguyen', '0398892972', NULL, 0, NULL);
INSERT INTO "Orders" ("OrderId", "UserId", "OrderDate", "TotalAmount", "Status", "ShippingAddress", "PaymentStatus", "FullName", "Phone", "VoucherCode", "VoucherDiscount", "PrescriptionNote") VALUES (2, '5a01d682-bead-4910-bf02-3ab73a706f82', TO_DATE('2026-06-08 16:55:42', 'YYYY-MM-DD HH24:MI:SS'), 115000, N'Chờ thanh toán', N'Tan Binh District, Ho Chi Minh City', N'Chưa thanh toán', N'Hieu Nguyen', '0398892972', NULL, 0, NULL);
INSERT INTO "Orders" ("OrderId", "UserId", "OrderDate", "TotalAmount", "Status", "ShippingAddress", "PaymentStatus", "FullName", "Phone", "VoucherCode", "VoucherDiscount", "PrescriptionNote") VALUES (3, '5a01d682-bead-4910-bf02-3ab73a706f82', TO_DATE('2026-06-08 17:51:05', 'YYYY-MM-DD HH24:MI:SS'), 115000, N'Đã hủy', N'Tan Binh District, Ho Chi Minh City', N'Đã hủy', N'Hieu Nguyen', '0398892972', NULL, 0, NULL);
INSERT INTO "Orders" ("OrderId", "UserId", "OrderDate", "TotalAmount", "Status", "ShippingAddress", "PaymentStatus", "FullName", "Phone", "VoucherCode", "VoucherDiscount", "PrescriptionNote") VALUES (4, '5a01d682-bead-4910-bf02-3ab73a706f82', TO_DATE('2026-06-08 18:08:27', 'YYYY-MM-DD HH24:MI:SS'), 420000, N'Đã hủy', N'Tan Binh District, Ho Chi Minh City', N'Đã hủy', N'C4T7 - 22DH111077 - Nguyễn Trung Hiếu', '0528675343', NULL, 0, NULL);
INSERT INTO "Orders" ("OrderId", "UserId", "OrderDate", "TotalAmount", "Status", "ShippingAddress", "PaymentStatus", "FullName", "Phone", "VoucherCode", "VoucherDiscount", "PrescriptionNote") VALUES (5, '5a01d682-bead-4910-bf02-3ab73a706f82', TO_DATE('2026-06-10 00:26:26', 'YYYY-MM-DD HH24:MI:SS'), 4899000, N'Đã hủy', N'123 CMT8', N'Đã hủy', N'Hiếu', '0528675343', NULL, 0, NULL);
INSERT INTO "Orders" ("OrderId", "UserId", "OrderDate", "TotalAmount", "Status", "ShippingAddress", "PaymentStatus", "FullName", "Phone", "VoucherCode", "VoucherDiscount", "PrescriptionNote") VALUES (6, '5a01d682-bead-4910-bf02-3ab73a706f82', TO_DATE('2026-06-10 00:27:41', 'YYYY-MM-DD HH24:MI:SS'), 3941550, N'Đã giao', N'123 CMT8', N'Đã thanh toán', N'Hiếu', '0528675343', 'BACFQCQS7', 207450, NULL);
INSERT INTO "Orders" ("OrderId", "UserId", "OrderDate", "TotalAmount", "Status", "ShippingAddress", "PaymentStatus", "FullName", "Phone", "VoucherCode", "VoucherDiscount", "PrescriptionNote") VALUES (7, '5a01d682-bead-4910-bf02-3ab73a706f82', TO_DATE('2026-06-15 15:40:58', 'YYYY-MM-DD HH24:MI:SS'), 410000, N'Đã giao', N'Tan Binh District, Ho Chi Minh City', N'Đã thanh toán', N'C4T7 - 22DH111077 - Nguyễn Trung Hiếu', '0528675343', NULL, 0, NULL);
INSERT INTO "Orders" ("OrderId", "UserId", "OrderDate", "TotalAmount", "Status", "ShippingAddress", "PaymentStatus", "FullName", "Phone", "VoucherCode", "VoucherDiscount", "PrescriptionNote") VALUES (8, '8b07a88a-0b38-46af-ba80-055edc4ca6f0', TO_DATE('2026-07-13 01:34:20', 'YYYY-MM-DD HH24:MI:SS'), 5000, N'Đã xác nhận', N'Tan Binh District, Ho Chi Minh City', N'Chưa thanh toán', N'Hieu Nguyen', '0398892972', NULL, 0, NULL);
INSERT INTO "Orders" ("OrderId", "UserId", "OrderDate", "TotalAmount", "Status", "ShippingAddress", "PaymentStatus", "FullName", "Phone", "VoucherCode", "VoucherDiscount", "PrescriptionNote") VALUES (9, '5a01d682-bead-4910-bf02-3ab73a706f82', TO_DATE('2026-07-13 01:37:15', 'YYYY-MM-DD HH24:MI:SS'), 325000, N'Chờ xác nhận', N'Tan Binh District, Ho Chi Minh City', N'Chưa thanh toán', N'Hieu Nguyen', '0398892972', NULL, 0, NULL);
INSERT INTO "Orders" ("OrderId", "UserId", "OrderDate", "TotalAmount", "Status", "ShippingAddress", "PaymentStatus", "FullName", "Phone", "VoucherCode", "VoucherDiscount", "PrescriptionNote") VALUES (10, '8b07a88a-0b38-46af-ba80-055edc4ca6f0', TO_DATE('2026-07-13 04:56:44', 'YYYY-MM-DD HH24:MI:SS'), 5000, N'Chờ xác nhận', N'766 CMT8, Hồ Chí Minh, Quận 10, Phường 4', N'Chưa thanh toán', N'Hieu Nguyen', '0398892972', NULL, 0, NULL);
INSERT INTO "Orders" ("OrderId", "UserId", "OrderDate", "TotalAmount", "Status", "ShippingAddress", "PaymentStatus", "FullName", "Phone", "VoucherCode", "VoucherDiscount", "PrescriptionNote") VALUES (11, '8b07a88a-0b38-46af-ba80-055edc4ca6f0', TO_DATE('2026-07-13 05:00:27', 'YYYY-MM-DD HH24:MI:SS'), 5000, N'Chờ xác nhận', N'766 CMT8, Hồ Chí Minh, Quận 11, Phường 7', N'Chưa thanh toán', N'Hieu Nguyen', '0398892972', NULL, 0, NULL);
INSERT INTO "Orders" ("OrderId", "UserId", "OrderDate", "TotalAmount", "Status", "ShippingAddress", "PaymentStatus", "FullName", "Phone", "VoucherCode", "VoucherDiscount", "PrescriptionNote") VALUES (12, '8b07a88a-0b38-46af-ba80-055edc4ca6f0', TO_DATE('2026-07-13 05:05:42', 'YYYY-MM-DD HH24:MI:SS'), 47900, N'Đang đóng gói', N'766 CMT8, Hồ Chí Minh, Quận 12, Phường Tân Chánh Hiệp', N'Chưa thanh toán', N'Hieu Nguyen', '0398892972', NULL, 0, NULL);
INSERT INTO "Orders" ("OrderId", "UserId", "OrderDate", "TotalAmount", "Status", "ShippingAddress", "PaymentStatus", "FullName", "Phone", "VoucherCode", "VoucherDiscount", "PrescriptionNote") VALUES (13, '5a01d682-bead-4910-bf02-3ab73a706f82', TO_DATE('2026-07-13 09:29:08', 'YYYY-MM-DD HH24:MI:SS'), 446900, N'Đã xác nhận', N'766 CMT8, Hồ Chí Minh, Quận 10, Phường 4', N'Chưa thanh toán', N'Hieu Nguyen', '0398892972', NULL, 0, NULL);

-- 13. BẢNG OrderItems (30 ban ghi)
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (1, 1, 1, 1, 420000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (2, 2, 4, 1, 115000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (3, 3, 4, 1, 115000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (4, 4, 1, 1, 420000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (5, 5, 1, 2, 420000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (6, 5, 4, 1, 115000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (7, 5, 6, 1, 5000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (8, 5, 11, 1, 325000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (9, 5, 5, 1, 410000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (10, 5, 12, 1, 660000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (11, 5, 10, 1, 486000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (12, 5, 9, 1, 660000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (13, 5, 7, 1, 738000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (14, 5, 8, 1, 660000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (15, 6, 4, 1, 115000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (16, 6, 5, 1, 410000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (17, 6, 12, 1, 660000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (18, 6, 10, 1, 486000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (19, 6, 8, 1, 660000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (20, 6, 7, 1, 738000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (21, 6, 1, 1, 420000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (22, 6, 9, 1, 660000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (23, 7, 5, 1, 410000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (24, 8, 6, 1, 5000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (25, 9, 11, 1, 325000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (26, 10, 6, 1, 5000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (27, 11, 6, 1, 5000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (28, 12, 6, 1, 5000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (29, 13, 6, 1, 5000);
INSERT INTO "OrderItems" ("OrderItemId", "OrderId", "ProductId", "Quantity", "Price") VALUES (30, 13, 5, 1, 410000);

-- 14. BẢNG Payments (12 ban ghi)
INSERT INTO "Payments" ("PaymentId", "OrderId", "PaymentMethod", "Amount", "PaymentDate", "PaymentStatus", "TransactionId") VALUES (1, 1, 'COD', 420000, TO_DATE('2026-06-08 11:26:23', 'YYYY-MM-DD HH24:MI:SS'), 'Đã thanh toán', NULL);
INSERT INTO "Payments" ("PaymentId", "OrderId", "PaymentMethod", "Amount", "PaymentDate", "PaymentStatus", "TransactionId") VALUES (2, 2, 'PayOS', 115000, TO_DATE('2026-06-08 16:55:46', 'YYYY-MM-DD HH24:MI:SS'), 'Pending', NULL);
INSERT INTO "Payments" ("PaymentId", "OrderId", "PaymentMethod", "Amount", "PaymentDate", "PaymentStatus", "TransactionId") VALUES (3, 3, 'PayOS', 115000, TO_DATE('2026-06-08 17:51:16', 'YYYY-MM-DD HH24:MI:SS'), 'Pending', NULL);
INSERT INTO "Payments" ("PaymentId", "OrderId", "PaymentMethod", "Amount", "PaymentDate", "PaymentStatus", "TransactionId") VALUES (4, 4, 'PayOS', 420000, TO_DATE('2026-06-08 18:11:37', 'YYYY-MM-DD HH24:MI:SS'), 'Pending', NULL);
INSERT INTO "Payments" ("PaymentId", "OrderId", "PaymentMethod", "Amount", "PaymentDate", "PaymentStatus", "TransactionId") VALUES (5, 5, 'PayOS', 4899000, TO_DATE('2026-06-10 00:26:29', 'YYYY-MM-DD HH24:MI:SS'), 'Pending', NULL);
INSERT INTO "Payments" ("PaymentId", "OrderId", "PaymentMethod", "Amount", "PaymentDate", "PaymentStatus", "TransactionId") VALUES (6, 6, 'COD', 3941550, TO_DATE('2026-06-10 00:28:50', 'YYYY-MM-DD HH24:MI:SS'), 'Đã thanh toán', NULL);
INSERT INTO "Payments" ("PaymentId", "OrderId", "PaymentMethod", "Amount", "PaymentDate", "PaymentStatus", "TransactionId") VALUES (7, 7, 'COD', 410000, TO_DATE('2026-06-15 15:41:56', 'YYYY-MM-DD HH24:MI:SS'), 'Đã thanh toán', NULL);
INSERT INTO "Payments" ("PaymentId", "OrderId", "PaymentMethod", "Amount", "PaymentDate", "PaymentStatus", "TransactionId") VALUES (8, 8, 'COD', 5000, NULL, 'Pending', NULL);
INSERT INTO "Payments" ("PaymentId", "OrderId", "PaymentMethod", "Amount", "PaymentDate", "PaymentStatus", "TransactionId") VALUES (9, 9, 'COD', 325000, NULL, 'Pending', NULL);
INSERT INTO "Payments" ("PaymentId", "OrderId", "PaymentMethod", "Amount", "PaymentDate", "PaymentStatus", "TransactionId") VALUES (10, 11, 'COD', 5000, NULL, 'Pending', NULL);
INSERT INTO "Payments" ("PaymentId", "OrderId", "PaymentMethod", "Amount", "PaymentDate", "PaymentStatus", "TransactionId") VALUES (11, 12, 'COD', 47900, NULL, 'Pending', NULL);
INSERT INTO "Payments" ("PaymentId", "OrderId", "PaymentMethod", "Amount", "PaymentDate", "PaymentStatus", "TransactionId") VALUES (12, 13, 'COD', 446900, NULL, 'Pending', NULL);

-- 15. BẢNG VoucherRedemptions (1 ban ghi)
INSERT INTO "VoucherRedemptions" ("VoucherRedemptionId", "VoucherId", "UserId", "OrderId", "DiscountAmount", "RedeemedAt", "IsReverted") VALUES (1, 1, '5a01d682-bead-4910-bf02-3ab73a706f82', 6, 207450, TO_DATE('2026-06-10 00:28:12', 'YYYY-MM-DD HH24:MI:SS'), 0);

-- 16. BẢNG InventoryTransactions (45 ban ghi)
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1029, 5, 1, 'BatchSale', 1, 100, 99, 7, TO_DATE('2026-06-15 15:41:18', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1030, 5, 1, 'Sale', 1, 101, 100, 7, TO_DATE('2026-06-15 15:41:18', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1031, 5, 2, 'Import', 50, 0, 50, NULL, TO_DATE('2026-07-07 18:19:46', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1038, 4, 1, 'Export', 99, 99, 99, NULL, TO_DATE('2026-07-12 23:38:07', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1039, 4, 1, 'Export', 99, 99, 0, NULL, TO_DATE('2026-07-12 23:38:07', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1040, 6, 1, 'BatchSale', 1, 50, 49, 8, TO_DATE('2026-07-13 01:34:44', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1041, 6, 1, 'Sale', 1, 50, 49, 8, TO_DATE('2026-07-13 01:34:44', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1042, 6, 1, 'BatchSale', 1, 49, 48, 12, TO_DATE('2026-07-13 05:07:27', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1043, 6, 1, 'Sale', 1, 49, 48, 12, TO_DATE('2026-07-13 05:07:27', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1044, 6, 1, 'BatchSale', 1, 48, 47, 13, TO_DATE('2026-07-13 09:29:20', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1045, 6, 1, 'Sale', 1, 48, 47, 13, TO_DATE('2026-07-13 09:29:20', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1046, 5, 1, 'BatchSale', 1, 99, 98, 13, TO_DATE('2026-07-13 09:29:20', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1047, 5, 1, 'Sale', 1, 100, 99, 13, TO_DATE('2026-07-13 09:29:20', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1, 4, 1, 'Import', 100, 0, 100, NULL, TO_DATE('2026-06-07 23:24:56', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (2, 5, 1, 'Import', 100, 0, 100, NULL, TO_DATE('2026-06-07 23:24:56', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (3, 1, 1, 'Import', 100, 0, 100, NULL, TO_DATE('2026-06-07 23:24:56', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (4, 11, 1, 'Import', 50, 0, 50, NULL, TO_DATE('2026-06-08 00:02:42', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (5, 11, 1, 'Import', 5, 50, 55, NULL, TO_DATE('2026-06-08 00:03:01', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (6, 12, 1, 'Import', 50, 0, 50, NULL, TO_DATE('2026-06-08 00:03:49', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (7, 12, 1, 'Import', 5, 50, 55, NULL, TO_DATE('2026-06-08 00:04:17', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1004, 1, 1, 'BatchSale', 1, 100, 99, 1, TO_DATE('2026-06-08 11:25:57', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1005, 1, 1, 'Sale', 1, 100, 99, 1, TO_DATE('2026-06-08 11:25:58', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1006, 6, 1, 'Import', 50, 0, 50, NULL, TO_DATE('2026-06-08 21:11:18', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1007, 8, 1, 'Import', 50, 0, 50, NULL, TO_DATE('2026-06-08 21:12:01', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1008, 7, 1, 'Import', 50, 0, 50, NULL, TO_DATE('2026-06-08 21:12:01', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1009, 9, 1, 'Import', 50, 0, 50, NULL, TO_DATE('2026-06-08 21:12:41', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1010, 10, 1, 'Import', 50, 0, 50, NULL, TO_DATE('2026-06-08 21:12:47', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1011, 5, 1, 'Import', 1, 100, 101, NULL, TO_DATE('2026-06-08 21:24:53', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1012, 5, 1, 'Import', 1, 101, 102, NULL, TO_DATE('2026-06-09 18:59:46', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1013, 4, 1, 'BatchSale', 1, 100, 99, 6, TO_DATE('2026-06-10 00:28:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1014, 4, 1, 'Sale', 1, 100, 99, 6, TO_DATE('2026-06-10 00:28:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1015, 5, 1, 'BatchSale', 1, 1, 0, 6, TO_DATE('2026-06-10 00:28:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1016, 5, 1, 'Sale', 1, 102, 101, 6, TO_DATE('2026-06-10 00:28:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1017, 12, 1, 'BatchSale', 1, 50, 49, 6, TO_DATE('2026-06-10 00:28:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1018, 12, 1, 'Sale', 1, 55, 54, 6, TO_DATE('2026-06-10 00:28:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1019, 10, 1, 'BatchSale', 1, 50, 49, 6, TO_DATE('2026-06-10 00:28:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1020, 10, 1, 'Sale', 1, 50, 49, 6, TO_DATE('2026-06-10 00:28:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1021, 8, 1, 'BatchSale', 1, 50, 49, 6, TO_DATE('2026-06-10 00:28:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1022, 8, 1, 'Sale', 1, 50, 49, 6, TO_DATE('2026-06-10 00:28:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1023, 7, 1, 'BatchSale', 1, 50, 49, 6, TO_DATE('2026-06-10 00:28:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1024, 7, 1, 'Sale', 1, 50, 49, 6, TO_DATE('2026-06-10 00:28:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1025, 1, 1, 'BatchSale', 1, 99, 98, 6, TO_DATE('2026-06-10 00:28:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1026, 1, 1, 'Sale', 1, 99, 98, 6, TO_DATE('2026-06-10 00:28:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1027, 9, 1, 'BatchSale', 1, 50, 49, 6, TO_DATE('2026-06-10 00:28:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "InventoryTransactions" ("TransactionId", "ProductId", "WarehouseId", "TransactionType", "Quantity", "QuantityBefore", "QuantityAfter", "OrderId", "TransactionDate") VALUES (1028, 9, 1, 'Sale', 1, 50, 49, 6, TO_DATE('2026-06-10 00:28:12', 'YYYY-MM-DD HH24:MI:SS'));

COMMIT;

-- =============================================================================
-- THỦ TỤC SINH DỮ LIỆU LỚN (TỰ ĐỘNG SINH 100.000+ DÒNG GIAO DỊCH VẤN ĐÁP)
-- =============================================================================
CREATE OR REPLACE PROCEDURE PROC_GENERATE_LARGE_DATA (
    p_NumOrders IN NUMBER DEFAULT 100000
) AS
    v_StartId NUMBER;
    v_BatchSize CONSTANT NUMBER := 5000;
    v_LoopCount NUMBER;
    v_RealUserId VARCHAR2(450);
    v_RealProductId NUMBER;
BEGIN
    -- Lấy 1 UserId hợp lệ thực tế từ bảng AspNetUsers
    BEGIN
        SELECT "Id" INTO v_RealUserId FROM "AspNetUsers" WHERE ROWNUM = 1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_RealUserId := NULL;
    END;

    -- Lấy 1 ProductId hợp lệ thực tế từ bảng Products
    BEGIN
        SELECT MIN("ProductId") INTO v_RealProductId FROM "Products";
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_RealProductId := 1;
    END;

    SELECT NVL(MAX("OrderId"), 1000) + 1 INTO v_StartId FROM "Orders";
    v_LoopCount := CEIL(p_NumOrders / v_BatchSize);

    DBMS_OUTPUT.PUT_LINE('Dang sinh ' || p_NumOrders || ' ban ghi giao dich Orders va OrderItems...');

    FOR i IN 1..v_LoopCount LOOP
        INSERT INTO "Orders" (
            "OrderId", "UserId", "OrderDate", "TotalAmount", "Status",
            "ShippingAddress", "PaymentStatus", "FullName", "Phone"
        )
        SELECT 
            v_StartId + (i - 1) * v_BatchSize + LEVEL - 1,
            v_RealUserId,
            SYSDATE - DBMS_RANDOM.VALUE(1, 365),
            ROUND(DBMS_RANDOM.VALUE(50000, 2000000), -3),
            N'Đã giao',
            N'Địa chỉ giao hàng tự động số ' || TO_CHAR(LEVEL),
            N'Đã thanh toán',
            N'Khách hàng ' || TO_CHAR(LEVEL),
            '09' || TRUNC(DBMS_RANDOM.VALUE(10000000, 99999999))
        FROM DUAL
        CONNECT BY LEVEL <= LEAST(v_BatchSize, p_NumOrders - (i - 1) * v_BatchSize);

        INSERT INTO "OrderItems" ("OrderId", "ProductId", "Quantity", "Price")
        SELECT 
            v_StartId + (i - 1) * v_BatchSize + LEVEL - 1,
            NVL(v_RealProductId, 1),
            TRUNC(DBMS_RANDOM.VALUE(1, 5)),
            ROUND(DBMS_RANDOM.VALUE(25000, 500000), -3)
        FROM DUAL
        CONNECT BY LEVEL <= LEAST(v_BatchSize, p_NumOrders - (i - 1) * v_BatchSize);

        COMMIT;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Sinh du lieu lon hoan tat thanh cong!');
END;
/

