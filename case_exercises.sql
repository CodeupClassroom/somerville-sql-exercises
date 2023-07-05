-- Create a file named case_exercises.sql and craft queries to return the results for the following criteria:
USE employees;
-- Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not. DO NOT WORRY ABOUT DUPLICATE EMPLOYEES.
SELECT CONCAT(first_name, ' ', last_name) AS employee_name, dept_no, from_date, to_date, 
IF(to_date > CURDATE(), TRUE, FALSE) AS is_current_employee
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no;

-- Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
SELECT last_name,
CASE
	WHEN left(last_name, 1) <= 'H' THEN 'A-H'
    WHEN left(last_name, 1) <= 'Q' THEN 'I-Q'
    ELSE 'R-Z'
END AS alpha_group
FROM employees;


-- How many employees (current or previous) were born in each decade?
SELECT 
	CASE
		WHEN substr(birth_date, 1, 4) BETWEEN 1950 AND 1959 THEN '1950s'
       --  WHEN substr(birth_date, 1, 4) BETWEEN 1960 AND 1969 THEN '1960s'
       ELSE '1960s'
        END AS 'birth_decade', 
	COUNT(emp_no)
	FROM employees
	GROUP BY birth_decade;
    
SELECT COUNT(*),
CASE
	WHEN birth_Date LIKE '199%' THEN '90s'
    WHEN birth_Date LIKE '198%' THEN '80s'
    WHEN birth_Date LIKE '197%' THEN '70s'
    WHEN birth_Date LIKE '196%' THEN '60s'
    WHEN birth_Date LIKE '195%' THEN '50s'
    ELSE 'OUT OF RANGE OLD TIMER'
END AS 'birth_decade'
FROM employees
GROUP BY birth_decade;
    

-- What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
SELECT AVG(salary), 
CASE
       WHEN dept_name IN ('research', 'development') THEN 'R&D'
       WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing'
       WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
       WHEN dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
       ELSE 'Customer Service'
   END AS dept_group
FROM dept_emp
LEFT JOIN salaries ON dept_emp.emp_no = salaries.emp_no AND salaries.to_date > CURDATE()
LEFT JOIN departments ON dept_emp.dept_no = departments.dept_no
GROUP BY dept_group;

-- Bonus
SELECT DISTINCT(employees.emp_no), CONCAT(first_name,' ',last_name), dept_no, from_date, to_date, 
IF(to_date > CURDATE(), TRUE, FALSE) AS is_current_employee
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no;

