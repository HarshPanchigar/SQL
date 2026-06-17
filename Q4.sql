-- Question 1

-- Show:

-- Employee Name
-- Salary
-- Department Name

-- using JOIN.

use collage;
SELECT e.emp_name , e.salary , d.dept_name
FROM employees as e 
INNER JOIN departments as d
ON e.dept_id = d.dept_id;
