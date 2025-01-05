SELECT username, COUNT(*)
FROM users
JOIN(
	SELECT user_id from photo_tags
	UNION ALL -- union all here because we don't want to remove any duplicates
	SELECT user_id from caption_tags
) AS tags ON tags.user_id = users.id
GROUP by username
ORDER BY COUNT(*) DESC;


CREATE VIEW tags AS (
	SELECT id, created_at, user_id, post_id, 'photo_tag' As type FROM photo_tags
	UNION ALL
	SELECT id, created_at, user_id, post_id, 'caption_tag' As type FROM caption_tags
);

SELECT * FROM tags;


SELECT username, COUNT(*)
FROM users
JOIN tags ON tags.user_id = users.id
GROUP by username
ORDER BY COUNT(*) DESC;

CREATE VIEW recent_posts AS (
	SELECT * FROM posts
	ORDER BY created_at DESC
	LIMIT 10
);

SELECT username FROM recent_posts
JOIN users ON users.id = recent_posts.user_id;

CREATE OR REPLACE VIEW recent_posts AS (
	SELECT * FROM posts
	ORDER BY created_at DESC LIMIT 15
)

-- zero results because left inner join is needed
SELECT * FROM likes
JOIN posts ON posts.id = likes.post_id
JOIN comments ON comments.id = likes.comment_id;

SELECT * FROM likes
LEFT JOIN posts ON posts.id = likes.post_id
LEFT JOIN comments ON comments.id = likes.comment_id;