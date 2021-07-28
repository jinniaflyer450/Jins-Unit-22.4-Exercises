-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  given_name TEXT NOT NULL,
  surname TEXT
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  release_date DATE
);

--In this day and age, many songs are released as singles, not on albums. 
--I'm not sure which would avoid more duplication--setting up song name as album name for singles or allowing a song to 
--not have an album name. In the former case, the song name is duplicated as the album name. In the latter case, release 
--date has to be on the song, which would have to carry over to every song and result in duplication where songs *do* 
--have albums. For now, I have gone with the former case. Help?

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  album_id TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL
);

CREATE TABLE artist_features (
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs(id) NOT NULL,
  artist_id INTEGER REFERENCES artists(id) NOT NULL 
);

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  given_name TEXT NOT NULL,
  surname TEXT
);

CREATE TABLE producer_features(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs(id) NOT NULL,
  producer_id INTEGER REFERENCES producers(id) NOT NULL
);

INSERT INTO artists (given_name, surname) 
VALUES ('Hanson', NULL), ('Queen', NULL), ('Mariah', 'Carey'), ('Boyz II Men', NULL), ('Lady Gaga', NULL), ('Bradley', 'Cooper'), 
('Nickelback', NULL), ('Jay Z', NULL), ('Alicia', 'Keys'), ('Katy', 'Perry'), ('Juicy J', NULL), ('Maroon 5', NULL), 
('Christina', 'Aguilera'), ('Avril', 'Lavigne'), ('Destiny''s Child', NULL);

INSERT INTO albums (title, release_date)
VALUES ('Middle of Nowhere', '04-15-1997'), ('A Night at the Opera', '10-31-1975'), ('Daydream', '11-14-1995'),
('A Star Is Born', '09-27-2018'), ('Silver Side Up', '08-21-2001'), ('The Blueprint 3', '10-20-2009'),
('Prism', '12-17-2013'), ('Hands All Over', '06-21-2011'), ('Let Go', '05-14-2002'), ('The Writing''s on the Wall', '11-07-1999');

INSERT INTO songs (title, album_id, duration_in_seconds)
VALUES ('MMMBop', 1, 238), ('Bohemian Rhapsody', 2, 355), ('One Sweet Day', 3, 282), ('Shallow', 4, 216), 
('How You Remind Me', 5, 223), ('New York State of Mind', 6, 276), ('Dark Horse', 7, 215), ('Moves Like Jagger', 8, 201),
('Complicated', 9, 244), ('Say My Name', 10, 240);

INSERT INTO artist_features (song_id, artist_id)
VALUES (1, 1), (2, 2), (3, 3), (3, 4), (4, 5), (4, 6), (5, 7), (6, 8), (6, 9), (7, 10), (7, 11), (8, 12), (8, 13), (9, 14), (10, 15);

INSERT INTO producers (given_name, surname)
VALUES ('Dust Brothers', NULL), ('Stephen', 'Lironi'), ('Roy Thomas', 'Baker'), ('Walter', 'Afanasieff'), ('Benjamin', 'Rice'),
('Rick', 'Parashar'), ('Al', 'Shux'), ('Max', 'Martin'), ('Cirkut', NULL), ('Shellback', NULL), ('Benny', 'Blanco'), 
('The Matrix', NULL), ('Darkchild', NULL);

INSERT INTO producer_features (song_id, producer_id)
VALUES (1, 1), (1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (6, 7), (7, 8), (7, 9), (8, 10), (8, 11), (9, 12), (10, 13);