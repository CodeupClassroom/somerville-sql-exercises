USE albums_db;

SELECT AVG(release_date)
FROM albums;

SELECT name, release_date
FROM albums
WHERE release_date > (SELECT AVG(release_date)
FROM albums);

-- if statement
USE employees;
-- SELECT column, IF(condition, true option, false option) AS alias_column_name
-- FROM table_name;

-- SELECT dept_name, IF(dept_name = 'Research', 1, 0) AS is_research
-- SELECT dept_name, IF(dept_name = 'Research', 'THIS IS RESEARCH', 0) AS is_research 
SELECT dept_name, IF(dept_name = 'Research', TRUE, FALSE) AS is_research
FROM employees.departments;

-- Case statement syntax
-- SELECT CASE column_a
--         WHEN condition_a THEN value_1
--         WHEN condition_b THEN value_2
--         ELSE value_3
--     END AS new_column_name
-- FROM table_a;

 
USE employees;

SELECT
    dept_name,
    CASE dept_name
        WHEN 'research' THEN 'Development'
        WHEN 'marketing' THEN 'Sales'
        ELSE FALSE
    END AS dept_group
FROM departments;

-- Case statemtents do not work well with wildcards
SELECT first_name,
	CASE first_name
		WHEN 'Aruna' THEN TRUE
        WHEN 'Parto' THEN 'name is Parto'
        WHEN 'Berni' THEN 5
	ELSE FALSE
	END AS practice_case
FROM employees;

SELECT * , 
IF(salary > (SELECT AVG(salary)FROM salaries)
,'high earner', 'low earner') AS company_class_system,
IF(from_date < 1970, 'old', 'not old') AS practice_second_column
FROM salaries;

SELECT AVG(salary)
FROM salaries;

SELECT dept_name,
    IF(dept_name = 'Research', 'true VALUE', 55555) AS is_research
FROM departments;

SELECT
    dept_name,
-- IF(dept_name = 'Research', true, false) AS is_research
    dept_name = 'Research' AS is_research
FROM departments;

SELECT
    dept_name,
    CASE dept_name
        WHEN 'Research' THEN 1
        ELSE 0
    END AS is_research
FROM departments;

SELECT
    dept_name,
    CASE dept_name
        WHEN 'Customer Service' THEN 1
        WHEN 'Development' THEN 2
        WHEN 'Finance' THEN 3
        ELSE 0
    END AS is_research
FROM departments;

SELECT dept_name,
    CASE 
        WHEN dept_name = 'Marketing' OR dept_name = 'Sales' THEN 'Money Makers'
        -- WHEN 'Sales' THEN 'Money Makers'
        WHEN dept_name LIKE '%research%' OR dept_name LIKE '%resources%' THEN 'People People'
        ELSE 'Others'
    END AS department_categories
FROM departments;


SELECT dept_name,
    CASE 
        WHEN dept_name IN ('Marketing', 'Sales') THEN 'Money Makers'
        WHEN dept_name LIKE '%research%' OR dept_name LIKE '%resources%' THEN 'People People'
        ELSE 'Others'
    END AS department_categories
FROM departments;

SELECT
    dept_name,
    COUNT(CASE WHEN title = 'Senior Engineer' THEN title ELSE NULL END) AS 'Senior Engineer',
    COUNT(CASE WHEN title = 'Staff' THEN title ELSE NULL END) AS 'Staff',
    COUNT(CASE WHEN title = 'Engineer' THEN title ELSE NULL END) AS 'Engineer',
    COUNT(CASE WHEN title = 'Senior Staff' THEN title ELSE NULL END) AS 'Senior Staff',
    COUNT(CASE WHEN title = 'Assistant Engineer' THEN title ELSE NULL END) AS 'Assistant Engineer',
    COUNT(CASE WHEN title = 'Technique Leader' THEN title ELSE NULL END) AS 'Technique Leader',
    COUNT(CASE WHEN title = 'Manager' THEN title ELSE NULL END) AS 'Manager'
FROM departments
JOIN dept_emp
    ON departments.dept_no = dept_emp.dept_no AND dept_emp.to_date > CURDATE() AND departments.dept_no = 'd001'
JOIN titles
    ON dept_emp.emp_no = titles.emp_no AND titles.to_date > CURDATE()
GROUP BY dept_name
ORDER BY dept_name;






        


