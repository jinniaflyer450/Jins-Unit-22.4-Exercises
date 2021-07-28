--To bring up a table of flights with all basic relevant information--airline name, departure time, arrival time, 
--and departing/arriving city names.

SELECT a.name, f.departure, f.arrival, c1.name AS from_city_id, c2.name AS to_city_id 
FROM 
cities c1 
JOIN flights f ON f.from_city_id = c1.id 
JOIN cities c2 ON f.to_city_id = c2.id
JOIN airlines a ON f.airline_id = a.id;

--To bring up a table of flights with seat and customer info added.

SELECT a.name, f.departure, f.arrival, c1.name AS from_city_id, c2.name AS to_city_id, cu.given_name, cu.surname, s.seat_designation
FROM 
cities c1 
JOIN flights f ON f.from_city_id = c1.id 
JOIN cities c2 ON f.to_city_id = c2.id
JOIN airlines a ON f.airline_id = a.id
JOIN seats s ON f.id = s.flights_id
JOIN customers cu ON s.customer_id = cu.id; 