CREATE TABLE cities (
    name VARCHAR(50), 
    country VARCHAR(50),
    population INTEGER,
    area INTEGER
);

INSERT INTO cities (name, country, population, area)
VALUES ('Tokyo', 'Japan', 38505000, 8223);

INSERT INTO cities (name, country, population, area)
VALUES 
	('Delhi', 'India', 28125000, 2240),
    ('Shanghai', 'China', 22125000, 4015),
    ('Sao Paulo', 'Brazil', 20935000, 3042);


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


SELECT name || ', ' || country As location FROM cities;

SELECT CONCAT(name, country) As location FROM cities;

SELECT CONCAT(name, ', ', country) As location FROM cities;

SELECT CONCAT(UPPER(name), ', ', LOWER(country)) As location FROM cities;

SELECT UPPER(CONCAT(name, ', ', country)) As location FROM cities;

SELECT name, area FROM cities WHERE area > 4000

SELECT name, population FROM cities WHERE area > 4000

SELECT name, population FROM cities WHERE area = 8223;

-- the comparision we are doing is going to be run for every row.
SELECT name, population FROM cities WHERE area != 8223;

SELECT name, area FROM cities WHERE area BETWEEN 2000 AND 4000;

SELECT name, area FROM cities WHERE name IN ('Delhi', 'Shanghai');

SELECT name, area FROM cities WHERE name IN ('delhi', 'Shanghai');

SELECT name, area FROM cities WHERE name NOT IN ('Delhi', 'Shanghai');

SELECT name, area FROM cities WHERE area NOT IN (8223, 3042);

SELECT name, area FROM cities WHERE area NOT IN (8223, 3042) AND name != 'Delhi';

SELECT name, area FROM cities WHERE area NOT IN (8223, 3042) OR name = 'Delhi' OR NAME = 'Tokyo';

-- here all the mathematical operations will done first before > operation.
SELECT
    name,
    population / area
FROM
    cities
WHERE
    population / area > 6000;

-- if there are 2 cities with name Tokyo then both row will get updated.
UPDATE cities SET population = 39505000 WHERE name = 'Tokyo';


DELETE FROM cities WHERE name = 'Tokyo';

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


SELECT url, username FROM photos
JOIN users ON users.id = photos.user_id;

-- insert or update on table "photos" violates foreign key constraint "photos_user_id_fkey"
-- user 90 doesn't exist
INSERT INTO photos (url, user_id)
VALUES ('http://owsd232323ne.jpg', 90);

-- The value null is very special in SQL and Postgres. It means there's no value here. It just nothing.
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