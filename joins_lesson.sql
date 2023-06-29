#Show all databases
SHOW DATABASES;

#Select the database for the joins lesson
USE join_example_db;

#List all tables
SHOW TABLES;

#Check out what's in the roles table
SELECT *
FROM roles;

#Check out what's in the users table
SELECT *
FROM users;

#Inner join
SELECT *
FROM users
INNER JOIN roles ON users.role_id = roles.id;

SELECT users.name, email, roles.name AS role_name
FROM roles
INNER JOIN users ON users.role_id = roles.id;

#Left join
SELECT *
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT *
FROM roles
LEFT JOIN users ON users.role_ID = roles.id;

#Right join
SELECT *
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

#Associative tables using employees database
USE employees;

#Show the tables
SHOW TABLES;

#Our goal is to join employees to departments
SELECT *
FROM employees
LIMIT 5;

SELECT *
FROM departments
LIMIT 5;

SELECT *
FROM dept_emp
LIMIT 5;

#Using the associative table to complete the join!
SELECT *
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no;

#We can alias tables to shorten text!
SELECT *
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no;

#Order matters!
SELECT *
FROM employees AS e
INNER JOIN departments AS d ON de.dept_no = d.dept_no
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no;