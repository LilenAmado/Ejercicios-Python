-- Esquema, una división lógica de la base de datos para organizar los objetos. 

-- Select 
    -- Hacer una consulta de todos los datos y columnas de la tabla
    SELECT * -- no es la mejor práctica porque traes todo
    FROM customers

    -- Columnas especificas al mostrar
    SELECT companyname as Compañia, country as País
    FROM customers


