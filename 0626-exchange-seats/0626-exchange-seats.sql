select case 
        when (id in (select max(id) from Seat)) & id%2=1 then id
        when id%2 = 0 then id-1
        when id%2 = 1 then id+1
        end as id,
        student
from Seat
order by id