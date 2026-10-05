DESCRIBE persons;

-- 1. Create new table called persons with columns: id, person_name, birth_date and phone

CREATE TABLE persons (
	id INT NOT NULL,
    person_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    phone VARCHAR(15) NOT NULL,
    CONSTRAINT pk_persons PRIMARY KEY (id) 
);

-- 2. Add new column called email to ther persons table

ALTER TABLE persons
ADD COLUMN email VARCHAR(50) NOT NULL;

-- 3. Remove column phone from persons table

ALTER TABLE persons
DROP COLUMN phone;

-- 4. Deleting an Table

DROP TABLE persons;