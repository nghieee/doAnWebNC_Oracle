using System;
using System.IO;
using System.Linq;
using System.Text;
using Microsoft.EntityFrameworkCore;
using web_ban_thuoc.Models;

namespace web_ban_thuoc.Data;

public static class DataExporter
{
    public static void Export(string connString, bool isOracle, string outputPath)
    {
        Console.WriteLine($"[Exporter] Dang ket noi toi database (isOracle={isOracle})...");
        
        DbContextOptions<LongChauDbContext> options;
        if (isOracle)
        {
            options = new DbContextOptionsBuilder<LongChauDbContext>()
                .UseOracle(connString)
                .Options;
        }
        else
        {
            options = new DbContextOptionsBuilder<LongChauDbContext>()
                .UseSqlServer(connString)
                .Options;
        }

        using var db = new LongChauDbContext(options);
        db.DisableAuditing = true;

        var sb = new StringBuilder();
        sb.AppendLine("-- =============================================================================");
        sb.AppendLine("-- ĐỒ ÁN MÔN HỌC: CÁC HỆ QUẢN TRỊ CƠ SỞ DỮ LIỆU (ORACLE 19C)");
        sb.AppendLine("-- SCRIPT 01B: DỮ LIỆU THỰC TẾ TRÍCH XUẤT TỪ CSDL HỆ THỐNG");
        sb.AppendLine("-- =============================================================================");
        sb.AppendLine();
        sb.AppendLine("SET DEFINE OFF;");
        sb.AppendLine();

        // 1. Categories
        var categories = db.Categories.AsNoTracking().ToList();
        sb.AppendLine($"-- 1. BẢNG Categories ({categories.Count} ban ghi)");
        foreach (var c in categories)
        {
            sb.AppendLine($"INSERT INTO \"Categories\" (\"CategoryId\", \"CategoryName\", \"Description\", \"ImageUrl\", \"ParentCategoryId\", \"IsFeature\", \"CategoryLevel\", \"ProductCount\") VALUES ({c.CategoryId}, {NStrVal(c.CategoryName)}, {NStrVal(c.Description)}, {StrVal(c.ImageUrl)}, {NullVal(c.ParentCategoryId)}, {BoolVal(c.IsFeature)}, {StrVal(c.CategoryLevel)}, {c.ProductCount});");
        }
        sb.AppendLine();

        // 2. Suppliers
        var suppliers = db.Suppliers.AsNoTracking().ToList();
        sb.AppendLine($"-- 2. BẢNG Suppliers ({suppliers.Count} ban ghi)");
        foreach (var s in suppliers)
        {
            sb.AppendLine($"INSERT INTO \"Suppliers\" (\"SupplierId\", \"Code\", \"Name\", \"Phone\", \"Email\", \"Address\", \"TaxCode\", \"IsActive\") VALUES ({s.SupplierId}, {StrVal(s.Code)}, {NStrVal(s.Name)}, {StrVal(s.Phone)}, {StrVal(s.Email)}, {NStrVal(s.Address)}, {StrVal(s.TaxCode)}, {BoolVal(s.IsActive)});");
        }
        sb.AppendLine();

        // 3. Products
        var products = db.Products.AsNoTracking().ToList();
        sb.AppendLine($"-- 3. BẢNG Products ({products.Count} ban ghi)");
        foreach (var p in products)
        {
            sb.AppendLine($"INSERT INTO \"Products\" (\"ProductId\", \"ProductName\", \"Sku\", \"Barcode\", \"RegistrationNumber\", \"RequiresPrescription\", \"CostPrice\", \"Price\", \"Brand\", \"Package\", \"CategoryId\", \"SupplierId\", \"Ingredients\", \"Uses\", \"Dosage\", \"Contraindications\", \"IngredientUnit\", \"IsFeature\", \"Origin\", \"StockQuantity\", \"MinStockLevel\", \"IsActive\", \"Slug\", \"SoldQuantity\") VALUES ({p.ProductId}, {NStrVal(p.ProductName)}, {StrVal(p.Sku)}, {StrVal(p.Barcode)}, {StrVal(p.RegistrationNumber)}, {BoolVal(p.RequiresPrescription)}, {p.CostPrice}, {p.Price}, {NStrVal(p.Brand)}, {NStrVal(p.Package)}, {NullVal(p.CategoryId)}, {NullVal(p.SupplierId)}, {NStrVal(p.Ingredients)}, {NStrVal(p.Uses)}, {NStrVal(p.Dosage)}, {NStrVal(p.Contraindications)}, {NStrVal(p.IngredientUnit)}, {BoolVal(p.IsFeature)}, {NStrVal(p.Origin)}, {p.StockQuantity}, {p.MinStockLevel}, {BoolVal(p.IsActive)}, {StrVal(p.Slug)}, {p.SoldQuantity ?? 0});");
        }
        sb.AppendLine();

        // 4. ProductImages
        var productImages = db.ProductImages.AsNoTracking().ToList();
        sb.AppendLine($"-- 4. BẢNG ProductImages ({productImages.Count} ban ghi)");
        foreach (var pi in productImages)
        {
            sb.AppendLine($"INSERT INTO \"ProductImages\" (\"ProductImageId\", \"ProductId\", \"ImageUrl\", \"SortOrder\", \"IsMain\") VALUES ({pi.ProductImageId}, {pi.ProductId}, {StrVal(pi.ImageUrl)}, {pi.SortOrder}, {BoolVal(pi.IsMain)});");
        }
        sb.AppendLine();

        // 5. AspNetUsers
        var users = db.Users.AsNoTracking().ToList();
        sb.AppendLine($"-- 5. BẢNG AspNetUsers ({users.Count} ban ghi)");
        foreach (var u in users)
        {
            sb.AppendLine($"INSERT INTO \"AspNetUsers\" (\"Id\", \"UserName\", \"Email\", \"PasswordHash\", \"PhoneNumber\") VALUES ({StrVal(u.Id)}, {NStrVal(u.UserName)}, {StrVal(u.Email)}, {StrVal(u.PasswordHash)}, {StrVal(u.PhoneNumber)});");
        }
        sb.AppendLine();

        // 6. UserRankInfos
        var userRankInfos = db.UserRankInfos.AsNoTracking().ToList();
        sb.AppendLine($"-- 6. BẢNG UserRankInfos ({userRankInfos.Count} ban ghi)");
        foreach (var r in userRankInfos)
        {
            sb.AppendLine($"INSERT INTO \"UserRankInfos\" (\"UserId\", \"TotalSpent\", \"TotalSpent6Months\", \"Rank\", \"LoyaltyPoints\") VALUES ({StrVal(r.UserId)}, {r.TotalSpent}, {r.TotalSpent6Months}, {StrVal(r.Rank)}, {r.LoyaltyPoints});");
        }
        sb.AppendLine();

        // 7. Vouchers
        var vouchers = db.Vouchers.AsNoTracking().ToList();
        sb.AppendLine($"-- 7. BẢNG Vouchers ({vouchers.Count} ban ghi)");
        foreach (var v in vouchers)
        {
            sb.AppendLine($"INSERT INTO \"Vouchers\" (\"VoucherId\", \"Code\", \"Description\", \"ExpiryDate\", \"DiscountAmount\", \"PercentValue\", \"DiscountType\", \"MinOrderAmount\", \"RequiredRank\", \"MaxUsage\", \"UsedCount\", \"IsPublic\", \"IsActive\", \"CategoryId\") VALUES ({v.VoucherId}, {StrVal(v.Code)}, {NStrVal(v.Description)}, {DateVal(v.ExpiryDate)}, {v.DiscountAmount ?? 0}, {v.PercentValue ?? 0}, {StrVal(v.DiscountType)}, {v.MinOrderAmount ?? 0}, {StrVal(v.RequiredRank)}, {NullVal(v.MaxUsage)}, {v.UsedCount}, {BoolVal(v.IsPublic)}, {BoolVal(v.IsActive)}, {NullVal(v.CategoryId)});");
        }
        sb.AppendLine();

        // 8. UserVouchers
        var userVouchers = db.UserVouchers.AsNoTracking().ToList();
        sb.AppendLine($"-- 8. BẢNG UserVouchers ({userVouchers.Count} ban ghi)");
        foreach (var uv in userVouchers)
        {
            sb.AppendLine($"INSERT INTO \"UserVouchers\" (\"UserVoucherId\", \"UserId\", \"VoucherId\", \"IsUsed\", \"UsedDate\") VALUES ({uv.UserVoucherId}, {StrVal(uv.UserId)}, {uv.VoucherId}, {BoolVal(uv.IsUsed)}, {DateVal(uv.UsedDate)});");
        }
        sb.AppendLine();

        // 9. Warehouses
        var warehouses = db.Warehouses.AsNoTracking().ToList();
        sb.AppendLine($"-- 9. BẢNG Warehouses ({warehouses.Count} ban ghi)");
        foreach (var w in warehouses)
        {
            sb.AppendLine($"INSERT INTO \"Warehouses\" (\"WarehouseId\", \"Name\", \"Address\", \"IsDefault\", \"IsActive\") VALUES ({w.WarehouseId}, {NStrVal(w.Name)}, {NStrVal(w.Address)}, {BoolVal(w.IsDefault)}, {BoolVal(w.IsActive)});");
        }
        sb.AppendLine();

        // 10. WarehouseStocks
        var warehouseStocks = db.WarehouseStocks.AsNoTracking().ToList();
        sb.AppendLine($"-- 10. BẢNG WarehouseStocks ({warehouseStocks.Count} ban ghi)");
        foreach (var ws in warehouseStocks)
        {
            sb.AppendLine($"INSERT INTO \"WarehouseStocks\" (\"WarehouseStockId\", \"WarehouseId\", \"ProductId\", \"QuantityOnHand\", \"QuantityReserved\") VALUES ({ws.WarehouseStockId}, {ws.WarehouseId}, {ws.ProductId}, {ws.QuantityOnHand}, {ws.QuantityReserved});");
        }
        sb.AppendLine();

        // 11. ProductBatches
        var productBatches = db.ProductBatches.AsNoTracking().ToList();
        sb.AppendLine($"-- 11. BẢNG ProductBatches ({productBatches.Count} ban ghi)");
        foreach (var pb in productBatches)
        {
            sb.AppendLine($"INSERT INTO \"ProductBatches\" (\"ProductBatchId\", \"ProductId\", \"WarehouseId\", \"BatchNo\", \"ExpiryDate\", \"QuantityOnHand\", \"UnitCost\") VALUES ({pb.ProductBatchId}, {pb.ProductId}, {pb.WarehouseId}, {StrVal(pb.BatchNo)}, {DateVal(pb.ExpiryDate)}, {pb.QuantityOnHand}, {pb.UnitCost});");
        }
        sb.AppendLine();

        // 12. Orders
        var orders = db.Orders.AsNoTracking().ToList();
        sb.AppendLine($"-- 12. BẢNG Orders ({orders.Count} ban ghi)");
        foreach (var o in orders)
        {
            sb.AppendLine($"INSERT INTO \"Orders\" (\"OrderId\", \"UserId\", \"OrderDate\", \"TotalAmount\", \"Status\", \"ShippingAddress\", \"PaymentStatus\", \"FullName\", \"Phone\", \"VoucherCode\", \"VoucherDiscount\", \"PrescriptionNote\") VALUES ({o.OrderId}, {StrVal(o.UserId)}, {DateVal(o.OrderDate)}, {o.TotalAmount}, {NStrVal(o.Status)}, {NStrVal(o.ShippingAddress)}, {NStrVal(o.PaymentStatus)}, {NStrVal(o.FullName)}, {StrVal(o.Phone)}, {StrVal(o.VoucherCode)}, {o.VoucherDiscount ?? 0}, {NStrVal(o.PrescriptionNote)});");
        }
        sb.AppendLine();

        // 13. OrderItems
        var orderItems = db.OrderItems.AsNoTracking().ToList();
        sb.AppendLine($"-- 13. BẢNG OrderItems ({orderItems.Count} ban ghi)");
        foreach (var oi in orderItems)
        {
            sb.AppendLine($"INSERT INTO \"OrderItems\" (\"OrderItemId\", \"OrderId\", \"ProductId\", \"Quantity\", \"Price\") VALUES ({oi.OrderItemId}, {oi.OrderId}, {oi.ProductId}, {oi.Quantity}, {oi.Price});");
        }
        sb.AppendLine();

        // 14. Payments
        var payments = db.Payments.AsNoTracking().ToList();
        sb.AppendLine($"-- 14. BẢNG Payments ({payments.Count} ban ghi)");
        foreach (var pm in payments)
        {
            sb.AppendLine($"INSERT INTO \"Payments\" (\"PaymentId\", \"OrderId\", \"PaymentMethod\", \"Amount\", \"PaymentDate\", \"PaymentStatus\", \"TransactionId\") VALUES ({pm.PaymentId}, {NullVal(pm.OrderId)}, {StrVal(pm.PaymentMethod)}, {pm.Amount}, {DateVal(pm.PaymentDate)}, {StrVal(pm.PaymentStatus)}, {StrVal(pm.TransactionId)});");
        }
        sb.AppendLine();

        // 15. VoucherRedemptions
        var voucherRedemptions = db.VoucherRedemptions.AsNoTracking().ToList();
        sb.AppendLine($"-- 15. BẢNG VoucherRedemptions ({voucherRedemptions.Count} ban ghi)");
        foreach (var vr in voucherRedemptions)
        {
            sb.AppendLine($"INSERT INTO \"VoucherRedemptions\" (\"VoucherRedemptionId\", \"VoucherId\", \"UserId\", \"OrderId\", \"DiscountAmount\", \"RedeemedAt\", \"IsReverted\") VALUES ({vr.VoucherRedemptionId}, {vr.VoucherId}, {StrVal(vr.UserId)}, {vr.OrderId}, {vr.DiscountAmount}, {DateVal(vr.RedeemedAt)}, {BoolVal(vr.IsReverted)});");
        }
        sb.AppendLine();

        // 16. InventoryTransactions
        var invTrans = db.InventoryTransactions.AsNoTracking().ToList();
        sb.AppendLine($"-- 16. BẢNG InventoryTransactions ({invTrans.Count} ban ghi)");
        foreach (var it in invTrans)
        {
            sb.AppendLine($"INSERT INTO \"InventoryTransactions\" (\"TransactionId\", \"ProductId\", \"WarehouseId\", \"TransactionType\", \"Quantity\", \"QuantityBefore\", \"QuantityAfter\", \"OrderId\", \"TransactionDate\") VALUES ({it.TransactionId}, {it.ProductId}, {it.WarehouseId}, {StrVal(it.TransactionType)}, {it.Quantity}, {it.QuantityBefore}, {it.QuantityAfter}, {NullVal(it.OrderId)}, {DateVal(it.TransactionDate)});");
        }
        sb.AppendLine();

        sb.AppendLine("COMMIT;");
        sb.AppendLine();

        // Append Procedure sinh dữ liệu lớn
        sb.AppendLine(@"-- =============================================================================
-- THỦ TỤC SINH DỮ LIỆU LỚN (TỰ ĐỘNG SINH 100.000+ DÒNG GIAO DỊCH VẤN ĐÁP)
-- =============================================================================
CREATE OR REPLACE PROCEDURE PROC_GENERATE_LARGE_DATA (
    p_NumOrders IN NUMBER DEFAULT 100000
) AS
    v_StartId NUMBER;
    v_BatchSize CONSTANT NUMBER := 5000;
    v_LoopCount NUMBER;
BEGIN
    SELECT NVL(MAX(""OrderId""), 1000) + 1 INTO v_StartId FROM ""Orders"";
    v_LoopCount := CEIL(p_NumOrders / v_BatchSize);

    DBMS_OUTPUT.PUT_LINE('Dang sinh ' || p_NumOrders || ' ban ghi giao dich Orders va OrderItems...');

    FOR i IN 1..v_LoopCount LOOP
        INSERT INTO ""Orders"" (
            ""OrderId"", ""UserId"", ""OrderDate"", ""TotalAmount"", ""Status"",
            ""ShippingAddress"", ""PaymentStatus"", ""FullName"", ""Phone""
        )
        SELECT 
            v_StartId + (i - 1) * v_BatchSize + LEVEL - 1,
            'USER_CUST_0' || TO_CHAR(MOD(LEVEL, 3) + 1),
            SYSDATE - DBMS_RANDOM.VALUE(1, 365),
            ROUND(DBMS_RANDOM.VALUE(50000, 2000000), -3),
            'Đã giao',
            N'Địa chỉ giao hàng tự động số ' || TO_CHAR(LEVEL),
            'Đã thanh toán',
            N'Khách hàng ' || TO_CHAR(LEVEL),
            '09' || TRUNC(DBMS_RANDOM.VALUE(10000000, 99999999))
        FROM DUAL
        CONNECT BY LEVEL <= LEAST(v_BatchSize, p_NumOrders - (i - 1) * v_BatchSize);

        INSERT INTO ""OrderItems"" (""OrderId"", ""ProductId"", ""Quantity"", ""Price"")
        SELECT 
            v_StartId + (i - 1) * v_BatchSize + LEVEL - 1,
            MOD(LEVEL, 7) + 1,
            TRUNC(DBMS_RANDOM.VALUE(1, 5)),
            ROUND(DBMS_RANDOM.VALUE(25000, 500000), -3)
        FROM DUAL
        CONNECT BY LEVEL <= LEAST(v_BatchSize, p_NumOrders - (i - 1) * v_BatchSize);

        COMMIT;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Sinh du lieu lon hoan tat thanh cong!');
END;
/
");

        File.WriteAllText(outputPath, sb.ToString(), Encoding.UTF8);
        Console.WriteLine($"[Exporter] XUAT DU LIEU HOAN TAT THANH CONG -> {outputPath}");
    }

    private static string Escape(string? val) => val?.Replace("'", "''") ?? "";
    private static string StrVal(string? val) => val != null ? $"'{Escape(val)}'" : "NULL";
    private static string NStrVal(string? val) => val != null ? $"N'{Escape(val)}'" : "NULL";
    private static string NullVal<T>(T? val) where T : struct => val.HasValue ? val.Value.ToString()! : "NULL";
    private static string DateVal(DateTime? dt) => dt.HasValue ? $"TO_DATE('{dt.Value:yyyy-MM-dd HH:mm:ss}', 'YYYY-MM-DD HH24:MI:SS')" : "NULL";
    private static int BoolVal(bool? b) => (b == true) ? 1 : 0;
}
