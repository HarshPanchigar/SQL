CREATE TABLE customers (
    cust_id SERIAL PRIMARY KEY,
    cust_name VARCHAR(100) NOT NULL
);

INSERT INTO customers (cust_name)
VALUES
    ('Raju'), ('Sham'), ('Paul'), ('Alex');

CREATE TABLE orders (
    ord_id SERIAL PRIMARY KEY,
    ord_date DATE NOT NULL,
    cust_id INTEGER NOT NULL,
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
);

INSERT INTO orders (ord_date, cust_id)
VALUES
    ('2024-01-01', 1),  -- Raju first order
    ('2024-02-01', 2),  -- Sham first order
    ('2024-03-01', 3),  -- Paul first order
    ('2024-04-04', 2);  -- Sham second order

CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    ord_id INTEGER NOT NULL,
    p_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (ord_id) REFERENCES orders(ord_id),
    FOREIGN KEY (p_id) REFERENCES products(p_id)
);

INSERT INTO order_items (ord_id, p_id, quantity)
VALUES
    (1, 1, 1),  -- Raju ordered 1 Laptop
    (1, 4, 2),  -- Raju ordered 2 Cables
    (2, 1, 1),  -- Sham ordered 1 Laptop
    (3, 2, 1),  -- Paul ordered 1 Mouse
    (3, 4, 5),  -- Paul ordered 5 Cables
    (4, 3, 1);  -- Sham ordered 1 Keyboard

CREATE TABLE products (
    p_id SERIAL PRIMARY KEY,
    p_name VARCHAR(100) NOT NULL,
    price NUMERIC NOT NULL
);

INSERT INTO products (p_name, price)
VALUES
    ('Laptop', 55000.00),
    ('Mouse', 500),
    ('Keyboard', 800.00),
    ('Cable', 250.00)
;


select 
    c.cust_name,
    o.ord_date,
    p.p_name,
    p.price,
    oi.quantity,
    (oi.quantity * p.price) as total_price
from order_items oi
JOIN products p
ON oi.p_id = p.p_id
JOIN orders o
ON o.ord_id = oi.ord_id
JOIN customers c 
ON o.cust_id = c.cust_id;

CREATE VIEW billing_info as 
select 
    c.cust_name,
    o.ord_date,
    p.p_name,
    p.price,
    oi.quantity,
    (oi.quantity * p.price) as total_price
from order_items oi
JOIN products p
ON oi.p_id = p.p_id
JOIN orders o
ON o.ord_id = oi.ord_id
JOIN customers c 
ON o.cust_id = c.cust_id;

select p_name,sum(total_price)
from billing_info 
GROUP BY p_name
HAVING sum(total_price) > 1500;

create or REPLACE PROCEDURE add_employee(
    p_emp_id INT,
    p_fname VARCHAR,
    p_lname VARCHAR,
    p_email VARCHAR,
    p_dept VARCHAR,
    p_salary NUMERIC
)
LANGUAGE plpgsql
as $$
BEGIN
INSERT INTO employees(emp_id,fname,lname,email,dept,salary)
VALUES (p_emp_id,p_fname,p_lname,p_email,p_dept,p_salary);
end;
$$;

select e.fname,e.lname,e.salary 
from employees e
where 
e.dept = 'HR' 
and 
e.salary = (
    select max(emp.salary)
    from employees emp
    where emp.dept = 'HR');

-- -----------------------------------------------------------
-- FUNCTION

CREATE OR REPLACE FUNCTION dept_max_sal_emp(
    dept_name VARCHAR
)
RETURNS TABLE (
    emp_id INT,
    fname VARCHAR,
    lname VARCHAR,
    salary NUMERIC
)
AS $$
BEGIN
    RETURN QUERY
    SELECT
        e.emp_id,
        e.fname,
        e.lname,
        e.salary
    FROM employees AS e
    WHERE e.dept = dept_max_sal_emp.dept_name
      AND e.salary = (
            SELECT MAX(emp.salary)
            FROM employees emp
            WHERE emp.dept = dept_max_sal_emp.dept_name
      );
END;
$$ LANGUAGE plpgsql;

select * from dept_max_sal_emp('IT');

select fname,salary,sum(salary) over(order by salary) from employees;
select row_number() over(partition by dept),fname,dept,salary from employees;
select fname ,salary , rank() over(order by salary desc) from employees;
select fname ,salary , dense_rank() over(order by salary desc) from employees;
select fname ,salary , lag(salary) over() from employees;
select fname ,salary , lead(salary) over() from employees;

with avg_sal as (select dept , avg(salary) as avg_salary from employees group by dept)
select  e.emp_id,e.fname ,e.dept , e.salary , a.avg_salary::int from employees e join avg_sal a on e.dept = a.dept where  e.salary > a.avg_salary;

with max_sal as (select dept , max(salary) as max_salary from employees group by dept)
select e.emp_id,e.fname ,e.dept , e.salary from employees e 
join max_sal m on e.dept = m.dept where  e.salary = m.max_salary;

