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

