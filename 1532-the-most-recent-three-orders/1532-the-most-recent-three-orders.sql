

select  customer_name,
        customer_id,
        order_id,
        order_date
from(
select  c.customer_id,
        name as customer_name,
        order_id,
        order_date,
        rank() over (partition by c.customer_id order by customer_id asc, order_date desc) as rnk
from Customers c left join Orders o on c.customer_id=o.customer_id
where order_id is not null
)t
where rnk<=3
order by customer_name, customer_id, order_date desc;