# Write your MySQL query statement below

/*
with t as
(
select department_id, count(*) as cnt
from Students
group by department_id
)


select student_id, Students.department_id, ifnull(round(100*(rank() over (partition by department_id order by mark desc)-1)/(cnt-1),2),0) as percentage
from Students join t on Students.department_id = t.department_id

*/

SELECT student_id, department_id, 
    ROUND(100*PERCENT_RANK() OVER (
          PARTITION BY department_id 
          ORDER BY mark DESC)
    , 2) AS percentage 
FROM Students