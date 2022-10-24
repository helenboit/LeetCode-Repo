select  distinct left(pay_date,7) as pay_month,
        department_id,
        case
            when avg(amount) over (partition by pay_date, department_id) < avg(amount) over (partition by pay_date) then 'lower'
            when avg(amount) over (partition by pay_date, department_id) > avg(amount) over (partition by pay_date) then 'higher'
        else 'same'
        end as comparison
from Salary s left join Employee e on s.employee_id=e.employee_id
order by 1,2
         
        
