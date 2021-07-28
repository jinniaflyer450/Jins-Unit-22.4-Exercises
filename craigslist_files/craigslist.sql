DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE regions (id SERIAL PRIMARY KEY, name VARCHAR(30) NOT NULL);
CREATE TABLE locations (id SERIAL PRIMARY KEY, name VARCHAR(30) NOT NULL, region_id INTEGER REFERENCES regions(id) NOT NULL);
CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(20) NOT NULL, password VARCHAR(20) NOT NULL, 
preferred_region_id INTEGER REFERENCES regions(id) NOT NULL);
CREATE TABLE categories (id SERIAL PRIMARY KEY, name VARCHAR(30) NOT NULL, post_count INTEGER NOT NULL DEFAULT 0);
CREATE TABLE posts (id SERIAL PRIMARY KEY, title VARCHAR(50) NOT NULL, content TEXT, user_id INTEGER REFERENCES users(id) NOT NULL,
region_id INTEGER REFERENCES regions(id) NOT NULL, location_id INTEGER REFERENCES locations(id) NOT NULL, 
category_id INTEGER REFERENCES categories(id) NOT NULL);

INSERT INTO regions (name) VALUES ('Northtown'), ('Southville'), ('Eastvale'), ('Westland');
INSERT INTO locations (name, region_id) VALUES ('Northwest', 1), ('Northeast', 1), ('Southwest', 2), ('Southeast', 2);
INSERT INTO users (username, password, preferred_region_id) VALUES ('randomlady', 'adjsk', 1), ('anotherrando', 'fkegh', 1),
('dogkid', 'gheathi', 2), ('madwoman', 'dtibhto', 2);
INSERT INTO categories (name, post_count) VALUES ('dogs', 2), ('cats', 1);
INSERT INTO categories (name) VALUES ('lizards'), ('birds');
INSERT INTO posts (title, content, user_id, region_id, location_id, category_id) VALUES ('My dog', 'This is a picture of my dog',
1, 1, 1, 1), ('My cat', 'This is a picture of my cat', 3, 2, 2, 2);