#install.packages("tidyr")
#install.packages("sqldf")
#install.packages("countrycode")
library("countrycode")
library("tidyr")
library("sqldf")

#improting crop data csv file 
East_Africa <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Region/Eastern_Africa.csv", na.strings = c(""), stringsAsFactors = T)
Middle_Africa <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Region/Middle_Africa.csv", na.strings = c(""), stringsAsFactors = T)
North_Africa <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Region/Northern_Africa.csv", na.strings = c(""), stringsAsFactors = T)
Southern_Africa <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Region/Southern_Africa.csv", na.strings = c(""), stringsAsFactors = T)
Western_Africa <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Region/Western_Africa.csv", na.strings = c(""), stringsAsFactors = T)

#Adding New Column as Sub_Region and Region for Africa
East_Africa$Sub_Region <- "East_Africa" 
#East_Africa$Region <- "Africa"
Middle_Africa$Sub_Region <- "Middle_Africa"
#Middle_Africa$Region <- "Africa"
North_Africa$Sub_Region <- "Nothern_Africa"
Southern_Africa$Sub_Region <- "Southern_Africa"
Western_Africa$Sub_Region <- "Western_Africa"
Africa <- rbind(East_Africa,Middle_Africa,North_Africa,Southern_Africa,Western_Africa)
Africa$Region <- "Africa"

#improting crop data csv file 
North_America <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Region/Northern_America.csv", na.strings = c(""), stringsAsFactors = T)
Central_America <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Region/Central_America.csv", na.strings = c(""), stringsAsFactors = T)
Caribbean_America <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Region/Caribbean.csv", na.strings = c(""), stringsAsFactors = T)
South_America <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Region/South_America.csv", na.strings = c(""), stringsAsFactors = T)

#Adding New Column as Sub_Region and Region for America
North_America$Sub_Region <- "North_America"
Central_America$Sub_Region <- "Central_America"
Caribbean_America$Sub_Region <- "Caribbean"
South_America$Sub_Region <- "South_america"
America <- rbind(North_America,South_America,Central_America,Caribbean_America)
America$Region <- "United States of America"

#improting crop data csv file 
Central_Asia <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Region/Central_ASia.csv", na.strings = c(""), stringsAsFactors = T)
Eastern_Asia <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Region/Eastern_Asia.csv", na.strings = c(""), stringsAsFactors = T)
Southern_Asia <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Region/Southern_Asia.csv", na.strings = c(""), stringsAsFactors = T)
South_East_Asia <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Region/South_Eastern_Asia.csv", na.strings = c(""), stringsAsFactors = T)
Western_Asia <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Region/Western_Asia.csv", na.strings = c(""), stringsAsFactors = T)

#Adding New Column as Sub_Region and Region for Asia
Central_Asia$Sub_Region <- "Central_Asia"
Eastern_Asia$Sub_Region <- "Eastern_Asia"
Southern_Asia$Sub_Region <- "Southern_Asia"
South_East_Asia$Sub_Region <- "South_Eastern_Asia"
Western_Asia$Sub_Region <- "Western_Asia"
Asia <- rbind(Central_Asia,Eastern_Asia,Southern_Asia,South_East_Asia,Western_Asia)
Asia$Region <- "Asia"

#improting crop data csv file 

Eastern_Europe <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Region/Eastern_Europe.csv", na.strings = c(""), stringsAsFactors = T)
Southern_Europe <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Region/Southern_Europe.csv", na.strings = c(""), stringsAsFactors = T)
Western_Europe <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Region/Western_Europe.csv", na.strings = c(""), stringsAsFactors = T)
Norther_Europe <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Region/Northern_Europe.csv", na.strings = c(""), stringsAsFactors = T)

#Adding New Column as Sub_Region and Region for Asia
Eastern_Europe$Sub_Region <- "Eastern_Europe"
Southern_Europe$Sub_Region <- "Southern_Europe"
Western_Europe$Sub_Region <- "Western_Europe"
Europe <- rbind(Eastern_Europe,Southern_Europe,Western_Europe)
Europe$Region <- "Europe"


Oceania <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Region/Oceania.csv", na.strings = c(""), stringsAsFactors = T)
Oceania$Sub_Region <- "Oceania"
Oceania$Region <- "Oceania"

Crop_Country <- rbind(Asia,America,Africa,Europe,Oceania)
Country_Name <- sqldf('select distinct Area,Sub_Region,Region from Crop_Country')
names <-  Country_Name$Area
#Assigning Country_Code for Each Country usig countrycode package
Country_Name$Country_Code <- countrycode(Country_Name$Area,'country.name','iso3c')


#### CROPS#########

