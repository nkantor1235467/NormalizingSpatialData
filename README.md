# Assignment 3: Normalizing Spatial Data

## Part 1
### Setup Instructions on MacOS, assumes PostgreSQL already installed in applications folder
1. Navigate to applications folder in finder
2. Click on PostgreSQL 15
3. Double click on SQL Shell (psql)
4. When prompted with Server [localhost]:, enter "localhost"
5. When prompted with Database [postgres]:, enter "postgres"
6. When prompted with Port [5433]:, enter "5433", if the number is different than 5433 enter the other number instead
7. When prompted with Username [postgres]:, enter "postgres"
8. When prompted with Password for user postgres:, enter the postgresql password
9. Type line 3 in the script.sql file into the shell and enter, this creates a database called RealEstateDB
10. Type line 6 in the script.sql file into the shell and enter, navigates to RealEstateDB
11. Type line 9 in the script.sql file into the shell and enter, enables PostGIS extension

## Part 2
In this part an initial PropertyDetails table was created that satisfies the 1st and 2nd normal forms. The PropertyID column is the primary key, and it satisfies both the 1st and 2nd normal form requirements because it uniquely identifies each row (satisfying 1st normal form) and is not a composite primary key (satisfying 2nd normal form). 