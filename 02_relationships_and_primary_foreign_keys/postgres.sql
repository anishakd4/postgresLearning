-- SERIAL tells postgres to generate values for this column automatically
-- This adds on some special performance benefits to looking up records inside the users table when we are trying to look up records using the ID.
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

SELECT * FROM users;

-- foreign key
-- foreign key enforces some level of data consistency.
CREATE TABLE photos (
	id SERIAL PRIMARY KEY,
    url VARCHAR(200),
    user_id INTEGER REFERENCES users(id)
);

INSERT INTO photos (url, user_id)
VALUES ('http://one.jpg', 4);

INSERT INTO
    photos (url, user_id)
VALUES
    ('http://one.jpg', 1),
    ('http://343.jpg', 1),
    ('http://565.jpg', 1),
    ('http://3453.jpg', 2),
    ('http://dfd.jpg', 3),
    ('http://sqweq.jpg', 4);

SELECT * FROM photos;

-- joining 2 tables
SELECT url, username FROM photos
JOIN users ON users.id = photos.user_id;

-- insert or update on table "photos" violates foreign key constraint "photos_user_id_fkey"
-- user 90 doesn't exist
INSERT INTO photos (url, user_id)
VALUES ('http://owsd232323ne.jpg', 90);

-- update or delete on table "users" violates foreign key constraint "photos_user_id_fkey" on table "photos"
-- our IDs are making use of that serial data type. Whenever we use that serial data type, no ID ever gets reused. Even if a record with some given ID gets deleted.
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