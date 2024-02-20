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

--part3
--creates table called CityDemographics to fix transitive dependencies of the City column
CREATE TABLE CityDemographics (
    City VARCHAR(100) PRIMARY KEY,--creates primary key column named City, of variable character 100 type, this should be a primary key because State, Country, and CityPopulation are dependent on it
    State VARCHAR(50),--creates column named State of variable character 50 type
    Country VARCHAR(50),--creates column named Country of variable character 50 type
    CityPopulation INT--creates column named CityPopulation of integer type
);

--alters table named PropertyDetails, drops the columns in that table named CityPopulation, State, and Country, this removes transitive dependencies from the PropertyDetails table
ALTER TABLE PropertyDetails DROP COLUMN CityPopulation, DROP COLUMN State, DROP COLUMN Country;

--part4
--creates table called PropertyZoning, this moves a multi-valued dependency to its own table
CREATE TABLE PropertyZoning (
    PropertyZoningID SERIAL PRIMARY KEY,--creates a serial primary key column named PropertyZoningID
    PropertyID INT REFERENCES PropertyDetails(PropertyID),--creates a PropertyID column with an integer type that references the PropertyID column in the PropertyDetails table
    ZoningType VARCHAR(100)--creates a column named ZoningType of the type variable character 100 
);

--creates table called PropertyUtilities, this also moves a multi valued dependency to its own table
CREATE TABLE PropertyUtilities (
    PropertyUtilityID SERIAL PRIMARY KEY,--creates a serial primary key column named PropertyUtilityID
    PropertyID INT REFERENCES PropertyDetails(PropertyID),--creates a PropertyID column with an integer type that references the PropertyID column in the PropertyDetails table
    Utility VARCHAR(100)--creates a column named Utility of the type variable character 100 
);

--alters table named PropertyDetails, deletes the columns in that table named ZoningType and Utility, makes it so multi-valued dependencies are completely eliminated from original table
ALTER TABLE PropertyDetails DROP COLUMN ZoningType, DROP COLUMN Utility;