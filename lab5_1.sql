--1)
create database lab5;

--2)
create table Warehouses(
    code integer,
    location character varying(255),
    capacity integer,
    primary key (code)
);

create table Boxes(
    code character(4),
    contents character varying(255),
    value real,
    warehouse integer,
    foreign key (warehouse) references Warehouses(code)
);

--3)
--

--4)
select *
from warehouses;

--5)
select *
from Boxes
where value > 150;

--6)
select distinct contents
from boxes;

--7)
select  warehouse, count(warehouse) number_of_boxes
from Boxes group by warehouse;

--8)
select  warehouse, count(warehouse) number_of_boxes
from Boxes group by warehouse having count(warehouse)>2;

--9)
insert into warehouses (code, location, capacity)
values (6, 'New York', 3);

--10)
insert into boxes(code, contents, value, warehouse)
values ('H5RT', 'Papers', 200, 2);

--11)
update boxes
set value = value * 0.85
where value in (select  value
                from boxes order by value
                desc offset 2 limit 1);

--12)
delete from Boxes
where value<150;
select * from boxes;

--13)
delete from Boxes
where warehouse in(select code
                   from Warehouses
                   where location = 'New York')
returning  *;



select * from warehouses;
select * from boxes;
