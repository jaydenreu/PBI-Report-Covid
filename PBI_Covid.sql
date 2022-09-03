SELECT d.iso_code
	,d.location AS country
	,d.continent
	,d.DATE
	,d.new_cases
	,d.new_cases_per_million
	,d.total_cases
	,d.total_cases_per_million
	,d.total_deaths
	,d.total_deaths_per_million
	,CAST(d.new_deaths AS INT) AS new_deaths
	,(CAST(d.total_deaths AS INT) / d.total_cases) AS death_rate
	,d.new_deaths_per_million
	,v.total_tests
	,v.total_tests_per_thousand
	,v.new_tests
	,v.new_tests_per_thousand
	,v.total_vaccinations
	,v.people_vaccinated
	,v.people_fully_vaccinated
FROM CovidDeaths d
JOIN CovidVaccinations v ON d.iso_code = v.iso_code
	AND d.DATE = v.DATE
WHERE d.continent IS NOT NULL
