INSERT INTO catalogs (name) VALUES 
	("Электроника"),
	("Бытовая техника"),
	("Одежда"),
	("Обувь"),
	("Аксессуары"),
	("Красота"),
	("Здоровье"),
	("Товары для дома"),
	("Строительство и ремонт"),
	("Автотовары");
	
INSERT INTO seller (seller_name) VALUES 
	("Aliquam Corp."),
	("Sed Neque Sed Ltd"),
	("Ultrices Posuere Cubilia Limited"),
	("Torquent Associates"),
	("Leo PC"),
	("Nunc Ac Associates"),
	("Dapibus Quam LLP"),
	("Lobortis Quis Pede Inc."),
	("Egestas LLC"),
	("Lectus Quis Corporation");
 
 INSERT INTO colour (colour) VALUES 
	("красный"),
	("оранжевый"),
	("желтый"),
	("еленый"),
	("голубой"),
	("синий"),
	("фиолетовый"),
	("черный"),
	("белый"),
	("серый");

INSERT INTO brand (brand) VALUES
	("Egestas Lacinia Corp."),
 	("Sagittis Felis Limited"),
  	("Lacinia Vitae Corp."),
  	("Risus In Institute"),
  	("Quisque Porttitor Limited"),
	("Id Erat Corp."),
	("Blandit Mattis LLP"),
	("Mauris Nulla Corporation"),
	("Sodales At Industries"),
	("Tempus Lorem LLP");

INSERT INTO users (name, birthday_at)
VALUES
  	("Stacey Gray","2021-12-14 19:55:26"),
  	("Geoffrey Horne","2019-08-05 21:18:10"),
  	("Cassidy Castillo","2023-06-23 14:15:24"),
  	("Maggie Munoz","2018-06-07 11:04:29"),
  	("Anastasia Edwards","2021-05-08 16:25:29"),
 	("Sophia Snider","2019-07-27 17:57:20"),
 	("Howard Franco","2019-04-24 09:09:30"),
 	("McKenzie Burt","2019-12-21 06:02:49"),
 	("Marsden Galloway","2022-10-19 16:53:58"),
 	("Audrey Mcmillan","2020-07-23 03:45:15");
 
INSERT INTO product (product_name, price, catalog_id, seller_id, colour_id, brand_id)
VALUES
	("Наушники", 1700.00, 1, 1, 1, 1),
	("Кофемолка", 2300.00, 2, 2, 2, 2),
	("Шорты", 700.00, 3, 3, 3, 3),
	("Сланцы", 800.00, 4, 4, 4, 4),
	("Кольцо", 3200.00, 5, 5, 5, 5),
	("Лак для ногтей", 300.00, 6, 6, 6, 6),
	("Хлоргексидин", 50.00, 7, 7, 7, 7),
	("Набор ножей", 2400.00, 8, 8, 8, 8),
	("Шпатель", 200.00, 9, 9, 9, 9),
	("Брелок", 110.00, 1, 2, 3, 4);

INSERT INTO feedback (feedback_id, user_id, txt) VALUES
	(1, 3, "sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris"),
  	(2, 3, "mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae,"),
  	(4, 1, "mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet,"),
  	(2, 5, "magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna."),
  	(7, 6, "turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut,"),
  	(9, 7, "enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus."),
  	(8, 2, "Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie"),
  	(3, 4, "a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu"),
  	(6, 9, "elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu"),
  	(5, 8, "pretium aliquet, metus urna convallis erat, eget tincidunt dui augue");
