#Use the join_example_db. Select all the records from both the users and roles tables.
USE join_example_db;

SELECT *
FROM users;

SELECT *
FROM roles;

#Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
SELECT *
FROM users
INNER JOIN roles ON users.role_id = roles.id;

SELECT *
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT *
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

#Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.
SELECT roles.name, COUNT(*)
FROM roles
INNER JOIN users ON users.role_id = roles.id
GROUP BY roles.name;

#Use the employees database.
USE employees;

SHOW TABLES;

SELECT *
FROM dept_emp
LIMIT 5;

#Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no
INNER JOIN dept_manager AS dm ON de.emp_no = dm.emp_no
WHERE dm.to_date > CURDATE()
ORDER BY d.dept_name ASC;

#Find the name of all departments currently managed by women.
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no
INNER JOIN dept_manager AS dm ON de.emp_no = dm.emp_no
WHERE dm.to_date > CURDATE()
AND e.gender = 'F'
ORDER BY d.dept_name ASC;

#Find the current titles of employees currently working in the Customer Service department.
SELECT t.title, COUNT(*) as Count
FROM employees AS e
INNER JOIN dept_emp AS de ON de.emp_no = e.emp_no
INNER JOIN departments AS d ON d.dept_no = de.dept_no
INNER JOIN titles AS t ON e.emp_no = t.emp_no
WHERE t.to_date > CURDATE()
AND de.to_date > CURDATE()
AND d.dept_name = 'Customer Service'
GROUP BY t.title
ORDER BY t.title ASC;

#Find the current salary of all current managers.
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager',
s.salary AS Salary
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no
INNER JOIN dept_manager AS dm ON de.emp_no = dm.emp_no
INNER JOIN salaries AS s ON s.emp_no = dm.emp_no
WHERE dm.to_date > CURDATE()
AND s.to_date > CURDATE()
ORDER BY d.dept_name ASC;

#Find the number of current employees in each department.
SELECT d.dept_no, d.dept_name, COUNT(*) AS num_employees
FROM employees AS e
INNER JOIN dept_emp AS de ON de.emp_no = e.emp_no
INNER JOIN departments AS d ON d.dept_no = de.dept_no
WHERE de.to_date > CURDATE()
GROUP BY d.dept_name
ORDER BY d.dept_no ASC;


#Which department has the highest average salary? Hint: Use current not historic information.
SELECT d.dept_name, ROUND(AVG(s.salary)) AS average_salary
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON d.dept_no = de.dept_no
INNER JOIN salaries AS s ON s.emp_no = e.emp_no
WHERE de.to_date > CURDATE()
AND s.to_date > CURDATE()
GROUP BY d.dept_name
ORDER BY average_salary DESC
LIMIT 1;

#Who is the highest paid employee in the Marketing department?
SELECT e.first_name, e.last_name
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON d.dept_no = de.dept_no
INNER JOIN salaries AS s ON s.emp_no = e.emp_no
WHERE de.to_date > CURDATE()
AND s.to_date > CURDATE()
AND d.dept_name = 'Marketing'
ORDER BY s.salary DESC
LIMIT 1;

#Which current department manager has the highest salary?
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager',
s.salary AS Salary
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no
INNER JOIN dept_manager AS dm ON de.emp_no = dm.emp_no
INNER JOIN salaries AS s ON s.emp_no = dm.emp_no
WHERE dm.to_date > CURDATE()
AND s.to_date > CURDATE()
ORDER BY Salary DESC
LIMIT 1;

#Determine the average salary for each department. Use all salary information and round your results.
SELECT d.dept_name, ROUND(AVG(s.salary)) AS average_salary
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON d.dept_no = de.dept_no
INNER JOIN salaries AS s ON s.emp_no = e.emp_no
GROUP BY d.dept_name
ORDER BY average_salary DESC;
