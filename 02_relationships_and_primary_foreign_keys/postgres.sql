

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
VALUES
    ('http://one.jpg', 1),
    ('http://343.jpg', 1),
    ('http://565.jpg', 1),
    ('http://3453.jpg', 2),
    ('http://dfd.jpg', 3),
    ('http://sqweq.jpg', 4);