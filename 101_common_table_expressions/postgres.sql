SELECT users.username, tags.created_at FROM users
JOIN (
	SELECT user_id, created_at FROM caption_tags
	UNION ALL
	SELECT user_id, created_at FROM photo_tags
) AS tags ON tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';



WITH tags AS(
	SELECT user_id, created_at FROM caption_tags
	UNION ALL
	SELECT user_id, created_at FROM photo_tags
)
SELECT users.username, tags.created_at FROM users
JOIN tags ON tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';


--  There is exactly 0 changes in both the explain statements output. There is exactly zero change to the actual query plan.
EXPLAIN WITH tags AS(
	SELECT user_id, created_at FROM caption_tags
	UNION ALL
	SELECT user_id, created_at FROM photo_tags
)
SELECT users.username, tags.created_at FROM users
JOIN tags ON tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';

EXPLAIN SELECT users.username, tags.created_at FROM users
JOIN (
	SELECT user_id, created_at FROM caption_tags
	UNION ALL
	SELECT user_id, created_at FROM photo_tags
) AS tags ON tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';


WITH RECURSIVE countdown(val) AS (
	SELECT 3 AS val
	UNION 
	SELECT val - 1 FROM countdown WHERE val > 1
)
SELECT * FROM countdown;

SELECT 3 as val;


WITH RECURSIVE suggestions(leader_id, follower_id, depth) AS
(
	SELECT leader_id, follower_id, 1 AS depth
	FROM followers
	WHERE follower_id = 1
	UNION
	SELECT followers.follower_id, followers.leader_id, depth + 1
	FROM followers
	JOIN suggestions ON suggestions.leader_id = followers.follower_id
	WHERE depth < 3
)
SELECT DISTINCT users.id, users.username
FROM suggestions
JOIN users ON users.id = suggestions.leader_id
WHERE depth > 1
LIMIT 30;
