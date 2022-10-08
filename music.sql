-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE "songs" (
    "id" serial   NOT NULL,
    "title" text   NOT NULL,
    "duration_in_seconds" text   NOT NULL,
    "release_date" date   NOT NULL,
    "album" text   NOT NULL,
    CONSTRAINT "pk_songs" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "artists" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_artists" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "producers" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_producers" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "songs_artists_producers" (
    "id" serial   NOT NULL,
    "song_id" int   NOT NULL,
    "artist_id" int   NOT NULL,
    "producer_id" int   NOT NULL,
    CONSTRAINT "pk_songs_artists_producers" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "songs_artists_producers" ADD CONSTRAINT "fk_songs_artists_producers_song_id" FOREIGN KEY("song_id")
REFERENCES "songs" ("id");

ALTER TABLE "songs_artists_producers" ADD CONSTRAINT "fk_songs_artists_producers_artist_id" FOREIGN KEY("artist_id")
REFERENCES "artists" ("id");

ALTER TABLE "songs_artists_producers" ADD CONSTRAINT "fk_songs_artists_producers_producer_id" FOREIGN KEY("producer_id")
REFERENCES "producers" ("id");

INSERT INTO songs
  (title, duration_in_seconds, release_date, album)
VALUES
  ('MMMBop', 238, '04-15-1997', 'Middle of Nowhere'),
  ('Bohemian Rhapsody', 355, '10-31-1975', 'A Night at the Opera'),
  ('One Sweet Day', 282, '11-14-1995', 'Daydream'),
  ('Shallow', 216, '09-27-2018', 'A Star Is Born'),
  ('How You Remind Me', 223, '08-21-2001', 'Silver Side Up'),
  ('New York State of Mind', 276, '10-20-2009', 'The Blueprint 3'),
  ('Dark Horse', 215, '12-17-2013', 'Prism'),
  ('Moves Like Jagger', 201, '06-21-2011', 'Hands All Over'),
  ('Complicated', 244, '05-14-2002', 'Let Go'),
  ('Say My Name', 240, '11-07-1999', 'The Writing''s on the Wall');

INSERT INTO artists (name)
VALUES
  ('Hanson'), ('Queen'), ('Mariah Cary'), ('Boyz II Men'), ('Lady Gaga'), ('Bradley Cooper'), ('Nickelback'), ('Jay Z'), ('Alicia Keys'),
  ('Katy Perry'), ('Juicy J'), ('Maroon 5'), ('Christina Aguilera'), ('Avril Lavigne'), ('Destiny''s Child');

INSERT INTO producers (name)
VALUES
  ('Dust Brothers'), ('Stephen Lironi'), ('Roy Thomas Baker'), ('Walter Afanasieff'), ('Benjamin Rice'), ('Rick Parashar'), 
  ('Al Shux'), ('Max Martin'), ('Cirkut'), ('Shellback'), ('Benny Blanco'), ('The Matrix'), ('Darkchild');

INSERT INTO songs_artists_producers 
  (song_id, artist_id, producer_id)
VALUES
  (1, 1, 1), (1, 1, 2), (2, 2, 3), (3, 3, 4), (3, 4, 4), (4, 5, 5), (4, 6, 5), (5, 7, 6), (6, 8, 7),  (6, 9, 7),
  (7, 10, 8), (7, 11, 8), (7, 10, 9), (7, 11, 9), (8, 12, 10), (8, 13, 10), (8, 12, 11), (8, 13, 11), (9, 14, 12),  (10, 15, 13);