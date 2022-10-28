SELECT * FROM AIRLINE.PASSENGER;
SELECT * FROM AIRLINE.PASSENGER WHERE "sex" = 'f';
SELECT * FROM AIRLINE.PASSENGER WHERE "sex" = 'm';

SELECT "name", "surname", "secondname"
FROM AIRLINE.PASSENGER
    RIGHT JOIN AIRLINE.TICKET
        ON AIRLINE.PASSENGER.passenger_id = AIRLINE.TICKET.passenger_id
WHERE AIRLINE.TICKET.sale_date > '2022-10-22';

SELECT "airline_name" FROM airline.airline a FULL JOIN airline.ticket t on a.airline_id = t.airline_id
                      WHERE
                          t.flight_id IN(SELECT "flight_id" FROM airline.flight f WHERE depature_city_id=2 AND arrival_city_id=3)
                        AND
                          a.airline_id = t.airline_id;

SELECT p."surname", c1."city_name", c."city_name" FROM AIRLINE.TICKET t
    RIGHT JOIN airline.passenger p  on p.passenger_id = t.passenger_id
    RIGHT JOIN airline.flight    f  on t.flight_id = f.flight_id
    RIGHT JOIN airline.city      c  on c.city_id = f.arrival_city_id
    RIGHT JOIN airline.city      c1 on c1.city_id = f.depature_city_id
      WHERE t.payment_type='cash'

