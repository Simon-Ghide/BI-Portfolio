/*
Queries used for Tableau Project
*/



-- 1. 

Select SUM(cast(new_cases as float)) as total_cases, SUM(cast(new_deaths as float)) as total_deaths, SUM(cast(new_deaths as float))/SUM(cast(New_Cases as float))*100 as DeathPercentage
From PortfolioAddition..CovidDeaths$
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2




-- 2. 

-- We take these out as they are not inluded in the above queries and want to stay consistent
-- European Union is part of Europe

Select location, SUM(cast(new_deaths as float)) as TotalDeathCount
From PortfolioAddition..CovidDeaths$
--Where location like '%states%'
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc


-- 3.

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((cast(total_cases as float)/population))*100 as PercentPopulationInfected
From PortfolioAddition..CovidDeaths$
--Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc


-- 4.


Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((cast(total_cases as float)/population))*100 as PercentPopulationInfected
From PortfolioAddition..CovidDeaths$
--Where location like '%states%'
Group by Location, Population, date
order by PercentPopulationInfected desc