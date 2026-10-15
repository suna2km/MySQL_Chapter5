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
