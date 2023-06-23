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

-- Challenge:
-- How many payment transactions were greater than $5.00? 

SELECT COUNT(*)
FROM payment
WHERE amount > 5.00

-- Challenge:
-- How many actors have a first name that starts with the letter P?

SELECT COUNT(first_name)
FROM actor
WHERE first_name ILIKE 'P%'

-- Challenge:
-- How many unique districts are out customers from?

SELECT COUNT(DISTINCT(district)) 
FROM address

-- Challenge:
-- Retrieve the list of names for those distinct districts from the previous question. 

SELECT DISTINCT district
FROM address

-- Challenge:
-- How many films have a rating of R and a replacement cost between $5 and $15? 

SELECT COUNT(title) 
FROM film
WHERE rating = 'R' 
AND rental_rate BETWEEN 5 AND 15

-- Challenge:
-- How many films have the word Truman somewhere in the title?

SELECT COUNT(title)
FROM film
WHERE title ILIKE '%Truman%'

-- CHALLENGE
-- We have two staff members, with Staff IDs 1 and 2.
-- We want to give a bonus to the staff member that handled the most payments.
-- (Most in terms of number of payments processed, not total dollar amoumt).
-- How many payments did each staf member handle and who gets the bonus?

SELECT staff_id, COUNT(amount) 
FROM payment 
GROUP BY staff_id 

-- CHALLENGE
-- Corporate HQ is conducting a study on the relationship between replacement cost and a movie MPAA rating (e.g. G, PG, R, etc)
-- What is the averange replacement cost per MPAA rating?
-- Note: You may need to expand the AVG column to view correct results

SELECT 
	rating, 
	ROUND(
		AVG(replacement_cost), 2
	)
FROM film 
GROUP BY rating

-- CHALLENGE
-- We are running a promotion to reward our top 5 customers with coupons.
-- What are the customer ids of the top 5 customers by total spend? 
select * from payment

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
limit 5

-- CHALLENGE
-- We are launching a platinum service for our most loyal customers. We will assign platinum status to customers that have had 40 or more transaction payments.
-- What customer_ids are eligible for platinum status?

SELECT customer_id, COUNT(amount)
FROM payment 
GROUP BY customer_id
HAVING COUNT(amount) >= 40

-- CHALLENGE
-- What are the customer ids of customers who have spent more than $100 in payment transactions with our staff_id member 2?

SELECT customer_id, SUM(amount) 
FROM payment 
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100

-- ASSESSMENT TEST 1
-- COMPLETE THE FOLLOWING TASKS!

-- 1. Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.
-- The answer should be customers 187 and 148.

SELECT 
	customer_id
	--, SUM(amount) 
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 110

-- 2. How many films begin with the letter J?
-- The answer should be 20.
SELECT count(title)
FROM film
WHERE title LIKE 'J%'

-- 3. What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?
-- The answer is Eddie Tomlin
SELECT 
	first_name,last_name 
FROM customer
WHERE first_name LIKE 'E%'
AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1

-- CHALLENGE:
-- California sales tax laws have changed and we need to alert our customers to this through email.
-- What are the emails of the customers who live in California? 

SELECT 
c.first_name
, c.last_name
, c.email 
, a.district
FROM customer AS c
INNER JOIN address AS a
ON c.address_id = a.address_id
WHERE a.district = 'California'

-- CHALLENGE:
-- A customer walks in and is a huge fan of the actor 'Nick Wahlberg' and wants to know which movies he is in.
-- Get a list of all the movies 'Nick Wahlberg' has been in. 

SELECT 
	A.first_name
	, A.last_name
	, F.title
FROM actor AS A 
INNER JOIN film_actor AS FA
ON A.actor_id = FA.actor_id
INNER JOIN film AS F
ON FA.film_id = F.film_id
WHERE A.first_name = 'Nick' 
AND A.last_name = 'Wahlberg'

-- CHALLENGE:
-- During which months did payments occur? 
-- Format your answer to return back the full month name.

SELECT DISTINCT 
	TO_CHAR(payment_date, 'Month')
FROM payment

-- CHALLENGE:
-- How many payments occurred on a Monday?
-- Note: We didn't show you exactly how to do this, but use the documentation or Google to figure this out!

SELECT 
    COUNT( 
        TO_CHAR(payment_date, 'Day') 
    ) AS "Monday" 
FROM payment
WHERE TO_CHAR(payment_date, 'Day') like '%Monday%'

SELECT COUNT(*)
FROM payment
WHERE EXTRACT(dow FROM payment_date) = 1

-- CHALLENGE:
--  1. How can you retrieve all the information from the cd.facilities table?

SELECT * 
FROM cd.facilities

-- 2. You want to print out a list of all of the facilities and their cost to members. How would you retrieve a list of only facility names and costs?

SELECT 
	name
	, membercost
FROM cd.facilities

-- 3. How can you produce a list of facilities that charge a fee to members?
-- Expected Results should have just 5 rows:

SELECT *
FROM cd.facilities
WHERE membercost > 0

-- 4. How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.
-- ● Result is just two rows:

SELECT 
	facid
	, name
	, membercost
	, monthlymaintenance
FROM cd.facilities
WHERE membercost > 0 
AND membercost < (monthlymaintenance / 50)

-- 5. How can you produce a list of all facilities with the word 'Tennis' in their name?

SELECT * 
FROM cd.facilities
WHERE name ILIKE '%Tennis%'

-- 6. How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.

SELECT *
FROM cd.facilities
WHERE facid IN (1, 5)

-- 7. How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and joindate of the members in question.
-- ● Expected Result is 10 rows (not all are shown below)

SELECT 
	memid
	, surname
	, firstname
	, DATE(joindate) AS JoinDate
FROM cd.members
WHERE joindate > '2012-09-01'

-- 8. How can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates.
-- ● Expected Result should be 10 rows if you include GUEST as a last name

SELECT DISTINCT surname
FROM cd.members
ORDER BY surname ASC
LIMIT 10

-- 9. You'd like to get the signup date of your last member. How can you retrieve this information?
-- ● Expected Result
-- ● 2012-09-26 18:08:45

SELECT MAX(joindate) AS latest_signup 
FROM cd.members
----
SELECT joindate AS latest_signup
FROM cd.members
ORDER BY joindate DESC
LIMIT 1 

-- 10. Produce a count of the number of facilities that have a cost to guests of 10 or more.
-- ● Expected Result
-- ● 6
SELECT COUNT(*) 
FROM cd.facilities
WHERE guestcost >= 10

-- 11. Produce a list of the total number of slots booked per facility in the month of September 2012. Produce an output table consisting of facility id and slots, sorted by the number of slots.
-- ● Expected Result is 9 rows

SELECT 
	facid
	, SUM(slots) AS Total_Slots
FROM cd.bookings
WHERE starttime >= '2012-09-01' 
AND starttime <= '2012-09-30' 
GROUP BY facid
ORDER BY Total_Slots