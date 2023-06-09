--1. Senaryo
SELECT country
FROM country
WHERE country LIKE 'A%a';
--2. Senaryo
SELECT country
FROM country
Where country LIKE '%_____n';
--3. Senaryo
SELECT *
FROM film
WHERE title ILIKE '%t%t%t%t%';
--4. Senaryo
SELECT *
FROM film
WHERE title LIKE 'C%' 
	AND length > 90 
	AND rental_rate = 2.99;