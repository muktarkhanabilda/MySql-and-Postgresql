/*
--problem 1
DDL is Data Definition Language which is used to define data structures.
For example: create table, alter table are instructions in SQL.

DML is Data Manipulation Language which is used to manipulate data itself.
For example: insert, update, delete are instructions in SQL.


b)
CREATE to create a new table or database.
ALTER for alteration.
DROP to drop a table.

INSERT : It is used to insert data into a table.
UPDATE: It is used to update existing data within a table.
DELETE : It is used to delete records from a database table.
EXPLAIN PLAN: It describes the access path to data.
*/




create  database dbForLab4;


 -- Problem2
create table costomers(
    id serial,
    full_name varchar(50),
    timestamp timestamp,
    delivery_address text,
    primary key (id)
);

create table products(
    id serial,
    name varchar(150),
    description text,
    price double precision,
    primary key (id)
);

create table orders(
    code integer,
    costomer_id integer,
    total_sum double precision,
    is_paid boolean,
    foreign key (costomer_id) references costomers(id),
    primary key (code)
);

create table order_items(
    order_code integer,
    product_id integer,
    quantity integer,
    foreign key (order_code) references orders(code),
    foreign key (product_id) references products(id)
);

------ Problem 3
--  a)
create table student(
    id varchar(9) unique not null ,
    full_name varchar(50),
    age integer,
    birth_day date,
    gender varchar(10),
    primary key (id)
);
create table student_info(
    id_numder varchar(9),
    avarage_grade double precision,
    dorm_needs boolean,
    add_info text,
    foreign key (id_numder) references student(id)
);

--  b)
create table instructor(
    full_name varchar(50),
    languages varchar(30),
    work_experience integer,
    remote_pos boolean,
    primary key (full_name)
);

--  c)
create table lesson(
    name varchar(40),
    instructor_name varchar(50),
    sudents_sum integer,
    room_number integer,
    foreign key (instructor_name) references instructor(full_name)

);


---- Problem4
insert into costomers(full_name, timestamp, delivery_address) values
('Erdaulet', now(), 'Kbtu');
insert into costomers(full_name, timestamp, delivery_address) values
('Olzhas', now(), 'Tolibi');

insert into products(name, description, price) values
('Car', 'very fast', 14000.5);
insert into products(name, description, price) values
('Ball', 'good', 28);

insert into orders(code, costomer_id, total_sum, is_paid) values
(1898, 1, 1780.35, true);

insert into order_items(order_code, product_id, quantity) values (1898, 1, 10);

delete from costomers where full_name = 'Olzhas';

update costomers
set delivery_address = 'Tolebi'
where full_name = 'Erdaulet';

select * from costomers;

select * from order_items;

select * from products;

select * from orders;
