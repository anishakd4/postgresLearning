
-- subquery
SELECT name, price FROM products
WHERE price > (
	SELECT MAX(price) FROM products WHERE department = 'Toys'
);

--subquery
SELECT name, price, (
	SELECT MAX(price) FROM products
) FROM products
WHERE price > 876;

--subquery
SELECT name, price, (
	SELECT price FROM products WHERE id = 3
) AS id_3_price 
FROM products
WHERE price > 876;

-- Write a query that prints the name and price for each phone. In addition, print out the ratio of the phones price against max price of all phones (so price / max price).  Rename this third column to price_ratio
SELECT name, price, price / (SELECT MAX(price) from phones) as price_ratio
FROM phones;

-- subquery in from
SELECT name, price_weight_ratio FROM 
(
	SELECT name, price / weight as price_weight_ratio FROM products
) AS p
WHERE price_weight_ratio > 5;

-- we can provide a subquery right here that gives us one single value as long as the outer selects and so on are going to agree with the structure
-- here we can just ask for *, everything else will break.
SELECT * FROM 
(SELECT MAX(price) FROM products) AS p

-- Find average number of orders for all users
SELECT AVG(order_count) 
FROM 
(
  SELECT user_id, COUNT(*) AS order_count FROM orders GROUP BY user_id
) AS p

-- Calculate the average price of phones for each manufacturer.  Then print the highest average price
SELECT MAX(avg_phones) as max_average_price
FROM
(
    SELECT manufacturer, AVG(price) as avg_phones FROM phones GROUP BY manufacturer
) AS p;


-- subquery
SELECT first_name FROM users
JOIN (
  SELECT user_id FROM orders WHERE product_id = 3
) AS o
ON o.user_id = users.id

-- above can be done without subquery also
SELECT first_name FROM users
JOIN orders
ON orders.user_id = users.id
WHERE orders.product_id = 3;

-- subquery in where
SELECT id FROM orders
WHERE product_id IN 
(
  SELECT id FROM products WHERE price / weight > 50
);