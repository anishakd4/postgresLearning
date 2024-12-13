-- creating tables
CREATE TABLE cities (
    name VARCHAR(50), 
    country VARCHAR(50),
    population INTEGER,
    area INTEGER
);

-- If we wanted to, we could kind of jumble the order of columns. The only requirement is that when we list out all the values we want to insert, they match up in the same order as the order in which we listed out all of our columns.
INSERT INTO cities (name, country, population, area)
VALUES ('Tokyo', 'Japan', 38505000, 8223);

INSERT INTO cities (name, country, population, area)
VALUES 
	('Delhi', 'India', 28125000, 2240),
  ('Shanghai', 'China', 22125000, 4015),
  ('Sao Paulo', 'Brazil', 20935000, 3042);


-- select query
SELECT * FROM cities;
SELECT name, population FROM cities;
SELECT area, name, population FROM cities;
SELECT name, name, name FROM cities;

-- We can use any other mathematical operation also here:
SELECT name, population / area FROM cities;

-- ?column? is a temporary column name
SELECT name, population + area FROM cities;

-- Index out of range
SELECT name, population * area FROM cities;

SELECT name, population + area AS population_density
FROM cities;

-- String operations and functions
SELECT name || ', ' || country As location FROM cities;
SELECT CONCAT(name, country) As location FROM cities;
SELECT CONCAT(name, ', ', country) As location FROM cities;

-- We can stack together as many functions as we want.
SELECT CONCAT(UPPER(name), ', ', LOWER(country)) As location FROM cities;
SELECT UPPER(CONCAT(name, ', ', country)) As location FROM cities;

-- Where clause
SELECT name, area FROM cities WHERE area > 4000
SELECT name, population FROM cities WHERE area > 4000
SELECT name, population FROM cities WHERE area = 8223;

-- the comparison we are doing is going to be run for every row.
SELECT name, population FROM cities WHERE area != 8223;

SELECT name, area FROM cities WHERE area BETWEEN 2000 AND 4000;
SELECT name, area FROM cities WHERE name IN ('Delhi', 'Shanghai');
SELECT name, area FROM cities WHERE name IN ('delhi', 'Shanghai');
SELECT name, area FROM cities WHERE name NOT IN ('Delhi', 'Shanghai');
SELECT name, area FROM cities WHERE area NOT IN (8223, 3042);

-- compound where clauses
SELECT name, area FROM cities WHERE area NOT IN (8223, 3042) AND name != 'Delhi';
SELECT name, area FROM cities WHERE area NOT IN (8223, 3042) OR name = 'Delhi' OR NAME = 'Tokyo';

-- we can add mathematical operation or string operation in the Where clause
-- here the mathematical operation (population / area) will done first before > operation.
SELECT
    name,
    population / area
FROM
    cities
WHERE
    population / area > 6000;

-- updating rows
-- if there are 2 cities with name Tokyo then both row will get updated.
UPDATE cities SET population = 39505000 WHERE name = 'Tokyo';

-- here also if have multiple rows matching with the where clause then multiple rows will be deleted
DELETE FROM cities WHERE name = 'Tokyo';

-- SERIAL tells postgres to generate values for this column automatically
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
  username VARCHAR(50)
);

INSERT INTO users (username)
VALUES ('anish'),('manish'),('suresh'),('mahesh');

INSERT INTO 
    users (username)
VALUES
    ('anish'),('manish'),('suresh'),('mahesh');

--foreign key
CREATE TABLE photos (
	id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id)
);

INSERT INTO photos (url, user_id)
VALUES ('http://one.jpg', 4);

INSERT INTO
    photos (url, user_id)
VA  LUES
    ('http://one.jpg', 1),
    ('http://343.jpg', 1),
    ('http://565.jpg', 1),
    ('http://3453.jpg', 2),
    ('http://dfd.jpg', 3),
    ('http://sqweq.jpg', 4);

-- joining 2 tables
SELECT url, username FROM photos
JOIN users ON users.id = photos.user_id;

-- insert or update on table "photos" violates foreign key constraint "photos_user_id_fkey"
-- user 90 doesn't exist
INSERT INTO photos (url, user_id)
VALUES ('http://owsd232323ne.jpg', 90);

-- update or delete on table "users" violates foreign key constraint "photos_user_id_fkey" on table "photos"
DELETE FROM users WHERE id = 1;

