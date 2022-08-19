# Write your MySQL query statement below

select distinct d.name as Department, e.name as Employee, salary as Salary
from Department d join Employee e on e.departmentId = d.id
where (d.id, salary) in
(select departmentId, max(salary) as max_salary from Employee group by departmentId)