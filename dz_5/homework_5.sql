/* ============ #1 =============== 
* Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
* Заполните их текущими датой и временем.
*/

UPDATE users SET 
	created_at = NOW(),
	updated_at = NOW();


/* ============ #2 =============== 
* Таблица users была неудачно спроектирована. Записи created_at и updated_at были 
* заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". 
* Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
*/

UPDATE users SET
	created_at = STR_TO_DATE(created_at,'%d.%m.%Y %H:%i'),
	updated_at = STR_TO_DATE(updated_at,'%d.%m.%Y %H:%i');
	
ALTER TABLE users MODIFY COLUMN created_at DATETIME;
ALTER TABLE users MODIFY COLUMN updated_at DATETIME;


/* ============ #3 =============== 
* В таблице складских запасов storehouses_products в поле value могут встречаться 
* самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. 
* Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения 
* значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.*/

SELECT value FROM storehouses_products 
ORDER BY 
	CASE 
		WHEN value = 0 THEN 1000 
		ELSE value 
	END;


/* ============ #4 =============== 
* (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе
* и мае. Месяцы заданы в виде списка английских названий ('may', 'august')*/

SELECT name FROM users WHERE birthday_at LIKE '%may%';
SELECT name FROM users WHERE birthday_at LIKE '%august%';


/* ============ #4 ===============
* (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса 
* SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи * в порядке, заданном в списке IN.*/

SELECT * FROM catalogs WHERE id IN (5, 1, 2) 
ORDER BY
	CASE 
		WHEN id = 5 THEN 0
		ELSE id
	END;



-- Практическое задание по теме “Агрегация данных”

/* ============ #1 ===============
* Подсчитайте средний возраст пользователей в таблице users*/

SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, now())) FROM users;


/* ============ #2 ===============
* Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
* Следует учесть, что необходимы дни недели текущего года, а не года рождения.*/

SELECT count(name) AS total, DAYNAME(
	DATE_ADD(
		birthday_at, 
		INTERVAL YEAR(now())- YEAR(birthday_at) year)
	) AS date 
FROM users GROUP BY date ORDER BY total;






