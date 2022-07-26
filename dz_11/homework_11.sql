DROP TABLE IF EXISTS logs;
CREATE TABLE logs(
	created_at datetime DEFAULT CURRENT_TIMESTAMP,
	table_name varchar(255),
	id bigint unsigned NOT NULL AUTO_INCREMENT,
	name varchar(255) DEFAULT NULL,
	PRIMARY KEY (id)
)ENGINE=Archive;

DELIMITER *

CREATE TRIGGER logs_add_users AFTER INSERT ON users
FOR EACH ROW 
BEGIN 
	DECLARE x1 varchar(255);
    	SELECT NEW.name INTO x FROM users ORDER BY id DESC LIMIT 1;
    	INSERT INTO logs(table_name, name) VALUES ('users', x1);
END*

CREATE TRIGGER logs_add_catalogs AFTER INSERT ON catalogs
FOR EACH ROW 
BEGIN 
	DECLARE x2 varchar(255);
    	SELECT NEW.name INTO x FROM catalogs ORDER BY id DESC LIMIT 1;
    	INSERT INTO logs(table_name, name) VALUES ('catalogs', x2);
END*

CREATE TRIGGER logs_add_products AFTER INSERT ON products
FOR EACH ROW 
BEGIN 
	DECLARE x3 varchar(255);
   	SELECT NEW.name INTO x FROM products ORDER BY id DESC LIMIT 1;
    	INSERT INTO logs(table_name, name) VALUES ('products', x3);
END*

DELIMITER ;

