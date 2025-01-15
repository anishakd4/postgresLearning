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

-- Error. Index out of range
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