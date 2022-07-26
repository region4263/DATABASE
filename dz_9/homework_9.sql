-- Практическое задание по теме “Транзакции, переменные, представления”

--===================  1  ======================
/*В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
* Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.*/

CREATE DATABASE sample;
DROP DATABASE sample;

DROP TABLE IF EXISTS sample.users;
CREATE TABLE sample.users (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL COMMENT 'Имя покупателя',
  birthday_at date DEFAULT NULL COMMENT 'Дата рождения',
  created_at datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY id (id)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Покупатели';

START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
COMMIT;

SELECT * FROM sample.users;
SELECT * FROM shop.users;



--===================  2  ======================
/*Создайте представление, которое выводит название name товарной позиции из таблицы 
* products и соответствующее название каталога name из таблицы catalogs.*/

CREATE VIEW name AS 
SELECT p.name, c.name AS desription
FROM products p 
JOIN catalogs c 
WHERE p.catalog_id = c.id;

SELECT * FROM name;

SHOW tables;
DROP VIEW IF EXISTS name;



-- Практическое задание по теме “Хранимые процедуры и функции, триггеры"

--===================  1  ======================
/*Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости 
* от текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
* с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", 
* с 00:00 до 6:00 — "Доброй ночи".*/

DROP FUNCTION IF EXISTS hello;

DELIMITER *

CREATE FUNCTION hello()
RETURNS TEXT DETERMINISTIC
BEGIN
	CASE
		WHEN TIME_FORMAT(now(), '%k:%i') BETWEEN '00:00' AND '05:59' THEN 
			RETURN 'Доброй ночи!';
		WHEN TIME_FORMAT(now(), '%k:%i') BETWEEN '06:00' AND '11:59' THEN 
			RETURN 'Доброе утро!';
		WHEN TIME_FORMAT(now(), '%k:%i') BETWEEN '12:00' AND '17:59' THEN 
			RETURN 'Добрый день!';
		WHEN TIME_FORMAT(now(), '%k:%i') BETWEEN '18:00' AND '23:59' THEN 
			RETURN 'Добрый вечер!';
	END CASE;
END *

DELIMITER ;


--===================  2  ======================
/* В таблице products есть два текстовых поля: name с названием товара и description 
* с его описанием. Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба 
* поля принимают неопределенное значение NULL неприемлема. Используя триггеры, добейтесь 
* того, чтобы одно из этих полей или оба поля были заполнены. При попытке присвоить полям 
* NULL-значение необходимо отменить операцию.*/

DELIMITER *

DROP TRIGGER IF EXISTS not_null *

CREATE TRIGGER not_null BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF NEW.name IS NULL AND NEW.description IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'попытка присвоить обоим полям NULL-значение - это неприемлемо!';
	END IF;
END *

DELIMITER ;



