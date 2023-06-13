--1. sorgu

SELECT * FROM country
LEFT JOIN city ON city.country_id = country.country_id;

--2. sorgu

SELECT payment.payment_id, customer.first_name, customer.last_name FROM customer
RIGHT JOIN payment ON customer.customer_id = payment.customer_id;

--3. sorgu

SELECT rental.rental_id, customer.first_name, customer.last_name FROM customer
FULL JOIN rental ON rental.customer_id = customer.customer_id;