CREATE SCHEMA IF NOT EXISTS AIRLINE;

CREATE TABLE AIRLINE.AIRLINE
(
    airline_id      SERIAL PRIMARY KEY,
    airline_name    VARCHAR(255)
);
COMMENT ON COLUMN AIRLINE.AIRLINE."airline_id"      IS 'id авиакомпании';
COMMENT ON COLUMN AIRLINE.AIRLINE."airline_name"    IS 'наименование авиакомпании';


CREATE TYPE AIRLINE.CLASS_ENUM AS ENUM('1','2','3');
CREATE TABLE AIRLINE.PLACE
(
    place_id    SERIAL PRIMARY KEY,
    class_id    AIRLINE.CLASS_ENUM NOT NULL,
    is_free     boolean NOT NULL DEFAULT TRUE
);
COMMENT ON COLUMN AIRLINE.PLACE."place_id"  IS 'id места';
COMMENT ON COLUMN AIRLINE.PLACE."class_id"  IS 'тип класса';
COMMENT ON COLUMN AIRLINE.PLACE."is_free"   IS 'свободно или нет';


CREATE TABLE AIRLINE.CATEGORY
(
    category_id     SERIAL PRIMARY KEY,
    category_name   varchar(255) NOT NULL
);

CREATE TABLE AIRLINE.RATE
(
    rate_id SERIAL PRIMARY KEY,
    rate    real NOT NULL
);
COMMENT ON COLUMN AIRLINE.RATE."rate_id"    IS 'id тарифа';
COMMENT ON COLUMN AIRLINE.RATE."rate"       IS 'тариф';


CREATE TABLE AIRLINE.COUNTRY
(
    country_id      SERIAL PRIMARY KEY,
    country_name    varchar(64) NOT NULL
);
COMMENT ON COLUMN AIRLINE.COUNTRY."country_id"   IS 'id страны';
COMMENT ON COLUMN AIRLINE.COUNTRY."country_name" IS 'наименование страны';


CREATE TABLE AIRLINE.CITY
(
    city_id     SERIAL PRIMARY KEY,
    country_id  INT NOT NULL,
    city_name   varchar(64) NOT NULL,
    FOREIGN KEY ("country_id") REFERENCES AIRLINE.COUNTRY("country_id")
);
COMMENT ON COLUMN AIRLINE.CITY."city_id"    IS 'id города';
COMMENT ON COLUMN AIRLINE.CITY."country_id" IS 'id страны';
COMMENT ON COLUMN AIRLINE.CITY."city_name"  IS 'наименование города';


CREATE TYPE  AIRLINE.SEX_ENUM AS ENUM('m','f') ;
CREATE TABLE AIRLINE.PASSENGER
(
    passenger_id    SERIAL PRIMARY KEY,
    name            varchar(32) NOT NULL,
    surname         varchar(64) NOT NULL,
    secondname      varchar(64) NOT NULL,
    sex             AIRLINE.SEX_ENUM NOT NULL,
    document        varchar(8) NOT NULL DEFAULT 'PASSPORT',
    document_number int NOT NULL,
    category_id     int NOT NULL,
    FOREIGN KEY ("category_id") REFERENCES AIRLINE.CATEGORY("category_id")
);
COMMENT ON COLUMN AIRLINE.PASSENGER."passenger_id"      IS 'id авиаперелета';
COMMENT ON COLUMN AIRLINE.PASSENGER."name"              IS 'имя пассажира';
COMMENT ON COLUMN AIRLINE.PASSENGER."surname"           IS 'фамилия пассажира';
COMMENT ON COLUMN AIRLINE.PASSENGER."secondname"        IS 'отчество пассажира';
COMMENT ON COLUMN AIRLINE.PASSENGER."sex"               IS 'пол пассажира';
COMMENT ON COLUMN AIRLINE.PASSENGER."document"          IS 'документ';
COMMENT ON COLUMN AIRLINE.PASSENGER."document_number"   IS 'номер документа';
COMMENT ON COLUMN AIRLINE.PASSENGER."category_id"       IS 'возрастная категория';


CREATE TABLE AIRLINE.FLIGHT
(
    flight_id           SERIAL PRIMARY KEY,
    depature_datetime   TIMESTAMP NOT NULL,
    arrival_datetime    TIMESTAMP NOT NULL,
    depature_city_id    INT NOT NULL,
    arrival_city_id     INT NOT NULL,
    FOREIGN KEY ("depature_city_id") REFERENCES AIRLINE.CITY("city_id"),
    FOREIGN KEY ("arrival_city_id")  REFERENCES AIRLINE.CITY("city_id")
);
COMMENT ON COLUMN AIRLINE.FLIGHT."flight_id"            IS 'id авиаперелета';
COMMENT ON COLUMN AIRLINE.FLIGHT."depature_datetime"    IS 'дата и время отбытия';
COMMENT ON COLUMN AIRLINE.FLIGHT."arrival_datetime"     IS 'дата и время прибытия';
COMMENT ON COLUMN AIRLINE.FLIGHT."depature_city_id"     IS 'город отбытия';
COMMENT ON COLUMN AIRLINE.FLIGHT."arrival_city_id"      IS 'город прибытия';


CREATE TYPE AIRLINE.PAYMENT_TYPE AS ENUM ('cash', 'apple_pay', 'sbp');
CREATE TABLE AIRLINE.TICKET
(
    ticket_id       SERIAL PRIMARY KEY,
    flight_id       INT NOT NULL,
    place_id        INT NOT NULL,
    passenger_id    INT NOT NULL,
    sale_date       TIMESTAMP NOT NULL DEFAULT NOW(),
    payment_type    AIRLINE.PAYMENT_TYPE,
    is_paid         BOOLEAN NOT NULL DEFAULT FALSE,
    airline_id      INT NOT NULL,
    rate_id         INT NOT NULL,

    FOREIGN KEY ("flight_id")    REFERENCES AIRLINE.FLIGHT("flight_id"),
	FOREIGN KEY ("place_id")     REFERENCES AIRLINE.PLACE("place_id"),
	FOREIGN KEY ("passenger_id") REFERENCES AIRLINE.PASSENGER("passenger_id"),
	FOREIGN KEY ("airline_id")   REFERENCES AIRLINE.AIRLINE("airline_id"),
	FOREIGN KEY ("rate_id")      REFERENCES AIRLINE.RATE("rate_id")
);
COMMENT ON COLUMN AIRLINE.TICKET."ticket_id"    IS 'id билета';
COMMENT ON COLUMN AIRLINE.TICKET."flight_id"    IS 'id полета';
COMMENT ON COLUMN AIRLINE.TICKET."place_id"     IS 'id места';
COMMENT ON COLUMN AIRLINE.TICKET."passenger_id" IS 'id пассажира';
COMMENT ON COLUMN AIRLINE.TICKET."sale_date"    IS 'дата продажи';
COMMENT ON COLUMN AIRLINE.TICKET."payment_type" IS 'способ оплаты';
COMMENT ON COLUMN AIRLINE.TICKET."is_paid"      IS 'оплачено или нет';
COMMENT ON COLUMN AIRLINE.TICKET."airline_id"   IS 'id авиакомпании';
COMMENT ON COLUMN AIRLINE.TICKET."rate_id"      IS 'id тарифа';
