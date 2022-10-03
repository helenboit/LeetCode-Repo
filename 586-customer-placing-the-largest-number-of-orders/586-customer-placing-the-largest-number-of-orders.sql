# Write your MySQL query statement below

with cte as
(
select customer_number, count(order_number) as OrderCounts
from Orders
group by customer_number
)

select customer_number
from cte
where OrderCounts in (select max(OrderCounts) from cte )
