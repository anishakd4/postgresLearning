

SELECT name FROM products
WHERE price > 
(
  SELECT AVG(price) FROM products
);

SELECT name, department FROM products
WHERE department NOT IN
(
  SELECT department FROM products WHERE price < 100
);

-- > ALL will work only in case of a single column
SELECT name, department FROM products
WHERE price > ALL
(
  SELECT price FROM products WHERE department = 'Industrial'
);

-- show the name of products that are more expensive than at least one product in the industrial department.
SELECT name, department, price FROM products
WHERE price > SOME
(
  SELECT price FROM products WHERE department = 'Industrial'
);

-- correlated queries
-- The term correlated subquery essentially means that we are referring to some row from the outside query in the inner query or in the subquery.
SELECT name, department, price FROM products AS p1
WHERE p1.price = (
  SELECT MAX(price) 
  FROM products as p2 
  WHERE p1.department = p2.department
);

-- Correlated query in select
-- Without using join or group by print the number of orders for each product
SELECT p1.name, ( 
  SELECT COUNT(*) FROM orders as o1 WHERE o1.product_id = p1.id
) AS num_orders
FROM products as p1;

-- Select without a from
-- we can only do a select with just a subquery if we are getting back one single value
-- this is actually really useful if we are ever trying to calculate just one single value that is the result of several other values.
SELECT ( 
  SELECT MAX(price) FROM products
);

SELECT 
(SELECT MAX(price) FROM products)/(SELECT AVG(price) FROM products);

SELECT 
(SELECT MAX(price) FROM products) , (SELECT AVG(price) FROM products);

-- DISTINCT
-- Distinct is always going to be placed inside of a select clause, and we're going to place it right after that select keyword.
-- Distinct is going to give you a list of all the different unique values inside of a column.
SELECT DISTINCT department FROM products;

-- the number of unique departments we have inside of our products table.
SELECT COUNT(DISTINCT department) FROM products;

--  it's going to find every unique combination of department and name put together.
SELECT DISTINCT department, name FROM products;

-- If we do a distinct over two or more different columns, we can no longer do a count on it.
-- function count(character varying, character varying) does not exist
SELECT COUNT(DISTINCT department, name) FROM products;

SELECT GREATEST(20, 30, 5);

SELECT name, weight , GREATEST(30, 2 * weight) FROM products;

SELECT LEAST(8, 5, 2 , 4);

SELECT name, price, LEAST(price * 0.5, 400) FROM products;

SELECT name, price, 
  CASE
    WHEN price > 600 THEN 'high'
    WHEN price > 300 THEN 'medium'
    else 'cheap'
  END
FROM products;

-- without else null will be returned at the unmatched case
SELECT name, price, 
  CASE
    WHEN price > 600 THEN 'high'
    WHEN price > 300 THEN 'medium'
    else 'cheap'
  END
FROM products;


SELECT 2 + 2;
SELECT (2);
SELECT (2.0);
SELECT (2.0::INTEGER);
SELECT (2.0::SMALLINT);

-- if we put in 99999, that's definitely outside the range of a small int and play that we get an error like this right here.
SELECT (99999::SMALLINT);

-- in the world of Postgres, the type's real,double precision and float are treated with floating point math.If you're not familiar with floating point calculations, they are notorious for being somewhat inaccurate.
-- when you start doing subtraction or any kind of really any kind of arithmetic operation on them, the decimal values are going to sometimes be just totally inaccurate and you're going to get these extra decimal values placed inside of here.
-- So whenever we are trying to do or trying to store some values related to a value that we don't really care about too much, like, for example, the number of liters of water in a lake or the number of kilograms of trash in a landfill. We can make use of these different types over here.
-- if they're not precise, the reason is that they're a lot more efficient for running calculations on. We can do math or do calculations with numbers that are of this type much more quickly than numbers of type, decimal or numeric.
SELECT (1.99999::REAL - 1.99998::REAL);

-- this will return the exact result
-- speaking of decimal and numeric, these are essentially the exact same type. You can think of these as being totally identical.
SELECT (1.99999::DECIMAL - 1.99998::DECIMAL);


SELECT ('asdfwewrwerew'::CHAR(3));

SELECT ('a'::CHAR(3));

SELECT ('awderwerwer'::VARCHAR(5));

SELECT ('True'::BOOLEAN);
SELECT ('t'::BOOLEAN);
SELECT ('y'::BOOLEAN);
SELECT (1::BOOLEAN);

SELECT ('no'::BOOLEAN);

SELECT (NULL::BOOLEAN);

SELECT ('NOV-20-1980'::DATE);
SELECT ('NOV 20 1980'::DATE);
SELECT ('NOV 20, 1980'::DATE);
SELECT ('1980 NOV 20'::DATE);
SELECT ('1980 November 20'::DATE);

SELECT ('01:23'::TIME);

