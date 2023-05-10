-- Esquema, una división lógica de la base de datos para organizar los objetos. 

-- Select 
    -- Muestra toda la tabla
    SELECT * -- No es la mejor práctica porque traes todo
    FROM customers

    -- Columnas especificas al mostrar
    SELECT 
    companyname AS Compania
    , country AS Pais
    , [Address] AS Direccion
    FROM customers

    -- Cálculo en la consulta
    SELECT 
    ProductName
    , UnitPrice
    , UnitPrice * 12 as ImpuestoIVA
    FROM Products

    SELECT
    OrderID
    , ProductID
    , UnitePrice
    , Quantity
    , Discount
    , (UnitePrice * Quantity) - (UnitePrice * Quantity * Discount) as Parcial
    FROM [Order Details]

    -- Función Año en consulta
    SELECT
    CustomerID
    , OrderID  
    , OrderDate
    , YEAR(OrderDate) as Anio
    FROM [Order Details]

    -- Distinct: Para sacar duplicados
    SELECT DISTINCT 
    Country
    FROM Customers
    Order by Country

    -- Función Case
    SELECT 
    ProductName
    , Category = 
        CASE CategoryID
            WHEN 1 THEN 'Bebidas'
            WHEN 2 THEN 'Lacteos'
            WHEN 3 THEN 'OTros'
            ELSE 'No se encuentra en venta'
        END -- AS Category
    FROM Products
    ORDER BY ProductName
