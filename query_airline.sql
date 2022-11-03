SELECT * FROM AIRLINE.PASSENGER;
SELECT * FROM AIRLINE.PASSENGER WHERE "sex" = 'f';
SELECT * FROM AIRLINE.PASSENGER WHERE "sex" = 'm';

SELECT "name", "surname", "secondname"
FROM AIRLINE.PASSENGER
    RIGHT JOIN AIRLINE.TICKET
        ON AIRLINE.PASSENGER.passenger_id = AIRLINE.TICKET.passenger_id
WHERE AIRLINE.TICKET.sale_date > '2022-10-22';


SELECT
       a.airline_name as Имя_рейса,
       dpt.city_name  as Город_отправления,
       arv.city_name  as Город_прибытия
FROM 
       airline.airline a
INNER JOIN airline.ticket t on t.airline_id = a.airline_id
INNER JOIN airline.flight f on f.flight_id = t.flight_id
INNER JOIN airline.city dpt on dpt.city_id = f.depature_city_id
INNER JOIN airline.city arv on arv.city_id = f.arrival_city_id
WHERE   dpt.city_name like '%Саранск%'
    and arv.city_name like '%Петер%';


SELECT p."surname", c1."city_name", c."city_name" FROM AIRLINE.TICKET t
    INNER JOIN airline.passenger p  on p.passenger_id = t.passenger_id
    INNER JOIN airline.flight    f  on t.flight_id = f.flight_id
    INNER JOIN airline.city      c  on c.city_id = f.arrival_city_id
    INNER JOIN airline.city      c1 on c1.city_id = f.depature_city_id
      WHERE t.payment_type::text LIKE '%cash%';


