# Write your MySQL query statement below

select  distinct candidate_id
from    Candidates c join Rounds r
        on c.interview_id = r.interview_id and years_of_exp>=2 and c.interview_id in
        (select interview_id 
         from Rounds 
         group by interview_id 
         having sum(score) > 15
        )