apples <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/crops/apples.csv", na.strings = c(""), stringsAsFactors = T)
barley <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/crops/barley.csv", na.strings = c(""), stringsAsFactors = T)
cereals <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/crops/cereals.csv", na.strings = c(""), stringsAsFactors = T)
citrus_fruit <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/crops/citrus fruit.csv", na.strings = c(""), stringsAsFactors = T)
maize <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/crops/maize.csv", na.strings = c(""), stringsAsFactors = T)
oil_crops <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/crops/oil_corps.csv", na.strings = c(""), stringsAsFactors = T)
paddy_rice <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/crops/paddy_rice.csv", na.strings = c(""), stringsAsFactors = T)
roots_tubers <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/crops/roots & tubers.csv", na.strings = c(""), stringsAsFactors = T)
sugar_cane <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/crops/sugar cane.csv", na.strings = c(""), stringsAsFactors = T)
suger_beets <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/crops/suger beet.csv", na.strings = c(""), stringsAsFactors = T)
vegetables <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/crops/vegetables.csv", na.strings = c(""), stringsAsFactors = T)
wheat <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/crops/wheat.csv", na.strings = c(""), stringsAsFactors = T)



crops_data <- rbind (apples,barley,cereals,citrus_fruit,maize,oil_crops,paddy_rice,roots_tubers,sugar_cane,suger_beets,vegetables,wheat)
colnames(crops_data)[15] <- "Year"
colnames(crops_data)[16] <- "Yield_Production"

crop_yield <- gather(crops_data,Year,Yield_Production,-Country,-Country.Name,-Country.RegionId,-Country.FrenchName,-Element,-Element.Name,-Element.FrenchName,-Item,-Item.Name,-Item.Definition,-Item.FrenchName,-Scale,-Units)
crop_yield$Year <- gsub("[^0-9]","",crop_yield$Year)

crop_yield$Country_Code <- countrycode(crop_yield$Country.Name,'country.name','iso3c')


Crop_Harvested <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/Crop_Area_Harvested_FAOSTAT.csv", na.strings = c(""), stringsAsFactors = T)
Crop_Harvested$Country_Code <- countrycode(Crop_Harvested$Area,'country.name','iso3c')

Crop_Harvested <- sqldf('select b.Region,b.Sub_Region,a.* from Crop_Harvested a join Country_Name b on a.Country_Code=b.Country_Code')
Crop_Harvested$Item <- ifelse(Crop_Harvested$Item == 'Roots and tubers, nes', 'Roots and Tubers',
                              ifelse(Crop_Harvested$Item == 'Castor oil seed', 'Oilcrops Primary', 
                                     ifelse(Crop_Harvested$Item == 'Fruit, citrus nes', 'Citrus Fruit',
                                            ifelse(Crop_Harvested$Item == 'Rice, paddy', 'Rice paddy',
                                                   ifelse(Crop_Harvested$Item == 'Leeks, other alliaceous vegetables', 'Vegetables Primary',
                                                          ifelse(Crop_Harvested$Item == 'Cereals, nes', 'Cereals',
                                                                 ifelse(Crop_Harvested$Item == 'Oil palm fruit', 'Oilcrops Primary',
                                                                        ifelse(Crop_Harvested$Item == 'Vegetable tallow', 'Vegetables Primary',
                                                                               ifelse(Crop_Harvested$Item == 'Oil, palm', 'Oilcrops Primary',
                                                                                      ifelse(Crop_Harvested$Item == 'Vegetables, leguminous nes', 'Vegetables Primary',
                                                                                             ifelse(Crop_Harvested$Item == 'Oilseeds nes', 'Oilcrops Primary',
                                                                                                    ifelse(Crop_Harvested$Item == 'Barley', 'Barley',
                                                                                                           ifelse(Crop_Harvested$Item == 'Apples', 'Apples',
                                                                                                                  ifelse(Crop_Harvested$Item == 'Wheat', 'Wheat',
                                                                                                                         ifelse(Crop_Harvested$Item == 'Maize', 'Maize',
                                                                                                                                ifelse(Crop_Harvested$Item == 'Sugar beet', 'Sugar beet',
                                                                                                                                       ifelse(Crop_Harvested$Item == 'Sugar cane', 'Sugar cane',
                                                                                                                                              ifelse(Crop_Harvested$Item == 'Vegetables, fresh nes', 'Vegetables Primary','Others'))))))))))))))))))


Crop_Harvested$Value <- as.numeric(Crop_Harvested$Value)

colnames(Crop_Harvested)[9] <- "Harvest_Value"
colnames(crop_yield)[9] <- "crop_name"

crop_yield <- sqldf('select distinct b.Harvest_Value,a.* from crop_yield a join Crop_Harvested b where a.Country_Code = b.Country_Code and a.crop_name = b.item and a.Year = b.Year')

crop_list <- sqldf('select distinct item from Crop_Harvested')

crop_list$clean_crop <- gsub('Total',' ',crop_list$crop_name)

