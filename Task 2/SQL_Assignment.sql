 
​/* A. Write a query using MySQL to return all countries included in the World database.
- Purpose: The purpose of the query is to return all the Names of countries in the database.
- Tables Involved: Country table in the World database.
- Filtering Logic: No filtering was used or needed for this task.
- The query satisfies the requirement because it returns all countries in the World database as required.
*/
SELECT Name AS Country_Name
FROM world.country


/* B. Write a query using MySQL that returns all countries in Europe.
- Purpose: The query below is written to return all countries in the 'Europe' continent.
- Tables Involved: Country table in the World database.
- Filtering logic: To return all countries in Europe only, we have to use 'where' to filter 
    rows where Continent = 'Europe'
- The query satisfies the requirement because it successfully filters the continent by the required value and returns\
   all the countries in Europe.
*/
SELECT Name AS Country_Name
FROM world.country
WHERE Continent = 'Europe'


/* C. Write a query using MySQL to return all countries that speak English as an official language 
      with percentage greater than or equal to 70.      
- Purpose: The query below is written to return all countries that speak English as an official language 
  with a percentage of 70% or more.
- Tables Involved: Country table and countrylanguage table in the World database.
- Filtering logic: To retun all countries that speaks english as an official language, we have to use 'where' to filter
  the language to match 'English' only, set the percentage to be greater than or equal to 70 using the operator ">="
  and ensure it is the official language of the country using the Boolean column "Isofficial". (IsOfficial = 'T')
   We used "and" to ensure that all criteria must be met. 
   An inner join was used to make sure only matching rows from both tables are returned.
- The query satisfies the requirement because it successfully returns all results based on the requirement. The additional columns
  were selected for more details.
*/
SELECT Name AS Country_Name, Language, Percentage, Isofficial
FROM world.country c
JOIN countrylanguage cl ON c.Code = cl.CountryCode
WHERE Language = 'English'
AND IsOfficial = 'T'
AND Percentage >= 70;



/* D. Write a query using MySQL to return all countries that received their independence in the 18th century.
      
- Purpose: The query below is written to return all countries that received their independence in the 18th century.
- Tables Involved: Country table in the World database.
- Filtering logic: To retun all countries that received their independence in the 18th century, we have to use '>=' and '<='
  Inm essence, we filter using a range (1701-1800).
  We also have to use 'and' to ensure that both rules are met. Since there is no column for Independence century, we have to use
 the years that falls between the 18th century. Another alternative is the use of 'BETWEEN' 
- The query satisfies the requirement because it successfully returns all results based on the requirement. IndepYear Column 
  was added to ensure accuracy.
*/
SELECT Name AS Country_Name, IndepYear
FROM world.country c
WHERE IndepYear >= 1701 and IndepYear <= 1800;


/* E. Write a query using MySQL that returns the following dataset.
- Purpose: The query is designed to return all cities with the country code 'IND' indicating Cities in India
  in the Delhi and Punjab district.
- Tables Involved: City table in the World database.
- Filtering logic: To get the desired result, we had to filter using the WHERE clause to get the country code and the District
  involved in the table. We used 'IN' for the district because it allows entry of multiple values from the same variable
  keeping the query clean and readable and efficient as opposed to using '=' and 'AND' multiple times.
- The query satisfies the requirement because it successfully returns all results based on the requirement and matches the data
   in the requirement table.
*/
SELECT Name, CountryCode, District
FROM world.city 
WHERE CountryCode = 'IND'
and District in ('Delhi', 'Punjab')


