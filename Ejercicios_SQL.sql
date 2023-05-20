--Ejercicios

-- Challenge: 
-- We want to send out a promotional email to our existing customers. 

SELECT 
last_name
, first_name
, email
FROM Customer

-- Challenge: 
-- An australian visitor isn't familiar with MPAA movie ratings (e.g PG, PG-13, R, etc.)
-- We want to know the types of ratings we have in out database. 
-- What ratings do we have available? 

SELECT DISTINCT rating 
FROM Film

SELECT DISTINCT 
rating 
, count(title) as "Num movies"
FROM Film
Group by rating