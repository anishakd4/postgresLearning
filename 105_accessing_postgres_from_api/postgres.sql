CREATE SCHEMA test;


CREATE TABLE test.users(
	id SERIAL PRIMARY KEY,
	username VARCHAR
);


INSERT INTO test.users (username) VALUES ('alex'),('sdfsfsdfsdfdfd');

SELECT * FROM users;

SELECT * FROM test.users;

-- So ignoring that little variable or that little part of the string right there focusing just on public, that means that if we ever run some kind of query or some kind of statement and we mention a table without designating a specific schema, then Postgres is going to default to trying to find that object inside the public schema.
SHOW search_path;


SET search_path TO test, public;

SHOW search_path;

-- Now we see result from test schema instead of the public schema
SELECT * FROM users;


SELECT * FROM public.users;

SET search_path TO "$user", public;