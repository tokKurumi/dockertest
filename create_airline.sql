-- CREATING SCHEMA AIRLINE
CREATE SCHEMA IF NOT EXISTS AIRLINE;

-- CREATING TABLE "AIRLINE"
CREATE TABLE AIRLINE.AIRLINE
(
	"airline_id" SERIAL,
	"airline_name" VARCHAR(255),
	PRIMARY KEY ("airline_id")
);
COMMENT ON COLUMN AIRLINE.AIRLINE."airline_id" IS 'id авиакомпании';
COMMENT ON COLUMN AIRLINE.AIRLINE."airline_name" IS 'наименование авиакомпании';

-- CREATING TABLE "COUNTRY"
CREATE TABLE AIRLINE.COUNTRY
(
	"country_id" SERIAL,
	"country_name" VARCHAR(64) NOT NULL,
	PRIMARY KEY ("country_id")
);
COMMENT ON COLUMN AIRLINE.COUNTRY."country_id" IS 'id страны';
COMMENT ON COLUMN AIRLINE.COUNTRY."country_name" IS 'наименование страны';

-- CREATING TABLE "CITY"
CREATE TABLE AIRLINE.CITY
(
	"city_id" SERIAL,
	"country_id" INT NOT NULL,
	"city_name" VARCHAR(128) NOT NULL,
	PRIMARY KEY ("city_id"),
	FOREIGN KEY ("country_id") REFERENCES AIRLINE.COUNTRY("country_id")
);
COMMENT ON COLUMN AIRLINE.CITY."city_id" IS 'id города';
COMMENT ON COLUMN AIRLINE.CITY."country_id" IS 'id страны';
COMMENT ON COLUMN AIRLINE.CITY."city_name" IS 'наименование города';

-- CREATING TABLE "CATEGORY"
CREATE TABLE AIRLINE.CATEGORY
(
	"category_id" SERIAL,
	"category_name" VARCHAR(255) NOT NULL,
	PRIMARY KEY ("category_id")
);
COMMENT ON COLUMN AIRLINE.CATEGORY."category_id" IS 'id возрастной категории';
COMMENT ON COLUMN AIRLINE.CATEGORY."category_name" IS 'наименование возрастной категории';

-- CREATING TABLE "RATE"
CREATE TABLE AIRLINE.RATE
(
	"rate_id" SERIAL,
	"rate" REAL NOT NULL,
	PRIMARY KEY ("rate_id")
);
COMMENT ON COLUMN AIRLINE.RATE."rate_id" IS 'id тарифа';
COMMENT ON COLUMN AIRLINE.RATE."rate" IS 'тариф';

-- CREATING TABLE "PLACE"
CREATE TYPE AIRLINE.CLASS_TYPE AS ENUM ('1', '2', '3');
CREATE TABLE AIRLINE.PLACE
(
	"place_id" SERIAL,
	"class_id" AIRLINE.CLASS_TYPE NOT NULL,
	"is_free" BOOLEAN NOT NULL DEFAULT TRUE,
	PRIMARY KEY ("place_id")
);
COMMENT ON COLUMN AIRLINE.PLACE."place_id" IS 'id места';
COMMENT ON COLUMN AIRLINE.PLACE."class_id" IS 'тип класса';
COMMENT ON COLUMN AIRLINE.PLACE."is_free" IS 'свободно или нет';

-- CREATING TABLE "FLIGHT"
CREATE TABLE AIRLINE.FLIGHT
(
	"flight_id" SERIAL,
	"depature_datetime" TIMESTAMP NOT NULL DEFAULT NOW(),
	"arrival_datetime" TIMESTAMP NOT NULL,
	"depature_city_id" INT NOT NULL,
	"arrival_city_id" INT NOT NULL,
	PRIMARY KEY ("flight_id"),
	FOREIGN KEY ("depature_city_id") REFERENCES AIRLINE.CITY("city_id"),
	FOREIGN KEY ("arrival_city_id")  REFERENCES AIRLINE.CITY("city_id")
);
COMMENT ON COLUMN AIRLINE.FLIGHT."flight_id" IS 'id авиаперелета';
COMMENT ON COLUMN AIRLINE.FLIGHT."depature_datetime" IS 'дата и время отбытия';
COMMENT ON COLUMN AIRLINE.FLIGHT."arrival_datetime" IS 'дата и время прибытия';
COMMENT ON COLUMN AIRLINE.FLIGHT."depature_city_id" IS 'город отбытия';
COMMENT ON COLUMN AIRLINE.FLIGHT."arrival_city_id" IS 'город прибытия';

