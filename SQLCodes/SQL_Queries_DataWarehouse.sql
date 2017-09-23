--- dimension tables

DROP TABLE dim_time;
CREATE TABLE dim_time (
	time_id INT NOT NULL,
	time_year INT NOT NULL,
	time_month INT NOT NULL,
	time_quarter NVARCHAR(2) NOT NULL,
	time_season NVARCHAR(25) NOT NULL,
	PRIMARY KEY (time_id)
);

DROP TABLE dim_agency;
CREATE TABLE dim_agency (
	agencyID INT NOT NULL,
	datasource NVARCHAR(100) NOT NULL,
	agencyname NVARCHAR(250) NULL,
	agency_address_zip NVARCHAR(250) NULL,
	agency_city NVARCHAR(25) NULL,
	agency_state NVARCHAR(25) NULL,
	agency_update_start_date DATETIME NOT NULL,
	agency_update_end_date DATETIME NULL,
	PRIMARY KEY (agencyID)
);



DROP TABLE dim_location;
CREATE TABLE dim_location (
	location_id INT NOT NULL,
	state_cd NVARCHAR(2) NOT NULL,
	region_cd NVARCHAR(3) NOT NULL,
	region_name NVARCHAR(25) NOT NULL,
	state_name NVARCHAR(25) NOT NULL,
	PRIMARY KEY (location_id)
);



DROP TABLE dim_metric;
CREATE TABLE dim_metric (
	metric_id INT NOT NULL,
	metric_name NVARCHAR(250) NOT NULL,
	metric_unit NVARCHAR(50) NOT NULL,
	PRIMARY KEY (metric_id)
);


DROP TABLE dim_diseasetype;
CREATE TABLE dim_diseasetype (
	metric_id INT NOT NULL,
	disease_id INT NOT NULL,
	diseaseDesc NVARCHAR(250) NOT NULL,
	diseaseType NVARCHAR(50) NOT NULL,
	distype_update_start_date DATETIME NOT NULL,
	distype_update_end_date DATETIME NULL,
	PRIMARY KEY (metric_id)
);

select count(*) from dim_diseasetype;
select count(*) from dim_metric;
select count(*) from dim_time;
select count(*) from dim_agency;
select count(*) from dim_location;

