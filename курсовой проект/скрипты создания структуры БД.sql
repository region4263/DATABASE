/* База данных описывает модель хранения данных интернет-магазина "kazanexpress". 
* 
* База данных решает задачи хранения информации о наименовании продукта, его бренда, 
* цвета, продавца, данных о пользователях (их имени, даты рождения и даты регистрации 
* в магазине), их отзывах о продукте, а также информации о заказах и скидках на продукт.
*/

DROP DATABASE IF EXISTS my_project;
CREATE DATABASE IF NOT EXISTS my_project;
USE my_project;


-- ========= 1 ===========
DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT 'Название раздела',
	UNIQUE unique_name(name(10))	
)COMMENT='Разделы' ENGINE=InnoDB;

-- ========= 2 ===========
DROP TABLE IF EXISTS seller;
CREATE TABLE seller (
	id SERIAL PRIMARY KEY,
	seller_name VARCHAR(255) COMMENT 'Название продавца'
)COMMENT='Продавец' ENGINE=InnoDB;

-- ========= 3 ===========
DROP TABLE IF EXISTS colour;
CREATE TABLE colour (
	id SERIAL PRIMARY KEY,
	colour VARCHAR(255) COMMENT 'Название цвета'
)COMMENT='Цвет' ENGINE=InnoDB;

-- ========= 4 ===========
DROP TABLE IF EXISTS brand;
CREATE TABLE brand (
	id SERIAL PRIMARY KEY,
	brand VARCHAR(255) COMMENT 'Название бренда'
)COMMENT='Бренд' ENGINE=InnoDB;

-- ========= 5 ===========
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  	id SERIAL PRIMARY KEY,
  	name VARCHAR(255) COMMENT 'Имя покупателя',
  	birthday_at DATE COMMENT 'Дата рождения',
  	created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) COMMENT = 'Покупатели' ENGINE=InnoDB;

-- ========= 6 ===========
DROP TABLE IF EXISTS product;
CREATE TABLE product (
	id SERIAL PRIMARY KEY,
	product_name VARCHAR(255) COMMENT 'Название',
  	price DECIMAL (11,2) COMMENT 'Цена',
	catalog_id BIGINT UNSIGNED NOT NULL,
	seller_id BIGINT UNSIGNED NOT NULL,
	colour_id BIGINT UNSIGNED NOT NULL,
	brand_id BIGINT UNSIGNED NOT NULL,	
	KEY index_of_catalogs_id (catalog_id),
	KEY index_of_seller_id (seller_id),
	KEY index_of_colour_id (colour_id),
	KEY index_of_brand_id (brand_id),	
	CONSTRAINT index_of_catalogs_id FOREIGN KEY (catalog_id) REFERENCES catalogs (id),
	CONSTRAINT index_of_seller_id FOREIGN KEY (seller_id) REFERENCES seller (id),
	CONSTRAINT index_of_colour_id FOREIGN KEY (colour_id) REFERENCES colour (id),
	CONSTRAINT index_of_brand_id FOREIGN KEY (brand_id) REFERENCES brand (id)	
) COMMENT = 'Товар' ENGINE=InnoDB;

-- ========= 7 ===========
DROP TABLE IF EXISTS feedback;
CREATE TABLE feedback (
	id SERIAL PRIMARY KEY,
	feedback_id BIGINT UNSIGNED,
	user_id BIGINT UNSIGNED,
	txt TEXT DEFAULT NULL,
	KEY index_of_feedback_id (feedback_id),
	KEY index_of_user_id_feedback (user_id),
	CONSTRAINT index_of_feedback_id FOREIGN KEY (feedback_id) REFERENCES product (id),
	CONSTRAINT index_of_user_id_feedback FOREIGN KEY (user_id) REFERENCES users (id)
) COMMENT = 'Отзыв о товаре' ENGINE=InnoDB;

-- ========= 8 ===========
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  	id SERIAL PRIMARY KEY,
  	user_id BIGINT UNSIGNED,
  	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  	KEY index_of_user_id (user_id),
  	CONSTRAINT index_of_user_id FOREIGN KEY (user_id) REFERENCES users (id)
) COMMENT = 'Заказы' ENGINE=InnoDB;

-- ========= 9 ===========
DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
  	id SERIAL PRIMARY KEY,
  	order_id BIGINT UNSIGNED,
  	product_id BIGINT UNSIGNED,
  	total INT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  	KEY index_of_order_id (order_id),
  	KEY index_of_product_id (product_id),
  	CONSTRAINT index_of_order_id FOREIGN KEY (order_id) REFERENCES orders (id),
  	CONSTRAINT index_of_product_id FOREIGN KEY (product_id) REFERENCES product (id)
) COMMENT = 'Состав заказа' ENGINE=InnoDB;

-- ========= 10 ===========
DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
  	id SERIAL PRIMARY KEY,
  	old_price DECIMAL (11,2) COMMENT 'Старая цена',
  	new_price DECIMAL (11,2) COMMENT 'Новая цена',
  	product_id BIGINT UNSIGNED,
  	discount FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0 до 1.0',
  	started_at DATETIME,
  	finished_at DATETIME,
  	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  	KEY index_of_product_id_discounts (product_id),
  	CONSTRAINT index_of_product_id_discounts FOREIGN KEY (product_id) REFERENCES product (id)
) COMMENT = 'Скидки' ENGINE=InnoDB;



-- скрипты характерных выборок (SELECT, включающие группировки, JOIN'ы, вложенные запросы);
SELECT 
	p.product_name, 
	c.name, 
	f.txt, 
	u.name 
FROM product p
JOIN catalogs c ON p.catalog_id = c.id 
JOIN feedback f ON p.id = f.feedback_id 
JOIN users u ON u.id = f.user_id; 


SELECT 
	p.product_name,
	COUNT(p.product_name)
FROM product p
GROUP BY p.product_name;

SELECT 
	product_name	
FROM product WHERE brand_id = 
	(SELECT id FROM brand WHERE brand = 'Egestas Lacinia Corp.');
	

SELECT 
	txt,
	(SELECT name FROM users WHERE id = feedback.user_id) AS name, 
	(SELECT product_name FROM product WHERE id = feedback_id) AS product_name
FROM feedback;

-- представления (минимум 2);
CREATE OR REPLACE VIEW prod_name_order AS 
SELECT * FROM product ORDER BY product_name;

SELECT * FROM prod_name_order;
DROP VIEW IF EXISTS prod_name_order;

CREATE OR REPLACE VIEW all_data AS 
SELECT 
	b.brand,
	c.colour,
	s.seller_name,
	ca.name
FROM product p 
JOIN colour c ON c.id = p.colour_id 
JOIN brand b ON b.id = p.brand_id 
JOIN seller s ON s.id = p.seller_id 
JOIN catalogs ca ON ca.id = p.catalog_id 
WHERE p.id = 1;

SELECT * FROM all_data;
DROP VIEW IF EXISTS all_data;


-- Хранимая процедура / функция / триггер (на выбор, 1 шт.);
DELIMITER //
CREATE TRIGGER feedback_count AFTER INSERT ON feedback
FOR EACH ROW
BEGIN
	SELECT COUNT(txt) INTO @total FROM feedback;
END//
DELIMITER ;

SELECT @total;

SHOW TRIGGERS;
DROP TRIGGER IF EXISTS feedback_count;



