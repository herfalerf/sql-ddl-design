DROP DATABASE IF EXISTS craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;

CREATE TABLE post (
    post_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    post_text TEXT NOT NULL,
    user_name INTEGER NOT NULL,
    location VARCHAR(20) NOT NULL,
    region INTEGER NOT NULL,
    category INTEGER NOT NULL
);

CREATE TABLE user_name (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(15) NOT NULL,
    region INTEGER NOT NULL
);

CREATE TABLE region (
    region_id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE categories (
    cat_id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

ALTER TABLE "post" ADD CONSTRAINT "fk_post_user" FOREIGN KEY("user_name")
REFERENCES "user_name" ("user_id");

ALTER TABLE "post" ADD CONSTRAINT "fk_post_region" FOREIGN KEY("region")
REFERENCES "region" ("region_id");

ALTER TABLE "post" ADD CONSTRAINT "fk_post_category" FOREIGN KEY("category")
REFERENCES "categories" ("cat_id");

ALTER TABLE "user_name" ADD CONSTRAINT "fk_user_region" FOREIGN KEY("region")
REFERENCES "region" ("region_id");

