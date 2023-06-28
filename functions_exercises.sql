-- 1. Copy the order by exercise and save it as functions_exercises.sql.
USE employees;
-- 2. Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';

-- 3. Convert the names produced in your last query to all uppercase.
SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';

-- 4. Use a function to determine how many results were returned from your previous query.
SELECT COUNT(UPPER(CONCAT(first_name, ' ', last_name))) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';

SELECT COUNT(*) AS result_count
FROM employees
WHERE last_name LIKE 'e%e';

-- 5. Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),
SELECT * , DATEDIFF(CURDATE(), hire_date) AS days_worked
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25';

-- 6. Find the smallest and largest current salary from the salaries table.
SELECT MIN(salary), MAX(salary)
FROM salaries;

-- 7. Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:

-- +------------+------------+-----------+------------+
-- | username   | first_name | last_name | birth_date |
-- +------------+------------+-----------+------------+
-- | gface_0953 | Georgi     | Facello   | 1953-09-02 |
-- | bsimm_0664 | Bezalel    | Simmel    | 1964-06-02 |
-- | pbamf_1259 | Parto      | Bamford   | 1959-12-03 |
-- | ckobl_0554 | Chirstian  | Koblick   | 1954-05-01 |
-- | kmali_0155 | Kyoichi    | Maliniak  | 1955-01-21 |
-- | apreu_0453 | Anneke     | Preusig   | 1953-04-20 |
-- | tziel_0557 | Tzvetan    | Zielinski | 1957-05-23 |
-- | skall_0258 | Saniya     | Kalloufi  | 1958-02-19 |
-- | speac_0452 | Sumant     | Peac      | 1952-04-19 |
-- | dpive_0663 | Duangkaew  | Piveteau  | 1963-06-01 |
-- +------------+------------+-----------+------------+
-- 10 rows in set (0.05 sec)

SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS user_name
FROM employees
LIMIT 10;

SELECT CONCAT(
LOWER(SUBSTR(first_name, 1, 1)), 
LOWER(SUBSTR(last_name, 1, 4)), '_', 
SUBSTR(REPLACE(birth_date, SUBSTR(birth_date, 1, 5), ''), 1, 2), 
--                   yyyy-mm-dd        (yyyy-)
SUBSTR(birth_date, 3, 2)) AS user_name
FROM employees
LIMIT 10;
