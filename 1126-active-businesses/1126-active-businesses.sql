with new_table as
(
SELECT business_id, event_type, occurences, avg(occurences) over (partition by event_type) as avg_activity
FROM Events

    )

SELECT business_id
from new_table
where occurences>avg_activity
group by business_id
having count(event_type)>1


