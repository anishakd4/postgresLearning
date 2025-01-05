SELECT username, COUNT(*)
FROM users
JOIN(
	SELECT user_id from photo_tags
	UNION ALL -- union all here because we don't want to remove any duplicates
	SELECT user_id from caption_tags
) AS tags ON tags.user_id = users.id
GROUP by username
ORDER BY COUNT(*) DESC;