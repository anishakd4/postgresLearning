CREATE INDEX ON users (username);

-- deleting a index
DROP INDEX users_username_idx;

-- query to print out the size in kilobytes in this case, or essentially the hard drive space used by our users table.
SELECT pg_size_pretty(pg_relation_size('users'));

-- Well, definitely 880kB and 184kB is really no big deal. At the end of the day, these are trivial amounts of space. So in a big application just for table 80GB large, we might be talking about 18GB worth of information just to store this additional index.
SELECT pg_size_pretty(pg_relation_size('users_username_idx'));


-- So we are looking at all the different indexes that exist inside of our Instagram database right now.
SELECT relname, relkind FROM pg_class WHERE relkind = 'i';

CREATE EXTENSION pageinspect;

-- So bt stands for B-tree. And then metap stands for meta page. So we are trying to retrieve information off the meta page of the users username index right now.
SELECT * FROM bt_metap('users_username_idx');

-- as you'd guess this stands for B-tree. Get all the items off of a specific page.
SELECT * FROM bt_page_items('users_username_idx', 3);

-- leaf node
SELECT * FROM bt_page_items('users_username_idx', 1);

-- it turns out that every row actually does have a ctid. It's just kind of invisible to us unless we specifically ask for it inside of our query.  Aaliyah was found on page 33, index 43.
SELECT ctid, * FROM users WHERE username = 'Aaliyah.Hintz';