-- The value null is very special in SQL and Postgres. It means there's no value here. It just nothing.
-- when we want to insert a photo which is not tied to any user then we put in a value of NULL for user_id
INSERT INTO photos (url, user_id)
VALUES ('http://owsd232323ne.jpg', NULL);

-- deleting a table
DROP TABLE photos;

-- After deleting a table if we try to fetch data then error comes as relation "photos" does not exist
SELECT * FROM photos;

CREATE TABLE photos (
id SERIAL PRIMARY KEY,
url VARCHAR(200),
user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);
INSERT INTO photos (url, user_id)
VALUES
('http:/one.jpg', 4),
('http:/two.jpg', 1),
('http:/25.jpg', 1),
('http:/36.jpg', 1),
('http:/754.jpg', 2),
('http:/35.jpg', 3),
('http:/256.jpg', 4);

SELECT * FROM photos;

-- ON DELETE CASCADE: If we attempt to delete a user, say the user with ID number one right here. All of the related photos tied to that user. So that would be the photo with ID two, three and four because they are all related to user ID one. They should all be deleted automatically whenever we delete that related user.
DELETE FROM users WHERE id = 1;

SELECT * FROM photos;

CREATE TABLE photos (
id SERIAL PRIMARY KEY,
url VARCHAR(200),
user_id INTEGER REFERENCES users(id) ON DELETE SET NULL
);
INSERT INTO photos (url, user_id)
VALUES
('http:/one.jpg', 4),
('http:/754.jpg', 2),
('http:/35.jpg', 3),
('http:/256.jpg', 4);

SELECT * FROM photos;

--Once we delete that user, all the related photos will have this value inside the user ID column set to null.
DELETE FROM users WHERE id = 4;
SELECT * FROM photos;

CREATE TABLE photos (
id SERIAL PRIMARY KEY,
url VARCHAR(200),
user_id INTEGER REFERENCES users(id)
);

INSERT INTO photos (url, user_id)
VALUES
('http:/one.jpg', 4),
('http:/two.jpg', 1),
('http:/25.jpg', 1),
('http:/36.jpg', 1),
('http:/754.jpg', 2),
('http:/35.jpg', 3),
('http:/256.jpg', 4);


CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username VARCHAR(50)
);
CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  contents VARCHAR(240),
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  photo_id INTEGER REFERENCES photos(id) ON DELETE CASCADE
);
INSERT INTO
  users (username)
VALUES
  ('Reyna.Marvin'),
  ('Micah.Cremin'),
  ('Alfredo66'),
  ('Gerard_Mitchell42'),
  ('Frederique_Donnelly');
INSERT INTO
  photos (url, user_id)
VALUES
  ('https://santina.net', 3),
  ('https://alayna.net', 5),
  ('https://kailyn.name', 3),
  ('http://marjolaine.name', 1),
  ('http://chet.net', 5),
  ('http://jerrold.org', 2),
  ('https://meredith.net', 4),
  ('http://isaias.net', 4),
  ('http://dayne.com', 4),
  ('http://colten.net', 2),
  ('https://adelbert.biz', 5),
  ('http://kolby.org', 1),
  ('https://deon.biz', 2),
  ('https://marina.com', 5),
  ('http://johnson.info', 1),
  ('https://linda.info', 2),
  ('https://tyrique.info', 4),
  ('http://buddy.info', 5),
  ('https://elinore.name', 2),
  ('http://sasha.com', 3);
INSERT INTO
  comments (contents, user_id, photo_id)
