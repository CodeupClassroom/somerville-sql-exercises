-- Create a file named temporary_tables.sql to do your work for this exercise.
USE employees;
SET SQL_SAFE_UPDATES=0;
-- 1. Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read.
CREATE TEMPORARY TABLE nikki_meyer.employees_with_departments AS (
SELECT first_name, last_name, dept_name
FROM employees.employees
JOIN employees.dept_emp USINg (emp_no)
JOIN employees.departments USING (dept_no)
);
SELECT * FROM nikki_meyer.employees_with_departments;
-- a. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns.
ALTER TABLE nikki_meyer.employees_with_departments ADD full_name VARCHAR(31);
-- b. Update the table so that the full_name column contains the correct data.
UPDATE nikki_meyer.employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name);
-- c. Remove the first_name and last_name columns from the table.
ALTER TABLE nikki_meyer.employees_with_departments DROP COLUMN first_name, DROP COLUMN last_name;
-- d. What is another way you could have ended up with this same table?
CREATE TEMPORARY TABLE nikki_meyer.employees_with_departments AS (
SELECT CONCAT(first_name,' ', last_name) AS full_name, dept_name
FROM employees.employees
JOIN employees.dept_emp USING (emp_no)
JOIN employees.departments USING (dept_no)
);


-- 2. Create a temporary table based on the payment table from the sakila database.
USE sakila;
CREATE TEMPORARY TABLE nikki_meyer.payment AS 
(SELECT 
    CAST(amount AS CHAR (20)) AS amount,
    payment_id,
    customer_id,
    staff_id,
    rental_id,
    payment_date,
    last_update
FROM
    sakila.payment);
SELECT * FROM nikki_meyer.payment;
-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
UPDATE nikki_meyer.payment 
SET amount = REPLACE(amount, '.', '');
ALTER TABLE nikki_meyer.payment MODIFY COLUMN amount INT;

SELECT * FROM nikki_meyer.payment;
-- 3. Go back to the employees database. Find out how the current average pay in each department compares to the overall current pay for everyone at the company. For this comparison, you will calculate the z-score for each salary. In terms of salary, what is the best department right now to work for? The worst?
    -- Returns the current z-scores for each salary
    -- Notice that there are 2 separate scalar subqueries involved
    USE employees;
    SELECT salary,
        (salary - (SELECT AVG(salary) FROM salaries where to_date > now()))
        /
        (SELECT stddev(salary) FROM salaries where to_date > now()) AS zscore
    FROM salaries
    WHERE to_date > now();
	-- Company table
    CREATE TEMPORARY TABLE nikki_meyer.zscore_salaries AS (
    SELECT AVG(salary) AS average_salary, STDDEV(salary) AS std_salary
    FROM employees.salaries
    WHERE to_date > CURDATE()
    );
    
    SELECT * FROM nikki_meyer.zscore_salaries;
    -- departments table
    CREATE TEMPORARY TABLE nikki_meyer.zscore_dept_salaries AS (
    SELECT dept_name, AVG(salary) as avg_dept_salary
    FROM employees.salaries
    JOIN employees.dept_emp USING (emp_no)
    JOIN employees.departments USING (dept_no)
    WHERE employees.salaries.to_date > CURDATE() AND employees.dept_emp.to_date > CURDATE()
    GROUP BY dept_name
    );
    
SELECT * FROM nikki_meyer.zscore_dept_salaries;
 -- added columns for calculations
ALTER TABLE nikki_meyer.zscore_dept_salaries ADD overall_avg FLOAT(10, 2);
ALTER TABLE nikki_meyer.zscore_dept_salaries ADD overall_stddev FLOAT(10, 2);
ALTER TABLE nikki_meyer.zscore_dept_salaries ADD dept_zscore FLOAT(10, 2);

-- bring in values from company table
UPDATE nikki_meyer.zscore_dept_salaries SET overall_avg = (SELECT average_salary FROM nikki_meyer.zscore_salaries);
UPDATE nikki_meyer.zscore_dept_salaries SET overall_stddev = (SELECT std_salary FROM nikki_meyer.zscore_salaries);
 -- calculate  score for each department
UPDATE nikki_meyer.zscore_dept_salaries SET dept_zscore = (avg_dept_salary - overall_avg)/overall_stddev;
