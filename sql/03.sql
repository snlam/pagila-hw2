/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */
select distinct customer_id from film
inner join inventory using (film_id)
inner join rental using (inventory_id)
inner join customer using (customer_id)
where film_id in
(select film_id from payment
inner join rental using (rental_id)
inner join inventory using (inventory_id)
inner join film using (film_id)
group by film_id
order by sum(amount) desc limit 5)
order by customer_id;
