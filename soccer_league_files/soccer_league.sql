DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams (id SERIAL PRIMARY KEY, name VARCHAR(30) NOT NULL);
CREATE TABLE referees (id SERIAL PRIMARY KEY, given_name VARCHAR(20) NOT NULL, surname VARCHAR(30) NOT NULL);
CREATE TABLE seasons (id SERIAL PRIMARY KEY, start_date DATE NOT NULL, end_date DATE NOT NULL);
CREATE TABLE games (id SERIAL PRIMARY KEY, team1_id INTEGER REFERENCES teams(id) NOT NULL, team1_score INTEGER DEFAULT 0 NOT NULL,
team2_id INTEGER REFERENCES teams(id) NOT NULL, team2_score INTEGER DEFAULT 0 NOT NULL, 
referee_id INTEGER REFERENCES referees(id) NOT NULL, date DATE NOT NULL, season_id INTEGER REFERENCES seasons(id) NOT NULL);
CREATE TABLE players (id SERIAL PRIMARY KEY, given_name VARCHAR(20) NOT NULL, surname VARCHAR(30) NOT NULL,
team_id INTEGER REFERENCES teams(id) NOT NULL);
CREATE TABLE goals (id SERIAL PRIMARY KEY, player_id INTEGER REFERENCES players(id) NOT NULL,
game_id INTEGER REFERENCES games(id) NOT NULL);

INSERT INTO teams (name) VALUES ('Tigers'), ('Lions'), ('Bears'), ('Eagles'), ('Wolves'), ('Hawks');
INSERT INTO referees (given_name, surname) VALUES ('Jack', 'Miller'), ('Stacy', 'Polanski'), ('Arnold', 'Freeman');
INSERT INTO seasons (start_date, end_date) VALUES ('2019-01-05', '2019-05-20'), ('2020-01-07', '2020-05-23'), 
('2021-01-06', ('2021-05-24'));
INSERT INTO games (team1_id, team1_score, team2_id, team2_score, referee_id, date, season_id) VALUES (2, 4, 1, 2, 1, '2019-02-20', 1),
(2, 1, 3, 3, 2, '2019-02-25', 1), (4, 0, 1, 0, 2, '2019-03-15', 1), (2, 5, 5, 2, 3, '2019-04-20', 1);
INSERT INTO players (given_name, surname, team_id) VALUES ('Max', 'Santos', 1), ('Kieran', 'Thomas', 2), ('Blake', 'Wesley', 1);
INSERT INTO goals (player_id, game_id) VALUES (1, 1), (2, 1), (2, 2);