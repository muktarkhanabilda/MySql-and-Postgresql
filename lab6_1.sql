create database lab6;

select * from dealer;
select * from client;
select * from sell;

--a
select *
from dealer d full outer join client c on d.id = c.dealer_id;

--b
select *
from dealer d full outer join client c on d.id = c.dealer_id
    full outer join sell s on d.id = s.dealer_id;

--c
select d.name, d.location, c.name, c.city
from dealer d full outer join client c on d.id = c.dealer_id
where d.location = c.city;

--d
select s.id, s.amount, c.name, c.city
from sell s full outer join client c on s.client_id = c.id
where s.amount between 100 and 500;

--e
select  *
from dealer d left join client c on d.id = c.dealer_id;

--f
select c.name, c.city, d.name, d.charge
from dealer d full outer join client c on d.id = c.dealer_id;

--g
select c.name, c.city, d.name, d.charge
from dealer d full outer join client c on d.id = c.dealer_id
where d.charge>0.12;

--h
select c.name, c.city, s.id, s.amount, d.name, d.charge
from dealer d full outer join client c on d.id = c.dealer_id
    full outer join sell s on d.id = s.dealer_id;

--i
select c.name, c.priority, d.name, s.id, s.amount
from dealer d full outer join client c on d.id = c.dealer_id
    full outer join sell s on d.id = s.dealer_id
where s.amount>2000 and c.priority is not null;