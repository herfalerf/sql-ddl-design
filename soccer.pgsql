-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "teams" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(15)   NOT NULL,
    "city" VARCHAR(15)   NOT NULL
);

CREATE TABLE "players" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(20)   NOT NULL,
    "team" INTEGER   NOT NULL
);

CREATE TABLE "referees" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(20)   NOT NULL
);

CREATE TABLE "matches" (
    "id" SERIAL PRIMARY KEY,
    "home_team_id" INTEGER   NOT NULL,
    "away_team_id" INTEGER   NOT NULL,
    "season_id" INTEGER   NOT NULL,
    "referee_id" INTEGER   NOT NULL
);

CREATE TABLE "goals" (
    "id" SERIAL PRIMARY KEY,
    "player_id" INTEGER   NOT NULL,
    "match_id" INTEGER   NOT NULL
);

CREATE TABLE "season" (
    "id" SERIAL PRIMARY KEY,
    "start_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL
);

CREATE TABLE "results" (
    "id" SERIAL PRIMARY KEY,
    "team_id" INTEGER   NOT NULL,
    "match_id" INTEGER   NOT NULL,
    "result" TEXT   NOT NULL

);

ALTER TABLE "players" ADD CONSTRAINT "fk_players_team" FOREIGN KEY("team")
REFERENCES "teams" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_home_team_id" FOREIGN KEY("home_team_id")
REFERENCES "teams" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_away_team_id" FOREIGN KEY("away_team_id")
REFERENCES "teams" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_season_id" FOREIGN KEY("season_id")
REFERENCES "season" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_referee_id" FOREIGN KEY("referee_id")
REFERENCES "referees" ("id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_player_id" FOREIGN KEY("player_id")
REFERENCES "players" ("id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_match_id" FOREIGN KEY("match_id")
REFERENCES "matches" ("id");

ALTER TABLE "results" ADD CONSTRAINT "fk_results_team_id" FOREIGN KEY("team_id")
REFERENCES "teams" ("id");

ALTER TABLE "results" ADD CONSTRAINT "fk_results_match_id" FOREIGN KEY("match_id")
REFERENCES "matches" ("id");
