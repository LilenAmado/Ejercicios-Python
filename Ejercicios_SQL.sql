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

-- Challenge:
-- A customer forgot their wallet at our store! We need to track down their email to inform them.
-- What is the email for the customer with the name Nancy Thomas? 

SELECT 
	first_name, 
	last_name, 
	email
FROM customer
WHERE first_name = 'Nancy' and last_name = 'Thomas'

-- Challenge:
-- A customer wants to know what the movie "Outlaw Hanky" is about. 
-- Could you give them the description for the mvoie "Outlaw Hanky"?

SELECT 
	film_id
	, title 
	, description
FROM film
WHERE title = 'Outlaw Hanky'

-- Challenge:
-- A customer is late on their movie return, and we've mailed them a letter to their address at "259 Ipoh Drive". We should also call them on the phone to let them know.
-- Can you get the phone number for the customer who lives at "259 Ipoh Drive"?

SELECT 
	C.first_name
	, C.last_name
	, A.address
	, A.phone
FROM customer as C
INNER JOIN address as A
ON C.address_id = A.address_id
WHERE A.address = '259 Ipoh Drive'

-- Challenge:
-- We want to reward out first 10 paying customers.
-- What are the customer ids of the first 10 customers who created a payment?

SELECT customer_id, amount, payment_date
FROM payment
ORDER BY payment_date asc
LIMIT 10

-- Challenge:
-- A customer wants to quickly rent a video to watch over their short lunch break. 
-- What are the titles of the 5 shortest (in length of runtime) movie? 

SELECT title
FROM FILM
ORDER BY length asc
LIMIT 5

-- Challenge:
-- If the previous customer can watch any movie that is 50 minutes or less in run time, how many options does she have? 

SELECT count(title) as Num_movies
FROM film
WHERE length <= 50
