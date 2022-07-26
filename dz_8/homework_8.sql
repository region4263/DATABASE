/* ============ #1 =============== 
* Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
* который больше всех общался с выбранным пользователем (написал ему сообщений).
*/

-- выбрал пользователя с id = 3
SELECT 
	u.firstname, 
	u.lastname, 
	COUNT(*) AS total 
FROM users u JOIN messages m
ON u.id = m.from_user_id 
WHERE m.to_user_id = 3
GROUP BY from_user_id 
ORDER BY total DESC LIMIT 1;


/* ============ #2 =============== 
* Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
*/

-- есть 2 пользователя младше 10 лет, но они не писали посты,  
-- поэтому я выбрал пользователей младше 18 лет
SELECT u.lastname, count(*) FROM posts p 
JOIN users u ON u.id = p.user_id 
JOIN profiles p2 ON u.id = p2.user_id
JOIN posts_likes pl ON pl.post_id = p.id
WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 18 AND pl.like_type = 1
GROUP BY u.lastname;


/* ============ #3 =============== 
* Определить кто больше поставил лайков (всего): мужчины или женщины.
*/

SELECT 
	COUNT(p3.gender) AS total,
	CASE p3.gender 
		WHEN 'f' THEN 'female'
		WHEN 'm' THEN 'male'
		WHEN 'x' THEN 'not defined'
	END AS gender
FROM profiles p 
JOIN users u ON p.user_id = u.id 
JOIN posts p2 ON p2.user_id = u.id 
JOIN posts_likes pl ON pl.post_id = p2.id
JOIN profiles p3 ON p3.user_id = pl.user_id 
WHERE TIMESTAMPDIFF(YEAR, p.birthday, NOW()) < 18 AND pl.like_type = 1
GROUP BY p3.gender ORDER BY total DESC;









