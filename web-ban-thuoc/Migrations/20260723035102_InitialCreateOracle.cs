using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace web_ban_thuoc.Migrations
{
    /// <inheritdoc />
    public partial class InitialCreateOracle : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "AspNetRoles",
                columns: table => new
                {
                    Id = table.Column<string>(type: "NVARCHAR2(450)", nullable: false),
                    Name = table.Column<string>(type: "NVARCHAR2(256)", maxLength: 256, nullable: true),
                    NormalizedName = table.Column<string>(type: "NVARCHAR2(256)", maxLength: 256, nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUsers",
                columns: table => new
                {
                    Id = table.Column<string>(type: "NVARCHAR2(450)", nullable: false),
                    UserName = table.Column<string>(type: "NVARCHAR2(256)", maxLength: 256, nullable: true),
                    NormalizedUserName = table.Column<string>(type: "NVARCHAR2(256)", maxLength: 256, nullable: true),
                    Email = table.Column<string>(type: "NVARCHAR2(256)", maxLength: 256, nullable: true),
                    NormalizedEmail = table.Column<string>(type: "NVARCHAR2(256)", maxLength: 256, nullable: true),
                    EmailConfirmed = table.Column<bool>(type: "NUMBER(1)", nullable: false),
                    PasswordHash = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    SecurityStamp = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    PhoneNumber = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(type: "NUMBER(1)", nullable: false),
                    TwoFactorEnabled = table.Column<bool>(type: "NUMBER(1)", nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(type: "TIMESTAMP(7) WITH TIME ZONE", nullable: true),
                    LockoutEnabled = table.Column<bool>(type: "NUMBER(1)", nullable: false),
                    AccessFailedCount = table.Column<int>(type: "NUMBER(10)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUsers", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Banners",
                columns: table => new
                {
                    BannerId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    Title = table.Column<string>(type: "NVARCHAR2(100)", maxLength: 100, nullable: false),
                    Description = table.Column<string>(type: "NVARCHAR2(200)", maxLength: 200, nullable: true),
                    ImageUrl = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    LinkUrl = table.Column<string>(type: "NVARCHAR2(200)", maxLength: 200, nullable: true),
                    BannerType = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    SortOrder = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    IsActive = table.Column<bool>(type: "NUMBER(1)", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Banners", x => x.BannerId);
                });

            migrationBuilder.CreateTable(
                name: "Carts",
                columns: table => new
                {
                    CartId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    UserId = table.Column<string>(type: "NVARCHAR2(450)", nullable: false),
                    VoucherCode = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    VoucherDiscount = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Carts", x => x.CartId);
                });

            migrationBuilder.CreateTable(
                name: "Categories",
                columns: table => new
                {
                    CategoryId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    CategoryName = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    Description = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    ImageUrl = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    ParentCategoryId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    IsFeature = table.Column<bool>(type: "NUMBER(1)", nullable: false),
                    CategoryLevel = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    ProductCount = table.Column<int>(type: "NUMBER(10)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Categories", x => x.CategoryId);
                    table.ForeignKey(
                        name: "FK_Categories_Categories_ParentCategoryId",
                        column: x => x.ParentCategoryId,
                        principalTable: "Categories",
                        principalColumn: "CategoryId");
                });

            migrationBuilder.CreateTable(
                name: "ChatMessages",
                columns: table => new
                {
                    Id = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    SenderId = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    ReceiverId = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    Message = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    SentAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false),
                    IsRead = table.Column<bool>(type: "NUMBER(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ChatMessages", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "DbActivityLogs",
                columns: table => new
                {
                    Id = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    UserId = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    UserEmail = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    Action = table.Column<string>(type: "NVARCHAR2(50)", maxLength: 50, nullable: false),
                    EntityName = table.Column<string>(type: "NVARCHAR2(100)", maxLength: 100, nullable: false),
                    EntityId = table.Column<string>(type: "NVARCHAR2(50)", maxLength: 50, nullable: true),
                    Description = table.Column<string>(type: "NCLOB", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DbActivityLogs", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "LoyaltyRewards",
                columns: table => new
                {
                    LoyaltyRewardId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    Title = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    Description = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    PointsCost = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    RewardType = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    PercentValue = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: true),
                    DiscountAmount = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: true),
                    ExpiryDays = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    MinOrderAmount = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: true),
                    RequiredRank = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    StockRemaining = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    MaxPerUser = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    IsActive = table.Column<bool>(type: "NUMBER(1)", nullable: false),
                    SortOrder = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_LoyaltyRewards", x => x.LoyaltyRewardId);
                });

            migrationBuilder.CreateTable(
                name: "News",
                columns: table => new
                {
                    NewsId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    Title = table.Column<string>(type: "NVARCHAR2(300)", maxLength: 300, nullable: false),
                    Slug = table.Column<string>(type: "NVARCHAR2(300)", maxLength: 300, nullable: true),
                    Summary = table.Column<string>(type: "NVARCHAR2(500)", maxLength: 500, nullable: true),
                    Content = table.Column<string>(type: "NCLOB", nullable: true),
                    ImageUrl = table.Column<string>(type: "NVARCHAR2(300)", maxLength: 300, nullable: true),
                    Category = table.Column<string>(type: "NVARCHAR2(100)", maxLength: 100, nullable: true),
                    IsFeature = table.Column<bool>(type: "NUMBER(1)", nullable: false),
                    IsPublished = table.Column<bool>(type: "NUMBER(1)", nullable: false),
                    ViewCount = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    Author = table.Column<string>(type: "NVARCHAR2(100)", maxLength: 100, nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: true),
                    PublishedAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: true),
                    Source = table.Column<string>(type: "NVARCHAR2(50)", maxLength: 50, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_News", x => x.NewsId);
                });

            migrationBuilder.CreateTable(
                name: "PayOSWebhookEvents",
                columns: table => new
                {
                    PayOSWebhookEventId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    IdempotencyKey = table.Column<string>(type: "NVARCHAR2(450)", nullable: false),
                    OrderId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    OrderCode = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    PaymentSuccess = table.Column<bool>(type: "NUMBER(1)", nullable: false),
                    RawPayload = table.Column<string>(type: "NCLOB", nullable: true),
                    ProcessedAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PayOSWebhookEvents", x => x.PayOSWebhookEventId);
                });

            migrationBuilder.CreateTable(
                name: "Suppliers",
                columns: table => new
                {
                    SupplierId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    Code = table.Column<string>(type: "NVARCHAR2(450)", nullable: false),
                    Name = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    Phone = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    Email = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    Address = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    TaxCode = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    IsActive = table.Column<bool>(type: "NUMBER(1)", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Suppliers", x => x.SupplierId);
                });

            migrationBuilder.CreateTable(
                name: "UserRankInfos",
                columns: table => new
                {
                    UserId = table.Column<string>(type: "NVARCHAR2(450)", nullable: false),
                    TotalSpent = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: false),
                    TotalSpent6Months = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: false),
                    Rank = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    LoyaltyPoints = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    LastRankMailSent = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: true),
                    LastNotiMailSent = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: true),
                    LastRankReset = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserRankInfos", x => x.UserId);
                });

            migrationBuilder.CreateTable(
                name: "Warehouses",
                columns: table => new
                {
                    WarehouseId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    Name = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    Address = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    IsDefault = table.Column<bool>(type: "NUMBER(1)", nullable: false),
                    IsActive = table.Column<bool>(type: "NUMBER(1)", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Warehouses", x => x.WarehouseId);
                });

            migrationBuilder.CreateTable(
                name: "AspNetRoleClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    RoleId = table.Column<string>(type: "NVARCHAR2(450)", nullable: false),
                    ClaimType = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    ClaimValue = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoleClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetRoleClaims_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    UserId = table.Column<string>(type: "NVARCHAR2(450)", nullable: false),
                    ClaimType = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    ClaimValue = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetUserClaims_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserLogins",
                columns: table => new
                {
                    LoginProvider = table.Column<string>(type: "NVARCHAR2(450)", nullable: false),
                    ProviderKey = table.Column<string>(type: "NVARCHAR2(450)", nullable: false),
                    ProviderDisplayName = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    UserId = table.Column<string>(type: "NVARCHAR2(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserLogins", x => new { x.LoginProvider, x.ProviderKey });
                    table.ForeignKey(
                        name: "FK_AspNetUserLogins_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserRoles",
                columns: table => new
                {
                    UserId = table.Column<string>(type: "NVARCHAR2(450)", nullable: false),
                    RoleId = table.Column<string>(type: "NVARCHAR2(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserRoles", x => new { x.UserId, x.RoleId });
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserTokens",
                columns: table => new
                {
                    UserId = table.Column<string>(type: "NVARCHAR2(450)", nullable: false),
                    LoginProvider = table.Column<string>(type: "NVARCHAR2(450)", nullable: false),
                    Name = table.Column<string>(type: "NVARCHAR2(450)", nullable: false),
                    Value = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserTokens", x => new { x.UserId, x.LoginProvider, x.Name });
                    table.ForeignKey(
                        name: "FK_AspNetUserTokens_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Orders",
                columns: table => new
                {
                    OrderId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    UserId = table.Column<string>(type: "NVARCHAR2(450)", nullable: true),
                    OrderDate = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: true),
                    TotalAmount = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: true),
                    Status = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    ShippingAddress = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    ProvinceId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    DistrictId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    WardCode = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    HouseNumber = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    PaymentStatus = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    FullName = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    Phone = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    VoucherCode = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    VoucherDiscount = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: true),
                    PrescriptionNote = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Orders", x => x.OrderId);
                    table.ForeignKey(
                        name: "FK_Orders_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.SetNull);
                });

            migrationBuilder.CreateTable(
                name: "Vouchers",
                columns: table => new
                {
                    VoucherId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    Code = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    Description = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    ExpiryDate = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false),
                    DiscountAmount = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: true),
                    IsActive = table.Column<bool>(type: "NUMBER(1)", nullable: false),
                    IsPublic = table.Column<bool>(type: "NUMBER(1)", nullable: false),
                    DiscountType = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    PercentValue = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: true),
                    CategoryId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    CategoryName = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    MinOrderAmount = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: true),
                    RequiredRank = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    Detail = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    MaxUsage = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    UsedCount = table.Column<int>(type: "NUMBER(10)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Vouchers", x => x.VoucherId);
                    table.ForeignKey(
                        name: "FK_Vouchers_Categories_CategoryId",
                        column: x => x.CategoryId,
                        principalTable: "Categories",
                        principalColumn: "CategoryId",
                        onDelete: ReferentialAction.SetNull);
                });

            migrationBuilder.CreateTable(
                name: "Products",
                columns: table => new
                {
                    ProductId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    ProductName = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    Sku = table.Column<string>(type: "NVARCHAR2(450)", nullable: true),
                    Barcode = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    RegistrationNumber = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    RequiresPrescription = table.Column<bool>(type: "NUMBER(1)", nullable: false),
                    CostPrice = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: true),
                    Brand = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    Price = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: false),
                    Package = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    CategoryId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    SupplierId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    Ingredients = table.Column<string>(type: "NCLOB", nullable: true),
                    Uses = table.Column<string>(type: "NCLOB", nullable: true),
                    Dosage = table.Column<string>(type: "NCLOB", nullable: true),
                    TargetUsers = table.Column<string>(type: "NCLOB", nullable: true),
                    Contraindications = table.Column<string>(type: "NCLOB", nullable: true),
                    IsFeature = table.Column<bool>(type: "NUMBER(1)", nullable: false),
                    Origin = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    StockQuantity = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    IsActive = table.Column<bool>(type: "NUMBER(1)", nullable: false),
                    IngredientUnit = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    Slug = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    SoldQuantity = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    MinStockLevel = table.Column<int>(type: "NUMBER(10)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Products", x => x.ProductId);
                    table.ForeignKey(
                        name: "FK_Products_Categories_CategoryId",
                        column: x => x.CategoryId,
                        principalTable: "Categories",
                        principalColumn: "CategoryId");
                    table.ForeignKey(
                        name: "FK_Products_Suppliers_SupplierId",
                        column: x => x.SupplierId,
                        principalTable: "Suppliers",
                        principalColumn: "SupplierId",
                        onDelete: ReferentialAction.SetNull);
                });

            migrationBuilder.CreateTable(
                name: "PurchaseOrders",
                columns: table => new
                {
                    PurchaseOrderId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    OrderCode = table.Column<string>(type: "NVARCHAR2(450)", nullable: false),
                    SupplierId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    WarehouseId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    Status = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    OrderDate = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false),
                    ExpectedDate = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: true),
                    Note = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    CreatedByUserId = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PurchaseOrders", x => x.PurchaseOrderId);
                    table.ForeignKey(
                        name: "FK_PurchaseOrders_Suppliers_SupplierId",
                        column: x => x.SupplierId,
                        principalTable: "Suppliers",
                        principalColumn: "SupplierId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PurchaseOrders_Warehouses_WarehouseId",
                        column: x => x.WarehouseId,
                        principalTable: "Warehouses",
                        principalColumn: "WarehouseId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "StockAdjustments",
                columns: table => new
                {
                    StockAdjustmentId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    AdjustmentCode = table.Column<string>(type: "NVARCHAR2(450)", nullable: false),
                    AdjustmentType = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    Reason = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    Note = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    RequestedBy = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    ApprovedBy = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    Status = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    WarehouseId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false),
                    ProcessedAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: true),
                    CreatedByUserId = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StockAdjustments", x => x.StockAdjustmentId);
                    table.ForeignKey(
                        name: "FK_StockAdjustments_Warehouses_WarehouseId",
                        column: x => x.WarehouseId,
                        principalTable: "Warehouses",
                        principalColumn: "WarehouseId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "LoyaltyPointTransactions",
                columns: table => new
                {
                    LoyaltyPointTransactionId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    UserId = table.Column<string>(type: "NVARCHAR2(450)", nullable: false),
                    Points = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    TransactionType = table.Column<string>(type: "NVARCHAR2(450)", nullable: false),
                    OrderId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    LoyaltyRewardId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    Description = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_LoyaltyPointTransactions", x => x.LoyaltyPointTransactionId);
                    table.ForeignKey(
                        name: "FK_LoyaltyPointTransactions_LoyaltyRewards_LoyaltyRewardId",
                        column: x => x.LoyaltyRewardId,
                        principalTable: "LoyaltyRewards",
                        principalColumn: "LoyaltyRewardId",
                        onDelete: ReferentialAction.SetNull);
                    table.ForeignKey(
                        name: "FK_LoyaltyPointTransactions_Orders_OrderId",
                        column: x => x.OrderId,
                        principalTable: "Orders",
                        principalColumn: "OrderId",
                        onDelete: ReferentialAction.SetNull);
                });

            migrationBuilder.CreateTable(
                name: "OrderStatusHistories",
                columns: table => new
                {
                    OrderStatusHistoryId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    OrderId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    FromStatus = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    ToStatus = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    ChangedByUserId = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    Note = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    ChangedAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_OrderStatusHistories", x => x.OrderStatusHistoryId);
                    table.ForeignKey(
                        name: "FK_OrderStatusHistories_Orders_OrderId",
                        column: x => x.OrderId,
                        principalTable: "Orders",
                        principalColumn: "OrderId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Payments",
                columns: table => new
                {
                    PaymentId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    OrderId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    PaymentMethod = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    Amount = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: true),
                    PaymentDate = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: true),
                    PaymentStatus = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    TransactionId = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Payments", x => x.PaymentId);
                    table.ForeignKey(
                        name: "FK_Payments_Orders_OrderId",
                        column: x => x.OrderId,
                        principalTable: "Orders",
                        principalColumn: "OrderId");
                });

            migrationBuilder.CreateTable(
                name: "Shipments",
                columns: table => new
                {
                    ShipmentId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    OrderId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    Carrier = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    TrackingCode = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    ShippingFee = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: true),
                    ShippedAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false),
                    EstimatedDelivery = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: true),
                    Note = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    CreatedByUserId = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false),
                    GhnOrderCode = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    GhnPrintToken = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    GhnPrintTokenExpiredAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: true),
                    GhnPrintFormat = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    GhnRawResponse = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Shipments", x => x.ShipmentId);
                    table.ForeignKey(
                        name: "FK_Shipments_Orders_OrderId",
                        column: x => x.OrderId,
                        principalTable: "Orders",
                        principalColumn: "OrderId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "UserVouchers",
                columns: table => new
                {
                    UserVoucherId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    UserId = table.Column<string>(type: "NVARCHAR2(450)", nullable: false),
                    VoucherId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    IsUsed = table.Column<bool>(type: "NUMBER(1)", nullable: false),
                    UsedDate = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: true),
                    IsNew = table.Column<bool>(type: "NUMBER(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserVouchers", x => x.UserVoucherId);
                    table.ForeignKey(
                        name: "FK_UserVouchers_Vouchers_VoucherId",
                        column: x => x.VoucherId,
                        principalTable: "Vouchers",
                        principalColumn: "VoucherId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "VoucherRedemptions",
                columns: table => new
                {
                    VoucherRedemptionId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    VoucherId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    UserId = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    OrderId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    DiscountAmount = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: false),
                    RedeemedAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false),
                    IsReverted = table.Column<bool>(type: "NUMBER(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_VoucherRedemptions", x => x.VoucherRedemptionId);
                    table.ForeignKey(
                        name: "FK_VoucherRedemptions_Orders_OrderId",
                        column: x => x.OrderId,
                        principalTable: "Orders",
                        principalColumn: "OrderId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_VoucherRedemptions_Vouchers_VoucherId",
                        column: x => x.VoucherId,
                        principalTable: "Vouchers",
                        principalColumn: "VoucherId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "CartItems",
                columns: table => new
                {
                    CartItemId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    CartId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    ProductId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    Quantity = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    UnitPrice = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CartItems", x => x.CartItemId);
                    table.ForeignKey(
                        name: "FK_CartItems_Carts_CartId",
                        column: x => x.CartId,
                        principalTable: "Carts",
                        principalColumn: "CartId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CartItems_Products_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Products",
                        principalColumn: "ProductId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "OrderItems",
                columns: table => new
                {
                    OrderItemId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    OrderId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    ProductId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    Quantity = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    Price = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_OrderItems", x => x.OrderItemId);
                    table.ForeignKey(
                        name: "FK_OrderItems_Orders_OrderId",
                        column: x => x.OrderId,
                        principalTable: "Orders",
                        principalColumn: "OrderId");
                    table.ForeignKey(
                        name: "FK_OrderItems_Products_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Products",
                        principalColumn: "ProductId");
                });

            migrationBuilder.CreateTable(
                name: "ProductImages",
                columns: table => new
                {
                    ProductImageId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    ProductId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    ImageUrl = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    SortOrder = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    IsMain = table.Column<bool>(type: "NUMBER(1)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductImages", x => x.ProductImageId);
                    table.ForeignKey(
                        name: "FK_ProductImages_Products_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Products",
                        principalColumn: "ProductId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Reviews",
                columns: table => new
                {
                    ReviewId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    UserId = table.Column<string>(type: "NVARCHAR2(450)", nullable: true),
                    ProductId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    Rating = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    Comment = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    ReviewDate = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Reviews", x => x.ReviewId);
                    table.ForeignKey(
                        name: "FK_Reviews_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.SetNull);
                    table.ForeignKey(
                        name: "FK_Reviews_Products_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Products",
                        principalColumn: "ProductId");
                });

            migrationBuilder.CreateTable(
                name: "WarehouseStocks",
                columns: table => new
                {
                    WarehouseStockId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    WarehouseId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    ProductId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    QuantityOnHand = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    QuantityReserved = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_WarehouseStocks", x => x.WarehouseStockId);
                    table.ForeignKey(
                        name: "FK_WarehouseStocks_Products_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Products",
                        principalColumn: "ProductId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_WarehouseStocks_Warehouses_WarehouseId",
                        column: x => x.WarehouseId,
                        principalTable: "Warehouses",
                        principalColumn: "WarehouseId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "GoodsReceipts",
                columns: table => new
                {
                    GoodsReceiptId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    ReceiptCode = table.Column<string>(type: "NVARCHAR2(450)", nullable: false),
                    PurchaseOrderId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    SupplierId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    WarehouseId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    ReceiptDate = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false),
                    Note = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    CreatedByUserId = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_GoodsReceipts", x => x.GoodsReceiptId);
                    table.ForeignKey(
                        name: "FK_GoodsReceipts_PurchaseOrders_PurchaseOrderId",
                        column: x => x.PurchaseOrderId,
                        principalTable: "PurchaseOrders",
                        principalColumn: "PurchaseOrderId",
                        onDelete: ReferentialAction.SetNull);
                    table.ForeignKey(
                        name: "FK_GoodsReceipts_Suppliers_SupplierId",
                        column: x => x.SupplierId,
                        principalTable: "Suppliers",
                        principalColumn: "SupplierId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_GoodsReceipts_Warehouses_WarehouseId",
                        column: x => x.WarehouseId,
                        principalTable: "Warehouses",
                        principalColumn: "WarehouseId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "PurchaseOrderLines",
                columns: table => new
                {
                    PurchaseOrderLineId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    PurchaseOrderId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    ProductId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    QuantityOrdered = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    QuantityReceived = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    UnitCost = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PurchaseOrderLines", x => x.PurchaseOrderLineId);
                    table.ForeignKey(
                        name: "FK_PurchaseOrderLines_Products_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Products",
                        principalColumn: "ProductId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PurchaseOrderLines_PurchaseOrders_PurchaseOrderId",
                        column: x => x.PurchaseOrderId,
                        principalTable: "PurchaseOrders",
                        principalColumn: "PurchaseOrderId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "GoodsReceiptLines",
                columns: table => new
                {
                    GoodsReceiptLineId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    GoodsReceiptId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    ProductId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    PurchaseOrderLineId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    BatchNo = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    ExpiryDate = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: true),
                    Quantity = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    UnitCost = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_GoodsReceiptLines", x => x.GoodsReceiptLineId);
                    table.ForeignKey(
                        name: "FK_GoodsReceiptLines_GoodsReceipts_GoodsReceiptId",
                        column: x => x.GoodsReceiptId,
                        principalTable: "GoodsReceipts",
                        principalColumn: "GoodsReceiptId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_GoodsReceiptLines_Products_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Products",
                        principalColumn: "ProductId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_GoodsReceiptLines_PurchaseOrderLines_PurchaseOrderLineId",
                        column: x => x.PurchaseOrderLineId,
                        principalTable: "PurchaseOrderLines",
                        principalColumn: "PurchaseOrderLineId");
                });

            migrationBuilder.CreateTable(
                name: "ProductBatches",
                columns: table => new
                {
                    ProductBatchId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    ProductId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    WarehouseId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    BatchNo = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    ExpiryDate = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: true),
                    QuantityOnHand = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    UnitCost = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: true),
                    SupplierId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    GoodsReceiptLineId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductBatches", x => x.ProductBatchId);
                    table.ForeignKey(
                        name: "FK_ProductBatches_GoodsReceiptLines_GoodsReceiptLineId",
                        column: x => x.GoodsReceiptLineId,
                        principalTable: "GoodsReceiptLines",
                        principalColumn: "GoodsReceiptLineId",
                        onDelete: ReferentialAction.SetNull);
                    table.ForeignKey(
                        name: "FK_ProductBatches_Products_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Products",
                        principalColumn: "ProductId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ProductBatches_Suppliers_SupplierId",
                        column: x => x.SupplierId,
                        principalTable: "Suppliers",
                        principalColumn: "SupplierId",
                        onDelete: ReferentialAction.SetNull);
                    table.ForeignKey(
                        name: "FK_ProductBatches_Warehouses_WarehouseId",
                        column: x => x.WarehouseId,
                        principalTable: "Warehouses",
                        principalColumn: "WarehouseId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "InventoryTransactions",
                columns: table => new
                {
                    TransactionId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    ProductId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    WarehouseId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    TransactionType = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    Quantity = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    QuantityBefore = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    QuantityAfter = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    OrderId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    SupplierId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    ProductBatchId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    GoodsReceiptId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    SupplierName = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    UnitCost = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: true),
                    Note = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    CreatedByUserId = table.Column<string>(type: "NVARCHAR2(450)", nullable: true),
                    TransactionDate = table.Column<DateTime>(type: "TIMESTAMP(7)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_InventoryTransactions", x => x.TransactionId);
                    table.ForeignKey(
                        name: "FK_InventoryTransactions_AspNetUsers_CreatedByUserId",
                        column: x => x.CreatedByUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.SetNull);
                    table.ForeignKey(
                        name: "FK_InventoryTransactions_GoodsReceipts_GoodsReceiptId",
                        column: x => x.GoodsReceiptId,
                        principalTable: "GoodsReceipts",
                        principalColumn: "GoodsReceiptId",
                        onDelete: ReferentialAction.SetNull);
                    table.ForeignKey(
                        name: "FK_InventoryTransactions_Orders_OrderId",
                        column: x => x.OrderId,
                        principalTable: "Orders",
                        principalColumn: "OrderId",
                        onDelete: ReferentialAction.SetNull);
                    table.ForeignKey(
                        name: "FK_InventoryTransactions_ProductBatches_ProductBatchId",
                        column: x => x.ProductBatchId,
                        principalTable: "ProductBatches",
                        principalColumn: "ProductBatchId",
                        onDelete: ReferentialAction.SetNull);
                    table.ForeignKey(
                        name: "FK_InventoryTransactions_Products_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Products",
                        principalColumn: "ProductId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_InventoryTransactions_Suppliers_SupplierId",
                        column: x => x.SupplierId,
                        principalTable: "Suppliers",
                        principalColumn: "SupplierId",
                        onDelete: ReferentialAction.SetNull);
                    table.ForeignKey(
                        name: "FK_InventoryTransactions_Warehouses_WarehouseId",
                        column: x => x.WarehouseId,
                        principalTable: "Warehouses",
                        principalColumn: "WarehouseId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "StockAdjustmentDetails",
                columns: table => new
                {
                    StockAdjustmentDetailId = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    StockAdjustmentId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    ProductId = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    ProductBatchId = table.Column<int>(type: "NUMBER(10)", nullable: true),
                    Quantity = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    UnitCost = table.Column<decimal>(type: "DECIMAL(18, 2)", nullable: true),
                    Note = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StockAdjustmentDetails", x => x.StockAdjustmentDetailId);
                    table.ForeignKey(
                        name: "FK_StockAdjustmentDetails_ProductBatches_ProductBatchId",
                        column: x => x.ProductBatchId,
                        principalTable: "ProductBatches",
                        principalColumn: "ProductBatchId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_StockAdjustmentDetails_Products_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Products",
                        principalColumn: "ProductId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_StockAdjustmentDetails_StockAdjustments_StockAdjustmentId",
                        column: x => x.StockAdjustmentId,
                        principalTable: "StockAdjustments",
                        principalColumn: "StockAdjustmentId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_AspNetRoleClaims_RoleId",
                table: "AspNetRoleClaims",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "RoleNameIndex",
                table: "AspNetRoles",
                column: "NormalizedName",
                unique: true,
                filter: "\"NormalizedName\" IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserClaims_UserId",
                table: "AspNetUserClaims",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserLogins_UserId",
                table: "AspNetUserLogins",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserRoles_RoleId",
                table: "AspNetUserRoles",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "EmailIndex",
                table: "AspNetUsers",
                column: "NormalizedEmail");

            migrationBuilder.CreateIndex(
                name: "UserNameIndex",
                table: "AspNetUsers",
                column: "NormalizedUserName",
                unique: true,
                filter: "\"NormalizedUserName\" IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_CartItems_CartId",
                table: "CartItems",
                column: "CartId");

            migrationBuilder.CreateIndex(
                name: "IX_CartItems_ProductId",
                table: "CartItems",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_Carts_UserId",
                table: "Carts",
                column: "UserId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Categories_ParentCategoryId",
                table: "Categories",
                column: "ParentCategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_GoodsReceiptLines_GoodsReceiptId",
                table: "GoodsReceiptLines",
                column: "GoodsReceiptId");

            migrationBuilder.CreateIndex(
                name: "IX_GoodsReceiptLines_ProductId",
                table: "GoodsReceiptLines",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_GoodsReceiptLines_PurchaseOrderLineId",
                table: "GoodsReceiptLines",
                column: "PurchaseOrderLineId");

            migrationBuilder.CreateIndex(
                name: "IX_GoodsReceipts_PurchaseOrderId",
                table: "GoodsReceipts",
                column: "PurchaseOrderId");

            migrationBuilder.CreateIndex(
                name: "IX_GoodsReceipts_ReceiptCode",
                table: "GoodsReceipts",
                column: "ReceiptCode",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_GoodsReceipts_SupplierId",
                table: "GoodsReceipts",
                column: "SupplierId");

            migrationBuilder.CreateIndex(
                name: "IX_GoodsReceipts_WarehouseId",
                table: "GoodsReceipts",
                column: "WarehouseId");

            migrationBuilder.CreateIndex(
                name: "IX_InventoryTransactions_CreatedByUserId",
                table: "InventoryTransactions",
                column: "CreatedByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_InventoryTransactions_GoodsReceiptId",
                table: "InventoryTransactions",
                column: "GoodsReceiptId");

            migrationBuilder.CreateIndex(
                name: "IX_InventoryTransactions_OrderId",
                table: "InventoryTransactions",
                column: "OrderId");

            migrationBuilder.CreateIndex(
                name: "IX_InventoryTransactions_ProductBatchId",
                table: "InventoryTransactions",
                column: "ProductBatchId");

            migrationBuilder.CreateIndex(
                name: "IX_InventoryTransactions_ProductId",
                table: "InventoryTransactions",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_InventoryTransactions_SupplierId",
                table: "InventoryTransactions",
                column: "SupplierId");

            migrationBuilder.CreateIndex(
                name: "IX_InventoryTransactions_WarehouseId",
                table: "InventoryTransactions",
                column: "WarehouseId");

            migrationBuilder.CreateIndex(
                name: "IX_LoyaltyPointTransactions_LoyaltyRewardId",
                table: "LoyaltyPointTransactions",
                column: "LoyaltyRewardId");

            migrationBuilder.CreateIndex(
                name: "IX_LoyaltyPointTransactions_OrderId",
                table: "LoyaltyPointTransactions",
                column: "OrderId");

            migrationBuilder.CreateIndex(
                name: "IX_LoyaltyPointTransactions_UserId_OrderId_TransactionType",
                table: "LoyaltyPointTransactions",
                columns: new[] { "UserId", "OrderId", "TransactionType" },
                filter: "\"ORDERID\" IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_OrderItems_OrderId",
                table: "OrderItems",
                column: "OrderId");

            migrationBuilder.CreateIndex(
                name: "IX_OrderItems_ProductId",
                table: "OrderItems",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_Orders_UserId",
                table: "Orders",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_OrderStatusHistories_OrderId",
                table: "OrderStatusHistories",
                column: "OrderId");

            migrationBuilder.CreateIndex(
                name: "IX_Payments_OrderId",
                table: "Payments",
                column: "OrderId");

            migrationBuilder.CreateIndex(
                name: "IX_PayOSWebhookEvents_IdempotencyKey",
                table: "PayOSWebhookEvents",
                column: "IdempotencyKey",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ProductBatches_GoodsReceiptLineId",
                table: "ProductBatches",
                column: "GoodsReceiptLineId",
                unique: true,
                filter: "\"GoodsReceiptLineId\" IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_ProductBatches_ProductId",
                table: "ProductBatches",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductBatches_SupplierId",
                table: "ProductBatches",
                column: "SupplierId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductBatches_WarehouseId",
                table: "ProductBatches",
                column: "WarehouseId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductImages_ProductId",
                table: "ProductImages",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_Products_CategoryId",
                table: "Products",
                column: "CategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_Products_Sku",
                table: "Products",
                column: "Sku",
                unique: true,
                filter: "\"SKU\" IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_Products_SupplierId",
                table: "Products",
                column: "SupplierId");

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseOrderLines_ProductId",
                table: "PurchaseOrderLines",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseOrderLines_PurchaseOrderId",
                table: "PurchaseOrderLines",
                column: "PurchaseOrderId");

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseOrders_OrderCode",
                table: "PurchaseOrders",
                column: "OrderCode",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseOrders_SupplierId",
                table: "PurchaseOrders",
                column: "SupplierId");

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseOrders_WarehouseId",
                table: "PurchaseOrders",
                column: "WarehouseId");

            migrationBuilder.CreateIndex(
                name: "IX_Reviews_ProductId",
                table: "Reviews",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_Reviews_UserId",
                table: "Reviews",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Shipments_OrderId",
                table: "Shipments",
                column: "OrderId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_StockAdjustmentDetails_ProductBatchId",
                table: "StockAdjustmentDetails",
                column: "ProductBatchId");

            migrationBuilder.CreateIndex(
                name: "IX_StockAdjustmentDetails_ProductId",
                table: "StockAdjustmentDetails",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_StockAdjustmentDetails_StockAdjustmentId",
                table: "StockAdjustmentDetails",
                column: "StockAdjustmentId");

            migrationBuilder.CreateIndex(
                name: "IX_StockAdjustments_AdjustmentCode",
                table: "StockAdjustments",
                column: "AdjustmentCode",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_StockAdjustments_WarehouseId",
                table: "StockAdjustments",
                column: "WarehouseId");

            migrationBuilder.CreateIndex(
                name: "IX_Suppliers_Code",
                table: "Suppliers",
                column: "Code",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_UserVouchers_UserId_VoucherId",
                table: "UserVouchers",
                columns: new[] { "UserId", "VoucherId" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_UserVouchers_VoucherId",
                table: "UserVouchers",
                column: "VoucherId");

            migrationBuilder.CreateIndex(
                name: "IX_VoucherRedemptions_OrderId",
                table: "VoucherRedemptions",
                column: "OrderId");

            migrationBuilder.CreateIndex(
                name: "IX_VoucherRedemptions_VoucherId_OrderId",
                table: "VoucherRedemptions",
                columns: new[] { "VoucherId", "OrderId" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Vouchers_CategoryId",
                table: "Vouchers",
                column: "CategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_WarehouseStocks_ProductId",
                table: "WarehouseStocks",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_WarehouseStocks_WarehouseId_ProductId",
                table: "WarehouseStocks",
                columns: new[] { "WarehouseId", "ProductId" },
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AspNetRoleClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserLogins");

            migrationBuilder.DropTable(
                name: "AspNetUserRoles");

            migrationBuilder.DropTable(
                name: "AspNetUserTokens");

            migrationBuilder.DropTable(
                name: "Banners");

            migrationBuilder.DropTable(
                name: "CartItems");

            migrationBuilder.DropTable(
                name: "ChatMessages");

            migrationBuilder.DropTable(
                name: "DbActivityLogs");

            migrationBuilder.DropTable(
                name: "InventoryTransactions");

            migrationBuilder.DropTable(
                name: "LoyaltyPointTransactions");

            migrationBuilder.DropTable(
                name: "News");

            migrationBuilder.DropTable(
                name: "OrderItems");

            migrationBuilder.DropTable(
                name: "OrderStatusHistories");

            migrationBuilder.DropTable(
                name: "Payments");

            migrationBuilder.DropTable(
                name: "PayOSWebhookEvents");

            migrationBuilder.DropTable(
                name: "ProductImages");

            migrationBuilder.DropTable(
                name: "Reviews");

            migrationBuilder.DropTable(
                name: "Shipments");

            migrationBuilder.DropTable(
                name: "StockAdjustmentDetails");

            migrationBuilder.DropTable(
                name: "UserRankInfos");

            migrationBuilder.DropTable(
                name: "UserVouchers");

            migrationBuilder.DropTable(
                name: "VoucherRedemptions");

            migrationBuilder.DropTable(
                name: "WarehouseStocks");

            migrationBuilder.DropTable(
                name: "AspNetRoles");

            migrationBuilder.DropTable(
                name: "Carts");

            migrationBuilder.DropTable(
                name: "LoyaltyRewards");

            migrationBuilder.DropTable(
                name: "ProductBatches");

            migrationBuilder.DropTable(
                name: "StockAdjustments");

            migrationBuilder.DropTable(
                name: "Orders");

            migrationBuilder.DropTable(
                name: "Vouchers");

            migrationBuilder.DropTable(
                name: "GoodsReceiptLines");

            migrationBuilder.DropTable(
                name: "AspNetUsers");

            migrationBuilder.DropTable(
                name: "GoodsReceipts");

            migrationBuilder.DropTable(
                name: "PurchaseOrderLines");

            migrationBuilder.DropTable(
                name: "Products");

            migrationBuilder.DropTable(
                name: "PurchaseOrders");

            migrationBuilder.DropTable(
                name: "Categories");

            migrationBuilder.DropTable(
                name: "Suppliers");

            migrationBuilder.DropTable(
                name: "Warehouses");
        }
    }
}
