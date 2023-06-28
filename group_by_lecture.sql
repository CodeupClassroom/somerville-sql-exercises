USE employees;

-- Grouping results based on data in columns allows us to remove duplicates, much like using DISTINCT. We can also use GROUP BY in combination with aggregate functions.
-- GROUP BY specifies a column or columns to group by and returns the unique/distinct occurances of the specified column.
-- GROUP BY works similar to DISTINCT
SELECT DISTINCT first_name
FROM employees;

-- same as: 
SELECT first_name
FROM employees
GROUP BY first_name;

-- You can specify ASC or DESC for our output by adding an ORDER BY to your clause after the GROUP BY.
SELECT first_name
FROM employees
GROUP BY first_name
ORDER BY first_name ASC;

-- With multiple columns:
SELECT first_name, last_name
FROM employees
GROUP BY first_name, last_name;


-- aggregate functions include COUNT, MIN, MAX, AVG, and SUM.
-- The COUNT() function will return the number of non-null values
-- You will also commonly see this function used as COUNT(*) which returns the total number of rows in a dataset whether a row contains NULL values or not.
SELECT first_name, last_name, COUNT(*)
FROM employees
GROUP BY first_name, last_name;

-- If we are only concerned about the values in a given column, we can pass that column name to the COUNT() function:
SELECt COUNT(first_name)
FROM employees;

-- Combining GROUP BY with aggregate functions 
-- Show each unique first name without an 'a' and the number of employees with that first name
SELECT COUNT(first_name), first_name
FROM employees
GROUP BY first_name
HAVING first_name NOT LIKE '%a%';

SELECT COUNT(first_name), first_name
FROM employees
WHERE first_name NOT LIKE '%a%'
GROUP BY first_name;

-- Show the 10 most common hire dates for employees.
SELECT COUNT(hire_date), hire_date
FROM employees
GROUP BY hire_date
ORDER BY COUNT(hire_date) DESC
LIMIT 10;

SELECT SUM(emp_no), AVG(emp_no), first_name, COUNT(first_name)
FROM employees 
GROUP BY first_name;

SELECT SUM(salary), AVG(salary), from_date, COUNT(from_date)
from salaries
GROUP BY from_date
ORDER BY AVG(salary) DESC;

-- WHERE does not work with aggregate values,so the appropriate tool for adding a conditional to a group by is to use HAVING.
