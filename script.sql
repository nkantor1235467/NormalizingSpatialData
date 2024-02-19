--Creates database called "RealEstateDB"
CREATE DATABASE "RealEstateDB";

--Connects to RealEstateDB database
\c RealEstateDB

--Enables PostGIS extension for the current database
CREATE EXTENSION IF NOT EXISTS postgis;