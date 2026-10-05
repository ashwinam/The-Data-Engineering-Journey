-- INSERT 2 CUSTOMERS

INSERT INTO customers (id, first_name, country, score)
VALUES 
	(6, 'lena', 'Germany', NULL),
    (7, 'samsher', 'USA', 400);
    
-- INSERT DATA USING SELECT
-- COPY DATA FROM 'CUSTOMERS' TABLE INTO 'PERSONS'

CREATE TABLE persons (
		id INT NOT NULL,
        person_name VARCHAR(50) NOT NULL,
        birth_date DATE,
        phone VARCHAR(15) NOT NULL
);

INSERT INTO persons (id, person_name, birth_date, phone)
SELECT 
	id,
    first_name, 
    NULL,
    'Unknown'
FROM customers;

-- CHANGE THE SCORE OF CUSTOMER OF ID 6 TO 0

UPDATE customers
SET score = 0
WHERE id=6;

-- UPDATE THE SCORE OF THE CUSTOMER WITH ID 7 TO 0 AND UPDATE THE COUNTRY TO UK

UPDATE customers
SET 
	score = 0,
    country = 'UK'
WHERE id=7;

-- DELETE ALL CUSTOMERS WITH AN ID GREATER THAN 5

DELETE FROM customers
WHERE id > 5;

-- DELETE ALL DATA FROM PERSONS TABLE

DELETE FROM persons;
