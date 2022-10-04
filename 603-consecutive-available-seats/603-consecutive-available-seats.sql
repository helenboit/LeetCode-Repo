# Write your MySQL query statement below



select distinct c1.seat_id
from Cinema c1, Cinema c2
where ((c2.seat_id=c1.seat_id+1) or (c2.seat_id=c1.seat_id-1)) and c1.free=1 and c2.free=1
order by c1.seat_id asc;
