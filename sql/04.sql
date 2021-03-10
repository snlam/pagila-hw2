/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */
select title from film
inner join inventory using (film_id)
inner join rental using (inventory_id)
inner join customer using (customer_id)
where customer_id = 1 
group by title
having count(customer_id) > 1
order by title;
