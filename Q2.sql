create database collage;
use collage;
create table student(
	roll_no int primary key,
    name varchar(50),
    marks int not null,
    grade varchar(1),
    city varchar(20)
);

insert into student(roll_no , name, marks, grade, city) values 
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbstudentsai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

select * from student;
SELECT roll_no , name from student;
select name,marks from student;
select distinct city from student;

select roll_no, name , marks from student where marks > 80;
select city from student where city = "Mumbai";


select * from student order by city desc limit 3;

select * from student;
select city, count(name) from student group by city;

-- // practice Q-1 - write query to find avg marks in each city in ascending order

select
city , avg(marks) 
from student 
group by city 
order by city;

select * from students order by marks desc;

-- Display the top 3 students with highest marks.

select * from students order by marks desc limit 3;

select max(marks) from students;

-- Count how many students are from each city.
select * from students group by city;

update students set id = "11" where id = "10"; 
update students set id = "10" where id = "11";
select * from students;

create table departments (
	dept_id int primary key,
    dept_name varchar(50) not null
);

INSERT INTO departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Sales');

create table employees (
	emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary INT,
    dept_id INT,
	foreign key (dept_id) 
    REFERENCES departments(dept_id)
    on update cascade
    on delete cascade
    );
    
select * from employees;
INSERT INTO employees VALUES
(101, 'Harsh', 50000, 1),
(102, 'Raj', 40000, 2),
(103, 'Priya', 60000, 1),
(104, 'Amit', 45000, 3),
(105, 'Neha', 55000, 2);

truncate table employees;

select * from departments;
update departments set dept_name="CS" where dept_name = "IT";

-- ----------------------------------------------------------


select * from students;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Sales'),
(4, 'Marketing');

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees VALUES
(101, 'Harsh', 50000, 1),
(102, 'Raj', 40000, 2),
(103, 'Priya', 60000, 1),
(104, 'Amit', 45000, 3),
(105, 'Neha', 55000, 2),
(106, 'Karan', 70000, 1);


select * from employees;

select * from departments;

select name, marks from students where city = "surat" and marks=(select max(marks) from students where city="surat");
select name , id from students where id in (select id from students where id % 2 = 0);
select id , name from students where id in (select id from students where id % 2 = 0);