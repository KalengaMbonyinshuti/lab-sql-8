/*
1. Write a query to display for each store its store ID, city, and country.
*/
select st.store_id, ci.city, co.country from sakila.store as st left JOIN sakila.country as co ON st.last_update = co.last_update
 left JOIN  sakila.city as ci ON co.last_update = ci.last_update;

/* 2. Write a query to display how much business, in dollars, each store brought in.
*/
select count(pa.amount), st.store_id from sakila.store as st 
left join sakila.payment as pa on pa.last_update = st.last_update
group by st.store_id;


/*3. Which film categories are longest?
*/
select ca.category_id,  f.length from sakila.film as f
left join sakila.category as ca on ca.last_update = f.last_update
order by length desc;

/*4.  Display the most frequently rented movies in descending order.
*/

SELECT title as name_of_rented_movie, rental_rate  from sakila.film
order by rental_rate desc;

/*5.  List the top five genres in gross revenue in descending order.
*/
select*, p.amount, f.title from sakila.payment as p left join sakila.film as f on f.last_update =p.last_update
order by f.title desc
limit 5;

/*6. Is "Academy Dinosaur" available for rent from Store 1?
*/

select* from sakila.store as s left join sakila.film as f on f.last_update =s.last_update
where s.store_id='Academy Dinosaur' and s.store_id ;


/* 7. Get all pairs of actors that worked together.
*/
select a.first_name, count( f.title) from sakila.film as f
left join sakila.actor as a on f.last_update =a.last_update group by a.first_name having count(*)>1;

/*8.  Get all pairs of customers that have rented the same film more than 3 times.
*/
select c.customer_id,  count(f.title) as customer_rented_movie from sakila.customer as c 
left join sakila.film as f on f.last_update =c.last_update group by c.customer_id having count(*)>3;

/*9. For each film, list actor that has acted in more films.
*/
select a.first_name,  count(a.last_name) as number_of_moved_involced_in from sakila.actor as a left join sakila.film as f on f.last_update =a.last_update
group by a.first_name having count(*)>2;




