/* ============ #1 =============== 
* Составьте список пользователей users, которые осуществили хотя бы 
* один заказ orders в интернет магазине.
*/

-- заполняем данными пользователей, совершивших покупки (Александр, Мария)
INSERT INTO orders (user_id) VALUES (3),(6);
-- заполняем данными о совершенных покупках
INSERT INTO orders_products (order_id, product_id, total) 
VALUES (1, 6, 2), (1, 2, 1), (2, 3, 1);

-- выполняем задание
-- в таблице "orders_products" находим заказы "order_id"
SELECT order_id FROM orders_products GROUP BY order_id;
-- в таблице "orders" находим id пользователей "user_id"
SELECT user_id FROM orders WHERE id IN 
	(SELECT order_id FROM orders_products GROUP BY order_id);
-- в таблице "users" находим имена пользователей
SELECT name FROM users WHERE id IN 
	(SELECT user_id FROM orders WHERE id IN 
		(SELECT order_id FROM orders_products GROUP BY order_id)
	);


/* ============ #2 =============== 
* Выведите список товаров products и разделов catalogs, который соответствует товару.
*/

SELECT 
	products.id, 
	products.name, 
	products.price,
	catalogs.name
FROM products
LEFT JOIN 
	catalogs
ON 
	catalogs.id = products.catalog_id;






