with cte as
(
select departmentId, name as Employee, Salary 
from(
select departmentId, Salary, dense_rank () over (partition by departmentId order by salary desc) as rnk, name
from Employee
    )t
where rnk <= 3
)

select d.name as Department, Employee, Salary
from Department d join cte on d.id = cte.departmentId
order by Salary desc