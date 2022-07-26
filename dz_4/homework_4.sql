/* ============ #1 =============== 
* Заполнить все таблицы БД vk данными (не больше 10-20 записей в каждой таблице) 
*/
INSERT INTO users (firstname, lastname, email, phone)
VALUES
  ("Dillon","Kidd","convallis@icloud.com","08004056131"),
  ("Porter","Smith","arcu@aol.couk","08003345529"),
  ("Hashim","Greene","dolor@icloud.org","08002554810"),
  ("Jesse","Bryant","pharetra.nam@hotmail.couk","08002242354"),
  ("Ralph","Gould","at.velit@icloud.edu","08004538205"),
  ("Nathan","Cannon","lobortis.quis@hotmail.net","08050732512"),
  ("Thor","Meyers","vulputate.dui@protonmail.ca","08006653648"),
  ("Porter","Howell","orci.tincidunt.adipiscing@hotmail.couk","08070583768"),
  ("Mufutau","Odonnell","praesent.luctus.curabitur@yahoo.org","08007887819"),
  ("Callum","Sargent","phasellus.fermentum.convallis@icloud.edu","08090653759"),
   ("Alan","Slater","mi.pede.nonummy@protonmail.net","08002091675"),
  ("Carl","Baird","non.lorem.vitae@aol.org","08005120153"),
  ("Griffith","Kaufman","posuere.cubilia@outlook.org","08008393600"),
  ("Aidan","Murphy","diam.at@outlook.org","08004733423"),
  ("Upton","Craig","mauris.sit@google.edu","08008157394");
  
INSERT INTO communities (name, description, admin_id)
VALUES
  ("Dictum","semper, dui lectus rutrum urna, nec luctus felis purus ac",6),
  ("Tincidunt","velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat,",6),
  ("Amet Lorem Foundation","magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem",3),
  ("Sed Limited","ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem",5),
  ("Facilisis","ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius",6),
  ("Eu LLC","Nam ligula elit, pretium et, rutrum non, hendrerit id, ante.",10),
  ("Fusce Diam","dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque",1),
  ("Et Limited","sem, vitae aliquam eros turpis non enim. Mauris quis turpis",4),
  ("Proin Vel","dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc",8),
  ("Cras Dolor","interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt",1),
  ("Curabitur Ltd","eleifend, nunc risus varius orci, in consequat enim diam vel",5),
  ("Sapien Aenean","Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper",4),
  ("Erat Vivamus","nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse",6),
  ("Convallis Erat","dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel,",7),
  ("Neque Sed","sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer",8);


INSERT INTO communities_users 
VALUES 
  (2, 1, DEFAULT),
  (4, 2, "2022-11-19 04:47:45"),
  (1, 6, DEFAULT),
  (6, 2, DEFAULT),
  (1, 8, "2022-07-26 14:36:52"),
  (7, 2, DEFAULT),
  (8, 9, "2022-01-26 09:40:59"),
  (1, 3, DEFAULT),
  (3, 4, "2022-10-02 11:51:57"),
  (9, 7, "2022-07-19 00:19:30"),
  (7, 8, "2022-11-19 04:47:45"),
  (2, 4, "2022-07-26 14:36:52"),
  (8, 4, "2022-01-26 09:40:59"),
  (7, 6, "2022-07-19 00:19:30"),
  (5, 2, "2022-10-02 11:51:57");


INSERT friend_requests
VALUES
  (7,8, TRUE),
  (2,4, DEFAULT),
  (8,4, TRUE),
  (7,6, FALSE),
  (5,2, TRUE),
  (4,5, TRUE),
  (8,10, DEFAULT),
  (3,5, FALSE),
  (1,7, TRUE),
  (4,10, TRUE);


INSERT INTO media 
VALUES 
    (DEFAULT, 1, 1, 'fm1.png', 140, DEFAULT),
    (DEFAULT, 4, 2, 'doc67.doc', 38, DEFAULT),
    (DEFAULT, 15, 2, 'rtdfyi.jpg', 163, DEFAULT),
    (DEFAULT, 8, 2, 'rtyfffi.jpg', 51, DEFAULT),
    (DEFAULT, 4, 3, 'do1c.doc', 72, DEFAULT),
    (DEFAULT, 10, 1, 'idddm1.png', 162, DEFAULT),
    (DEFAULT, 1, 1, 'rtsfsyi.jpg', 130, DEFAULT),
    (DEFAULT, 9, 2, 'do2c.doc', 56, DEFAULT),
    (DEFAULT, 2, 3, 'aaaaaaartyi.jpg', 87, DEFAULT),
    (DEFAULT, 3, 1, '6doc.doc', 81, DEFAULT),
    (DEFAULT, 4, 2, 'isdtym1.png', 163, DEFAULT);


INSERT messages (from_user_id, to_user_id, txt)
VALUES 
    (1, 15, "leo elementum sem, vitae aliquam eros turpis non enim. Mauris"),
    (9, 9, "lectus ante dictum mi, ac mattis velit justo nec ante."),
    (2, 7, "vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor"),
    (3, 9, "malesuada fames ac turpis egestas. Fusce aliquet magna a neque."),
    (4, 5, "at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac"),
    (12, 4, "magna. Nam ligula elit, pretium et, rutrum non, hendrerit id,"),
    (13, 7, "mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent"),
    (12, 3, "Curabitur ut odio vel est tempor bibendum. Donec felis orci,"),
    (9, 13, "Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus"),
    (6, 8, "ac nulla. In tincidunt congue turpis. In condimentum. Donec at");


INSERT profiles 
VALUES 
  (3, "m", "2000-02-13", "Kurgan", "Russia", NULL),
  (4, "x", "2002-07-02", "Rostov", "Russia", NULL),
  (5, "m", "2003-03-15", "Astrakhan", "Russia", 1),
  (6, "m", "2001-08-13", "Shenkursk", "Russia", NULL),
  (7, "m", "2001-10-31", "Smolensk", "Russia", NULL),
  (8, "f", "2003-05-03", "Voronezh", "Russia", NULL),
  (9, "m", "2002-01-30", "Lipetsk", "Russia", NULL),
  (10, "f", "2002-06-11", "Penza", "Russia", NULL),
  (11, "f", "2000-06-11", "Penza", "Russia", NULL),
  (12, "x", "2006-07-02", "Rostov", "Russia", NULL),
  (13, "f", "2003-08-28", "Sakhalin", "Russia", NULL),
  (14, "m", "2001-09-13", "Shenkursk", "Russia", NULL),
  (15, "m", "2001-11-21", "Smolensk", "Russia", NULL),
  (16, "f", "2003-01-10", "Voronezh", "Russia", NULL),
  (17, "m", "2002-11-14", "Lipetsk", "Russia", NULL);


/* ============ #2 ================ 
* Написать скрипт, возвращающий список имен (только firstname) 
* пользователей без повторений в алфавитном порядке
*/
SELECT DISTINCT firstname FROM users ORDER BY firstname;


/* ============ #3 ================
* Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
* Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
*/
ALTER TABLE profiles ADD COLUMN is_active BOOLEAN DEFAULT TRUE;
UPDATE profiles SET is_active = FALSE WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 18;


/* ============ #4 ================
* Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
*/
DELETE FROM messages WHERE TIMESTAMPDIFF(SECOND, created_at, NOW()) < 0;



