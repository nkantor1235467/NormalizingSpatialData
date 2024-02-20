--part1
--Creates database called "RealEstateDB"
CREATE DATABASE "RealEstateDB";

--Connects to RealEstateDB database
\c RealEstateDB

--Enables PostGIS extension for the current database
CREATE EXTENSION IF NOT EXISTS postgis;

--part2
--creates table called PropertyDetails
CREATE TABLE PropertyDetails (
    PropertyID SERIAL PRIMARY KEY,--creates primary key column named PropertyID, there is no composite primary key in accordance with 2nd normal form, uniquely identifies each row making it in compliance with 1st normal form
    Address VARCHAR(255),--creates column named Address of variable character 255 type
    City VARCHAR(100),--creates column named City of variable character 100 type
    State VARCHAR(50),--creates column named State of variable character 50 type
    Country VARCHAR(50),--creates column named Country of variable character 50 type
    ZoningType VARCHAR(100),--creates column named ZoningType of variable character 100 type
    Utility VARCHAR(100),--creates column named Utility of variable character 100 type
    GeoLocation GEOMETRY(Point, 4326),--creates column named GeoLocation which is a geometry column containing coordinate data in the 4326 projection
    CityPopulation INT--creates column named CityPopulation of the integer type
);