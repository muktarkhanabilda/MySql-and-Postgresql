--a
create view unique_client as select distinct count(c.id), avg(s.amount), sum(s.amount), s.date
from client c full outer join sell s on c.id = s.client_id
group by date;
select  * from unique_client;

--b
create view top_5 as select distinct count(c.id), avg(s.amount), sum(s.amount), s.date
from client c full outer join sell s on c.id = s.client_id
group by date order by sum(s.amount) desc limit 5;
select * from top_5;

--c
create view dealer_count as select distinct d.id as dealer_id, count(s.id) number_of_sales, avg(s.amount) as avarage_amount, sum(s.amount) as total_amount
from dealer d full outer join sell s on d.id = s.dealer_id
group by d.id;
select * from dealer_count;

--d
create view total as select distinct d.location, count(d.id), sum(s.amount) * d.charge as total
from dealer d full outer join sell s on d.id = s.dealer_id
group by d.location, d.charge;
select * from total;


create view total2 as select distinct d.location, count(d.id), sum(s.amount) * count(d.charge)
from dealer d full outer join sell s on d.id = s.dealer_id
group by d.location;
select * from total2;

--e
create view dealer_loc as select d.location, count(s.id), avg(s.amount), sum(s.amount)
from dealer d full outer join sell s on d.id = s.dealer_id
group by d.location;
select * from dealer_loc;

--f
create view client_city as select c.city, count(s.id), avg(s.amount), sum(s.amount)
from client c full outer join sell s on c.id = s.client_id
group by c.city;
select * from client_city;

--f
create view tot_city as select  c.city, sum(s.amount)
from client c full outer join sell s on c.id = s.client_id
group by c.city;

create view tot_location as select  d.location, sum(s.amount)
from dealer d full outer join sell s on d.id = s.dealer_id
group by d.location;

select *
from tot_city c inner join tot_location  l on c.city = l.location
where c.sum>l.sum;