VALUES
  (
    'Quo velit iusto ducimus quos a incidunt nesciunt facilis.',
    2,
    4
  ),
  ('Non est totam.', 5, 5),
  ('Fuga et iste beatae.', 3, 3),
  ('Molestias tempore est.', 1, 5),
  (
    'Est voluptatum voluptatem voluptatem est ullam quod quia in.',
    1,
    5
  ),
  ('Aut et similique porro ullam.', 1, 3),
  (
    'Fugiat cupiditate consequatur sit magni at non ad omnis.',
    1,
    2
  ),
  (
    'Accusantium illo maiores et sed maiores quod natus.',
    2,
    5
  ),
  ('Perferendis cumque eligendi.', 1, 2),
  ('Nihil quo voluptatem placeat.', 5, 5),
  ('Rerum dolor sunt sint.', 5, 2),
  (
    'Id corrupti tenetur similique reprehenderit qui sint qui nulla tenetur.',
    2,
    1
  ),
  ('Maiores quo quia.', 1, 5),
  (
    'Culpa perferendis qui perferendis eligendi officia neque ex.',
    1,
    4
  ),
  (
    'Reprehenderit voluptates rerum qui veritatis ut.',
    1,
    1
  ),
  ('Aut ipsum porro deserunt maiores sit.', 5, 3),
  ('Aut qui eum eos soluta pariatur.', 1, 1),
  (
    'Praesentium tempora rerum necessitatibus aut.',
    4,
    3
  ),
  ('Magni error voluptas veniam ipsum enim.', 4, 2),
  (
    'Et maiores libero quod aliquam sit voluptas.',
    2,
    3
  ),
  ('Eius ab occaecati quae eos aut enim rem.', 5, 4),
  ('Et sit occaecati.', 4, 3),
  (
    'Illum omnis et excepturi totam eum omnis.',
    1,
    5
  ),
  ('Nemo nihil rerum alias vel.', 5, 1),
  ('Voluptas ab eius.', 5, 1),
  (
    'Dolor soluta quisquam voluptatibus delectus.',
    3,
    5
  ),
  ('Consequatur neque beatae.', 4, 5),
  ('Aliquid vel voluptatem.', 4, 5),
  ('Maiores nulla ea non autem.', 4, 5),
  ('Enim doloremque delectus.', 1, 4),
  ('Facere vel assumenda.', 2, 5),
  (
    'Fugiat dignissimos dolorum iusto fugit voluptas et.',
    2,
    1
  ),
  ('Sed cumque in et.', 1, 3),
  (
    'Doloribus temporibus hic eveniet temporibus corrupti et voluptatem et sint.',
    5,
    4
  ),
  ('Quia dolorem officia explicabo quae.', 3, 1),
  ('Ullam ad laborum totam veniam.', 1, 2),
  (
    'Et rerum voluptas et corporis rem in hic.',
    2,
    3
  ),
  ('Tempora quas facere.', 3, 1),
  (
    'Rem autem corporis earum necessitatibus dolores explicabo iste quo.',
    5,
    5
  ),
  (
    'Animi aperiam repellendus in aut eum consequatur quos.',
    1,
    2
  ),
  ('Enim esse magni.', 4, 3),
  ('Saepe cumque qui pariatur.', 4, 4),
  ('Sit dolorem ipsam nisi.', 4, 1),
  ('Dolorem veniam nisi quidem.', 2, 5),
  (
    'Porro illum perferendis nemo libero voluptatibus vel.',
    3,
    3
  ),
  (
    'Dicta enim rerum culpa a quo molestiae nam repudiandae at.',
    2,
    4
  ),
  (
    'Consequatur magnam autem voluptas deserunt.',
    5,
    1
  ),
  ('Incidunt cum delectus sunt tenetur et.', 4, 3),
  ('Non vel eveniet sed molestiae tempora.', 2, 1),
  (
    'Ad placeat repellat et veniam ea asperiores.',
    5,
    1
  ),
  ('Eum aut magni sint.', 3, 1),
  (
    'Aperiam voluptates quis velit explicabo ipsam vero eum.',
    1,
    3
  ),
  (
    'Error nesciunt blanditiis quae quis et tempora velit repellat sint.',
    2,
    4
  ),
  (
    'Blanditiis saepe dolorem enim eos sed ea.',
    1,
    2
  ),
  ('Ab veritatis est.', 2, 2),
  ('Vitae voluptatem voluptates vel nam.', 3, 1),
  (
    'Neque aspernatur est non ad vitae nisi ut nobis enim.',
    4,
    3
  ),
  ('Debitis ut amet.', 4, 2),
  (
    'Pariatur beatae nihil cum molestiae provident vel.',
    4,
    4
  ),
  ('Aperiam sunt aliquam illum impedit.', 1, 4),
  (
    'Aut laudantium necessitatibus harum eaque.',
    5,
    3
  ),
  (
    'Debitis voluptatum nesciunt quisquam voluptatibus fugiat nostrum sed dolore quasi.',
    3,
    2
  ),
  (
    'Praesentium velit voluptatem distinctio ut voluptatum at aut.',
    2,
    2
  ),
  (
    'Voluptates nihil voluptatum quia maiores dolorum molestias occaecati.',
    1,
    4
  ),
  ('Quisquam modi labore.', 3, 2),
  (
    'Fugit quia perferendis magni doloremque dicta officia dignissimos ut necessitatibus.',
    1,
    4
  ),
  (
    'Tempora ipsam aut placeat ducimus ut exercitationem quis provident.',
    5,
    3
  ),
  ('Expedita ducimus cum quibusdam.', 5, 1),
  (
    'In voluptates doloribus aut ut libero possimus adipisci iste.',
    3,
    2
  ),
  (
    'Sit qui est sed accusantium quidem id voluptatum id.',
    1,
    5
  ),
  (
    'Libero eius quo consequatur laudantium reiciendis reiciendis aliquid nemo.',
    1,
    2
  ),
  (
    'Officia qui reprehenderit ut accusamus qui voluptatum at.',
    2,
    2
  ),
  ('Ad similique quo.', 4, 1),
  (
    'Commodi culpa aut nobis qui illum deserunt reiciendis.',
    2,
    3
  ),
  (
    'Tenetur quam aut rerum doloribus est ipsa autem.',
    4,
    2
  ),
  (
    'Est accusamus aut nisi sit aut id non natus assumenda.',
    2,
    4
  ),
  ('Et sit et vel quos recusandae quo qui.', 1, 3),
  ('Velit nihil voluptatem et sed.', 4, 4),
  ('Sunt vitae expedita fugiat occaecati.', 1, 3),
  ('Consequatur quod et ipsam in dolorem.', 4, 2),
  (
    'Magnam voluptatum molestias vitae voluptatibus beatae nostrum sunt.',
    3,
    5
  ),
  (
    'Alias praesentium ut voluptatem alias praesentium tempora voluptas debitis.',
    2,
    5
  ),
  (
    'Ipsam cumque aut consectetur mollitia vel quod voluptates provident suscipit.',
    3,
    5
  ),
  (
    'Ad dignissimos quia aut commodi vel ut nisi.',
    3,
    3
  ),
  (
    'Fugit ut architecto doloremque neque quis.',
    4,
    5
  ),
  (
    'Repudiandae et voluptas aut in excepturi.',
    5,
    3
  ),
  ('Aperiam voluptatem animi.', 5, 1),
  ('Et mollitia vel soluta fugiat.', 4, 1),
  ('Ut nemo voluptas voluptatem voluptas.', 5, 2),
  ('At aut quidem voluptatibus rem.', 5, 1),
  (
    'Temporibus voluptates iure fuga alias minus eius.',
    2,
    3
  ),
  (
    'Non autem laboriosam consectetur officiis aut excepturi nobis commodi.',
    4,
    3
  ),
  (
    'Esse voluptatem sed deserunt ipsum eaque maxime rerum qui.',
    5,
    5
  ),
  (
    'Debitis ipsam ut pariatur molestiae ut qui aut reiciendis.',
    4,
    4
  ),
  (
    'Illo atque nihil et quod consequatur neque pariatur delectus.',
    3,
    3
  ),
  (
    'Qui et hic accusantium odio quis necessitatibus et magni.',
    4,
    2
  ),
  (
    'Debitis repellendus inventore omnis est facere aliquam.',
    3,
    3
  ),
  (
    'Occaecati eos possimus deleniti itaque aliquam accusamus.',
    3,
    4
  ),
  (
    'Molestiae officia architecto eius nesciunt.',
    5,
    4
  ),
  (
    'Minima dolorem reiciendis excepturi culpa sapiente eos deserunt ut.',
    3,
    3
  );


