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
