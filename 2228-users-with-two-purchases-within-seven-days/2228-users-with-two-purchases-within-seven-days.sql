# Write your MySQL query statement below
/*
select distinct p1.user_id
from Purchases p1 join Purchases p2 
    on p1.user_id = p2.user_id 
    and p1.purchase_id != p2.purchase_id
    and abs(DATEDIFF(p1.purchase_date, p2.purchase_date))<=7
order by p1.user_id


*/

select  distinct user_id
from
( select user_id, purchase_date,
lag(purchase_date) over (partition by user_id order by purchase_date) prev_purchase_date
from purchases) t
where datediff(purchase_date, prev_purchase_date) <=7