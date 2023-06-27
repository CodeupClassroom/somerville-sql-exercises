SHOW employees;

USE employees;
SELECT *
FROM employees;

SELECT * 
FROM employees
ORDER BY birth_date ASC;

SELECT * 
FROM employees
ORDER BY birth_date DESC;

SELECT * 
FROM employees
ORDER BY first_name ASC
LIMIT 5 OFFSET 3;


SELECT * 
FROM employees
ORDER BY last_name ASC;