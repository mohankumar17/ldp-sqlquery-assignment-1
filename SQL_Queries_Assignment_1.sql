-- 1. Find out the PG-13 rated comedy movies.
SELECT title FROM sakila.film
WHERE rating="PG-13";

-- 2. Find out the top 3 rented horror movies.
SELECT F.film_id, F.title, F.rental_rate, FL.category FROM sakila.film F
INNER JOIN sakila.film_list FL
ON F.film_id=FL.FID
WHERE FL.category="Horror"
ORDER BY F.rental_rate DESC limit 3;

-- 3. Find out the list of customers from India who have rented sports movies.
/*
SELECT CL.ID, CL.name, CL.country, FL.FID, FL.category, R.inventory_id, I.film_id, R.customer_id
FROM ((( sakila.rental R
INNER JOIN sakila.inventory I ON R.inventory_id=I.inventory_id)
INNER JOIN sakila.customer_list CL ON CL.ID=R.customer_id)
INNER JOIN sakila.film_list FL ON FL.FID=I.film_id)
WHERE CL.country="India" AND FL.category="Sports";*/

SELECT DISTINCT CL.name
FROM ((( sakila.rental R
INNER JOIN sakila.inventory I ON R.inventory_id=I.inventory_id)
INNER JOIN sakila.customer_list CL ON CL.ID=R.customer_id)
INNER JOIN sakila.film_list FL ON FL.FID=I.film_id)
WHERE CL.country="India" AND FL.category="Sports";

-- 4. Find out the list of customers from Canada who have rented “NICK WAHLBERG” movies.

SELECT CL.name, CL.country, FL.actors  
FROM ((( sakila.rental R
INNER JOIN sakila.inventory I ON R.inventory_id=I.inventory_id)
INNER JOIN sakila.customer_list CL ON CL.ID=R.customer_id)
INNER JOIN sakila.film_list FL ON FL.FID=I.film_id)
WHERE CL.country="Canada" AND FL.actors LIKE '%NICK WAHLBERG%';

-- 5. Find out the number of movies in which “SEAN WILLIAMS” acted. 
SELECT COUNT(*) AS total_films FROM sakila.film_list
WHERE actors LIKE '%SEAN WILLIAMS%';




