/* ============ #1 =============== 
* Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
* который больше всех общался с выбранным пользователем (написал ему сообщений).
*/

-- выбрал пользователя с id = 3
SELECT 
	firstname, lastname 
FROM users 
WHERE id = (
	SELECT
		from_user_id
	FROM messages WHERE to_user_id = 3
	GROUP BY from_user_id ORDER BY COUNT(from_user_id) DESC LIMIT 1
	);


/* ============ #2 =============== 
* Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
*/

-- есть 2 пользователя младше 10 лет, но они не писали посты,  
-- поэтому я выбрал пользователей младше 18 лет
SELECT
	id,
	firstname, 
	lastname,
	(SELECT TIMESTAMPDIFF(YEAR, birthday, NOW()) FROM profiles WHERE user_id = users.id) AS bth
FROM users
WHERE id IN (SELECT user_id FROM profiles WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 18);
-- имеется 3 пользователя младше 18 лет

-- проверяем кто из них писал посты
SELECT 
	user_id,
	(SELECT lastname FROM users WHERE id = posts.user_id)
FROM posts 
WHERE user_id IN 
	(SELECT
		id
	FROM users
	WHERE id IN (SELECT user_id FROM profiles WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 18))
GROUP BY user_id;
-- посты писал только пользователь с id = 6


SELECT * FROM posts_likes;
SELECT * FROM posts;

-- узнаём id постов пользователя
SELECT id FROM posts 
WHERE user_id IN 
	(SELECT 
		user_id
	FROM posts 
	WHERE user_id IN 
		(SELECT
			id
		FROM users
		WHERE id IN (SELECT user_id FROM profiles WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 18))
	GROUP BY user_id);


-- производим подсчёт лайков
SELECT COUNT(like_type) FROM posts_likes 
WHERE post_id IN (
	SELECT id FROM posts 
WHERE user_id IN (
	SELECT 
		user_id
	FROM posts 
	WHERE user_id IN 
		(SELECT
			id
		FROM users
		WHERE id IN (SELECT user_id FROM profiles WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 18))
	GROUP BY user_id)
	);


/* ============ #3 =============== 
* Определить кто больше поставил лайков (всего): мужчины или женщины.
*/

SELECT 
	CASE gender 
			WHEN 'f' THEN 'female'
			WHEN 'm' THEN 'male'
			WHEN 'x' THEN 'not defined'
	END AS gender,
	COUNT(gender) AS total
FROM profiles
WHERE user_id IN 
	(SELECT user_id	FROM posts_likes WHERE post_id IN 
		(SELECT id FROM posts WHERE user_id IN 
			(SELECT user_id FROM posts WHERE user_id IN 
				(SELECT id FROM users WHERE id IN  -- 
					(SELECT user_id FROM profiles WHERE  -- меньше 18 лет
						TIMESTAMPDIFF(YEAR, birthday, NOW()) < 18))
			GROUP BY user_id)
		)
	)
GROUP BY gender ORDER BY total DESC;





