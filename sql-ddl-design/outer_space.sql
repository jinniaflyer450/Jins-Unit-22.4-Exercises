-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies (
  id SERIAL PRIMARY KEY, 
  name TEXT NOT NULL
  );

CREATE TABLE stars (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  in_galaxy_id INTEGER REFERENCES galaxies(id) NOT NULL
);

CREATE TABLE planets(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbits_star_id INTEGER REFERENCES stars(id) NOT NULL,
  orbital_period_in_years FLOAT NOT NULL
);

CREATE TABLE moons(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbits_planet_id INTEGER REFERENCES planets(id) NOT NULL
);
  INSERT INTO galaxies (name) VALUES ('Milky Way');
  INSERT INTO stars (name, in_galaxy_id) VALUES ('The Sun', 1), ('Proxima Centauri', 1), ('Gliese 876', 1);
  INSERT INTO planets (name, orbits_star_id, orbital_period_in_years) VALUES ('Earth', 1, 1.00), ('Mars', 1, 1.88), ('Venus', 1, 0.62),
  ('Neptune', 1, 164.8), ('Proxima Centauri b', 2, 0.03), ('Gliese 876 b', 3, 0.23);
  INSERT INTO moons (name, orbits_planet_id) VALUES ('The Moon', 1), ('Phobos', 2), ('Deimos', 2), ('Naiad', 4), ('Thalassa', 4),
  ('Despina', 4), ('Galatea', 4), ('Larissa', 4), ('S/2004 N 1', 4), ('Proteus', 4), ('Triton', 4), ('Nereid', 4),
  ('Halimede', 4), ('Sao', 4), ('Laomedeia', 4), ('Psamanthe', 4), ('Neso', 4);