-- CREATING TABLE "PASSENGER"
CREATE TYPE AIRLINE.SEX_TYPE AS ENUM ('f', 'm');
CREATE TABLE AIRLINE.PASSENGER
(
	"passenger_id" SERIAL,
	"name" VARCHAR(64) NOT NULL,
	"surname" VARCHAR(128) NOT NULL,
	"secondname" VARCHAR(128) NOT NULL,
	"sex" AIRLINE.SEX_TYPE NOT NULL,
	"document" VARCHAR(8) NOT NULL DEFAULT 'PASSPORT',
	"document_number" INT NOT NULL,
	"category_id" INT NOT NULL,
	PRIMARY KEY ("passenger_id"),
	FOREIGN KEY ("category_id") REFERENCES AIRLINE.CATEGORY("category_id")
);
COMMENT ON COLUMN AIRLINE.PASSENGER."passenger_id" IS 'id авиаперелета';
COMMENT ON COLUMN AIRLINE.PASSENGER."name" IS 'имя пассажира';
COMMENT ON COLUMN AIRLINE.PASSENGER."surname" IS 'фамилия пассажира';
COMMENT ON COLUMN AIRLINE.PASSENGER."secondname" IS 'отчество пассажира';
COMMENT ON COLUMN AIRLINE.PASSENGER."sex" IS 'пол пассажира';
COMMENT ON COLUMN AIRLINE.PASSENGER."document" IS 'документ';
COMMENT ON COLUMN AIRLINE.PASSENGER."document_number" IS 'номер документа';
COMMENT ON COLUMN AIRLINE.PASSENGER."category_id" IS 'возрастная категория';

-- CREATING TABLE "TICKET"
CREATE TYPE AIRLINE.PAYMENT_TYPE AS ENUM ('cash', 'apple_pay', 'sbp');
CREATE TABLE AIRLINE.TICKET
(
	"ticket_id" SERIAL,
	"flight_id" INT NOT NULL,
	"place_id" INT NOT NULL,
	"passenger_id" INT NOT NULL,
	"sale_date" TIMESTAMP NOT NULL DEFAULT NOW(),
	"payment_type" AIRLINE.PAYMENT_TYPE,
	"is_paid" BOOLEAN NOT NULL DEFAULT FALSE,
	"airline_id" INT NOT NULL,
	"rate_id" INT NOT NULL,
	PRIMARY KEY ("ticket_id"),
	FOREIGN KEY ("flight_id") REFERENCES AIRLINE.FLIGHT("flight_id"),
	FOREIGN KEY ("place_id") REFERENCES AIRLINE.PLACE("place_id"),
	FOREIGN KEY ("passenger_id") REFERENCES AIRLINE.PASSENGER("passenger_id"),
	FOREIGN KEY ("airline_id") REFERENCES AIRLINE.AIRLINE("airline_id"),
	FOREIGN KEY ("rate_id") REFERENCES AIRLINE.RATE("rate_id")
);
COMMENT ON COLUMN AIRLINE.TICKET."ticket_id" IS 'id билета';
COMMENT ON COLUMN AIRLINE.TICKET."flight_id" IS 'id полета';
COMMENT ON COLUMN AIRLINE.TICKET."place_id" IS 'id места';
COMMENT ON COLUMN AIRLINE.TICKET."passenger_id" IS 'id пассажира';
COMMENT ON COLUMN AIRLINE.TICKET."sale_date" IS 'дата продажи';
COMMENT ON COLUMN AIRLINE.TICKET."payment_type" IS 'способ оплаты';
COMMENT ON COLUMN AIRLINE.TICKET."is_paid" IS 'оплачено или нет';
COMMENT ON COLUMN AIRLINE.TICKET."airline_id" IS 'id авиакомпании';
COMMENT ON COLUMN AIRLINE.TICKET."rate_id" IS 'id тарифа';
