-- Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.
-- Create a file named where_advanced_exercises.sql. Use the employees database.
USE employees;
-- 1. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. What is the employee number of the top three results?
SELECT emp_no, first_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');
-- 10200, 10397, 10610

-- 2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. What is the employee number of the top three results? Does it match the previous question?
SELECT *
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
-- 10200, 10397, 10610

-- 3. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. What is the employee number of the top three results.
SELECT *
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya')
AND gender = 'M';
-- 10200, 10397, 10821

-- 4. Find all unique last names that start with 'E'.
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE 'e%';

-- 5. Find all unique last names that start or end with 'E'.
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%e' OR last_name LIKE 'e%';

-- 6. Find all unique last names that end with E, but does not start with E?
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%e' AND last_name NOT LIKE 'e%';

-- 7. Find all unique last names that start and end with 'E'.
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE 'e%e';

-- 8. Find all current or previous employees hired in the 90s. Enter a comment with top three employee numbers.
SELECT * 
FROM employees
WHERE hire_date LIKE '199%';
-- 10008, 10011, 10012


-- 9. Find all current or previous employees born on Christmas. Enter a comment with top three employee numbers.
SELECT *
FROM employees
WHERE birth_date LIKE '%12-25';
-- 10078, 10115, 10261

-- 10. Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with top three employee numbers.
SELECT * 
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25';
-- 10261, 10438, 10681

-- 11. Find all unique last names that have a 'q' in their last name.
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%q%';

-- 12. Find all unique last names that have a 'q' in their last name but not 'qu'.
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';

-- 1. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT emp_no, first_name, Last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;
-- Irena Reutenauer, Vidya Simmen

-- 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name ASC, last_name ASC;
 -- Irena Acton, Vidya Zweizig

-- 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name ASC, first_name ASC;
 -- Irena Acton, Maya Zyda

-- 4. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
SELECT * 
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY emp_no ASC;
-- 899 employees, 10021 Ramzi Erde, 499648 Tadahiro Erde

-- 5. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.
SELECT *
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY hire_date DESC;
-- 8999 employees, Teiji Eldrige, Sergi Erde

-- 6. Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.
SELECT * 
FROM employees
WHERE birth_date LIKE '%12-25'
AND hire_date LIKE '199%'
ORDER BY birth_date ASC, hire_date DESC;
 -- 362 employees, Khun Bernini, Douadi Pettis
 