with new_t as
(
select name as customer_name, order_id, order_date, c.customer_id, row_number() over (partition by customer_id order by order_date desc) as rnk
from Customers c join Orders o on c.customer_id=o.customer_id
)




select customer_name, customer_id, order_id, order_date
from new_t
where rnk<=3
order by customer_name, customer_id, order_date desc;