-- column reference "id" is ambiguous
SELECT id FROM comments
JOIN users ON users.id = comments.user_id;

SELECT comments.id FROM comments
JOIN users ON users.id = comments.user_id;

SELECT users.id FROM comments
JOIN users ON users.id = comments.user_id;

SELECT comments.id, users.id FROM comments
JOIN users ON users.id = comments.user_id;

SELECT comments.id AS comments_id, users.id FROM comments
JOIN users ON users.id = comments.user_id;

SELECT co.id AS comments_id, users.id FROM comments as co
JOIN users ON users.id = co.user_id;

SELECT co.id AS comments_id, users.id FROM comments co
JOIN users ON users.id = co.user_id;

INSERT INTO photos (url, user_id)
VALUES ('http://banner.jpg', NULL);

-- order in join tables sometimes matters
SELECT url, username FROM photos
JOIN users ON users.id = photos.user_id;

-- Left outer join
SELECT url, username FROM photos
LEFT JOIN users ON users.id = photos.user_id;

-- new user add
INSERT INTO users (username)
VALUES ('Nicole');

-- Right outer join
SELECT url, username FROM photos
RIGHT JOIN users ON users.id = photos.user_id;

-- Full join
SELECT url, username FROM photos
FULL JOIN users ON users.id = photos.user_id;

