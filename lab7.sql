create database lab7;

--1
--a
create or replace function increment(a integer)
returns integer as
    $$
    begin
        return a+1;
    end;
    $$
language plpgsql;

select increment(5);

--b
create or replace function sum_of_two_numbers(a integer, b integer)
returns integer as
    $$
    begin
        return a+b;
    end;
    $$
language plpgsql;
select sum_of_two_numbers(5,5);

--c
create or replace function two_divisible(x integer)
returns bool as
    $$
    declare
        mod_ integer;
    begin
        mod_ = mod(x, 2);
        return case
            when mod_=0 then true
            else false
        end;
    end;
    $$
language plpgsql;
select two_divisible(15);
select two_divisible(16);

--d
create or replace function check_password(s varchar)
returns bool as
    $$
    declare
        pass varchar := '123456';
    begin
        return
            case
                when pass = s then false
                else true
            end;
    end;
    $$
language plpgsql;
select check_password('123456');
select check_password('adsg123!!');

--e
create or replace function one_input_two_output(in a integer, out x integer, out y integer)
as
    $$
    begin
        y := a/4;
        x := a/2;
    end;
    $$
language plpgsql;
select * from one_input_two_output(16);



--2
--a
create table lab2_a(
    city varchar,
    current__time timestamp,
    undate_time timestamp
);

create or replace function time_update_fun()
returns trigger as
    $$
    declare
        t timestamp;
    begin
        t = current_timestamp;
        new.undate_time = t;
        return new;
    end;
    $$
language plpgsql;

create or replace trigger time_update_trig
    before update
    on lab2_a
    for each row
    execute procedure time_update_fun();

insert into lab2_a(city,current__time)
values('Almaty', current_timestamp);

select * from lab2_a;

update lab2_a
set city = 'Astana'
where city = 'Almaty';

select * from lab2_a;

--b
create table lab2_b(
    name varchar,
    year  int,
    age int
);

create or replace function age_cal_fun()
returns trigger as
    $$
    declare
        y int;
    begin
        y = 2022-new.year;
        new.age = y;
        return new;
    end;
    $$
language plpgsql;

create or replace trigger age_cal_trig
    before insert
    on lab2_b
    for each row
    execute procedure age_cal_fun();

insert into lab2_b(name, year)
values ('Marat', 2003);
select * from lab2_b;

--c
create table lab2_c(
    name varchar,
    price real,
    total_price real
);

create or replace function total_price_fun()
returns trigger as
    $$
    declare
        sum real;
    begin
        sum = new.price * 0.12 + new.price;
        new.total_price = sum;
        return new;
    end;
    $$
language plpgsql;

create or replace trigger total_price_trig
    before insert
    on lab2_c
    for each row
    execute procedure total_price_fun();

insert into lab2_c (name, price)
values ('Dias', 1200);
insert into lab2_c (name, price)
values ('Aset', 2700);

select * from lab2_c;

--d
create or replace  function check_del_fun()
    returns trigger as $$
    begin
        if old.name = 'Aset' then
            raise exception 'cannot delete this row';
        end if;
    end;
$$ language plpgsql;

create or replace trigger check_del_trig
    before delete on lab2_c
    for each row
    execute procedure check_del_fun();

select * from lab2_c;

drop function check_del_fun;
drop trigger check_del_trig;
drop trigger c;
delete from lab2_c
where name = 'Aset';

--e
create table lab2_e(
    login varchar,
    password varchar,
    validity bool
);

create or replace function check_pass_fun()
returns trigger as
    $$
    declare
        pass_ varchar := '123456';
        check_ bool := true;
    begin
        if new.password = pass_ then
            check_ = false;
        end if;
        new.validity = check_;
        return new;
    end;
    $$
language plpgsql;

create or replace trigger check_pass_trig
    before insert on lab2_e
    for each row
    execute procedure check_pass_fun();

select * from lab2_e;

insert into lab2_e(login, password) values ('Dias', '123456');
insert into lab2_e(login, password) values ('Didar', 'dasf!_14');



--3
--a
create table employee(
    id integer,
    name varchar,
    date_of_birth date,
    age integer,
    salaty integer,
    work_experince integer,
    discount  integer
);

insert into employee(id, name, date_of_birth, age, salaty, work_experince, discount)
values
    (1, 'Dias', '1980-12-02', 42, 150000, 9, 5),
    (201, 'Didar', '1996-12-02', 26, 155000, 2, 3);

select * from employee;

create or replace function every_2()
returns trigger as
    $$
    declare
        year integer;
        exp integer;
        exp5 integer;
    begin
        year = new.work_experince - old.work_experince;
        exp = year/2;
        exp5 = year/5;
        if year<2 then
            new.salaty = old.salaty;
        elsif year>5 then
            new.salaty = old.salaty*(exp*0.1) + old.salaty;
            new.discount = old.discount * (exp5*0.1) + old.discount;
        else
            new.salaty = old.salaty*(exp*0.1) + old.salaty;
        end if;
        return new;
    end;
    $$
language plpgsql;

create or replace trigger every_2_trig
    after update on employee
    for each row
    execute procedure every_2();

select * from employee;
update employee set work_experince = 5
where id = 201;