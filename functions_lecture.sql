SELECT REPLACE('aaaabbb', 'aa', 'c');
USE employees;

SELECT birth_date
FROM employees
ORDER BY birth_date ASC
LIMIT 2 OFFSET 2;

SELECT MIN(birth_date) AS 'Lowest Employee Number'
FROM employees;

SELECT MIN(emp_no+1) AS 'Lowest Employee Number'
FROM employees;

SELECT CONCAT('Hello ', 'Codeup', '!');

SELECT CONCAT(first_name, ' ', last_name) 
FROM employees;

SELECT SUBSTR('abcdefg', 2, 4);

SELECT SUBSTR(first_name, 2,4) 
FROM employees;

SELECT SUBSTR(first_name, -5) 
FROM employees;

SELECT UPPER('abcde'), LOWER('ABCDE');

SELECT UPPER(first_name) 
FROM employees;

SELECT REPLACE('abcdefg', 'abc', '123');


SELECT first_name
FROM employees;

SELECT REPLACE(first_name, 'e', 'EEEE')
FROM employees;

SELECT REPLACE(first_name, 'a', 'AAAAAH')
FROM employees;

SELECT NOW();
SELECT CURDATE();
-- the following adjusts time for DALLAS from GMT
SELECT CONVERT_TZ(NOW(),'+00:00','-5:00');

SELECT 1 + '4', '3' - 1, CONCAT('Here is a number: ', 123);

SELECT CAST(123 as CHAR), CAST('123' as UNSIGNED);

SELECT CAST(11102824 as CHAR);

SELECT 'ein' + 11102824;

SELECT CONCAT('ein', 11102824);




