-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE "tickets" (
    "id" serial   NOT NULL,
    "first_name" text   NOT NULL,
    "last_name" text   NOT NULL,
    "seat" text   NOT NULL,
    "departure" timestamp   NOT NULL,
    "arrival" timestamp   NOT NULL,
    "airline" int   NOT NULL,
    "from" int   NOT NULL,
    "to" int   NOT NULL,
    CONSTRAINT "pk_tickets" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "airlines" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_airlines" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "locations" (
    "id" serial   NOT NULL,
    "city" text   NOT NULL,
    "country" text   NOT NULL,
    CONSTRAINT "pk_locations" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "tickets" ADD CONSTRAINT "fk_tickets_airline" FOREIGN KEY("airline")
REFERENCES "airlines" ("id");

ALTER TABLE "tickets" ADD CONSTRAINT "fk_tickets_from" FOREIGN KEY("from")
REFERENCES "locations" ("id");

ALTER TABLE "tickets" ADD CONSTRAINT "fk_tickets_to" FOREIGN KEY("to")
REFERENCES "locations" ("id");

INSERT into airlines
  (name)
VALUES 
  ('United'), ('British Airways'), ('Delta'), ('TUI Fly Belgium'), ('Air China'), ('American Airlines'), ('Avianca Brasil');

INSERT INTO locations
  (city, country)
VALUES
  ('Washington DC', 'United States'),
  ('New York', 'United States'),
  ('Chicago', 'United States'),
  ('Los Angeles', 'United States'),
  ('Seattle', 'United States'),
  ('Las Vegas', 'United States'),
  ('Charlotte', 'United States'),
  ('New Orleans', 'United States'),
  ('Paris', 'France'),
  ('London', 'United Kingdom'),
  ('Tokyo', 'Japan'),
  ('Beijing', 'China'),
  ('Dubai', 'UAE'),
  ('Mexico City', 'Mexico'),
  ('Santiago', 'Chile'),
  ('Sao Paolo', 'Brazil'),
  ('Casablanca', 'Morocco'),
  ('Cedar Rapids', 'United States');

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline, "from", "to")
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 5),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 11, 10),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 4, 6),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 4, 14),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 9, 17),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 13, 12),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 2, 7),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 18, 3),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 7, 8),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 16, 15);