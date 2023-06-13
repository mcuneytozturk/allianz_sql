--1. sorgu

SELECT country.country_id, country.country, city.city FROM country
JOIN city ON country.country_id = city.country_id;

--2. sorgu

SELECT payment.payment_id, customer.first_name, customer.last_name FROM payment
JOIN customer ON payment.customer_id = customer.customer_id;

--3. sorgu

SELECT rental.rental_id, customer.first_name, customer.last_name, customer.customer_id FROM rental
JOIN customer ON rental.customer_id = customer.customer_id;