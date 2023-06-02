-- Esquema, una división lógica de la base de datos para organizar los objetos. 
-- https://www.postgresql.org/docs/12/functions.html
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

-- COUNT: Devuelve el número de filas que coinciden con la condición especifica de la consulta. Devuelve el numero de filas totales dependiendo la condición. Función agregada.
    
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

-- GROUP BY:
    SELECT 
        company
        , division
        , SUM(sales) 
    FROM finance
    WHERE division IN ('Marketing')
    GROUP BY company, division
    ORDER BY SUM(sales)

    SELECT 
        DATE(payment_date)
        , SUM(amount)
    FROM payment
    GROUP BY DATE(payment_date)
    ORDER BY SUM(amount) DESC
    
-- HAVING: Permite filtrar luego del group by, por ejemplo la función agregada

    SELECT company, SUM(sales)
    FROM finance
    WHERE company != 'Google'
    GROUP BY company
    HAVING SUM(sales) > 1000

    SELECT store_id, COUNT(*)
    FROM customer
    GROUP BY store_id
    HAVING COUNT(*) > 300 


-- Funciones agregadas: Tomar multiples entradas y devolver una sola salida.
-- AVG(): Devuelve el valor promedio. Devuelve float.

    SELECT AVG(replacement_cost) 
    FROM film

-- MAX(): Devuelve el valor máximo.

    SELECT MAX(replacement_cost) 
    FROM film

-- MIN(): Devuelve el valor mínimo.

    SELECT MIN(replacement_cost) 
    FROM film

-- SUM(): Devuelve la sumatoria total. 

    SELECT SUM(replacement_cost) 
    FROM film

-- ROUND(): Redondear decimales.
    SELECT ROUND(AVG(replacement_cost), 2)
    FROM film

-- DATE(): Convierte fecha/hora en fecha

    SELECT DATE(payment_date)
    FROM payment

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

-- Full outer Joins (Ambas tablas enteras tengan o no datos en común)

    SELECT * 
    FROM customer
    FULL OUTER JOIN payment
    ON customer.customer_id = payment.customer_id

    WHERE customer.customer_id IS null 
    OR payment.payment_id IS null

-- Left Joins: Toda la tabla izq más lo común con tabla derecha. 

    SELECT * 
    FROM registrations
    LEFT JOIN logins
    ON registrations.name = logins.name

    WHERE logins.log_id IS null  

-- Right Joins: Toda la tabla derecha más lo común con tabla izq. 

    SELECT * 
    FROM tabla_A
    RIGHT JOIN tabla_B
    ON tabla_A.columna_comun = tabla_B.columna_comun

-- Union: Combina el conjunto de resultados de dos o más sentencias SELECT. Una tabla arriba de la otra.

    SELECT * FROM tabla_A
    UNION 
    SELECT * FROM tabla_B

-- Outer Join (Uniones externas)

-- Cross Join (Uniones cruzadas)

-- Selft Join (Union de tablas con sigo mismas)

-- Subconsultas/Subquery:

    SELECT 
        student, 
        grade
    FROM test_scores
    WHERE grade > (
        SELECT AVG(grade)
        FROM test_scores
    )

    ---------

    SELECT 
        student, 
        grade
    FROM test_scores
    WHERE student IN (
        SELECT student
        FROM honor_roll_table
    )

    ---------
    
    SELECT title, rental_rate
    FROM film
    WHERE rental_rate > (
        SELECT AVG(rental_rate)
        FROM film
    )

    ---------
    
    SELECT film_id, title
    FROM film
    WHERE film_id IN(
                    SELECT inventory.film_id
                    FROM rental
                    INNER JOIN inventory 
                    ON  inventory.inventory_id = rental.inventory_id
                    WHERE return_date
                    BETWEEN '2005-05-29' 
                    AND '2005-05-30'
                )
    ORDER BY title

-- Funciones de tiempo
'''
SHOW ALL 
SHOW TIMEZONE
'''

-- TIME: Contiene solo hora

-- DATE: Contiene solo fecha

-- TIMESTAMP: Contiene fecha y hora

-- TIMESTAMPTZ: Contiene fecha, hora, timezone

-- TIMEZONE:

-- NOW:

    SELECT NOW()

-- TIMEOFDAY:

    SELECT TIMEOFDAY() -- Te da con formato string

-- CURRENT_TIME:

    SELECT CURRENT_TIME()

-- CURRENT_DATE:

    SELECT CURRENT_DATE()

-- EXTRACT(): YEAR - MONTH - DAY - WEEK - QUARTER

    EXTRACT(YEAR FROM date_columna)

    SELECT EXTRACT(YEAR FROM payment_date)
    FROM payment

-- AGE():

    AGE(date_columna) -- la edad / antigüedad

    SELECT AGE(payment_date)
    FROM payment

-- TO_CHAR(): Convertir tipo de date a text -- Buscar formatos en internet dependiendo de lo que necesite 
-- https://www.postgresql.org/docs/12/functions-formatting.html

    TO_CHAR(date_columna, 'mm-dd-yyyy')

    SELECT TO_CHAR(payment_date, 'dd/MM/YYYY')
    FROM payment

-- Funciones matemáticas: https://www.postgresql.org/docs/12/functions-math.html

    SELECT 
        ROUND(
            rental_rate / replacement_cost,
            4
        ) * 100
    FROM film

-- Funciones String https://www.postgresql.org/docs/12/functions-string.html

-- LENGTH():

    SELECT LENGTH(first_name) 
    FROM customer

-- CONCATENAR:

    SELECT first_name || ' ' || last_name
    FROM customer

-- UPPER: Mayúsculas

    SELECT UPPER(first_name) 
    FROM customer

-- LEFT: 
    
    SELECT LEFT(first_name, 1) 
    FROM customer
