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

    -- JOINS (Para unir las tablas deben contener un campo en común)

    -- Inner Join (Uniones internas) 
        -- Los datos en común 
        /*
            Tablas a utilizar para ver campo en común:
                SELECT TOP 10 FROM Customers
                SELECT TOP 10 FROM Orders
        */

        -- Entre dos tablas
        SELECT 
        C.CustomerID
        , C.Companyname
        , C.[Address]
        , C.ContactName
        , C.City
        , O.OrderID
        , O.OrderDate
        , O.ShippedDate
        , O.ShippAddress
        FROM Customers AS C
        INNER JOIN Orders AS O
        ON C.CustomerID = O.CustomerID

        -- Entre más tablas
          SELECT 
        C.CustomerID
        , C.Companyname
        , C.[Address]
        , C.ContactName
        , C.City
        , O.OrderID
        , O.OrderDate
        , O.ShippedDate
        , O.ShippAddress
        , D.OrderID
        , D.Quantity
        , D.UnitePrice
        , P.ProductID
        , P.ProductName

        FROM Customers AS C

        INNER JOIN Orders AS O
        ON C.CustomerID = O.CustomerID

        INNER JOIN [Orders Details] AS D
        ON O.OrderID = D.OrderID

        INNER JOIN Products AS P 
        ON D.ProductID = P.ProductID

    -- Outer Join (Uniones externas)

    -- Cross Join (Uniones cruzadas)

    -- Selft Join (Union de tablas con sigo mismas)