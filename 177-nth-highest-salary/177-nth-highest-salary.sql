
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN   
  RETURN (
      # Write your MySQL query statement below.
    SELECT DISTINCT salary 
    FROM       
    (SELECT id, salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM Employee
    GROUP BY id)t
    WHERE rnk=N
      
  );
END

/*
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M int;
SET M=N-1;
  RETURN (
        SELECT DISTINCT salary FROM Employee ORDER BY salary DESC LIMIT 1 OFFSET M 
  );
END
*/

