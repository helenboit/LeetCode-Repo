# Write your MySQL query statement below

with t1 as
(
select departure_airport as airport_id, sum(flights_count) as total_count
from Flights
group by departure_airport

union

select arrival_airport as airport_id, sum(flights_count) as total_count
from Flights
group by arrival_airport
),

    t2 as
(
select airport_id, sum(total_count) as counts
from t1
group by airport_id

)

select airport_id
from t2
where counts >=all(select counts from t2)