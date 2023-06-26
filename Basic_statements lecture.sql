-- choose a database and list the tables in that database:
-- database "chipotle" contains the table "orders" 
SHOW DATABASES;
USE chipotle;
DESCRIBE orders;
SHOW CREATE TABLE orders;

SELECT 'this is a string';
SELECT 'this is nikki\'s string ';
SELECT 'this is "nick\'s string" ';

-- this line is going to be commented out
# this is the same thing > this line is going to be commented out

/*
if i 
need to comment out
multiple lines
i can use this
*/

SELECT DISTINCT item_name FROM orders;

SELECT DISTINCT item_name AS Food FROM orders;

SELECT * FROM orders;

SELECT * FROM orders WHERE quantity >= 2 AND item_name = 'Canned Soda';

SELECT * FROM orders WHERE quantity >= 2 AND item_name = 'Canned Soda' AND order_id BETWEEN 75 AND 1000;