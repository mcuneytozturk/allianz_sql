-- 1. Sorgu

(SELECT first_name FROM actor)
UNION
(SELECT first_name FROM customer);

--2. Sorgu

(SELECT first_name FROM actor)
INTERSECT
(SELECT first_name FROM customer);

--3. Sorgu

(SELECT first_name FROM actor)
EXCEPT
(SELECT first_name FROM customer);