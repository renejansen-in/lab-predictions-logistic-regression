SELECT r.rental_id, r.rental_date, r.inventory_id, r.customer_id, r.return_date, 
r.staff_id, i.film_id, i.store_id, fi.release_year, fi.language_id, 
fi.rental_duration, fi.rental_rate, fi.length, fi.rating, 
fc.category_id, fa.actor_id, cu.customer_id, a.address_id, ci.city_id, co.country_id,
CASE
    WHEN rental_date >= '2005-08-01 00:00:00' THEN 1
    ELSE 0
END AS t_rented
FROM sakila.rental AS r
JOIN sakila.inventory i USING (inventory_id)
JOIN sakila.film fi USING (film_id)
JOIN sakila.film_category fc USING (film_id)
JOIN sakila.film_actor fa USING (film_id)
JOIN sakila.customer cu USING (customer_id)
JOIN sakila.address a USING (address_id)
JOIN sakila.city ci USING (city_id)
JOIN sakila.country co USING (country_id)
WHERE rental_date < '2005-09-01 00:00:00' 
;