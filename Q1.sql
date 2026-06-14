create database Rev;

use rev;

CREATE Table employee(id INT PRIMARY KEY, name VARCHAR(50) , salary INT);

INSERT INTO employee (id,name,salary)
    VALUES 
    (001,"Harsh",90000),
    (002,"Ram",80000),
    (003,"Shyam",70000);

SELECT * FROM employee

USE rev;

SELECT * FROM employee

CREATE Table temp1 (
    id INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
    name VARCHAR(50),
    roll_no INT UNIQUE
);

INSERT INTO temp1(name,roll_no) 
    VALUES
    ("Harsh",001),
    ("Ram",002),
    ("Krishna",003);
SELECT * FROM temp1