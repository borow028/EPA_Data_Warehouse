-- For this year 2016, which states defaulted in their Carbonmonoxide emission from the Carbonmonoxide AQI

select time_year,c.state_name,avg([CO_Mean]) as 'Average CO emission',avg([CO_AQI]) as 'Avg CO AQI' 
from [dbo].[fact_environment] as a
left join [dbo].[dim_time] as b
on a.time_id = b.time_id
left join [dbo].[dim_location] as c
on a.location_id= c.location_id
where b.time_year = 2016
group by [time_year],state_name
having avg([CO_Mean]) > avg([CO_AQI])
order by c.state_name;

-- For the year 2012, what is the average SO2 content and the corresponding lung and bronchitis cancer incidences rate in each of the states?

select time_year,c.state_name,avg([NO2_Mean]) as 'Average NO2 emission',sum([Cancer_of_the_lung_and_bronchus_incidence_Avg_Annual_No])/sum([population_Estimate])*10000 as 'lung cancer rate per 10,000'
from [dbo].[fact_environment] as a
left join [dbo].[dim_time] as b
on a.time_id = b.time_id
left join [dbo].[dim_location] as c
on a.location_id= c.location_id
where b.time_year = 2012
group by [time_year],state_name
order by c.state_name;

-- Which are the 5 states that account for highest incidence of lung cancer and bronchus cancer and what is the mortality?

SELECT TOP 5 
  l.state_cd, 
  l.state_name,
  SUM(Cancer_of_the_lung_and_bronchus_incidence_Avg_Annual_No) AS total_incidence,
  SUM(Cancer_of_the_lung_and_bronchus_mortality_Avg_Annual_No) AS total_mortality
FROM fact_environment AS f
JOIN dim_location AS l ON f.location_id = l.location_id
GROUP BY f.location_id,
   l.state_cd,
   l.state_name
ORDER BY total_incidence DESC;

-- What is the trend of Sulphur Di-oxide and average temperature over a period of time (at a monthly level)?

SELECT t.time_month,
  t.time_year,
  l.state_cd,
  l.state_name,
  AVG(f.SO2_Mean) AS avg_SO2_level,
  AVG(f.AverageTemperature) AS avg_temperature
FROM fact_environment AS f
JOIN dim_time AS t ON f.time_id = t.time_id
JOIN dim_location AS l ON f.location_id = l.location_id
GROUP BY t.time_month, 
   t.time_year, 
   state_cd, 
   state_name
HAVING AVG(f.SO2_Mean) IS NOT NULL AND 
  AVG(f.AverageTemperature) IS NOT NULL;
