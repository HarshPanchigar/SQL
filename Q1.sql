create database Rev;

use rev;

CREATE Table employee(id INT PRIMARY KEY, name VARCHAR(50) , salary INT);

INSERT INTO employee (id,name,salary)
    VALUES 
    (001,"Harsh",90000),
    (002,"Ram",80000),
    (003,"Shyam",70000);

SELECT * FROM employee