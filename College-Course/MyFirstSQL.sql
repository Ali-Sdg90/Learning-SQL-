-- language: sql

create database ali

------------------------------

create table computer 
(
    u_id int not null primary key,
    first_name varchar(50) not null,
    num varchar(10) not null unique,
    f_key int,
    foreign key(f_key) reference randomTable (u_id),
)

------------------------------

create table orders
(
    id int not null primary key,
    u_id int not null,
    constraint fk_order foreign key(u_id) reference randomTable (u_id),
)

------------------------------

create table person
(
    id int not null primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    city varchar(100) not null default "tehran",
    age int not null check(age >= 18)
    u_id int not null,
    foreign key u_id reference randomTable (id),
)

------------------------------

create table person
(
    id int not null primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    city varchar(100) not null default "tehran",
    age int not null,
    u_id int not null,
    foreign key u_id reference randomTable (id),
    constraint admin check(age>=18 and id<20)
)

------------------------------

CREATE TABLE Customer
(
    U_ID int NOT NULL PRIMARY KEY,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    Age int NOT NULL,
    Address varchar(255) NOT NULL,
    Country varchar(20) NOT NULL DEFAULT 'Iran',
    City varchar(20) NOT NULL,
    CHECK (Age>=18),
    CONSTRAINT uc_customer UNIQUE (Age,LastName)
)

--  delete
ALTER table Customer,
constraint uc_customer drop,

-- add
ALTER table Customer,
Add password int,

-- modify
ALTER table Customer
ALTER column age date,

------------------------------

CREATE TABLE Customer
(
    U_ID int NOT NULL PRIMARY KEY identity,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    Age int NOT NULL,
    Address varchar(255) NOT NULL,
    Country varchar(20) NOT NULL DEFAULT 'Iran',
    City varchar(20) NOT NULL,
    CHECK (Age>=18),
    CONSTRAINT uc_customer UNIQUE (Age,LastName)
)

Insert into Customer (first_name, last_name, age, Address, Country, city)
values("ali", "sadeghi", 21, "iran-tehran", "iran", "tehran");

Insert into Customer values("ali", "sadeghi", 21, "iran-tehran", "iran", "tehran")

------------------------------

select * from Customer

update Customer
set age = 17, first_name="saba"
where u_id=5

delete from Customer
where u_id=5

------------------------------

select city from Country
select distinct city form Country

select * from Country where city = "tehran"
select * from Country where age >= 21
select * from Country where age between 21 and 50
select * from Country where city <> tehran

select * from Country where city LIKE "a%"
select * from Country where city LIKE "%a"
select * from Country where city LIKE "%a%"
select * from Country where city LIKE "_a%"
select * from Country where city LIKE "a_%_%t"
select * from Country where city LIKE "a%t"
select * from Country where city LIKE "[abc]%"
select * from Country where city NOT LIKE "[abc]%"
select * from Country where city LIKE "[!abc]%"
select * from Country where city LIKE "[a-e]___"
select * from Country where city NOT LIKE "[!abc]%"

select top 30 * from Country
select top 30 persent * from Country

select * from Country order by age

------------------------------

select p#, sum(qty) as total_qty from spj group by p#

------------------------------

select last_name from user

UNION -- or -- UNION ALL

select first_name from person

------------------------------

select * into Country_backup from Country
select age into Country_backup from Country
select * into Country_backup from Country where city = "tehran"

------------------------------

select * from Country where city="tehran" or city="shiraz"
select * from Country where city="tehran" and name="ali"
select * from Country where city IN ("tehran","shiraz") 
select * from Country where city NOT LIKE "__hr__"
select * from Country where city Like "[^a-d]___"
select * from Country where city Like "[!a-d]___"
