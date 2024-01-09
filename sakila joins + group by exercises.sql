select firstname, lastname, city
from employees
join offices
on employees.officeCode = offices.officeCode
where city = "Boston"
order by lastName asc;

/* 1) Use `INNER JOIN` to display the first and last names, as well as the address, of each staff member. Use the tables `staff` and `address` */
select staff.first_name, staff.last_name, address.address
from staff
inner join address
on staff.address_id = address.address_id;

/* 2) Use `INNER JOIN` to display the total amount rung up by each staff member in August of 2005. Use tables `staff` and `payment`. */
select payment.staff_id,first_name, last_name, sum(amount)
from payment
inner join staff
on payment.staff_id = staff.staff_id
where payment_date like "2005-08-%"
group by payment.staff_id;

select first_name, last_name,sum(amount) 
from staff 
join payment
on staff.staff_id=payment.staff_id
where payment_date like "2005-08-%"
group by first_name, last_name;

/* 3) Write a query  to find the employee_id,name(last_name) along with their manager_id and name(last_name).*/
select staff_id, last_name, manager_staff_id
from staff
join store
on staff.store_id = store.store_id
group by staff_id;


 
/* 4) List each film and the number of actors who are listed for that film. Use tables `film_actor` and `film`. Use inner join. */
select count(film_actor.actor_id) as Number_of_Actors, title
from film
join film_actor
on film.film_id = film_actor.film_id
group by title;

/* 5) Write a query to get the department name and number of employees in the department. */

/* 6) How many copies of the film `Hunchback Impossible` exist in the inventory system? */
select count(inventory.film_id), title
from inventory
join film
on inventory.film_id = film.film_id
where title = "Hunchback Impossible";

/* 7) Using the tables `payment` and `customer` and the `INNER JOIN` command, list the total paid by each customer. List the customers
 alphabetically by last name: */
select sum(amount), customer.customer_id
from payment
join customer
on customer.customer_id = payment.customer_id
order by last_name asc;

/* 8) Which actor has appeared in the most films? */
select count(film_actor.actor_id) as Number_of_Films, title, first_name, last_name
from film
join film_actor
on film.film_id = film_actor.film_id
join actor
on actor.actor_id = film_actor.actor_id
group by title
order by count(film_actor.actor_id) desc
limit 1;

select first_name, last_name, count(film_actor.actor_id) as total_films_appeared_in from film_actor
inner join actor
on film_actor.actor_id = actor.actor_id
group by actor.actor_id
order by count(film_actor.actor_id) DESC
limit 1;


