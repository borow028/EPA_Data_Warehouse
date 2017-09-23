folder="C:/Users/Lavanya/Desktop/EPA Database/Datasets/pollution"
setwd(folder) 

d1 <- read.csv("conreport2006.csv")
d1$year <- 2006
d2 <- read.csv("conreport2007.csv")
d2$year <- 2007
d3 <- read.csv("conreport2008.csv")
d3$year <- 2008
d4 <- read.csv("conreport2009.csv")
d4$year <- 2009
d5 <- read.csv("conreport2010.csv")
d5$year <- 2010
d6 <- read.csv("conreport2011.csv")
d6$year <- 2011


d7 <- read.csv("conreport2012.csv")
d7$year <- 2012
d8 <- read.csv("conreport2013.csv")
d8$year <- 2013
d9 <- read.csv("conreport2014.csv")
d9$year <- 2014
d10 <- read.csv("conreport2015.csv")
d10$year <- 2015
d11 <- read.csv("conreport2016.csv")
d11$year <- 2016

pollution_data <- rbind(d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11)
write.csv(pollution_data, "pollution_us_2000_2016.csv")



folder="C:/Users/Lavanya/Google Drive/EPA Database/Lavanya/Data"
setwd(folder)
pollution <- read.csv("pollution_us_2000_2016.csv")
str(pollution)
colnames(pollution)
pollution_2 = subset(pollution, select=c("State.Code", "County.Code" ,"Site.Num" ,"State" ,           
                                         "County","City","Date.Local" ,"NO2.Units","NO2.Mean" ,"NO2.1st.Max.Value",
                                         "NO2.1st.Max.Hour",  "NO2.AQI" ,"O3.Units","O3.Mean","O3.1st.Max.Value" , "O3.1st.Max.Hour",  
                                         "O3.AQI","SO2.Units","SO2.Mean","SO2.1st.Max.Value" ,"SO2.1st.Max.Hour",  "SO2.AQI" ,         
                                         "CO.Units","CO.Mean" , "CO.1st.Max.Value" , "CO.1st.Max.Hour" ,"CO.AQI"   ))

colnames(pollution_2)
library(dplyr)
pollution_3 <- pollution_2 %>% group_by(State.Code, State, County, County.Code,City, Date.Local) %>% 
              summarize(NO2_Mean = mean(NO2.Mean),
                        NO2_1st_Max_Value = mean(NO2.1st.Max.Value),
                        NO2_1st_Max_Hour = mean(NO2.1st.Max.Hour),
                        NO2_AQI = mean(NO2.AQI),
                        
                        O3_Mean = mean(O3.Mean),
                        O3_1st_Max_Value = mean(O3.1st.Max.Value),
                        O3_1st_Max_Hour = mean(O3.1st.Max.Hour),
                        O3_AQI = mean(O3.AQI),
                        
                        SO2_Mean = mean(SO2.Mean),
                        SO2_1st_Max_Value = mean(SO2.1st.Max.Value),
                        SO2_1st_Max_Hour = mean(SO2.1st.Max.Hour),
                        SO2_AQI = mean(SO2.AQI),
                        
                        CO_Mean = mean(CO.Mean),
                        CO_1st_Max_Value = mean(CO.1st.Max.Value),
                        CO_1st_Max_Hour = mean(CO.1st.Max.Hour),
                        CO_AQI = mean(CO.AQI)
)
colnames(pollution_3) <- c("State_Code", "State" , "County","County_Code" , "City","Date_Local" ,
                           "NO2_Mean" ,"NO2_1st_Max_Value","NO2_1st_Max_Hour",  "NO2_AQI" ,
                           "O3_Mean","O3_1st_Max_Value" , "O3_1st_Max_Hour", "O3_AQI",
                           "SO2_Mean","SO2_1st_Max_Value" ,"SO2_1st_Max_Hour",  "SO2_AQI" ,         
                           "CO_Mean" , "CO_1st_Max_Value" , "CO_1st_Max_Hour" ,"CO_AQI")

write.csv(pollution_3, "pollution_data_modified.csv", row.names = FALSE)

