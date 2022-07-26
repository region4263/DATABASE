-- создаем таблицу блог
DROP TABLE IF EXISTS blog;
CREATE TABLE blog(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,  -- кто загрузил текст
	txt TEXT NOT NULL,  -- текст блога
	created_at DATETIME NOT NULL DEFAULT NOW(),  -- время создания сообщения
	FOREIGN KEY (user_id) REFERENCES users (id)
);

-- добавим два сообщения блога у Пети, одно сообщение у Васи
INSERT blog VALUES (DEFAULT, 1, 'text Text Text Text Text Text Text Text', DEFAULT);
INSERT blog VALUES (DEFAULT, 1, 'V2 2 2 2 Text Text Text text text2 text2', DEFAULT);
INSERT blog VALUES (DEFAULT, 2, '3 3 3 3 Text Text Text text text3 text3', DEFAULT);

SELECT * FROM blog;


-- создаём таблицу комментариев к тексту блогов
DROP TABLE IF EXISTS comments;
CREATE TABLE comments(
	comments_id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL,  -- кто загрузил комментарий к тексту блога
	to_user_id BIGINT UNSIGNED NOT NULL,  -- кому загрузил комментарий
	txt TEXT NOT NULL,  -- текст комментария
	created_at DATETIME NOT NULL DEFAULT NOW(),  -- время создания текста
	FOREIGN KEY (from_user_id) REFERENCES users (id),
	FOREIGN KEY (to_user_id) REFERENCES users (id),
	FOREIGN KEY (comments_id) REFERENCES blog (id)
);

-- добавим два сообщения блога у Пети, одно сообщение у Васи
INSERT comments VALUES (DEFAULT, 1, 2, 'text Text Text Text Text Text Text Text', DEFAULT);
INSERT comments VALUES (DEFAULT, 1, 2, 'V2 2 2 2 Text Text Text text text2 text2', DEFAULT);
INSERT comments VALUES (DEFAULT, 2, 1, '3 3 3 3 Text Text Text text text3 text3', DEFAULT);

SELECT * FROM comments;


-- создадим таблицу форума
DROP TABLE IF EXISTS forum;
CREATE TABLE forum(
	forum_id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL,  -- кто создал форум
	name VARCHAR(50) NOT NULL UNIQUE,  -- название форума
	created_at DATETIME NOT NULL DEFAULT NOW(),  -- время создания форума
	FOREIGN KEY (from_user_id) REFERENCES users (id)
);

-- Петя создаёт форум
INSERT forum VALUES (DEFAULT, 1, 'Говорилка', DEFAULT);

SELECT * FROM forum;


