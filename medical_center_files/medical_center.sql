DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors (id SERIAL PRIMARY KEY, given_name VARCHAR(15) NOT NULL, surname VARCHAR(20) NOT NULL, is_surgeon BOOLEAN NOT NULL);
CREATE TABLE patients (id SERIAL PRIMARY KEY, given_name VARCHAR(15) NOT NULL, surname VARCHAR(20) NOT NULL, 
gender VARCHAR(10), sex VARCHAR(10) NOT NULL, birthdate DATE NOT NULL);
CREATE TABLE establlished_doctors_patients_relationships (id SERIAL PRIMARY KEY, doctor_id INTEGER REFERENCES doctors(id) NOT NULL, 
patient_id INTEGER REFERENCES patients(id) NOT NULL);
CREATE TABLE specialties (id SERIAL PRIMARY KEY, name VARCHAR(20) NOT NULL);
CREATE TABLE trained_specialties (id SERIAL PRIMARY KEY, doctor_id INTEGER REFERENCES doctors(id) NOT NULL, 
specialty_id INTEGER REFERENCES specialties(id) NOT NULL);
CREATE TABLE diseases (id SERIAL PRIMARY KEY, name VARCHAR(30) NOT NULL, specialty_id INTEGER REFERENCES specialties(id) NOT NULL);
CREATE TABLE patients_afflictions (id SERIAL PRIMARY KEY, patient_id INTEGER REFERENCES patients(id) NOT NULL, 
disease_id INTEGER REFERENCES diseases(id) NOT NULL);

INSERT INTO doctors (given_name, surname, is_surgeon) VALUES ('Alice', 'Jackson', false), ('Max', 'Wu', true);
INSERT INTO patients (given_name, surname, gender, sex, birthdate) VALUES ('Caleb', 'Wesley', 'male', 'male', '2000-04-08'),
('Taylor', 'Wozniak', 'nonbinary', 'female', '1980-08-04');
INSERT INTO doctors_patients (doctor_id, patient_id) VALUES (1, 2), (2, 2), (2, 1);
INSERT INTO specialties (name) VALUES ('gynecology'), ('orthopedics'), ('gastroentology');
INSERT INTO doctors_specialties (doctor_id, specialty_id) VALUES (1, 1), (2, 2), (2, 3);
INSERT INTO diseases (name, specialty_id) VALUES ('ovarian cancer', 1), ('tibia fracture', 2);
INSERT INTO patients_diseases(patient_id, disease_id) VALUES (2, 1), (2, 2), (1, 2);