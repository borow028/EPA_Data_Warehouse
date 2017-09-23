-- database has following tables

DROP TABLE carbonemissions;
CREATE TABLE carbonemissions (
		MSN VARCHAR(7) NOT NULL,
		YYYYMM VARCHAR(6) NOT NULL,
		Value DECIMAL(10,2) NULL,
		Column_Order VARCHAR(1) NULL,
		Description TEXT NULL,
		Unit TEXT NULL,
		agencyname NVARCHAR(50) NOT NULL,
		PRIMARY KEY (MSN, YYYYMM)
);

DROP TABLE temperature;
CREATE TABLE temperature (
		dt DATETIME NOT NULL,
		State NVARCHAR(25) NOT NULL,
		Country NVARCHAR(25) NOT NULL,
		AverageTemperature DECIMAL(10,2) NULL,
		AverageTemperatureUncertainty DECIMAL(10,2) NULL,
		agencyname NVARCHAR(50) NOT NULL,
		PRIMARY KEY (dt, State, Country )
);


DROP TABLE chronicdisease;
CREATE TABLE chronicdisease (
		YearStart NVARCHAR(4) NOT NULL,
		YearEnd NVARCHAR(4) NOT NULL,
		LocationAbbr NVARCHAR(2) NOT NULL,
		LocationDesc NVARCHAR(25) NOT NULL,
		DataSource NVARCHAR(50) NOT NULL,
		Alcohol_Binge_drinking_frequency_among_adults_aged_ge_18_years_who_binge_drink_Mean DECIMAL(10,2) NULL,
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
		-- agencyname NVARCHAR(50) NOT NULL,
		PRIMARY KEY (YearStart, YearEnd, LocationAbbr, DataSource  )
);



DROP TABLE pollution;
CREATE TABLE pollution (
		State_name NVARCHAR(25) NOT NULL,
		year_num VARCHAR(4) NOT NULL,
		month_num VARCHAR(2) NOT NULL,
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
		agencyname NVARCHAR(50) NOT NULL,
		PRIMARY KEY (State_name, year_num, month_num)
);

DROP TABLE census;
CREATE TABLE census (
	state_name NVARCHAR(25) NOT NULL,
	population_Estimate NUMERIC  NULL,
	Births NUMERIC  NOT NULL,
	Deaths NUMERIC  NOT NULL,
	year_num NVARCHAR(4) NOT NULL,
	agencyname NVARCHAR(50) NOT NULL,
	PRIMARY KEY (year_num, state_name )
);

select count(*) from chronicdisease;
select count(*) from temperature;
select count(*) from carbonemissions;
select count(*) from pollution;
select count(*) from census;

