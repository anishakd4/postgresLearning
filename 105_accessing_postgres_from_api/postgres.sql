CREATE SCHEMA test;


CREATE TABLE test.users(
	id SERIAL PRIMARY KEY,
	username VARCHAR
);


INSERT INTO test.users (username) VALUES ('alex'),('sdfsfsdfsdfdfd');

SELECT * FROM users;

SELECT * FROM test.users;