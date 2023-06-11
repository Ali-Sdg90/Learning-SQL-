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

