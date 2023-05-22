-- Esquema, una división lógica de la base de datos para organizar los objetos. 
"""
=
<
>
>=
<=
<> or !=

AND - OR - NOT

"""
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
    ORDER BY Country

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

-- COUNT: Devuelve el número de filas que coinciden con la condición especifica de la consulta. 
    
    SELECT count(first_name) FROM customers
	
	SELECT 
        first_name, 
        COUNT(first_name) as "num names"
	FROM customer
	GROUP BY first_name

    SELECT DISTINCT 
        rating as "Clasificación"
        , count(title) as "Cant. Películas"
    FROM Film
    Group by rating -- Se usa el group by para agrupar por el conteo

-- WHERE: Condiciones
    SELECT 
        rating as Rating
        , count(*) as Num
    FROM film
    WHERE rating = 'R' or rating = 'NC-17'
    GROUP BY rating

-- ORDER BY: ASC DESC
    SELECT 
        store_id
        , first_name
        , last_name
    FROM customer
    ORDER BY store_id DESC, first_name ASC

-- LIMIT (TOP 10 - LIMIT 10)

    SELECT first_name 
    FROM customer
    ORDER BY first_name ASC
    LIMIT 10

    SELECT TOP 10 first_name 
    FROM customer

-- BETWEEN: Un operador para unir entre un rango de valores (NOT BETWEEN)
    SELECT * 
    FROM payment
    WHERE amount BETWEEN 7 and 9

    SELECT * 
    FROM payment
    WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15'
    ORDER BY amount ASC

-- IN: Condición que verifica si el valor esta incluido en una lista de varios valores (NOT IN)

    SELECT 
        amount
        , COUNT(amount) 
    FROM payment
    WHERE amount IN (0.99, 1.98, 1.99)
    GROUP BY amount

-- LIKE: distingue minusculas y mayusculas - ILIKE: No distingue, toma todas. (Todos los caracteres que le sigan: % Un solo caracter: _)
    SELECT first_name
    FROM customer
    WHERE first_name LIKE 'J%'

    SELECT first_name
    FROM customer
    WHERE first_name LIKE '_her%'

    SELECT first_name
    FROM customer
    WHERE first_name ILIKE '%er%'

-- JOINS (Para unir las tablas deben contener un campo en común)

-- Inner Join (Uniones internas) Los datos en común.
         
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