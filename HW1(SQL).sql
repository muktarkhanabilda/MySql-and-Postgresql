create database Family;

create table FamilyMembers
(
member_id int not null primary key auto_increment,
status varchar(10) not null,
member_name varchar(15) not null,
birthdate date
);

create table Payments
(
payment_id int not null primary key auto_increment,
good_name varchar(20) not null,
amount int not null,
date date not null 
);

create table FamilyFriends
(
friend_id int not null primary key auto_increment,
friend_name varchar(20) not null,
member_name varchar(20) not null,
friend_age int not null
);
select * from FamilyFriends;

select * from payments;

select * from familymembers;