crop_list$clean_crop <- gsub("[^a-z A-Z]","",crop_list$clean_crop)
names(crop_list)[2] <- paste("Item")
crop_list$Item<-  trimws(crop_list$Item, "r")

crop_list$Category <- ifelse(crop_list$Item == 'Barley', 'Primary Grains',
                             ifelse(crop_list$Item == 'Maize', 'Primary Grains',
                                    ifelse(crop_list$Item == 'Wheat', 'Primary Grains',
                                           ifelse(crop_list$Item == 'Cereals', 'Primary Grains',
                                                  ifelse(crop_list$Item == 'Rice paddy', 'Paddy Fields',
                                                         ifelse(crop_list$Item == 'Sugar beet', 'Paddy Fields',
                                                                ifelse(crop_list$Item == 'Sugar cane', 'Paddy Fields',
                                                                       ifelse(crop_list$Item == 'Citrus Fruit', 'Paddy Fields',
                                                                              ifelse(crop_list$Item == 'Apples', 'Paddy Fields',
                                                                                     ifelse(crop_list$Item == 'Vegetables Primary', 'Paddy Fields',
                                                                                            ifelse(crop_list$Item == 'Oilcrops Primary', 'Oil and Ground Crops',
                                                                                                   ifelse(crop_list$Item == 'Roots and Tubers', 'Oil and Ground Crops', 'Others'))))))))))))


crop_yield <- sqldf('select distinct b.Category,b.Item,a.* from crop_yield a join crop_list b on a.crop_name = b.Crop')
crop_yield <- crop_yield[,-7]
colnames(crop_yield)[2] <- "Crop Name"

crop_yield <- sqldf('select distinct * from crop_yield where Year between 2000 and 2018')


crop_yield <- na.omit(crop_yield)


#Exporting data to csv file 
write.csv(crop_yield, file="D:/Data Warehousing/Project/Dataset/final_DS/Final/crop_yield.csv",row.names = FALSE)


#improting crop data csv file 
CPI <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/Consumer Price Indices.csv", na.strings = c(""), stringsAsFactors = T)
CPI <- sqldf('select distinct Year,Area,avg(Value) from CPI group by Year,Area')
CPI$Country_Code <- countrycode(CPI$Area,'country.name','iso3c')
CPI <- sqldf('select distinct b.Region,b.Sub_Region,a.* from CPI a join Country_Name b on a.Country_Code=b.Country_Code')

colnames(CPI)[5] <- "CPI VALUE"

CPI$`CPI VALUE` <- format(round(CPI$`CPI VALUE`, 2), nsmall = 2)
CPI$`CPI VALUE` <- as.numeric(CPI$`CPI VALUE`)


CPI<-  sqldf('select distinct * from CPI where Year between 2000 and 2018')
  
#Exporting Crop Price data frame to local folder as csv file
write.csv(CPI, file="D:/Data Warehousing/Project/Dataset/final_DS/Final/CPI.csv",row.names = FALSE)


############Global GDP##########
gdp = read.csv("D:/Data Warehousing/Project/Dataset/final_DS/w_gdp1.csv", na.strings=c(""), stringsAsFactors = T)

#amazon1 <- gather(United.States,Germany,United.Kingdom,Japan,Rest.of.world,)

colnames(gdp)[1] <- "Country_Name"
colnames(gdp)[2] <- "Country_Code"
colnames(gdp)[3] <- "Indicator_Name"
colnames(gdp)[4] <- "Indicator_Code"
colnames(gdp)[5] <- "Year"
colnames(gdp)[6]  <- "Total_GDP"

gdp1 <- gather(gdp,Year,Total_GDP,-Country_Name,-Country_Code,-Indicator_Name,-Indicator_Code)

gdp1$Year <- gsub("[^0-9]", "", gdp1$Year)

gdp1$Total_GDP <- gdp1$Total_GDP/1000000
gdp1$Total_GDP <- format(round(gdp1$Total_GDP, 2), nsmall = 2)
gdp1$Total_GDP <- as.numeric(gdp1$Total_GDP)
gdp1 <- gdp1[,-3:-4]
gdp1 <- sqldf('select * from gdp1 where Year between 2000 and 2018')
gdp1 <- na.omit(gdp1)
gdp1$Year <- as.numeric(gdp1$Year)

gdp1 <- gdp1[,-1]


write.csv(gdp1, file = "D:/Data Warehousing/Project/Dataset/final_DS/Final/WORLD_GDP.csv",row.names = FALSE)

#Exporting Crop Price data frame to local folder as csv file
organic <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/global-organic-farming.csv", na.strings=c(""), stringsAsFactors = T)
organic$Area.in.hectares <- (organic$Area.in.hectares * 10000000)


write.csv(organic, file = "D:/Data Warehousing/Project/Dataset/final_DS/Final/organic-farming-worldwide.csv",row.names = FALSE)