-- both are exact same thing
-- The type of this column is time without time zone. Time is an alias of time without time zone.
SELECT ('01:23 PM'::TIME);
SELECT ('01:23 PM'::TIME WITHOUT TIME ZONE);

SELECT ('01:23:33 PM'::TIME);

SELECT ('01:23:33 AM EST'::TIME WITH TIME ZONE);

SELECT ('01:23:33 AM PST'::TIME WITH TIME ZONE);

-- both are exact same thing
SELECT ('01:23:33 AM z'::TIME WITH TIME ZONE);
SELECT ('01:23:33 AM utc'::TIME WITH TIME ZONE);

SELECT ('NOV-20-1980 01:23 AM PST'::TIMESTAMP WITH TIME ZONE);


SELECT ('1 day'::INTERVAL);
SELECT ('1 D'::INTERVAL);

SELECT ('1 D 20 H'::INTERVAL);

SELECT ('1 D 20 H 30 M 25 SEC'::INTERVAL);

SELECT ('1 D 20 H 30 M 25 SEC'::INTERVAL) - ('1 D'::INTERVAL);

SELECT ('NOV-20-1980 01:23 AM PST'::TIMESTAMP WITH TIME ZONE) - ('4D'::INTERVAL);

SELECT ('NOV-20-1980 01:23 AM PST'::TIMESTAMP WITH TIME ZONE) - 
('NOV-13-1980 01:23 AM PST'::TIMESTAMP WITH TIME ZONE);

SELECT ('NOV-20-1980 01:23 AM PST'::TIMESTAMP WITH TIME ZONE) - 
('NOV-13-1980 05:43 AM PST'::TIMESTAMP WITH TIME ZONE);

SELECT ('NOV-20-1980 01:23 AM PST'::TIMESTAMP WITH TIME ZONE) - 
('NOV-13-1980 05:43 AM EST'::TIMESTAMP WITH TIME ZONE);


CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40),
	department VARCHAR(40),
	price INTEGER,
	weight INTEGER
);

INSERT INTO products (name, department, price, weight)
VALUES
	('Shirt', 'Clothes', 20, 1);

-- price will be set to null for this row
INSERT INTO products (name, department, price)
VALUES
	('Pants', 'Clothes', 3);

-- ERROR:  column "weight" of relation "products" contains null values. Because already there is a row with weight as null value.
ALTER TABLE products
ALTER COLUMN weight SET NOT NULL;

UPDATE products SET weight = 30 WHERE weight IS NULL;

-- no error this time
ALTER TABLE products
ALTER COLUMN weight SET NOT NULL;

-- Failing row contains (3, Shows, Clothes, 200, null).null value in column "weight" of relation "products" violates not-null constraint 
INSERT INTO products (name, department, price)
VALUES
	('Shows', 'Clothes', 200);


ALTER TABLE products
ALTER COLUMN price SET DEFAULT 999;

INSERT INTO products (name, department, weight) VALUES ('Gloves', 'Tools', 5);

-- ERROR:  Key (name)=(Shirt) is duplicated.could not create unique index "products_name_key" 
ALTER TABLE products ADD UNIQUE(name);


ALTER TABLE products Add UNIQUE(name, department);

-- This will work once and next time it will fail because of same 
INSERT INTO products (name, department, price, weight)
VALUES ('Shirt', 'Housewares', 24, 1);


ALTER TABLE products ADD CHECK (price > 0);

-- ERROR:  Failing row contains (10, dress, cloths, -99, 7).new row for relation "products" violates check constraint "products_price_check" 

INSERT INTO products (name, department, price, weight)
VALUES ('dress', 'cloths', -99, 7);


-- Multi column check
CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	created_at TIMESTAMP NOT NULL,
	est_delivery TIMESTAMP NOT NULL,
	CHECK (created_at > est_delivery)
);

INSERT INTO orders (name, created_at, est_delivery) 
VALUES ('Shirt', '2000-NOV-25 01:00 AM', '2000-NOV-20 01:00AM');

-- ERROR:  Failing row contains (3, Shirt, 2000-11-19 01:00:00, 2000-11-29 01:00:00).new row for relation "orders" violates check constraint "orders_check" 
INSERT INTO orders (name, created_at, est_delivery) 
VALUES ('Shirt', '2000-NOV-19 01:00 AM', '2000-NOV-29 01:00AM');

-- All COALESCE does is it takes a look at the different arguments it is provided and it's going to return the first value that is not null.
SELECT COALESCE(NULL, 5);
SELECT COALESCE(10, 5);


SELECT COALESCE((NULL)::BOOLEAN::INTEGER, 0);

-- this will return null;
SELECT (NULL)::BOOLEAN::INTEGER;

-- for any number greater than 0, this will return 1
SELECT (1)::BOOLEAN::INTEGER;
SELECT (45)::BOOLEAN::INTEGER;

