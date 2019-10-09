install.packages("tidyr")
install.packages("sqldf")
install.packages("countrycode")
library("countrycode")
library("tidyr")
library("sqldf")


#improting crop data csv file 
Crop_Harvested <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/Crop_Area_Harvested_FAOSTAT.csv", na.strings = c(""), stringsAsFactors = T)
Crop_Price <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/Crop_Producer_Prices(OR).csv", na.strings = c(""), stringsAsFactors = T)
Crop_Price$Country_Code <- countrycode(Crop_Price$Area,'country.name','iso3c')
Crop_Price <- sqldf('select b.Region,b.Sub_Region,a.* from Crop_Price a join Country_Name b on a.Country_Code=b.Country_Code')
Crop_Harvested$Country_Code <- countrycode(Crop_Harvested$Area,'country.name','iso3c')
Crop_Harvested <- sqldf('select b.Region,b.Sub_Region,a.* from Crop_Harvested a join Country_Name b on a.Country_Code=b.Country_Code')
crop_name <- sqldf("select distinct item from Crop_Price")
crop_name$Category <- ifelse(crop_name$Item == 'Apples', 'Healthy Fruit',
                             ifelse(crop_name$Item == 'Fruit, citrus nes', 'Healthy Fruit', 
                                    ifelse(crop_name$Item == 'Barley', 'Primary Grains',
                                           ifelse(crop_name$Item == 'Maize', 'Primary Grains',
                                                  ifelse(crop_name$Item == 'Wheat', 'Primary Grains',
                                                         ifelse(crop_name$Item == 'Cereals, nes', 'Primary Grains',
                                                                ifelse(crop_name$Item == 'Rice, paddy', 'Paddy Fields',
                                                                       ifelse(crop_name$Item == 'Sugar beet', 'Paddy Fields',
                                                                              ifelse(crop_name$Item == 'Sugar cane', 'Paddy Fields',
                                                                                     ifelse(crop_name$Item == 'Vegetables, leguminous nes', 'Paddy Fields',
                                                                                            ifelse(crop_name$Item == 'Leeks, other alliaceous vegetables', 'Paddy Fields',
                                                                                                   ifelse(crop_name$Item == 'Vegetables, fresh nes', 'Paddy Fields',
                                                                                                          ifelse(crop_name$Item == 'Castor oil seed', 'Oil and Ground Crops',
                                                                                                                 ifelse(crop_name$Item == 'Oil palm fruit', 'Oil and Ground Crops',
                                                                                                                        ifelse(crop_name$Item == 'Oilseeds nes', 'Oil and Ground Crops',
                                                                                                                               ifelse(crop_name$Item == 'Roots and tubers, nes', 'Oil and Ground Crops', 'Others'))))))))))))))))


Crop_Price <- sqldf('select b.Category,a.* from Crop_Price a join crop_name b on a.item = b.item')
Crop_Harvested <- sqldf('select b.Category,a.* from Crop_Harvested a join crop_name b on a.item = b.item')

Crop_Harvested <- Crop_Harvested[,-17:-18]
#Exporting Crop Price data frame to local folder as csv file
write.csv(Crop_Price, file="D:/Data Warehousing/Project/Dataset/final_DS/Final/Crop_Price.csv")

#Exporting Crop_harvested data frame to local csv file
write.csv(Crop_Harvested, file="D:/Data Warehousing/Project/Dataset/final_DS/Final/Crop_Harvested.csv")

