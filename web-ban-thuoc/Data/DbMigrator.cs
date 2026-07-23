using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;
using web_ban_thuoc.Models;
using Oracle.EntityFrameworkCore.Infrastructure;

namespace web_ban_thuoc.Data;

public static class DbMigrator
{
    public static void Migrate(string sqlServerConnString, string oracleConnString)
    {
        Console.WriteLine("=== Bat dau qua trinh di chuyen CSDL tu SQL Server sang Oracle ===");

        // 1. Tao DbContext Options cho SQL Server va Oracle
        var sqlServerOptions = new DbContextOptionsBuilder<LongChauDbContext>()
            .UseSqlServer(sqlServerConnString)
            .Options;

        var oracleOptions = new DbContextOptionsBuilder<LongChauDbContext>()
            .UseOracle(oracleConnString, ob => ob.UseOracleSQLCompatibility(OracleSQLCompatibility.DatabaseVersion19))
            .Options;

        using var sqlDb = new LongChauDbContext(sqlServerOptions);
        using var oracleDb = new LongChauDbContext(oracleOptions);
        sqlDb.DisableAuditing = true;
        oracleDb.DisableAuditing = true;

        // 2. Xoa va khoi tao lai Database tren Oracle
        Console.WriteLine("Dang xoa CSDL Oracle cu (neu co)...");
        oracleDb.Database.EnsureDeleted();
        Console.WriteLine("Dang khoi tao cau truc CSDL tren Oracle...");
        oracleDb.Database.Migrate();
        Console.WriteLine("Cau truc CSDL Oracle da duoc khoi tao thanh cong.");

        // 3. Thuc hien sao chep du lieu tung bang theo thu tu de tranh loi khoa ngoai
        Console.WriteLine("Bat dau sao chep du lieu...");

        // 3.1. Roles
        Console.Write("Sao chep AspNetRoles... ");
        var roles = sqlDb.Roles.AsNoTracking().ToList();
        oracleDb.Roles.AddRange(roles);
        oracleDb.SaveChanges();
        Console.WriteLine($"{roles.Count} ban ghi.");

        // 3.2. Users
        Console.Write("Sao chep AspNetUsers... ");
        var users = sqlDb.Users.AsNoTracking().ToList();
        oracleDb.Users.AddRange(users);
        oracleDb.SaveChanges();
        Console.WriteLine($"{users.Count} ban ghi.");

        // 3.3. UserClaims
        Console.Write("Sao chep AspNetUserClaims... ");
        var userClaims = sqlDb.UserClaims.AsNoTracking().ToList();
        oracleDb.UserClaims.AddRange(userClaims);
        oracleDb.SaveChanges();
        Console.WriteLine($"{userClaims.Count} ban ghi.");

        // 3.4. UserLogins
        Console.Write("Sao chep AspNetUserLogins... ");
        var userLogins = sqlDb.UserLogins.AsNoTracking().ToList();
        oracleDb.UserLogins.AddRange(userLogins);
        oracleDb.SaveChanges();
        Console.WriteLine($"{userLogins.Count} ban ghi.");

        // 3.5. UserTokens
        Console.Write("Sao chep AspNetUserTokens... ");
        var userTokens = sqlDb.UserTokens.AsNoTracking().ToList();
        oracleDb.UserTokens.AddRange(userTokens);
        oracleDb.SaveChanges();
        Console.WriteLine($"{userTokens.Count} ban ghi.");

        // 3.6. UserRoles
        Console.Write("Sao chep AspNetUserRoles... ");
        var userRoles = sqlDb.UserRoles.AsNoTracking().ToList();
        oracleDb.UserRoles.AddRange(userRoles);
        oracleDb.SaveChanges();
        Console.WriteLine($"{userRoles.Count} ban ghi.");

        // 3.7. RoleClaims
        Console.Write("Sao chep AspNetRoleClaims... ");
        var roleClaims = sqlDb.RoleClaims.AsNoTracking().ToList();
        oracleDb.RoleClaims.AddRange(roleClaims);
        oracleDb.SaveChanges();
        Console.WriteLine($"{roleClaims.Count} ban ghi.");

        // 3.8. UserRankInfos
        Console.Write("Sao chep UserRankInfos... ");
        var userRankInfos = sqlDb.UserRankInfos.AsNoTracking().ToList();
        oracleDb.UserRankInfos.AddRange(userRankInfos);
        oracleDb.SaveChanges();
        Console.WriteLine($"{userRankInfos.Count} ban ghi.");

        // 3.9. Categories
        Console.Write("Sao chep Categories (tam ngat ParentCategoryId)... ");
        var categories = sqlDb.Categories.AsNoTracking().ToList();
        // De tranh tu tham chieu loi khi cha chua duoc tao, tam thoi gan ParentCategoryId = null
        var parentMapping = new Dictionary<int, int?>();
        foreach (var c in categories)
        {
            parentMapping[c.CategoryId] = c.ParentCategoryId;
            c.ParentCategoryId = null;
        }
        oracleDb.Categories.AddRange(categories);
        oracleDb.SaveChanges();

        // Cap nhat lai ParentCategoryId sau khi tat ca da duoc luu
        Console.Write("Dang cap nhat lai moi quan he cha-con cho Categories... ");
        foreach (var c in categories)
        {
            if (parentMapping.TryGetValue(c.CategoryId, out var parentId) && parentId.HasValue)
            {
                c.ParentCategoryId = parentId;
                oracleDb.Entry(c).State = EntityState.Modified;
            }
        }
        oracleDb.SaveChanges();
        Console.WriteLine($"{categories.Count} ban ghi.");

        // 3.10. Suppliers
        Console.Write("Sao chep Suppliers... ");
        var suppliers = sqlDb.Suppliers.AsNoTracking().ToList();
        oracleDb.Suppliers.AddRange(suppliers);
        oracleDb.SaveChanges();
        Console.WriteLine($"{suppliers.Count} ban ghi.");

        // 3.11. Products
        Console.Write("Sao chep Products... ");
        var products = sqlDb.Products.AsNoTracking().ToList();
        oracleDb.Products.AddRange(products);
        oracleDb.SaveChanges();
        Console.WriteLine($"{products.Count} ban ghi.");

        // 3.12. ProductImages
        Console.Write("Sao chep ProductImages... ");
        var productImages = sqlDb.ProductImages.AsNoTracking().ToList();
        oracleDb.ProductImages.AddRange(productImages);
        oracleDb.SaveChanges();
        Console.WriteLine($"{productImages.Count} ban ghi.");

        // 3.12.1. Reviews
        Console.Write("Sao chep Reviews... ");
        var reviews = sqlDb.Reviews.AsNoTracking().ToList();
        oracleDb.Reviews.AddRange(reviews);
        oracleDb.SaveChanges();
        Console.WriteLine($"{reviews.Count} ban ghi.");

        // 3.13. Warehouses
        Console.Write("Sao chep Warehouses... ");
        var warehouses = sqlDb.Warehouses.AsNoTracking().ToList();
        oracleDb.Warehouses.AddRange(warehouses);
        oracleDb.SaveChanges();
        Console.WriteLine($"{warehouses.Count} ban ghi.");

        // 3.13.1. PurchaseOrders
        Console.Write("Sao chep PurchaseOrders... ");
        var purchaseOrders = sqlDb.PurchaseOrders.AsNoTracking().ToList();
        oracleDb.PurchaseOrders.AddRange(purchaseOrders);
        oracleDb.SaveChanges();
        Console.WriteLine($"{purchaseOrders.Count} ban ghi.");

        // 3.13.2. PurchaseOrderLines
        Console.Write("Sao chep PurchaseOrderLines... ");
        var purchaseOrderLines = sqlDb.PurchaseOrderLines.AsNoTracking().ToList();
        oracleDb.PurchaseOrderLines.AddRange(purchaseOrderLines);
        oracleDb.SaveChanges();
        Console.WriteLine($"{purchaseOrderLines.Count} ban ghi.");

        // 3.13.3. GoodsReceipts
        Console.Write("Sao chep GoodsReceipts... ");
        var goodsReceipts = sqlDb.GoodsReceipts.AsNoTracking().ToList();
        oracleDb.GoodsReceipts.AddRange(goodsReceipts);
        oracleDb.SaveChanges();
        Console.WriteLine($"{goodsReceipts.Count} ban ghi.");

        // 3.13.4. GoodsReceiptLines
        Console.Write("Sao chep GoodsReceiptLines... ");
        var goodsReceiptLines = sqlDb.GoodsReceiptLines.AsNoTracking().ToList();
        oracleDb.GoodsReceiptLines.AddRange(goodsReceiptLines);
        oracleDb.SaveChanges();
        Console.WriteLine($"{goodsReceiptLines.Count} ban ghi.");

        // 3.14. WarehouseStocks
        Console.Write("Sao chep WarehouseStocks... ");
        var warehouseStocks = sqlDb.WarehouseStocks.AsNoTracking().ToList();
        oracleDb.WarehouseStocks.AddRange(warehouseStocks);
        oracleDb.SaveChanges();
        Console.WriteLine($"{warehouseStocks.Count} ban ghi.");

        // 3.15. ProductBatches
        Console.Write("Sao chep ProductBatches... ");
        var productBatches = sqlDb.ProductBatches.AsNoTracking().ToList();
        oracleDb.ProductBatches.AddRange(productBatches);
        oracleDb.SaveChanges();
        Console.WriteLine($"{productBatches.Count} ban ghi.");

        // 3.16. Vouchers
        Console.Write("Sao chep Vouchers... ");
        var vouchers = sqlDb.Vouchers.AsNoTracking().ToList();
        oracleDb.Vouchers.AddRange(vouchers);
        oracleDb.SaveChanges();
        Console.WriteLine($"{vouchers.Count} ban ghi.");

        // 3.17. UserVouchers
        Console.Write("Sao chep UserVouchers... ");
        var userVouchers = sqlDb.UserVouchers.AsNoTracking().ToList();
        oracleDb.UserVouchers.AddRange(userVouchers);
        oracleDb.SaveChanges();
        Console.WriteLine($"{userVouchers.Count} ban ghi.");

        // 3.18. Orders
        Console.Write("Sao chep Orders... ");
        var orders = sqlDb.Orders.AsNoTracking().ToList();
        oracleDb.Orders.AddRange(orders);
        oracleDb.SaveChanges();
        Console.WriteLine($"{orders.Count} ban ghi.");

        // 3.19. OrderItems
        Console.Write("Sao chep OrderItems... ");
        var orderItems = sqlDb.OrderItems.AsNoTracking().ToList();
        oracleDb.OrderItems.AddRange(orderItems);
        oracleDb.SaveChanges();
        Console.WriteLine($"{orderItems.Count} ban ghi.");

        // 3.20. OrderStatusHistories
        Console.Write("Sao chep OrderStatusHistories... ");
        var orderStatusHistories = sqlDb.OrderStatusHistories.AsNoTracking().ToList();
        oracleDb.OrderStatusHistories.AddRange(orderStatusHistories);
        oracleDb.SaveChanges();
        Console.WriteLine($"{orderStatusHistories.Count} ban ghi.");

        // 3.21. Payments
        Console.Write("Sao chep Payments... ");
        var payments = sqlDb.Payments.AsNoTracking().ToList();
        oracleDb.Payments.AddRange(payments);
        oracleDb.SaveChanges();
        Console.WriteLine($"{payments.Count} ban ghi.");

        // 3.22. Shipments
        Console.Write("Sao chep Shipments... ");
        var shipments = sqlDb.Shipments.AsNoTracking().ToList();
        oracleDb.Shipments.AddRange(shipments);
        oracleDb.SaveChanges();
        Console.WriteLine($"{shipments.Count} ban ghi.");

        // 3.23. VoucherRedemptions
        Console.Write("Sao chep VoucherRedemptions... ");
        var voucherRedemptions = sqlDb.VoucherRedemptions.AsNoTracking().ToList();
        oracleDb.VoucherRedemptions.AddRange(voucherRedemptions);
        oracleDb.SaveChanges();
        Console.WriteLine($"{voucherRedemptions.Count} ban ghi.");

        // 3.24. LoyaltyPointTransactions
        Console.Write("Sao chep LoyaltyPointTransactions... ");
        var loyaltyPointTransactions = sqlDb.LoyaltyPointTransactions.AsNoTracking().ToList();
        oracleDb.LoyaltyPointTransactions.AddRange(loyaltyPointTransactions);
        oracleDb.SaveChanges();
        Console.WriteLine($"{loyaltyPointTransactions.Count} ban ghi.");

        // 3.25. LoyaltyRewards
        Console.Write("Sao chep LoyaltyRewards... ");
        var loyaltyRewards = sqlDb.LoyaltyRewards.AsNoTracking().ToList();
        oracleDb.LoyaltyRewards.AddRange(loyaltyRewards);
        oracleDb.SaveChanges();
        Console.WriteLine($"{loyaltyRewards.Count} ban ghi.");

        // 3.26. InventoryTransactions
        Console.Write("Sao chep InventoryTransactions... ");
        var inventoryTransactions = sqlDb.InventoryTransactions.AsNoTracking().ToList();
        oracleDb.InventoryTransactions.AddRange(inventoryTransactions);
        oracleDb.SaveChanges();
        Console.WriteLine($"{inventoryTransactions.Count} ban ghi.");

        // 3.27. ChatMessages
        Console.Write("Sao chep ChatMessages... ");
        var chatMessages = sqlDb.ChatMessages.AsNoTracking().ToList();
        oracleDb.ChatMessages.AddRange(chatMessages);
        oracleDb.SaveChanges();
        Console.WriteLine($"{chatMessages.Count} ban ghi.");

        // 3.28. Banners
        Console.Write("Sao chep Banners... ");
        var banners = sqlDb.Banners.AsNoTracking().ToList();
        oracleDb.Banners.AddRange(banners);
        oracleDb.SaveChanges();
        Console.WriteLine($"{banners.Count} ban ghi.");

        // 3.29. DbActivityLogs
        Console.Write("Sao chep DbActivityLogs... ");
        var dbActivityLogs = sqlDb.DbActivityLogs.AsNoTracking().ToList();
        oracleDb.DbActivityLogs.AddRange(dbActivityLogs);
        oracleDb.SaveChanges();
        Console.WriteLine($"{dbActivityLogs.Count} ban ghi.");

        // 3.30. News
        Console.Write("Sao chep News... ");
        var news = sqlDb.News.AsNoTracking().ToList();
        oracleDb.News.AddRange(news);
        oracleDb.SaveChanges();
        Console.WriteLine($"{news.Count} ban ghi.");

        // 3.31. StockAdjustments
        Console.Write("Sao chep StockAdjustments... ");
        var stockAdjustments = sqlDb.StockAdjustments.AsNoTracking().ToList();
        oracleDb.StockAdjustments.AddRange(stockAdjustments);
        oracleDb.SaveChanges();
        Console.WriteLine($"{stockAdjustments.Count} ban ghi.");

        // 3.32. StockAdjustmentDetails
        Console.Write("Sao chep StockAdjustmentDetails... ");
        var stockAdjustmentDetails = sqlDb.StockAdjustmentDetails.AsNoTracking().ToList();
        oracleDb.StockAdjustmentDetails.AddRange(stockAdjustmentDetails);
        oracleDb.SaveChanges();
        Console.WriteLine($"{stockAdjustmentDetails.Count} ban ghi.");

        // 3.33. PayOSWebhookEvents
        Console.Write("Sao chep PayOSWebhookEvents... ");
        var payOSWebhookEvents = sqlDb.PayOSWebhookEvents.AsNoTracking().ToList();
        oracleDb.PayOSWebhookEvents.AddRange(payOSWebhookEvents);
        oracleDb.SaveChanges();
        Console.WriteLine($"{payOSWebhookEvents.Count} ban ghi.");

        // 3.34. Carts
        Console.Write("Sao chep Carts... ");
        var carts = sqlDb.Carts.AsNoTracking().ToList();
        oracleDb.Carts.AddRange(carts);
        oracleDb.SaveChanges();
        Console.WriteLine($"{carts.Count} ban ghi.");

        // 3.35. CartItems
        Console.Write("Sao chep CartItems... ");
        var cartItems = sqlDb.CartItems.AsNoTracking().ToList();
        oracleDb.CartItems.AddRange(cartItems);
        oracleDb.SaveChanges();
        Console.WriteLine($"{cartItems.Count} ban ghi.");

        // 4. Khoi tao lai cac Sequences (Identity) trong Oracle de tranh xung dot khoa khi Insert moi
        Console.WriteLine("Cap nhat lai Sequence/Identity cac bang trong Oracle...");
        ResetSequences(oracleDb);

        Console.WriteLine("=== Qua trinh di chuyen du lieu HOAN THANH THANH CONG! ===");
    }

