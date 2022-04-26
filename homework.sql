-- Week 5 - Monday Questions

-- 1. How many actors are there with the last name ‘Wahlberg’?

SELECT COUNT(actor_id) 
FROM actor
WHERE last_name = 'Wahlberg';
-- ANSWER = 2

-- 2. How many payments were made between $3.99 and $5.99?

SELECT COUNT(amount)
from payment
WHERE amount BETWEEN 3.99 AND 5.99;
-- ANSWER = 5602

-- 3. What film does the store have the most of? (search in inventory)

SELECT film_id, SUM(film_id)
FROM inventory
GROUP BY film_id
ORDER BY SUM(film_id) DESC;
-- ANSWER = film_id 1000 has 8000 film_ids


-- 4. How many customers have the last name ‘William’?

SELECT COUNT(customer_id)
FROM customer
WHERE last_name = 'William';
-- ANSWER = 0

-- 5. What store employee (get the id) sold the most rentals?

-- Not sure if staff ID is the same as employee ID. Thought it was weird that there's only 2

SELECT staff_id, SUM(rental_id)
from rental
GROUP BY staff_id
ORDER BY SUM(rental_id) DESC;
-- ANSWER = staff_id 1 Mike Hillyer sold 64772289 rentals

-- 6. How many different district names are there?

-- Wasn't sure, but i went with distinct actor first names
SELECT COUNT(DISTINCT first_name)
FROM actor;
-- ANSWER = 130

-- 7. What film has the most actors in it? (use film_actor table and get film_id)

SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;
-- ANSWER = film_id 508 had 15 actors

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT COUNT(last_name)
FROM customer
WHERE last_name = '%es';
-- ANSWER = 0

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)

SELECT amount, SUM(amount)
FROM payment
GROUP BY amount
HAVING SUM(amount) > 250;
-- ANSWER = 16

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?

SELECT DISTINCT rating, SUM(film_id)
FROM film
GROUP BY rating
ORDER BY SUM(film_id) DESC;
-- ANSWER = PG-13 has 119006