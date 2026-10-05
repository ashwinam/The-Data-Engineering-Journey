-- 1. Add records to the customers table in a manual way

INSERT INTO customers (id, first_name, country, score)
VALUES 
	(6, "Ashwin", 'India', 400),
    (7, "Rohan", "India", 700);
    
-- 2. Copy data from 'customers' table into persons table

-- CREATE THE TABLE

CREATE TABLE persons (
id INT NOT NULL,
full_name VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL,
score INT NOT NULL
);

-- INSERT THE DATA FROM CUSTOMERS TO PERSON

INSERT INTO persons (id, full_name, country, score)
SELECT 
	id,
    first_name,
    country,
    score
FROM customers;

-- Check the data

SELECT *
FROM persons;

-- 3. Change the score of customer with id 6 to 0 and update country to UK

UPDATE persons
SET 
	score = 0,
	country = 'UK'
WHERE id = 6;

-- 4. Delete all customers whose id is greater than 5

DELETE FROM persons
WHERE id > 5;

-- 5. TRUNCATE Table Persons

TRUNCATE TABLE persons;