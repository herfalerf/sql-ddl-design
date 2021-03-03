DROP DATABASE IF EXISTS medical_db;
CREATE DATABASE medical_db;
\c medical_db;

CREATE TABLE "doctors" (
    "doctor_id" SERIAL PRIMARY KEY,
    "name" VARCHAR(20) NOT NULL 
);

CREATE TABLE "patients" (
    "patient_id" SERIAL PRIMARY KEY,
    "name" VARCHAR(20) NOT NULL  
);

CREATE TABLE "diseases" (
    "disease_id" SERIAL PRIMARY KEY,
    "name" VARCHAR(30) NOT NULL 
);

CREATE TABLE "visit" (
    "relationship_id" SERIAL PRIMARY KEY,
    "doctor" INTEGER NOT NULL,
    "patient" INTEGER NOT NULL,
    "disease" INTEGER NOT NULL
);

ALTER TABLE "visit" ADD CONSTRAINT "fk_visit_doctor" FOREIGN KEY("doctor")
REFERENCES "doctors" ("doctor_id");

ALTER TABLE "visit" ADD CONSTRAINT "fk_visit_patient" FOREIGN KEY("patient")
REFERENCES "patients" ("patient_id");

ALTER TABLE "visit" ADD CONSTRAINT "fk_visit_disease" FOREIGN KEY("disease")
REFERENCES "diseases" ("disease_id");

CREATE INDEX "idx_doctors_name"
ON "doctors" ("name");

CREATE INDEX "idx_patients_name"
ON "patients" ("name");

CREATE INDEX "idx_diseases_name"
ON "diseases" ("name");

