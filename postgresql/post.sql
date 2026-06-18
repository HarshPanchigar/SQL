CREATE TABLE person(
	id INT,
	name VARCHAR(100),
	city VARCHAR(100)
);

INSERT INTO person
VALUES
(2,'sham','mumbai'),
(3,'paul','chennai'),
(4,'alex','pune');

select name from person;

update person set city='landon' where id=1;

select * from person

delete from person where id = 4;
select * from person;
insert into person values (4,'alex','pune');
select * from person;

create table employees(
	emp_id serial primary key,
	fname varchar(50) NOT NULL,
	lname varchar(50) not null,
	email varchar(100) not null unique,
	dept varchar(50),
	salary decimal(10,2) default 30000.00,
	hire_date date not null default current_date
);

INSERT INTO employees (emp_id, fname, lname, email, dept, salary, hire_date)
VALUES
(1, 'Raj', 'Sharma', 'raj.sharma@example.com', 'IT', 50000.00, '2020-01-15'),

(2, 'Priya', 'Singh', 'priya.singh@example.com', 'HR', 45000.00, '2019-03-22'),

(3, 'Arjun', 'Verma', 'arjun.verma@example.com', 'IT', 55000.00, '2021-06-01'),

(4, 'Suman', 'Patel', 'suman.patel@example.com', 'Finance', 60000.00, '2018-07-30'),

(5, 'Kavita', 'Rao', 'kavita.rao@example.com', 'HR', 47000.00, '2020-11-10'),

(6, 'Amit', 'Gupta', 'amit.gupta@example.com', 'Marketing', 52000.00, '2020-09-25'),

(7, 'Neha', 'Desai', 'neha.desai@example.com', 'IT', 48000.00, '2019-05-18'),

(8, 'Rahul', 'Kumar', 'rahul.kumar@example.com', 'IT', 53000.00, '2021-02-14'),

(9, 'Anjali', 'Mehta', 'anjali.mehta@example.com', 'Finance', 61000.00, '2018-12-03'),

(10, 'Vijay', 'Nair', 'vijay.nair@example.com', 'Marketing', 50000.00, '2020-04-19');


select * from employees;
select * from employees where dept in ('HR','IT')

SELECT * from employees WHERE dept not in ('HR','IT','Finance');

SELECT * from employees where salary BETWEEN 50000 and 60000;

select DISTINCT dept from employees;

select * from employees ORDER BY fname;

SELECT * FROM employees LIMIT 3;

SELECT * from employees WHERE fname like '%i%'

SELECT * from employees WHERE dept like '__'

select fname , salary from employees where salary = (SELECT min(salary) from employees);
select fname , salary from employees where salary = (SELECT max(salary) from employees);

select dept , count(dept) as total_dept from employees group by dept;

select dept, sum(salary) from employees GROUP BY dept;

SELECT concat('hello',' ','world');

select emp_id,concat(fname,' ', lname),salary from employees;

select emp_id,concat_ws(' ',fname, lname),salary from employees;

select substr('hello buddy',7,10);
select REPLACE('hello buddy','hello' , 'hey');

SELECT reverse(dept) from employees;

select replace(dept,'IT','CS') from employees;

SELECT length(fname) from employees;
SELECT emp_id ,fname , length(fname) as length from employees WHERE length(fname) > 4;

select * , length(fname) FROM employees where length(fname) > 4;
select upper(fname) from employees;

select concat_ws(':',emp_id,fname,lname,dept,salary) from employees where emp_id =1;

select concat_ws(':', emp_id ,concat_ws(' ',fname,lname),dept,salary) from employees WHERE emp_id =1;

select * from employees;



 select concat_ws(' ',concat(substr(dept,1,1),emp_id),fname) from employees where emp_id= 1 or
emp_id=2;


select * from employees where salary = (select min(salary) from employees);