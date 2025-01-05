EXPLAIN SELECT username, contents 
FROM users 
JOIN comments ON comments.user_id = users.id 
WHERE username = 'Alyson14';

EXPLAIN ANALYZE SELECT username, contents 
FROM users 
JOIN comments ON comments.user_id = users.id 
WHERE username = 'Alyson14';

SELECT * FROM pg_stats WHERE tablename = 'users';

SELECT * FROM likes WHERE created_at < '2013-01-01';

SELECT * FROM likes WHERE created_at > '2013-01-01';

SELECT COUNT(*) FROM likes WHERE created_at > '2013-01-01';
SELECT COUNT(*) FROM likes WHERE created_at < '2013-01-01';

EXPLAIN SELECT * FROM likes WHERE created_at < '2013-01-01';

EXPLAIN SELECT * FROM likes WHERE created_at > '2013-01-01';