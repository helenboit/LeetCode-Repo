select b.book_id, name
from Books b left join Orders o on b.book_id = o.book_id
where available_from <'2019-05-23'
group by b.book_id, name
having 
    sum(case when dispatch_date>=date_sub('2019-06-23', interval 1 year) then quantity else 0 end) < 10