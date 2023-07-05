USE nikki_meyer;
-- USE your_db_name;

SHOW TABLES;
 
 -- Creating a temp table from scratch
 CREATE TEMPORARY TABLE my_numbers(
	numbers INT UNSIGNED NOT NULL
 );
 
 SHOW TABLES;
 
 INSERT INTO nikki_meyer.my_numbers(numbers) VALUES (1), (2), (3), (4), (5);
 
 SELECT * FROM my_numbers;
 
 SHOW TABLES;
 
 SELECT DATABASE();
 
 ALTER TABLE nikki_meyer.my_numbers ADD email VARCHAR(100);
INSERT INTO nikki_meyer.my_numbers(numbers, email) VALUES (1, 'nikki.meyer@codeup.com'), (2, 'nikki.meyer@codeup.com'), (3, 'nikki.meyer@codeup.com'), (4, 'adam.krull@codeup.com'), (5, 'adam.krull@codeup.com');

SELECT * FROM my_numbers;
 UPDATE nikki_meyer.my_numbers SET numbers = numbers + 1;
 
 ALTER TABLE nikki_meyer.my_numbers DROP COLUMN numbers;
 SELECT * FROM nikki_meyer.my_numbers;
 
 -- creating a temp table from a query
 USE employees;
 
CREATE TEMPORARY TABLE nikki_meyer.employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
LIMIT 100;

SELECT DATABASE();
 -- in the 'employees' database
USE nikki_meyer;
SELECT * FROM employees_with_departments;
 SELECT * FROM my_numbers;
 
 ALTER TABLE nikki_meyer.employees_with_departments DROP COLUMN dept_no;
USE somerville_2274;

SHOW TABLES;
ALTER TABLE nikki_meyer.employees_with_departments DROP COLUMN last_name;

SELECT * FROM nikki_meyer.employees_with_departments;



