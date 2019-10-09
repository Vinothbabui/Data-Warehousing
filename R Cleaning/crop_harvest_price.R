#install.packages("tidyr")
#install.packages("sqldf")
#install.packages("countrycode")
library("countrycode")
library("sqldf")


#improting crop data csv file 
Crop_Harvested <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/Crop_Area_Harvested_FAOSTAT.csv", na.strings = c(""), stringsAsFactors = T)
Crop_Price <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/Crop_Producer_Prices(OR).csv", na.strings = c(""), stringsAsFactors = T)
Crop_Price$Country_Code <- countrycode(Crop_Price$Area,'country.name','iso3c')
Crop_Price <- sqldf('select b.Region,b.Sub_Region,a.* from Crop_Price a join Country_Name b on a.Country_Code=b.Country_Code')
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
Crop_Price$Item <- ifelse(Crop_Price$Item == 'Roots and tubers, nes', 'Roots and Tubers',
                          ifelse(Crop_Price$Item == 'Castor oil seed', 'Oilcrops Primary', 
                                 ifelse(Crop_Price$Item == 'Fruit, citrus nes', 'Citrus Fruit',
                                        ifelse(Crop_Price$Item == 'Rice, paddy', 'Rice paddy',
                                               ifelse(Crop_Price$Item == 'Leeks, other alliaceous vegetables', 'Vegetables Primary',
                                                      ifelse(Crop_Price$Item == 'Cereals, nes', 'Cereals',
                                                             ifelse(Crop_Price$Item == 'Oil palm fruit', 'Oilcrops Primary',
                                                                    ifelse(Crop_Price$Item == 'Vegetable tallow', 'Vegetables Primary',
                                                                           ifelse(Crop_Price$Item == 'Oil, palm', 'Oilcrops Primary',
                                                                                  ifelse(Crop_Price$Item == 'Vegetables, leguminous nes', 'Vegetables Primary',
                                                                                         ifelse(Crop_Price$Item == 'Oilseeds nes', 'Oilcrops Primary',
                                                                                                ifelse(Crop_Price$Item == 'Barley', 'Barley',
                                                                                                       ifelse(Crop_Price$Item == 'Apples', 'Apples',
                                                                                                              ifelse(Crop_Price$Item == 'Wheat', 'Wheat',
                                                                                                                     ifelse(Crop_Price$Item == 'Maize', 'Maize',
                                                                                                                            ifelse(Crop_Price$Item == 'Sugar beet', 'Sugar beet',
                                                                                                                                   ifelse(Crop_Price$Item == 'Sugar cane', 'Sugar cane',
                                                                                                                                          ifelse(Crop_Price$Item == 'Vegetables, fresh nes', 'Vegetables Primary','Others'))))))))))))))))))


Crop_Harvested <- Crop_Harvested[ -c(3,5,7,9,11,15,16)]
Crop_Price <- Crop_Price[ -c(3,5,7,9,11,15,17,18)]
Crop_Harvested$Category <- ifelse(Crop_Harvested$Item == 'Barley', 'Primary Grains',
                                  ifelse(Crop_Harvested$Item == 'Maize', 'Primary Grains',
                                         ifelse(Crop_Harvested$Item == 'Wheat', 'Primary Grains',
                                                ifelse(Crop_Harvested$Item == 'Cereals', 'Primary Grains',
                                                       ifelse(Crop_Harvested$Item == 'Rice paddy', 'Paddy Fields',
                                                              ifelse(Crop_Harvested$Item == 'Sugar beet', 'Paddy Fields',
                                                                     ifelse(Crop_Harvested$Item == 'Sugar cane', 'Paddy Fields',
                                                                            ifelse(Crop_Harvested$Item == 'Citrus Fruit', 'Paddy Fields',
                                                                                   ifelse(Crop_Harvested$Item == 'Apples', 'Paddy Fields',
                                                                                          ifelse(Crop_Harvested$Item == 'Vegetables Primary', 'Paddy Fields',
                                                                                                 ifelse(Crop_Harvested$Item == 'Oilcrops Primary', 'Oil and Ground Crops',
                                                                                                        ifelse(Crop_Harvested$Item == 'Roots and Tubers', 'Oil and Ground Crops', 'Others'))))))))))))


Crop_Harvested$Category <- ifelse(Crop_Harvested$Item == 'Barley', 'Primary Grains',
                                  ifelse(Crop_Harvested$Item == 'Maize', 'Primary Grains',
                                         ifelse(Crop_Harvested$Item == 'Wheat', 'Primary Grains',
                                                ifelse(Crop_Harvested$Item == 'Cereals', 'Primary Grains',
                                                       ifelse(Crop_Harvested$Item == 'Rice paddy', 'Paddy Fields',
                                                              ifelse(Crop_Harvested$Item == 'Sugar beet', 'Paddy Fields',
                                                                     ifelse(Crop_Harvested$Item == 'Sugar cane', 'Paddy Fields',
                                                                            ifelse(Crop_Harvested$Item == 'Citrus Fruit', 'Paddy Fields',
                                                                                   ifelse(Crop_Harvested$Item == 'Apples', 'Paddy Fields',
                                                                                          ifelse(Crop_Harvested$Item == 'Vegetables Primary', 'Paddy Fields',
                                                                                                 ifelse(Crop_Harvested$Item == 'Oilcrops Primary', 'Oil and Ground Crops',
                                                                                                        ifelse(Crop_Harvested$Item == 'Roots and Tubers', 'Oil and Ground Crops', 'Others'))))))))))))

c.names <- sqldf('select distinct Item,Category from Crop_Harvested')

Crop_Harvested$Value <- as.numeric(Crop_Harvested$Value)

#Exporting Crop Price data frame to local folder as csv file
write.csv(Crop_Price, file="D:/Data Warehousing/Project/Dataset/final_DS/Final/Crop_Price.csv")

#Exporting Crop_harvested data frame to local csv file
write.csv(Crop_Harvested, file="D:/Data Warehousing/Project/Dataset/final_DS/Final/Crop_Harvested.csv")

