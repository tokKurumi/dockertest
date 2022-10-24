INSERT INTO AIRLINE.COUNTRY ("country_name") VALUES ('РФ');

INSERT INTO AIRLINE.CITY ("country_id", "city_name") VALUES (1, 'Москва');
INSERT INTO AIRLINE.CITY ("country_id", "city_name") VALUES (1, 'Санкт-Петербург');
INSERT INTO AIRLINE.CITY ("country_id", "city_name") VALUES (1, 'Саранск');
INSERT INTO AIRLINE.CITY ("country_id", "city_name") VALUES (1, 'Нижний Новгород');
INSERT INTO AIRLINE.CITY ("country_id", "city_name") VALUES (1, 'Казань');
INSERT INTO AIRLINE.CITY ("country_id", "city_name") VALUES (1, 'Сочи');
INSERT INTO AIRLINE.CITY ("country_id", "city_name") VALUES (1, 'Архангельск');
INSERT INTO AIRLINE.CITY ("country_id", "city_name") VALUES (1, 'Омск');

INSERT INTO AIRLINE.AIRLINE ("airline_name") VALUES ('Быстрее ветра');
INSERT INTO AIRLINE.AIRLINE ("airline_name") VALUES ('Крылья и хвост');
INSERT INTO AIRLINE.AIRLINE ("airline_name") VALUES ('Перелеты РФ');

INSERT INTO AIRLINE.CATEGORY ("category_name") VALUES ('Ребенок');
INSERT INTO AIRLINE.CATEGORY ("category_name") VALUES ('Взрослый');
INSERT INTO AIRLINE.CATEGORY ("category_name") VALUES ('Пожилой');

INSERT INTO AIRLINE.PLACE ("is_free", "class_id") VALUES (false, '1');
INSERT INTO AIRLINE.PLACE ("is_free", "class_id") VALUES (false, '2');
INSERT INTO AIRLINE.PLACE ("is_free", "class_id") VALUES (false, '3');
INSERT INTO AIRLINE.PLACE ("is_free", "class_id") VALUES (false, '1');
INSERT INTO AIRLINE.PLACE ("is_free", "class_id") VALUES (false, '2');
INSERT INTO AIRLINE.PLACE ("is_free", "class_id") VALUES (true, '3');
INSERT INTO AIRLINE.PLACE ("is_free", "class_id") VALUES (true, '1');
INSERT INTO AIRLINE.PLACE ("is_free", "class_id") VALUES (true, '2');
INSERT INTO AIRLINE.PLACE ("is_free", "class_id") VALUES (true, '3');

INSERT INTO AIRLINE.RATE ("rate") VALUES (6500);
INSERT INTO AIRLINE.RATE ("rate") VALUES (12340);
INSERT INTO AIRLINE.RATE ("rate") VALUES (4300);

INSERT INTO AIRLINE.FLIGHT ("depature_datetime", "arrival_datetime", "depature_city_id", "arrival_city_id") VALUES ('2022-10-28 19:10:25-07', '2022-10-28 21:10:25-07', 1, 2);
INSERT INTO AIRLINE.FLIGHT ("depature_datetime", "arrival_datetime", "depature_city_id", "arrival_city_id") VALUES ('2022-10-29 19:10:25-07', '2022-10-29 21:10:25-07', 2, 1);
INSERT INTO AIRLINE.FLIGHT ("depature_datetime", "arrival_datetime", "depature_city_id", "arrival_city_id") VALUES ('2022-11-28 19:10:25-07', '2022-11-28 21:10:25-07', 2, 3);
INSERT INTO AIRLINE.FLIGHT ("depature_datetime", "arrival_datetime", "depature_city_id", "arrival_city_id") VALUES ('2022-11-29 19:10:25-07', '2022-11-29 21:10:25-07', 3, 2);
INSERT INTO AIRLINE.FLIGHT ("depature_datetime", "arrival_datetime", "depature_city_id", "arrival_city_id") VALUES ('2022-12-28 19:10:25-07', '2022-12-28 21:10:25-07', 1, 3);
INSERT INTO AIRLINE.FLIGHT ("depature_datetime", "arrival_datetime", "depature_city_id", "arrival_city_id") VALUES ('2022-12-29 19:10:25-07', '2022-12-29 21:10:25-07', 3, 1);

INSERT INTO AIRLINE.PASSENGER ("surname", "name", "secondname", "sex", "document_number", "category_id") VALUES ('Иванова', 'Людмила', 'Ивановна', 'f', 123123, 1);
INSERT INTO AIRLINE.PASSENGER ("surname", "name", "secondname", "sex", "document_number", "category_id") VALUES ('Иванов', 'Даниил', 'Иванович', 'm', 123123, 1);
INSERT INTO AIRLINE.PASSENGER ("surname", "name", "secondname", "sex", "document_number", "category_id") VALUES ('Зайцева', 'Людмила', 'Ивановна', 'f', 123123, 2);
INSERT INTO AIRLINE.PASSENGER ("surname", "name", "secondname", "sex", "document_number", "category_id") VALUES ('Зайцев', 'Даниил', 'Иванович', 'm', 123123, 2);
INSERT INTO AIRLINE.PASSENGER ("surname", "name", "secondname", "sex", "document_number", "category_id") VALUES ('Петрова', 'Людмила', 'Ивановна', 'f', 123123, 3);
INSERT INTO AIRLINE.PASSENGER ("surname", "name", "secondname", "sex", "document_number", "category_id") VALUES ('Петров', 'Даниил', 'Иванович', 'm', 123123, 3);
INSERT INTO AIRLINE.PASSENGER ("surname", "name", "secondname", "sex", "document_number", "category_id") VALUES ('Васечкин', 'Даниил', 'Иванович', 'm', 123123, 3);

INSERT INTO AIRLINE.TICKET ("flight_id", "place_id", "passenger_id", "payment_type", "is_paid", "airline_id", "rate_id") VALUES (1, 1, 1, 'cash', true, 1, 2);
INSERT INTO AIRLINE.TICKET ("flight_id", "place_id", "passenger_id", "sale_date", "payment_type", "is_paid", "airline_id", "rate_id") VALUES (2, 2, 2, '2022-10-25 19:10:25-07', 'apple_pay', true, 2, 1);
INSERT INTO AIRLINE.TICKET ("flight_id", "place_id", "passenger_id", "sale_date", "payment_type", "is_paid", "airline_id", "rate_id") VALUES (3, 3, 3, '2022-09-29 19:10:25-07', 'sbp', true, 2, 1);
INSERT INTO AIRLINE.TICKET ("flight_id", "place_id", "passenger_id", "payment_type", "is_paid", "airline_id", "rate_id") VALUES (4, 4, 4, 'sbp', true, 1, 2);
INSERT INTO AIRLINE.TICKET ("flight_id", "place_id", "passenger_id", "payment_type", "is_paid", "airline_id", "rate_id") VALUES (5, 5, 5, 'cash', true, 3, 1);