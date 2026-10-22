/********************************************************
Date: 2026-10-13
Name: Suna Aregay, Faith Coufal
Chapter 5 Assignment
Github URL: https://github.com/suna2km/MySQL_Chapter5
*********************************************************/
/********************************************************************
Suna
Exercise 1
Part 1.1: Write a query that determines how many records are in the customer table, and document
Part 1.2) Write a statement that creates a complete backup table for the customer table
Part 1.3) Write a query that verifies your newly created backup table has the same number of rows as the
original table
Part 1.4) Use the MySQL CHECKSUM to verify the two tables are the same
*****************************************************************************************/
-- Part 1.1
SELECT COUNT(*) FROM customer;

-- Part 1.2
CREATE TABLE customer_full_backup AS 
SELECT *
FROM customer;

-- Part 1.3
SELECT * FROM customer_full_backup;

-- Part 1.4 
CHECKSUM TABLE customer, customer_full_backup;
/********************************************************************
Faith
Exercise 2: Partial Table Backup
• Part 2.1) Write three queries to determine the following:
o 2.1.A How many records are in the rental table, and document
o 2.1.B How many rentals have been returned (based on return_date) and document
o 2.1.C How many rentals have NOT been returned (based on return_date), and document
• Part 2.2) Write statements to create a partial backup of the rental table
for all rentals that have been returned. Name your backup table returned_rental
*****************************************************************************************/
-- Part 2.1A
SELECT * FROM rental;

-- Part 2.1B
SELECT * FROM rental
WHERE return_date IS NOT NULL;

-- Part 2.1C
SELECT * FROM rental
WHERE return_date IS NULL;

-- Part 2.2
CREATE TABLE returned_rental AS
SELECT *
FROM rental
WHERE return_date IS NOT NULL;
/********************************************************************
Suna
Exercise 3: Drop Tables
• Write one or two statements that will drop the backup tables from Exercise 1 and 2
Verify both backup tables have been deleted by refreshing your schemas window
*****************************************************************************************/
DROP TABLE customer_full_backup, returned_rental;
/********************************************************************
Suna
Exercise 4: Insert statement WITHOUT a column list
• Part 4.1: Write multiple statements to setup yourself as a new customer with a new city and address
o use DEFAULT for auto increment columns
o use NULL for columns that allow null values
o use DEFAULT for columns with default values

*****************************************************************************************/
INSERT INTO city VALUES 
(DEFAULT, 'LA', 103, '2006-02-15' );

SELECT * FROM city
WHERE city_id = 601;

INSERT INTO address VALUES 
(DEFAULT, '1111 Main St.', NULL, 'Wayne', 601, NULL, 43526175846, '2006-02-15' );

SELECT * FROM address
WHERE city_id = 601;

INSERT INTO customer VALUES 
(DEFAULT, 1, 'JOHN', 'SMITH', DEFAULT, 608, DEFAULT, '2006-02-15', DEFAULT );

/********************************************************************
Faith
Exercise 5: Insert statement using a column list
• Part 5.1: Write a statement to setup insert another new customer with the same address id 606
o Also use the same last name as the previous insert statement
o OMIT all columns that are auto increment, defaults, and nullable columns
• Part 5.2: Write a query to prove the new customer was created by filtering on address id 606
This should have created customer id = 601

*****************************************************************************************/

INSERT INTO customer (store_id, first_name, last_name, address_id, create_date) VALUES 
(1, 'MARY', 'SMITH', 608, '2006-02-15');

SELECT * FROM customer
WHERE address_id = 608;

SELECT * FROM customer
WHERE address_id = 608;

/********************************************************************
Faith
Exercise 6: Update multiple columns for a single record
Note: use book_scripts/ch05/5-05 examples as a starting point
Write the following update statements:
• Part 6.1 - update your first new customer record by changing it's store id = 2 and email address
use the customer id (600) to update only one record
• Part 6.2 - update your second new customer record by changing it's store id = 2 and email address
use the customer id (601) to update only one record
• Part 6.3 - write a query to verify the two records have been correctly update
use the address id (606) to retrieve both records

*****************************************************************************************/

UPDATE customer
SET store_id = 2, 
    email = 'JeanClaudeIDoNotNameTheGoons'
WHERE customer_id = 608;

UPDATE customer
SET store_id = 2, 
    email = 'MrStacioandMrPis'
WHERE customer_id = 609;

SELECT * FROM customer
WHERE address_id = 608;

/********************************************************************
Suna
Exercise 7: Update multiple records (rows)
• Part 7.1: Write one update statement that will update both new customer records
changing their address id from 606 to 605. This will require you filtering by the address id = 606.
• Part 7.2: Write a query to verify that both records have been correctly updated by filtering by address id (605)

*****************************************************************************************/
UPDATE customer
SET address_id = 605
WHERE address_id = 608;

SELECT * FROM customer
WHERE address_id = 605;
