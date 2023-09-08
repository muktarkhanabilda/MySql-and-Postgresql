create database university;

use university;

#Address
create table Address
(
id int not null auto_increment,
Country varchar(50) default 'Kazakhstan',
City varchar(50) not null,
Street varchar(50),
Number int,
primary key(id)
);
#person
create table Person
(
id int not null auto_increment,
FirstName varchar(50),
LastName varchar(50),
BirthDate date,
Addressld int not null,
primary key(id),
foreign key(Addressld) references address(id)
);
alter table person add PhoneNumber bigint;
#Student
create table Student
(
id int not null auto_increment,
Personld int not null,
Description varchar(250),
primary key(id),
foreign key(Personld) references person(id) on delete cascade
);

#Teacher
create table Teacher
(
	id int not null auto_increment,
	Position varchar(50),
	Personld int,
	primary key(id),
	foreign key(Personld) references person(id)
);

#Course
create table Course
(
id int not null auto_increment,
Name varchar(50),
Credits int,
Description varchar(250),
Teacherld int,
primary key(id),
foreign key(Teacherld) references Teacher(id)
);


insert into address(Country,County,City,Street,Number) values ('Kazakhstan','Almaty','Almaty','AlFarabi',777);

insert into person(FirstName,LastName,PhoneNumber,BirthDate,Addressld) values ('Muktarkhan', 'Abilda', 87771063746, '2004-06-02', 1);

insert into student(Personld,Description) value (1,'This is good!');

insert into teacher(Position, Personld) values ('Student of KBTU', 1);

insert into course(Name, Credits, Description, Teacherld) values ('Dig Data', 6, 'This course good', 2);

INSERT INTO address(County, City, Street, Number)
VALUES
('West Kazakhstan', 'Uralsk', 'Podstepnoe', 5),
(' ', 'Aktobe', 'Abay', 23),
(' ', 'Almaty', 'Tole bi', 59),
(' ', 'Kyzylorda', 'Zhibek zholy', 40),
('Akmola', 'Nur-Sultan', 'Bukhar Zhyrau', 12);

INSERT INTO person(FirstName, LastName, PhoneNumber, BirthDate, Addressld) 
VALUES
('Azamat', 'Kussainov', 87771111111, '1988-09-05',1),
('Malik', 'Yeleuov', 87772222222, '1964-11-22', 2),
('Veronika', 'Shedrova', 87773333333, '1990-08-12', 3),
('Nazerke', 'Donenova', 87774444444, '1954-05-12', 4),
('Dinara', 'Kakhayeva', 87775555555, '1988-06-02', 5);

INSERT INTO student(Personld, Description) 
VALUES
(1, 'smart,creative,IELTS 8'), 
(3, 'sociable,clever,good leader'),
(5, 'intelligent,good at physics');

INSERT INTO teacher(Position, Personld)
VALUES
('Professor', 2),
('lecturer', 4);

INSERT INTO Course (Name, Credits, Description, Teacherld) VALUES ('Geophysics', 3, ' Gas-condensate ', 1) , ('Gas-condensate fields', 4, 'Gas-condensate production', 2);
insert into course(Name, Credits, Description, Teacherld) values ('Dig Data', 6, 'This course good', 2);

select * from address;
select * from person;
select * from student;
select * from teacher;
select * from course;

