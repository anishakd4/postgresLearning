
-- We make use of show anytime that we want to pull one individual configuration option out of our Postgres database.
--  This is where Postgres stores information on your hard disk.
SHOW data_directory;

-- This will then list out the name of all the different databases inside of our Postgres installation and an internal identifier that is being used for each one.
SELECT oid, datname FROM pg_database;