-- where will always be on the other side of the join.
SELECT url, contents FROM comments
JOIN photos ON photos.id = comments.photo_id
WHERE comments.user_id = photos.user_id

-- 3 way join
SELECT url, contents FROM comments
JOIN photos ON photos.id = comments.photo_id
JOIN users ON users.id = comments.user_id AND users.id = photos.user_id


-- 3 way join 
SELECT url, contents FROM comments
JOIN photos ON photos.id = comments.photo_id
JOIN users ON users.id = comments.user_id AND users.id = photos.user_id

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


SELECT user_id, MAX(id) FROM COMMENTS GROUP BY user_id ;

-- This conveys how many comments are there from each user_id 
SELECT user_id, COUNT(id) AS num_comments_created 
FROM COMMENTS GROUP BY user_id ;

-- this will count all user_id which has not null values
SELECT COUNT(user_id) FROM photos;

-- this will count all rows.
SELECT COUNT(*) FROM photos;

SELECT user_id FROM photos GROUP BY user_id;
SELECT user_id, COUNT(user_id) FROM photos GROUP BY user_id;
SELECT user_id, COUNT(*) FROM photos GROUP BY user_id;

-- get count of number of comments for each photo
SELECT photo_id, COUNT(*) FROM comments GROUP BY photo_id;


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

-- Given a table of phones, print the names of manufacturers and total revenue (price * units_sold) for all phones.  Only print the manufacturers who have revenue greater than 2,000,000 for all the phones they sold
SELECT manufacturer, SUM(price * units_sold) 
FROM phones 
GROUP BY manufacturer
HAVING SUM(price * units_sold) > 2000000;


--sorting
SELECT * FROM products ORDER BY price;
SELECT * FROM products ORDER BY price ASC;
SELECT * FROM products ORDER BY price DESC;


SELECT * FROM products ORDER BY name;
SELECT * FROM products ORDER BY name DESC;

-- second sorting criteria in case of same price
SELECT * FROM products ORDER BY price, weight;

-- ascending price and descending weight
SELECT * FROM products ORDER BY price, weight DESC;

-- skip the first 40 rows and return rest
SELECT * FROM users OFFSET 40;

-- give only first 5 rows
SELECT * FROM users LIMIT 5;

-- no error it is just that you will receive all the available rows if 999 os greater than 50
SELECT * FROM users LIMIT 999;

-- 5 least priced products
SELECT * FROM products ORDER BY price LIMIT 5;

-- 5 most priced products
SELECT * FROM products ORDER BY price DESC LIMIT 5;

-- 5 most priced products except the costliest one
SELECT * FROM products ORDER BY price DESC LIMIT 5 OFFSET 1;

-- logics in case of large dataset
-- first page of 20 items
SELECT * FROM products ORDER BY price DESC LIMIT 20 OFFSET 0;
-- second page of 20 items
SELECT * FROM products ORDER BY price DESC LIMIT 20 OFFSET 0;

--a query that shows the names of only the second and third most expensive phones
SELECT name from phones ORDER BY price DESC LIMIT 2 OFFSET 1;

-- union. this removes duplicates
(SELECT * FROM products ORDER BY price DESC LIMIT 4)
UNION
(SELECT * FROM products ORDER BY price / weight DESC LIMIT 4);

-- union all. this doesnot remove duplicates
(SELECT * FROM products ORDER BY price DESC LIMIT 4)
UNION ALL
(SELECT * FROM products ORDER BY price / weight DESC LIMIT 4);

-- UNION types character varying and integer cannot be matched. So we must always have the same columns and they must have compatible data types as well
SELECT name FROM products UNION SELECT price FROM products;

-- Besides the union keyword, there are a couple of other keywords that we use to work with multiple sets of data. Whenever I use a term multiple sets, I'm essentially saying the result of multiple different queries.


-- Intersection between 2 queries and remove duplicates
(SELECT * FROM products ORDER BY price DESC LIMIT 4)
INTERSECT
(SELECT * FROM products ORDER BY price / weight DESC LIMIT 4);

-- Intersection between 2 queries but donot remove duplicates
(SELECT * FROM products ORDER BY price DESC LIMIT 4)
INTERSECT
(SELECT * FROM products ORDER BY price / weight DESC LIMIT 4);

-- EXCEPT. Here order of sets matter. Items present in first set but not present in second
(SELECT * FROM products ORDER BY price DESC LIMIT 4)
EXCEPT
(SELECT * FROM products ORDER BY price / weight DESC LIMIT 4);