--- fact table
select * from fact_environment;
DROP TABLE fact_environment;
CREATE TABLE fact_environment (
	time_id INT NOT NULL,
	location_id INT NOT NULL,
	carbon_emissions DECIMAL(10,2) NULL,
	ce_agencyname NVARCHAR(100) NULL,
	AverageTemperature DECIMAL(10,2) NULL,
	temp_agencyname NVARCHAR(100) NULL,
	NO2_Mean  DECIMAL(10,2) NULL,
	NO2_1st_Max_Value  DECIMAL(10,2) NULL,
	NO2_1st_Max_Hour  DECIMAL(10,2) NULL,
	NO2_AQI  DECIMAL(10,2) NULL,
	O3_Mean  DECIMAL(10,2) NULL,
	O3_1st_Max_Value  DECIMAL(10,2) NULL,
	O3_1st_Max_Hour  DECIMAL(10,2) NULL,
	O3_AQI  DECIMAL(10,2) NULL,
	SO2_Mean  DECIMAL(10,2) NULL,
	SO2_1st_Max_Value  DECIMAL(10,2) NULL,
	SO2_1st_Max_Hour  DECIMAL(10,2) NULL,
	SO2_AQI  DECIMAL(10,2) NULL,
	CO_Mean  DECIMAL(10,2) NULL,
	CO_1st_Max_Value  DECIMAL(10,2) NULL,
	CO_1st_Max_Hour  DECIMAL(10,2) NULL,
	CO_AQI  DECIMAL(10,2) NULL,
	pollution_agencyname NVARCHAR(100) NULL,
	population_Estimate NUMERIC  NULL,
	Births NUMERIC  NOT NULL,
	Deaths NUMERIC  NOT NULL,
	census_agencyname NVARCHAR(100) NULL,
	Alcohol_Chronic_liver_disease_mortality_No DECIMAL(10,2) NULL,
	Alcohol_Per_capita_consumption_among_persons_aged_ge_14_years_Per_capita_consumption DECIMAL(10,2) NULL,
	Cancer_of_the_colon_and_rectum_colorectal_incidence_Avg_Annual_No DECIMAL(10,2) NULL,
	Cancer_of_the_colon_and_rectum_colorectal_mortality_Avg_Annual_No DECIMAL(10,2) NULL,
	Cancer_of_the_female_breast_mortality_Avg_Annual_No DECIMAL(10,2) NULL,
	Cancer_of_the_female_cervix_mortality_Avg_Annual_No DECIMAL(10,2) NULL,
	Cancer_of_the_lung_and_bronchus_incidence_Avg_Annual_No DECIMAL(10,2) NULL,
	Cancer_of_the_lung_and_bronchus_mortality_Avg_Annual_No DECIMAL(10,2) NULL,
	Cancer_of_the_oral_cavity_and_pharynx_mortality_Avg_Annual_No DECIMAL(10,2) NULL,
	Cancer_of_the_prostate_mortality_Avg_Annual_No DECIMAL(10,2) NULL,
	Cancer_Invasive_all_sites_combined_incidence_Avg_Annual_No DECIMAL(10,2) NULL,
	Cancer_Invasive_all_sites_combined_mortality_Avg_Annual_No DECIMAL(10,2) NULL,
	Cancer_Invasive_of_the_cervix_incidence_Avg_Annual_No DECIMAL(10,2) NULL,
	Cancer_Invasive_of_the_female_breast_incidence_Avg_Annual_No DECIMAL(10,2) NULL,
	Cancer_Invasive_of_the_oral_cavity_or_pharynx_incidence_Avg_Annual_No DECIMAL(10,2) NULL,
	Cancer_Invasive_of_the_prostate_incidence_Avg_Annual_No DECIMAL(10,2) NULL,
	Cancer_Invasive_melanoma_incidence_Avg_Annual_No DECIMAL(10,2) NULL,
	Cancer_Melanoma_mortality_Avg_Annual_No DECIMAL(10,2) NULL,
	Diabetes_Mortality_due_to_diabetes_reported_as_any_listed_cause_of_death_No DECIMAL(10,2) NULL,
	Tobacco_Sale_of_cigarette_packs_No DECIMAL(10,2) NULL,
	disease_agencyid INT NULL,
	alcohol_chronic_liver_disease_mortality_no_code INT NOT NULL,
	alcohol_per_capita_consumption_among_persons_aged_ge_14_years_per_capita_consumption_code INT NOT NULL,
	cancer_of_the_colon_and_rectum_colorectal_incidence_avg_annual_no_code INT NOT NULL,
	cancer_of_the_colon_and_rectum_colorectal_mortality_avg_annual_no_code INT NOT NULL,
	cancer_of_the_female_breast_mortality_avg_annual_no_code INT NOT NULL,
	cancer_of_the_female_cervix_mortality_avg_annual_no_code INT NOT NULL,
	cancer_of_the_lung_and_bronchus_incidence_avg_annual_no_code INT NOT NULL,
	cancer_of_the_lung_and_bronchus_mortality_avg_annual_no_code INT NOT NULL,
	cancer_of_the_oral_cavity_and_pharynx_mortality_avg_annual_no_code INT NOT NULL,
	cancer_of_the_prostate_mortality_avg_annual_no_code INT NOT NULL,
	cancer_invasive_all_sites_combined_incidence_avg_annual_no_code INT NOT NULL,
	cancer_invasive_all_sites_combined_mortality_avg_annual_no_code INT NOT NULL,
	cancer_invasive_of_the_cervix_incidence_avg_annual_no_code INT NOT NULL,
	cancer_invasive_of_the_female_breast_incidence_avg_annual_no_code INT NOT NULL,
	cancer_invasive_of_the_oral_cavity_or_pharynx_incidence_avg_annual_no_code INT NOT NULL,
	cancer_invasive_of_the_prostate_incidence_avg_annual_no_code INT NOT NULL,
	cancer_invasive_melanoma_incidence_avg_annual_no_code INT NOT NULL,
	cancer_melanoma_mortality_avg_annual_no_code INT NOT NULL,
	diabetes_mortality_due_to_diabetes_reported_as_any_listed_cause_of_death_no_code INT NOT NULL,
	tobacco_sale_of_cigarette_packs_no_code INT NOT NULL,
	averagetemperature_code INT NOT NULL,
	carbonemissions_code INT NOT NULL,
	NO2_Mean_code INT NOT NULL,
	NO2_1st_Max_Value_code INT NOT NULL,
	NO2_1st_Max_Hour_code INT NOT NULL,
	NO2_AQI_code INT NOT NULL,
	O3_Mean_code INT NOT NULL,
	O3_1st_Max_Value_code INT NOT NULL,
	O3_1st_Max_Hour_code INT NOT NULL,
	O3_AQI_code INT NOT NULL,
	SO2_Mean_code INT NOT NULL,
	SO2_1st_Max_Value_code INT NOT NULL,
	SO2_1st_Max_Hour_code INT NOT NULL,
	SO2_AQI_code INT NOT NULL,
	CO_Mean_code INT NOT NULL,
	CO_1st_Max_Value_code INT NOT NULL,
	CO_1st_Max_Hour_code INT NOT NULL,
	CO_AQI_code INT NOT NULL,
	population_estimate_code INT NOT NULL,
	births_code INT NOT NULL,
	deaths_code INT NOT NULL,
	PRIMARY KEY (time_id, location_id),
	CONSTRAINT fk_time FOREIGN KEY (time_id) REFERENCES dim_time (time_id),
	CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES dim_location (location_id),
	CONSTRAINT fk_disease FOREIGN KEY (disease_agencyid) REFERENCES dim_agency (agencyID)
);

