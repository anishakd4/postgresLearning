CREATE TABLE accounts (
	id SERIAL PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	balance INTEGER NOT NULL
);

INSERT INTO accounts (name, balance)
VALUES
	('Gia', 100),
	('Alyson', 100);


SELECT * FROM accounts;


BEGIN;

UPDATE accounts 
SET balance = balance - 50 
WHERE name = 'Alyson';

UPDATE accounts 
SET balance = balance + 50 
WHERE name = 'Gia';

SELECT * FROM accounts;

COMMIT;

SELECT * FROM accounts;


UPDATE accounts 
SET balance = 100
WHERE name = 'Alyson';

UPDATE accounts 
SET balance = 100
WHERE name = 'Gia';

-- this is just going to take a look at all the different rows inside of accounts and set the balance of every one of them to $100.
UPDATE accounts SET balance = 100;