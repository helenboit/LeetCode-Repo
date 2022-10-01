# Write your MySQL query statement below

with minT as
(
    select player_id, event_date, min(event_date) over (partition by player_id order by event_date) as minDate
    from Activity 
   )

select round(sum(event_date=minDate+1)/count(distinct player_id),2) as fraction
from minT