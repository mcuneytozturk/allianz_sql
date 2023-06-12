SELECT * FROM film
WHERE title LIKE '%n'
ORDER BY length DESC
LIMIT 5;

SELECT * FROM film
WHERE title LIKE '%n'
ORDER BY length
LIMIT 5
OFFSET 5;

SELECT * FROM customer
WHERE store_id = 1
ORDER BY last_name DESC
LIMIT 4;

SELECT ROUND(AVG(rental_rate)) FROM film;

SELECT COUNT(title) FROM film
WHERE title LIKE 'C%';

SELECT MAX(length) FROM film
WHERE rental_rate = 0.99;

SELECT COUNT(DISTINCT replacement_cost) FROM film
WHERE length > 150;