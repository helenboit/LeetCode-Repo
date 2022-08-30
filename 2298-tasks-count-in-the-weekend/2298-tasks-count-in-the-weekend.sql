# Write your MySQL query statement below


with new_t as
(
select WEEKDAY(submit_date) as DayOfWeek, count(task_id) as cnt
from Tasks
group by WEEKDAY(submit_date)
)


select distinct (select sum(cnt) from new_t where DayOfweek between 5 and 6) as weekend_cnt, (select sum(cnt) from new_t where DayOfWeek between 0 and 4) as working_cnt
from new_t