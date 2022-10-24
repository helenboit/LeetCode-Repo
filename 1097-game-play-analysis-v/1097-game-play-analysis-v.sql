# Write your MySQL query statement below

with installdate as
(
    select  player_id,
            min(event_date) over (partition by player_id) as install_dt,
            datediff(event_date, min(event_date) over (partition by player_id)) as diff
    from Activity
    
            
            

)



select  install_dt,
        count(distinct player_id) as installs,
        round(sum(diff=1)/(count(distinct player_id)),2) as Day1_retention
        
from installdate
group by install_dt
