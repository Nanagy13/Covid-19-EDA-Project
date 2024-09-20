-- Deaths Dataset Preview
select * from coviddeaths;

-- vaccinations Dataset Preview
select * from covidvaccinations;

-- select data that we are using
select location, total_cases, new_cases, date, population, total_deaths
from coviddeaths
order by 1, 2;

-- total cases vs population
select location, total_cases, total_deaths, population, (total_cases/population)*100 as percentageofcasespopulation
from coviddeaths
order by 1, 2;

-- total death vs population
select location, total_cases, total_deaths, population, (total_deaths/population)*100 as percentageofdeadpopulation
from coviddeaths
order by 1, 2;

-- total death vs population in nigeria
select location, total_cases, total_deaths, population, (total_cases/population)*100 as percentageofdeadnigeriapopulation
from coviddeaths
where location = 'nigeria'
order by 1, 2;

-- Mortality rate ; total_deaths/total_cases
select continent, location, date, total_cases, total_deaths, (total_deaths*1.0/total_cases)*100 as mortality_rate
from coviddeaths
where continent is not NULL 
order by 1, 2;

-- continent with the highest death count
Select continent, 
       MAX(CAST(Total_deaths as signed)) as TotalDeathCount
from Coviddeaths
where continent is not NULL
group by continent
order by TotalDeathCount desc;

-- country with the highest death rate compared to population
select continent, location, population, MAX(total_deaths) as hightestDeathCount, MAX((total_deaths * 1.0/population)*100) as PercentPopulationDied
FROM coviddeaths
WHERE Continent is not NULL
Group by continent, location, population
order by 4 desc;

-- country with the highest infection rate compared to population
SELECT continent, location, population, Max(total_cases) as highestInfectionCount, MAX((total_cases * 1.0/population)*100) as PercentPopulationInfected
FROM coviddeaths
WHERE Continent is not NULL
Group by continent, location, population
order by 4 desc;

-- Global cases for each day
 SELECT date, SUM(new_cases) as total_newcases, sum(new_deaths) as total_newdeaths, 
    case
        WHEN SUM(new_cases) <> 0 THEN SUM(new_deaths)*1.0/SUM(new_cases)*100 
        ELSE NULL
    END AS death_rate
FROM coviddeaths
WHERE Continent is not NULL
GROUP BY DATE
Order by date;

-- percentage of the population infected with covid
SELECT continent, location, date, total_cases, population, (total_cases * 1.0 /population) * 100 as PercentPopulationInfected
FROM coviddeaths
WHERE Continent is not NULL
order by 1,2;

