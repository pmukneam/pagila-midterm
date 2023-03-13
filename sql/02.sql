/*
 * Write a SQL query SELECT query that:
 * computes the country with the most customers in it. 
 */

SELECT country 
FROM customer 
JOIN address USING (address_id)
JOIN city USING (city_id) 
JOIN country using (country_id) 
GROUP BY country 
ORDER BY count(*) DESC
LIMIT 1;
