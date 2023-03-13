/*
 * Write a SQL query SELECT query that:
 * List the first and last names of all actors who have appeared in movies in the "Children" category,
 * but that have never appeared in movies in the "Horror" category.
 */

SELECT DISTINCT
    first_name,
    last_name
FROM film
JOIN film_actor USING (film_id)
JOIN actor USING (actor_id)
JOIN film_category USING (film_id)
JOIN category USING (category_id)
WHERE
    category.name = 'Children'
    AND
    actor_id NOT IN (SELECT DISTINCT actor_id
                     FROM film
                     JOIN film_actor USING (film_id)
                     JOIN film_category USING (film_id)
                     JOIN category USING (category_id)
                     WHERE category.name = 'Horror')
ORDER BY first_name, last_name;
