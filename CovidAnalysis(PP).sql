USE portfolioproject;
SELECT 
location, total_cases, new_cases, total_deaths, population 
FROM coviddeaths
GROUP BY 1;

-- total cases vs total deaths

SELECT 
location, 
date, 
total_cases, 
total_deaths, 
ROUND((total_deaths/total_cases)*100,2) AS deathpercentage
FROM coviddeaths
WHERE location = 'United kingdom';

-- total case vs population

SELECT 
location, 
date, 
population, 
total_cases, ROUND((total_cases/population)*100,2) AS cases_to_population
FROM coviddeaths
WHERE location = 'United kingdom';

-- highest infection rate to population

SELECT 
location, 
population, 
MAX(total_cases) AS max_infection_count, 
ROUND(MAX((total_cases/population)*100),2) AS infected_population
FROM coviddeaths
GROUP BY 1,2
ORDER BY 4;

-- countries with the highest death count per population

SELECT 
location,
MAX(total_deaths) AS totaldeath_count
FROM coviddeaths
GROUP BY 1
ORDER BY 2 DESC;

-- continents with the highest death count

SELECT 
continent,
MAX(total_deaths) AS totaldeath_count
FROM coviddeaths
WHERE continent IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;

-- global numbers

SELECT 
date,
SUM(new_cases) AS total_cases,
SUM(new_deaths) AS total_deaths,
SUM(new_deaths)/SUM(new_cases)*100 AS death_percentage
FROM coviddeaths
WHERE continent IS NOT NULL
ORDER BY 1,2;