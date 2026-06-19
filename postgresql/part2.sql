-- Active: 1781721348836@@127.0.0.1@5432@persondb
select * FROM employees;

select sum(salary) from employees WHERE dept = 'Finance';

alter TABLE person add COLUMN mob VARCHAR(15) check (length(mob) >= 10);

create table costomers(cust_id serial primary key,cust_name varchar(100) not null);
create table orders(ord_id serial primary key , ord_date date not null,
    price NUMERIC not null,cust_id INT not NULL,
    Foreign Key (cust_id) REFERENCES costomers(cust_id)
    );

INSERT INTO costomers (cust_name) VALUES ('raj'),('sham'),('paul'),('alex');

INSERT INTO orders (ord_date, cust_id, price)

VALUES 

    ('2024-01-01', 1, 250.00),  

    ('2024-01-15', 1, 300.00),  

    ('2024-02-01', 2, 150.00),

    ('2024-03-01', 3, 450.00),

    ('2024-04-04', 2, 550.00);  

select * from costomers as c inner join orders as o
on c.cust_id = o.cust_id;

select c.cust_name,count(o.ord_id) from costomers as c inner join orders as o
on c.cust_id = o.cust_id
group by c.cust_name;