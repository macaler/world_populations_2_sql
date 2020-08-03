-- How many entries in the database are from Africa?
SELECT COUNT(DISTINCT name) AS 'Number of African countries:' FROM countries WHERE continent == 'Africa';

-- What was the total population of Oceania in 2005?
SELECT SUM(population) AS 'Total Pop. of Oceania in 2005:' FROM population_years 
INNER JOIN countries ON countries.id = population_years.country_id 
WHERE countries.continent == 'Oceania' AND population_years.year == 2005;


-- What is the average population of countries in South America in 2003?
SELECT ROUND(AVG(population),6) AS 'Avg. Pop. of S. Ameria:' FROM population_years 
INNER JOIN countries ON countries.id = population_years.country_id
WHERE countries.continent == 'South America' AND population_years.year == 2003;

-- What country had the smallest population in 2007?
SELECT countries.name AS 'Country', MIN(population_years.population) AS 'Population'
FROM population_years 
INNER JOIN countries ON countries.id = population_years.country_id WHERE year == 2007;


-- What is the average population of Poland during the time period covered by this dataset?
--first get the time period covered by the dataset:
SELECT MIN(year), MAX(year) FROM population_years;
--Now get the average population of Poland during this time period:
SELECT ROUND(AVG(population_years.population),6) AS "Avg. Polish Pop." FROM population_years 
INNER JOIN countries on countries.id = population_years.country_id 
WHERE countries.name == 'Poland';

-- How many countries have the word "The" in their name?
SELECT COUNT(id) AS 'Num. of Counties with "The:"' FROM countries WHERE name LIKE '%The%';
--Which specific countries are these?
SELECT name AS 'Num. of Counties with "The:"' FROM countries WHERE name LIKE '%The%';
--However, the spirit of the question is to get all countries whose names
--start with "The" and would therefore be listed as "country_name, The" To
--get these countries, we use the following query:
SELECT COUNT(id) AS 'Num. of Counties with "The:"' FROM countries WHERE name LIKE '%, The';
--Which specific countries are these?
SELECT name AS 'Num. of Counties with "The:"' FROM countries WHERE name LIKE '%, The';

-- What was the total population of each continent in 2010?
SELECT countries.continent AS 'Continent', ROUND(SUM(population_years.population),6) AS 'Total Pop.'
FROM population_years 
INNER JOIN countries on countries.id = population_years.country_id 
WHERE population_years.year == 2010
GROUP BY countries.continent ORDER BY ROUND(SUM(population_years.population),6) DESC;