-- query method

select tb2.time_id, tb3.location_id, tb1.*
from
(select t1.*, t2.temp_agency, t2.ce_agency,
t2.avg_temp, t2.avg_ce
from
(select p.year_num, p.state_name,
p.NO2_Mean_1 as NO2_Mean,
p.CO_Mean_1 as CO_Mean,
p.SO2_Mean_1 as SO2_Mean,
p.O3_Mean_1 as O3_Mean,
 p.NO2_1st_Max_Hour_1 as  NO2st_Max_Hour,
 p.CO_1st_Max_Hour_1 as  COst_Max_Hour,
 p.SO2_1st_Max_Hour_1 as  SO2st_Max_Hour,
 p.O3_1st_Max_Hour_1 as  O3st_Max_Hour,
 p.NO2_AQI_1 as  NO2_AQI,
 p.CO_1st_Max_Value_1 as  COst_Max_Value,
 p.SO2_AQI_1 as  SO2_AQI,
 p.O3_1st_Max_Value_1 as  O3st_Max_Value,
 p.NO2_1st_Max_Value_1 as  NO2st_Max_Value,
 p.CO_AQI_1 as  CO_AQI,
 p.SO2_1st_Max_Value_1 as  SO2st_Max_Value,
 p.O3_AQI_1 as  O3_AQI,

cd.DataSource as cd_agency,
cd.Alcohol_Binge_drinking_frequency_among_adults_aged_ge_18_years_who_binge_drink_Mean,
cd.Alcohol_Chronic_liver_disease_mortality_No,
cd.Alcohol_Per_capita_consumption_among_persons_aged_ge_14_years_Per_capita_consumption,
cd.Cancer_Invasive_all_sites_combined_incidence_Avg_Annual_No,
cd.Cancer_Invasive_all_sites_combined_mortality_Avg_Annual_No,
cd.Cancer_Invasive_melanoma_incidence_Avg_Annual_No,
cd.Cancer_Invasive_of_the_cervix_incidence_Avg_Annual_No,
cd.Cancer_Invasive_of_the_female_breast_incidence_Avg_Annual_No,
cd.Cancer_Invasive_of_the_oral_cavity_or_pharynx_incidence_Avg_Annual_No,
cd.Cancer_Invasive_of_the_prostate_incidence_Avg_Annual_No,
cd.Cancer_Melanoma_mortality_Avg_Annual_No,
cd.Cancer_of_the_colon_and_rectum_colorectal_incidence_Avg_Annual_No,
cd.Cancer_of_the_colon_and_rectum_colorectal_mortality_Avg_Annual_No,
cd.Cancer_of_the_female_breast_mortality_Avg_Annual_No,
cd.Cancer_of_the_female_cervix_mortality_Avg_Annual_No,
cd.Cancer_of_the_oral_cavity_and_pharynx_mortality_Avg_Annual_No,
cd.Cancer_of_the_lung_and_bronchus_incidence_Avg_Annual_No,
cd.Cancer_of_the_lung_and_bronchus_mortality_Avg_Annual_No,
cd.Cancer_of_the_prostate_mortality_Avg_Annual_No,
cd.Diabetes_Mortality_due_to_diabetes_reported_as_any_listed_cause_of_death_No,
c.population_Estimate,c.Births, c.Deaths, c.agencyname as census_agency
from 
(select State_name, year_num, 
AVG(NO2_Mean) as NO2_Mean_1,
AVG(NO2_1st_Max_Value) as NO2_1st_Max_Value_1,
AVG(NO2_1st_Max_Hour) as NO2_1st_Max_Hour_1,
AVG(NO2_AQI) as NO2_AQI_1,
AVG(O3_Mean) as O3_Mean_1,
AVG(O3_1st_Max_Value) as O3_1st_Max_Value_1,
AVG(O3_1st_Max_Hour) as O3_1st_Max_Hour_1,
AVG(O3_AQI) as O3_AQI_1,
AVG(SO2_Mean) as SO2_Mean_1,
AVG(SO2_1st_Max_Value) as SO2_1st_Max_Value_1,
AVG(SO2_1st_Max_Hour) as SO2_1st_Max_Hour_1,
AVG(SO2_AQI) as SO2_AQI_1,
AVG(CO_Mean) as CO_Mean_1,
AVG(CO_1st_Max_Value) as CO_1st_Max_Value_1,
AVG(CO_1st_Max_Hour) as CO_1st_Max_Hour_1,
AVG(CO_AQI) as CO_AQI_1
from pollution group by State_name, year_num) as p
left outer join chronicdisease as cd
on p.year_num = cd.yearStart
and p.State_name = cd.LocationDesc
left outer join census as c
on p.year_num = c.year_num
and p.State_name = c.state_name
) as t1
left join
(select a.yr_dt as year_num, a.State as state_name, a.agencyname as temp_agency, b.agencyname as ce_agency,
avg_temp, avg_ce
from
(select yr_dt, State, agencyname, avg(AverageTemperature) as avg_temp
from
(select temp.*, year(dt) as yr_dt, month(dt) as mon_dt
from temperature as temp) as t
group by yr_dt, State, agencyname) as a
join
(select year_num, agencyname, avg(Value) as avg_ce
from
(select car.*, SUBSTRING(YYYYMM,1,4) as year_num,  SUBSTRING(YYYYMM,5,2) as mon_num
from carbonemissions as car) as c
group by year_num, agencyname) as b
on a.yr_dt = b.year_num) as t2
on t2.year_num = t1.year_num and 
t2.state_name = t1.State_name) as tb1
join dim_time as tb2
on tb1.year_num = tb2.time_year
join dim_location as tb3
on tb1.State_name = tb3.state_name

