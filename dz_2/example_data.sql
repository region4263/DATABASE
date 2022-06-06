-- Создаем БД
CREATE DATABASE example;

-- Переходим на БД example
USE example;

/* Создаем в БД example таблицу users с двумя колонками
 * первая колонка с числовыми идентификаторами
 * вторая колонка со строковыми данными произвольной длинны
 */
CREATE TABLE users(
	id INT,
	name VARCHAR(150)
);

-- Добавляем в таблицу users значения: 1 - в первую колонку, 'new_data' - во вторую 
INSERT users VALUES(1, 'new_data');

