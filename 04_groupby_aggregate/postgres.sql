-- GROUP BY 
SELECT user_id FROM comments GROUP BY user_id;

-- column "comments.contents" must appear in the GROUP BY clause or be used in an aggregate function
-- We can only select in particular, the grouped column. We are not allowed to directly select any of the underlying columns inside of our original table
SELECT contents FROM comments GROUP BY user_id;

-- aggregate function
SELECT MAX(id) FROM comments;
SELECT MIN(id) FROM comments;
SELECT AVG(id) FROM comments;
SELECT COUNT(id) FROM comments;
SELECT SUM(id) FROM comments;

-- We can not select a column and aggregate at the same time
-- column "comments.id" must appear in the GROUP BY clause or be used in an aggregate function
SELECT SUM(id), id FROM comments;
-- column "comments.contents" must appear in the GROUP BY clause or be used in an aggregate function
SELECT SUM(id), contents FROM comments;

-- An aggregate function, if we use it while doing group by, is only going to be applied to each of the individual little sub columns.
SELECT user_id, MAX(id) FROM COMMENTS GROUP BY user_id ;

-- This conveys how many comments are there from each user_id 
SELECT user_id, COUNT(id) AS num_comments_created 
FROM COMMENTS GROUP BY user_id ;

-- this will count all user_id which has not null values
-- when we count on a column null values are not calculated
SELECT COUNT(user_id) FROM photos;

-- this will count all rows.
SELECT COUNT(*) FROM photos;

SELECT user_id FROM photos GROUP BY user_id;
SELECT user_id, COUNT(user_id) FROM photos GROUP BY user_id;
SELECT user_id, COUNT(*) FROM photos GROUP BY user_id;

-- get count of number of comments for each photo
SELECT photo_id, COUNT(*) FROM comments GROUP BY photo_id;

-- join and group by
SELECT name, COUNT(*) FROM books JOIN authors ON authors.id = books.author_id
GROUP by authors.name;

-- having
-- We're going to do some filtering based upon a aggregate function. So this is where we would make use of that having statement.
SELECT photo_id, COUNT(*) FROM comments 
WHERE photo_id < 3 
GROUP BY photo_id
HAVING COUNT(*) > 2;

-- having
-- Anytime we're trying to filter groups or anytime we're trying to filter using an aggregate function, we want to think about that having keyword.
SELECT user_id, COUNT(*) 
FROM comments 
WHERE photo_id < 50 
GROUP BY user_id
HAVING COUNT(*) > 20;

-- Given a table of phones, print the names of manufacturers and total revenue (price * units_sold) for all phones. Only print the manufacturers who have revenue greater than 2,000,000 for all the phones they sold
SELECT manufacturer, SUM(price * units_sold) 
FROM phones 
GROUP BY manufacturer
HAVING SUM(price * units_sold) > 2000000;