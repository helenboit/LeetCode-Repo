# Write your MySQL query statement below


with cte1 as (select *, row_number() over() as rn from coffeeshop),

cte2 as (select *, count(drink) over(order by rn) as 'cnt' from cte1)

select id, first_value(drink) over(partition by cnt) as drink from cte2