--1. List all customers who live in Texas (use JOINs)
SELECT first_name, last_name, email, country
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON city.city_id = address.city_id
WHERE state = 'Texas';

--2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name 
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY first_name, last_name
HAVING SUM(amount) >= 6.99
ORDER BY first_name, last_name;

--3. Show all customers names who have made payments over $175(use subqueries)
SELECT *
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY first_name, last_name
HAVING SUM(amount) >= 175;

--4. List all customers that live in Nepal (use the city table)
SELECT first_name, last_name 
FROM customer
JOIN city
ON customer.city_id = city.city_id
WHERE city = Nepal;

--5. Which staff member had the most transactions?
SELECT first_name, last_name 
FROM staff
ON staff.customer_id = payment.customer_id

--6. How many movies of each rating are there?
SELECT *
FROM movie
JOIN rating
ON movie.movie_id = rating.rating_id
WHERE rating.rating_id = 1;


--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT *
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY first_name, last_name;

--How many free rentals did our stores give away?
SELECT store
FROM customer
JOIN rental
ON customer.customer_id = rental.rental_customer_id
WHERE rental.rental_customer_id = 0;
