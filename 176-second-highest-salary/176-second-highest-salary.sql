# Write your MySQL query statement below
/*
with newT as
(
SELECT salary,
Dense_Rank() over(order by salary desc) as rank2
FROM Employee

    )
   
SELECT 
    case
        when count(rank2=2)<>0 then salary
        else null
        end as 'SecondHighestSalary'
FROM newT
WHERE rank2=2
*/

SELECT
    IFNULL(
      (SELECT DISTINCT Salary
       FROM Employee
       ORDER BY Salary DESC
        LIMIT 1 OFFSET 1),
    NULL) AS SecondHighestSalary

