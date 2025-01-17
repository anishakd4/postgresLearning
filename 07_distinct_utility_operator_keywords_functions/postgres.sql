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