    private static void ResetSequences(LongChauDbContext db)
    {
        var identityTables = new Dictionary<string, string>
        {
            { "Categories", "CategoryId" },
            { "Products", "ProductId" },
            { "ProductImages", "ProductImageId" },
            { "Warehouses", "WarehouseId" },
            { "WarehouseStocks", "WarehouseStockId" },
            { "ProductBatches", "ProductBatchId" },
            { "InventoryTransactions", "TransactionId" },
            { "Carts", "CartId" },
            { "CartItems", "CartItemId" },
            { "Vouchers", "VoucherId" },
            { "UserVouchers", "UserVoucherId" },
            { "Orders", "OrderId" },
            { "OrderItems", "OrderItemId" },
            { "OrderStatusHistories", "OrderStatusHistoryId" },
            { "Payments", "PaymentId" },
            { "Shipments", "ShipmentId" },
            { "VoucherRedemptions", "VoucherRedemptionId" },
            { "LoyaltyPointTransactions", "LoyaltyPointTransactionId" },
            { "LoyaltyRewards", "LoyaltyRewardId" },
            { "ChatMessages", "Id" },
            { "Banners", "BannerId" },
            { "DbActivityLogs", "Id" },
            { "News", "NewsId" },
            { "StockAdjustments", "StockAdjustmentId" },
            { "StockAdjustmentDetails", "StockAdjustmentDetailId" },
            { "PayOSWebhookEvents", "PayOSWebhookEventId" },
            { "AspNetUserClaims", "Id" },
            { "AspNetRoleClaims", "Id" }
        };

        foreach (var pair in identityTables)
        {
            string tableName = pair.Key;
            string columnName = pair.Value;
            try
            {
                // Su dung cu phap START WITH LIMIT VALUE cua Oracle 12cR2+ de tu dong dat gia tri tiep theo lon hon Max ID hien tai
                string sql = $"ALTER TABLE \"{tableName}\" MODIFY (\"{columnName}\" GENERATED BY DEFAULT AS IDENTITY (START WITH LIMIT VALUE))";
                db.Database.ExecuteSqlRaw(sql);
                Console.WriteLine($"-> Da reset Sequence cho bang {pair.Key}.");
            }
            catch (Exception ex)
            {
                // Thu vien ASP.NET Identity co the viet bang khac di, hoac bang khong co du lieu
                Console.WriteLine($"[Canh bao] Khong the reset sequence cho {pair.Key} (co the bang rong): {ex.Message}");
            }
        }
    }
}
