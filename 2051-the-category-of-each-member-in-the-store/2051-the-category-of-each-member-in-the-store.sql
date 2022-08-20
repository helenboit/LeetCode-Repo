# Write your MySQL query statement below
with new_t as
(            
select  m.member_id, name, v.visit_id, charged_amount
from    Members m left join Visits v on v.member_id = m.member_id
        left join Purchases p on v.visit_id = p.visit_id
)


select  member_id, name, 
        case
            when sum(charged_amount>0)*100/count(visit_id) >=80 then 'Diamond'
            when visit_id is not null and ifnull(sum(charged_amount>0)*100/count(visit_id),0) < 50  then 'Silver'
            when visit_id is null then 'Bronze'
            else 'Gold'
            end as category
from new_t
group by member_id, name
order by member_id

