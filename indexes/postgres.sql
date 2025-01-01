CREATE INDEX ON users (username);

-- deleting a index
DROP INDEX users_username_idx;

-- query to print out the size in kilobytes in this case, or essentially the hard drive space used by our users table.
SELECT pg_size_pretty(pg_relation_size('users'));

-- Well, definitely 880kB and 184kB is really no big deal. At the end of the day, these are trivial amounts of space. So in a big application just for table 80GB large, we might be talking about 18GB worth of information just to store this additional index.
SELECT pg_size_pretty(pg_relation_size('users_username_idx'));
