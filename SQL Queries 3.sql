-- How many distinct (different) actors' last names are there?

select COUNT(distinct(last_name)) as dist_last_name_sum
from actor;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)

select COUNT(distinct(language_id))
from film;

-- How many movies were released with "PG-13" rating?

select count(rating) as 'PG-13_total'
from film
where rating = 'PG-13';

-- Get 10 the longest movies from 2006.

select *
from film
where release_year = '2006' 
order by length desc
limit 10;

-- How many days has been the company operating (check DATEDIFF() function)?
select DATEDIFF(min(rental_date), max(return_date)) as store_operation
from rental;

-- Show rental info with additional columns month and weekday. Get 20.

SELECT rental_id, WEEKDAY(rental_date), MONTH(rental_date)
from rental
group by rental_id
limit 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT rental_id, rental_date,
case when dayofweek(rental_date) in (1,7) then 'Weekend' else 'Weekday' end as day_type
from rental; 

-- How many rentals were in the last month of activity?

SELECT count(rental_id) as total_rentals
FROM rental
WHERE rental_date <= NOW() - INTERVAL 1 MONTH;



