--1. sorgu

SELECT title, length, (SELECT AVG(length) FROM film) AS avg_movie_length FROM film
WHERE length > 
(
SELECT AVG(length) FROM film
)
ORDER BY length;

--2. sorgu

SELECT COUNT(*) FROM film
WHERE rental_rate = (
SELECT MAX(rental_rate) FROM film);

--3. sorgu

SELECT * FROM film
WHERE rental_rate = (
	SELECT MIN(rental_rate) FROM film
) 
AND replacement_cost = 
(
SELECT MIN(replacement_cost) FROM film
);

--4. sorgu

SELECT * FROM payment
WHERE amount = (
	SELECT MAX(amount) FROM payment
);