-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE "planets" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "orbital_period_in_years" float   NOT NULL,
    "orbits_around" text   NOT NULL,
    "galaxy" text   NOT NULL,
    CONSTRAINT "pk_planets" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "moons" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "planet_id" int   NOT NULL,
    CONSTRAINT "pk_moons" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "moons" ADD CONSTRAINT "fk_moons_planet_id" FOREIGN KEY("planet_id")
REFERENCES "planets" ("id");

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way'),
  ('Mars', 1.88, 'The Sun', 'Milky Way'),
  ('Venus', 0.62, 'The Sun', 'Milky Way'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way');

INSERT INTO moons 
  (name, planet_id)
VALUES 
  ('The Moon', 1), ('Phobos', 2), ('Deimos', 2), ('Naiad', 4), ('Thalassa', 4), ('Despina', 4), ('Galatea',4 ), ('Larissa', 4), 
  ('S/2004 N 1', 4), ('Proteus', 4), ('Triton', 4), ('Nereid', 4), ('Halimede', 4), ('Sao', 4), ('Laomedeia', 4), ('Psamathe', 4), ('Neso', 4);