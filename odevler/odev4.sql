--1. Senaryo
SELECT DISTINCT(replacement_cost)
FROM film;
--2. Senaryo
SELECT COUNT(DISTINCT(replacement_cost))
FROM film;
--3. Senaryo
SELECT COUNT(*)
FROM film
WHERE title LIKE 'T%' 
	AND rating = 'G';
--4. Senaryo
SELECT COUNT(*)
FROM country
WHERE country LIKE '_____';
--5. Senaryo
SELECT COUNT(*)
FROM city
WHERE city ILIKE '%r';