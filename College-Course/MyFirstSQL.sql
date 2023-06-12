-- language: sql

CREATE DATABASE ali;

------------------------------

CREATE TABLE computer (
    u_id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    num VARCHAR(10) NOT NULL UNIQUE,
    f_key INT,
    FOREIGN KEY (f_key) REFERENCES randomTable (u_id)
);

------------------------------

CREATE TABLE orders (
    id INT NOT NULL PRIMARY KEY,
    u_id INT NOT NULL,
    CONSTRAINT fk_order FOREIGN KEY (u_id) REFERENCES randomTable (u_id)
);

------------------------------

CREATE TABLE person (
    id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    city VARCHAR(100) NOT NULL DEFAULT 'tehran',
    age INT NOT NULL CHECK (age >= 18),
    u_id INT NOT NULL,
    FOREIGN KEY (u_id) REFERENCES randomTable (id)
);

------------------------------

CREATE TABLE person (
    id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    city VARCHAR(100) NOT NULL DEFAULT 'tehran',
    age INT NOT NULL,
    u_id INT NOT NULL,
    FOREIGN KEY (u_id) REFERENCES randomTable (id),
    CONSTRAINT admin CHECK (age >= 18 AND id < 20)
);

------------------------------

CREATE TABLE Customer (
    U_ID INT NOT NULL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Country VARCHAR(20) NOT NULL DEFAULT 'Iran',
    City VARCHAR(20) NOT NULL,
    CHECK (Age >= 18),
    CONSTRAINT uc_customer UNIQUE (Age, LastName)
);

--  delete
ALTER TABLE Customer
DROP CONSTRAINT uc_customer;

-- add
ALTER TABLE Customer
ADD password INT;

-- modify
ALTER TABLE Customer
ALTER COLUMN age DATE;

------------------------------

CREATE TABLE Customer (
    U_ID INT NOT NULL PRIMARY KEY IDENTITY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Country VARCHAR(20) NOT NULL DEFAULT 'Iran',
    City VARCHAR(20) NOT NULL,
    CHECK (Age >= 18),
    CONSTRAINT uc_customer UNIQUE (Age, LastName)
);

INSERT INTO Customer (first_name, last_name, age, Address, Country, city)
VALUES ('ali', 'sadeghi', 21, 'iran-tehran', 'iran', 'tehran');

INSERT INTO Customer
VALUES (1, 'ali', 'sadeghi', 21, 'iran-tehran', 'iran', 'tehran');

------------------------------

SELECT * FROM Customer;

UPDATE Customer
SET age = 17, first_name = 'saba'
WHERE u_id = 5;

DELETE FROM Customer
WHERE u_id = 5;

------------------------------

SELECT city FROM Country;
SELECT DISTINCT city FROM Country;

SELECT * FROM Country WHERE city = 'tehran';
SELECT * FROM Country WHERE age >= 21;
SELECT * FROM Country WHERE age BETWEEN 21 AND 50;
SELECT * FROM Country WHERE city <> 'tehran';

SELECT * FROM Country WHERE city LIKE 'a%';
SELECT * FROM Country WHERE city LIKE '%a';
SELECT * FROM Country WHERE city LIKE '%a%';
SELECT * FROM Country WHERE city LIKE '_a%';
SELECT * FROM Country WHERE city LIKE 'a_%_%t';
SELECT * FROM Country WHERE city LIKE 'a%t';
SELECT * FROM Country WHERE city LIKE '[abc]%';
SELECT * FROM Country WHERE city NOT LIKE '[abc]%';
SELECT * FROM Country WHERE city LIKE '[!abc]%';
SELECT * FROM Country WHERE city LIKE '[a-e]___';
SELECT * FROM Country WHERE city NOT LIKE '[!abc]%';

SELECT TOP 30 * FROM Country;
SELECT TOP 30 PERCENT * FROM Country;

SELECT * FROM Country ORDER BY age;

------------------------------

SELECT p#, SUM(qty) AS total_qty FROM spj GROUP BY p#;

------------------------------

SELECT last_name FROM user
UNION
SELECT first_name FROM person;

------------------------------

SELECT * INTO Country_backup FROM Country;
SELECT age INTO Country_backup FROM Country;
SELECT * INTO Country_backup FROM Country WHERE city = 'tehran';

------------------------------

SELECT * FROM Country WHERE city = 'tehran' OR city = 'shiraz';
SELECT * FROM Country WHERE city = 'tehran' AND name = 'ali';
SELECT * FROM Country WHERE city IN ('tehran', 'shiraz');
SELECT * FROM Country WHERE city NOT LIKE '__hr__';
SELECT * FROM Country WHERE city LIKE '[^a-d]___';
SELECT * FROM Country WHERE city LIKE '[!a-d]___';

------------------------------

CREATE TABLE persons (
    u_id INT NOT NULL PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(30) NOT NULL
);

CREATE TABLE orders (
    id INT NOT NULL PRIMARY KEY,
    u_id INT,
    price INT,
    FOREIGN KEY (u_id) REFERENCES persons (u_id)
);

SELECT persons.first_name, persons.last_name, orders.price
FROM persons INNER JOIN orders ON persons.u_id = orders.u_id;

SELECT persons.firstname, persons.lastname, orders.price
FROM persons LEFT JOIN orders ON persons.u_id = orders.u_id;

SELECT persons.firstname, persons.lastname, orders.price
FROM persons RIGHT JOIN orders ON persons.u_id = orders.u_id;

SELECT persons.firstname, persons.lastname, orders.price
FROM persons FULL JOIN orders ON persons.u_id = orders.u_id;

------------------------------

CREATE VIEW test_view AS
SELECT firstname, lastname, age FROM pishva WHERE age > 25;

CREATE OR REPLACE VIEW test_view AS
SELECT FirstName, LastName FROM Customer;

DROP VIEW test_view;
