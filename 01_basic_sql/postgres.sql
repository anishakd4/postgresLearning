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