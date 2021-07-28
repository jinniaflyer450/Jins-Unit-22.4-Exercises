-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE customers
(
  id SERIAL PRIMARY KEY,
  given_name TEXT NOT NULL,
  surname TEXT NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INTEGER REFERENCES countries(id) NOT NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  airline_id INTEGER REFERENCES airlines(id) NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  from_city_id INTEGER REFERENCES cities(id) NOT NULL,
  to_city_id INTEGER REFERENCES cities(id) NOT NULL
);

CREATE TABLE seats
(
  id SERIAL PRIMARY KEY,
  seat_designation TEXT NOT NULL,
  flights_id INTEGER REFERENCES flights(id) NOT NULL,
  customer_id INTEGER REFERENCES customers(id)
);


  INSERT INTO customers 
  (given_name, surname) 
  VALUES 
  ('Jennifer', 'Finch'), 
  ('Thadeus', 'Gathercoal'), 
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'), 
  ('Berkie', 'Wycliff'), 
  ('Alvin', 'Leathes'), 
  ('Cory', 'Squibbes');
  
  INSERT INTO countries (name) 
  VALUES 
  ('United States'), 
  ('Japan'), 
  ('United Kingdom'), 
  ('Mexico'), 
  ('France'), 
  ('Morocco'),
  ('UAE'), 
  ('China'), 
  ('Brazil'), 
  ('Chile');
  
  INSERT INTO cities 
  (name, country_id) 
  VALUES 
  ('Washington DC', 1), 
  ('Seattle', 1), 
  ('Tokyo', 2), 
  ('London', 3), 
  ('Los Angeles', 1),
  ('Las Vegas', 1), 
  ('Mexico City', 4), 
  ('Paris', 5), 
  ('Casablanca', 6), 
  ('Dubai', 7), 
  ('Beijing', 8), 
  ('New York', 1), 
  ('Charlotte', 1), 
  ('Cedar Rapids', 1), 
  ('Chicago', 1), 
  ('New Orleans', 1), 
  ('Sao Paolo', 9), 
  ('Santiago', 10);
  
  INSERT INTO airlines 
  (name) 
  VALUES 
  ('United'), 
  ('British Airways'), 
  ('Delta'), 
  ('TUI Fly Belgium'), 
  ('Air China'),
  ('American Airlines'), 
  ('Avancia Brasil');
  
  INSERT INTO flights 
  (airline_id, departure, arrival, from_city_id, to_city_id) 
  VALUES 
  (1, '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 2),
  (2, '2018-12-19 12:45:00', '2018-12-19 16:15:00', 3, 4), 
  (3, '2018-01-02 07:00:00', '2018-01-02 08:03:00', 5, 6), 
  (3, '2018-04-15 16:50:00', '2018-04-15 21:00:00', 2, 7), 
  (4, '2018-08-01 18:30:00', '2018-08-01 21:50:00', 8, 9), 
  (5, '2018-10-31 01:15:00', '2018-10-31 12:55:00', 10, 11), 
  (1, '2019-02-06 06:00:00', '2019-02-06 07:47:00', 12, 13), 
  (6, '2018-12-22 14:42:00', '2018-12-22 15:56:00', 14, 15), 
  (6, '2019-02-06 16:28:00', '2019-02-06 19:18:00', 13, 16),
  (7, '2019-01-20 19:30:00', '2019-01-20 22:45:00', 17, 18);

  INSERT INTO seats
  (seat_designation, flights_id, customer_id)
  VALUES
  ('33B', 1, 1), 
  ('8A', 2, 2), 
  ('12F', 3, 3), 
  ('20A', 4, 1), 
  ('23D', 5, 4), 
  ('18C', 6, 2), 
  ('9E', 7, 5), 
  ('1A', 8, 6), 
  ('32B', 9, 5), 
  ('10D', 10, 7);