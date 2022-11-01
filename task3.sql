-- CREATING SCHEMA TEST_SCHEMA
CREATE SCHEMA IF NOT EXISTS TEST_SCHEMA;

-- CREATING TABLE "City"
CREATE TABLE TEST_SCHEMA.City
(
	"city_id" SERIAL,
	"city_name" VARCHAR(255) NOT NULL,
	PRIMARY KEY ("city_id")
);

-- CREATING TABLE "Country"
CREATE TABLE TEST_SCHEMA.Country
(
	"country_id" SERIAL,
	"country_name" INT NOT NULL,
	"city_id" INT,
	PRIMARY KEY ("country_id"),
	FOREIGN KEY ("city_id") REFERENCES TEST_SCHEMA.City("city_id")
);

-- INSERT DATA
-- INSERT CITY
INSERT INTO TEST_SCHEMA.City ("city_name") VALUES ('Москва');
INSERT INTO TEST_SCHEMA.City ("city_name") VALUES ('Рим');
INSERT INTO TEST_SCHEMA.City ("city_name") VALUES ('Пекин');
INSERT INTO TEST_SCHEMA.City ("city_name") VALUES ('Вашингтон');
INSERT INTO TEST_SCHEMA.City ("city_name") VALUES ('Бразилия');
INSERT INTO TEST_SCHEMA.City ("city_name") VALUES ('Канберра');
INSERT INTO TEST_SCHEMA.City ("city_name") VALUES ('Нью-Дели');

-- CHANGE TYPR OF "COUNTRY_NAME" ON TABLE "COUNTRY"
ALTER TABLE TEST_SCHEMA.Country ALTER COLUMN country_name TYPE VARCHAR(255);

-- INSERT COUNTRY
INSERT INTO TEST_SCHEMA.Country ("country_name", "city_id") VALUES ('Россия', '1');
INSERT INTO TEST_SCHEMA.Country ("country_name", "city_id") VALUES ('Италия', '2');
INSERT INTO TEST_SCHEMA.Country ("country_name", "city_id") VALUES ('Китай', '3');
INSERT INTO TEST_SCHEMA.Country ("country_name", "city_id") VALUES ('США', '4');
INSERT INTO TEST_SCHEMA.Country ("country_name", "city_id") VALUES ('Бразилия', '5');
INSERT INTO TEST_SCHEMA.Country ("country_name", "city_id") VALUES ('Австралия', '6');
INSERT INTO TEST_SCHEMA.Country ("country_name", "city_id") VALUES ('Индия', '7');
INSERT INTO TEST_SCHEMA.Country ("country_name") VALUES ('Токио');

-- COPY FROM TABLE TO TABLE
INSERT INTO TEST_SCHEMA.City (city_name)
SELECT Country.country_name FROM TEST_SCHEMA.Country
WHERE Country.country_id = 15; -- Ваш ID, у меня 15, у вас возможно 8!!
DELETE FROM TEST_SCHEMA.Country WHERE "country_id" = 15;

-- CREATING TABLE FOR PASSENGER FROM ANOTHER SHEMA
SELECT surname, name, secondname INTO TEST_SCHEMA.PASSENGER_COPY FROM AIRLINE.PASSENGER;

