-- from the terminal run:
-- psql < part1_seed.sql

DROP DATABASE IF EXISTS medical_center_db;

CREATE DATABASE medical_center_db;

\c medical_center_db

CREATE TABLE "Deparments" (
    "id" serial   NOT NULL,
    "name" varchar(50)   NOT NULL,
    "phone" int   NOT NULL,
    "address" text   NOT NULL,
    CONSTRAINT "pk_Deparments" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Doctors" (
    "id" serial   NOT NULL,
    "f_name" varchar(30)   NOT NULL,
    "l_name" varchar(30)   NOT NULL,
    "role" varchar(50)   NOT NULL,
    "email" varchar(50)   NOT NULL,
    "department_id" int   NOT NULL,
    CONSTRAINT "pk_Doctors" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Patients" (
    "id" serial   NOT NULL,
    "f_name" varchar(30)   NOT NULL,
    "l_name" varchar(30)   NOT NULL,
    "dob" date   NOT NULL,
    "insurance" varchar(50)   NOT NULL,
    "phone" int   NOT NULL,
    "gender" varchar(10)   NULL,
    "email" varchar(50)   NULL,
    "address" text   NULL,
    CONSTRAINT "pk_Patients" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Visits" (
    "id" serial   NOT NULL,
    "patient_id" int   NOT NULL,
    "doctor_id" int   NOT NULL,
    "date" date   NOT NULL,
    "time" time   NOT NULL,
    "result" text   NOT NULL,
    CONSTRAINT "pk_Visits" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diseases" (
    "id" serial   NOT NULL,
    "name" varchar(50)   NOT NULL,
    "description" text   NOT NULL,
    "symptoms" text   NOT NULL,
    "treatment" text   NOT NULL,
    CONSTRAINT "pk_Diseases" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diagnoses" (
    "id" serial   NOT NULL,
    "visit_id" int   NOT NULL,
    "disease_id" int   NOT NULL,
    "condition" varchar(50)   NULL,
    CONSTRAINT "pk_Diagnoses" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Doctors" ADD CONSTRAINT "fk_Doctors_department_id" FOREIGN KEY("department_id")
REFERENCES "Deparments" ("id");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_patient_id" FOREIGN KEY("patient_id")
REFERENCES "Patients" ("id");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "Doctors" ("id");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_visit_id" FOREIGN KEY("visit_id")
REFERENCES "Visits" ("id");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_disease_id" FOREIGN KEY("disease_id")
REFERENCES "Diseases" ("id");

DROP DATABASE IF EXISTS craiglist_db;

CREATE DATABASE craiglist_db;

\c craiglist_db

CREATE TABLE "Regions" (
    "id" serial   NOT NULL,
    "name" varchar(50)   NOT NULL,
    "timezone" varchar(10)   NOT NULL,
    CONSTRAINT "pk_Regions" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Users" (
    "id" serial   NOT NULL,
    "username" varchar(50)   NOT NULL,
    "password" varchar(50)   NOT NULL,
    "email" varchar(50)   NOT NULL,
    "date_created" date   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "id"
     ),
    CONSTRAINT "uc_Users_username" UNIQUE (
        "username"
    )
);

CREATE TABLE "Categories" (
    "id" serial   NOT NULL,
    "name" varchar(50)   NOT NULL,
    "description" text   NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Posts" (
    "id" serial   NOT NULL,
    "title" varchar(50)   NOT NULL,
    "text" text   NOT NULL,
    "username" text   NOT NULL,
    "date_time" timestamp   NOT NULL,
    "location" varchar(50)   NOT NULL,
    "category_id" int   NOT NULL,
    "location_id" int   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_id" FOREIGN KEY("id")
REFERENCES "Categories" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_username" FOREIGN KEY("username")
REFERENCES "Users" ("username");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_location_id" FOREIGN KEY("location_id")
REFERENCES "Regions" ("id");

DROP DATABASE IF EXISTS soccer_league_db;

CREATE DATABASE soccer_league_db;

\c soccer_league_db


CREATE TABLE "Teams" (
    "id" serial   NOT NULL,
    "name" varchar(50)   NOT NULL,
    "city" varchar(50)   NOT NULL,
    "founded" date   NOT NULL,
    "coach" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Players" (
    "id" serial   NOT NULL,
    "f_name" varchar(30)   NOT NULL,
    "l_name" varchar(30)   NOT NULL,
    "dob" date   NOT NULL,
    "height" int   NOT NULL,
    "weight" int   NOT NULL,
    "position" varchar(20)   NOT NULL,
    "team_id" int   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Referees" (
    "id" serial   NOT NULL,
    "f_name" varchar(30)   NOT NULL,
    "l_name" varchar(30)   NOT NULL,
    "dob" date   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Seasons" (
    "year" int   NOT NULL,
    "start_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    CONSTRAINT "pk_Seasons" PRIMARY KEY (
        "year"
     )
);

CREATE TABLE "Games" (
    "id" int   NOT NULL,
    "team1" int   NOT NULL,
    "team2" int   NOT NULL,
    "referee_id" int   NOT NULL,
    "date" date   NOT NULL,
    "stadium" varchar(50)   NOT NULL,
    "info" text   NULL,
    "season" int   NOT NULL,
    CONSTRAINT "pk_Games" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Goals" (
    "id" serial   NOT NULL,
    "player_id" int   NOT NULL,
    "game_id" int   NOT NULL,
    "time_min" int   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Results" (
    "id" serial   NOT NULL,
    "team_id" int   NOT NULL,
    "game_id" int   NOT NULL,
    "result" varchar(10)   NOT NULL,
    "point" int   NOT NULL,
    CONSTRAINT "pk_Results" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_team1" FOREIGN KEY("team1")
REFERENCES "Teams" ("id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_team2" FOREIGN KEY("team2")
REFERENCES "Teams" ("id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_referee_id" FOREIGN KEY("referee_id")
REFERENCES "Referees" ("id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_season" FOREIGN KEY("season")
REFERENCES "Seasons" ("year");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_player_id" FOREIGN KEY("player_id")
REFERENCES "Players" ("id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_game_id" FOREIGN KEY("game_id")
REFERENCES "Games" ("id");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_game_id" FOREIGN KEY("game_id")
REFERENCES "Games" ("id");