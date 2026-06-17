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
