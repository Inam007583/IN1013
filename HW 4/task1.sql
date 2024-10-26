-- Drop the database if it exists and create a new one
DROP DATABASE IF EXISTS pet_database;
CREATE DATABASE pet_database;
USE pet_database;

-- Define the petPet table
CREATE TABLE petPet (
    petname VARCHAR(20) PRIMARY KEY,
    owner VARCHAR(45),
    species VARCHAR(45),
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    birth DATE,
    death DATE
);

-- Define the petEvent table
CREATE TABLE petEvent (
    petname VARCHAR(20),
    eventdate DATE,
    eventtype VARCHAR(15),
    remark VARCHAR(255),
    PRIMARY KEY (petname, eventdate, eventtype),
    FOREIGN KEY (petname) REFERENCES petPet(petname)
);
