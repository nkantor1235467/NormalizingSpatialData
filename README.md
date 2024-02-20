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

## Part 3
This part involves transitioning the table from the previous section to 3rd normal form. To do this it is necessary to eliminate transitive dependencies which is when some columns are dependent on non-primary key columns. In the original PropertyDetails table, State, Country, and CityPopulation were all dependent on the city column. To fix this, those columns were moved to a separate table with City as its primary key and they were deleted from the original PropertyDetails table.

## Part 4
After the 3rd normal form was achieved in the previous part, the table still had not met the criteria for 4th normal form. This is because there were multi-valued dependencies which is when different independent columns both depend on the primary key column. In this case Zoning and Utilities both are multi-valued dependencies so new tables needed to be created for them, and they were both removed from the original table.

## Part 5
Part 5 involves selecting properties by location.