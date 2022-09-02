# Write your MySQL query statement below
select user_id, product_id
from
(
select user_id, s.product_id, rank() over (partition by user_id order by sum(quantity*price) desc) as rnk
from Sales s join Product p on s.product_id = p.product_id
group by user_id, s.product_id
)t
where rnk = 1
