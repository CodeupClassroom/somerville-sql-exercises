-- Exercises
-- 1. Open MySQL Workbench and login to the database server
-- 2. Save your work in a file named db_tables_exercises.sql
-- 3. List all the databases
SHOW DATABASES;

-- 4. Write the SQL code necessary to use the albums_db database
USE albums_db;

-- 5. Show the currently selected database
SELECT DATABASE();

-- 6. List all tables in the database
SHOW TABLES;

-- 7. Write the SQL code to switch the employees database
USE employees;

-- 8. Show the currently selected database
SELECT DATABASE();

-- 9. List all the tables in the database
SHOW TABLES;

-- 10. Explore the employees table. What different data types are present on this table?
-- INT/number, Date/number, varchar/string, varchar/string, eum/character, date/number 

-- 11. Which table(s) do you think contain a numeric type column? (Write this question and your answer in a comment)
-- salaries, dept_emp, dept_manager, employees, titles

-- 12. Which table(s) do you think contain a string type column? (Write this question and your answer in a comment)
-- departments, dept_emp, dept_manager, employees, titles, 

-- 13. Which table(s) do you think contain a date type column? (Write this question and your answer in a comment)
-- dept_emp, dept_manager, employees, salaries, titles

-- 14. What is the relationship between the employees and the departments tables? (Write this question and your answer in a comment)
-- There is no direct repaltionship between the employees and departments tables, but they do have a relationshipship on the dept_emp table throught their emp_no and dept_no

-- 15. Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
SHOW CREATE TABLE dept_manager;

-- CREATE TABLE `dept_manager` (
--   `emp_no` int NOT NULL,
--   `dept_no` char(4) NOT NULL,
--   `from_date` date NOT NULL,
--   `to_date` date NOT NULL,
--   PRIMARY KEY (`emp_no`,`dept_no`),
--   KEY `dept_no` (`dept_no`),
--   CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
--   CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
-- );