CREATE OR REPLACE PROCEDURE PROC_INSERT_PRODUCT (
    p_ProductName IN VARCHAR2,
    p_Sku IN VARCHAR2,
    p_Barcode IN VARCHAR2,
    p_RegistrationNumber IN VARCHAR2,
    p_RequiresPrescription IN NUMBER,
    p_CostPrice IN NUMBER,
    p_Price IN NUMBER,
    p_CategoryId IN VARCHAR2,
    p_SupplierId IN VARCHAR2,
    p_Ingredients IN VARCHAR2,
    p_Uses IN VARCHAR2,
    p_Dosage IN VARCHAR2,
    p_Contraindications IN VARCHAR2,
    p_MinStockLevel IN NUMBER,
    p_ProductId OUT VARCHAR2
) AS
    v_NewId VARCHAR2(50);
BEGIN
    v_NewId := 'PROD_' || SYS_GUID();
    
    INSERT INTO PRODUCTS (
        ProductId, ProductName, Sku, Barcode, RegistrationNumber,
        RequiresPrescription, CostPrice, Price, CategoryId, SupplierId,
        Ingredients, Uses, Dosage, Contraindications, StockQuantity,
        MinStockLevel, IsActive
    ) VALUES (
        v_NewId, p_ProductName, p_Sku, p_Barcode, p_RegistrationNumber,
        p_RequiresPrescription, p_CostPrice, p_Price, p_CategoryId, p_SupplierId,
        p_Ingredients, p_Uses, p_Dosage, p_Contraindications, 0,
        p_MinStockLevel, 1
    );
    
    p_ProductId := v_NewId;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20001, 'Lỗi khi thêm mới sản phẩm: ' || SQLERRM);
END PROC_INSERT_PRODUCT;