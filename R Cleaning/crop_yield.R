#install.packages("tidyr")
#install.packages("sqldf")
#install.packages("countrycode")

library("countrycode")
library("tidyr")
library("sqldf")


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
colnames(crops_data)[16] <- "Yeild_Production"

crop_yield <- gather(crops_data,Year,Yeild_Production,-Country,-Country.Name,-Country.RegionId,-Country.FrenchName,-Element,-Element.Name,-Element.FrenchName,-Item,-Item.Name,-Item.Definition,-Item.FrenchName,-Scale,-Units)
crop_yield$Year <- gsub("[^0-9]","",crop_yield$Year)


###crop_yield <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/crop_data.csv", na.strings = c(""), stringsAsFactors = T)
crop_yield <- crop_yield[ -c(1,3:8,10:12)]
crop_yield$Country_Code <- countrycode(crop_yield$Country.Name,'country.name','iso3c')
crop_yield <- sqldf('select b.Sub_Region,b.Region,a.* from crop_yield a join Country_Name b on a.Country_Code=b.Country_Code')
names(crop_yield)[names(crop_yield) == 'Item.Name'] <- 'Crop'



apples <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/Crop_Area/Apples.csv", na.strings = c(""), stringsAsFactors = T)
barley <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/Crop_Area/Barley.csv", na.strings = c(""), stringsAsFactors = T)
cereals <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/Crop_Area/Cereals.csv", na.strings = c(""), stringsAsFactors = T)
citrus_fruit <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/Crop_Area/Citrus Fruit.csv", na.strings = c(""), stringsAsFactors = T)
maize <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/Crop_Area/Maize.csv", na.strings = c(""), stringsAsFactors = T)
oil_crops <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/Crop_Area/Oilcrops.csv", na.strings = c(""), stringsAsFactors = T)
paddy_rice <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/Crop_Area/rice_paddy.csv", na.strings = c(""), stringsAsFactors = T)
roots_tubers <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/Crop_Area/Roots and Tubers.csv", na.strings = c(""), stringsAsFactors = T)
sugar_cane <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/Crop_Area/Sugar cane.csv", na.strings = c(""), stringsAsFactors = T)
suger_beets <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/Crop_Area/Sugar beet.csv", na.strings = c(""), stringsAsFactors = T)
vegetables <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/Crop_Area/Vegetables Primary.csv", na.strings = c(""), stringsAsFactors = T)
wheat <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/Crop_Area/Wheat.csv", na.strings = c(""), stringsAsFactors = T)



crops_data <- rbind (apples,barley,cereals,citrus_fruit,maize,oil_crops,paddy_rice,roots_tubers,sugar_cane,suger_beets,vegetables,wheat)

colnames(crops_data)[5] <- "Year"
colnames(crops_data)[4] <- "Crop"
colnames(crops_data)[6] <- "Harvest_Area"


crops_data$Country_Code <- countrycode(crops_data$country,'country.name','iso3c')
crops_data <- sqldf('select b.Sub_Region,b.Region,a.* from crops_data a join Country_Name b on a.Country_Code=b.Country_Code')
crop_yield <- sqldf('select b.Harvest_Area,a.* from crop_yield a join crops_data b where a.Country_Code = b.Country_Code and a.Crop = b.item and a.Year = b.Year')




crop_list <- sqldf('select distinct Crop from crop_yield')
crop_list$clean_crop <- gsub('Total',' ',crop_list$Crop)

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


crop_yield <- sqldf('select b.Category,b.Item,a.* from crop_yield a join crop_list b on a.Crop = b.Crop')
crop_yield <- crop_yield[,-7]
colnames(crop_yield)[2] <- "Crop Name"



crop_yield <- sqldf('select * from crop_yield where Year between 2000 and 2017')
crop_yield <- na.omit(crop_yield)

#Exporting data to csv file 
write.csv(crop_yield, file="D:/Data Warehousing/Project/Dataset/final_DS/Final/crop_yield.csv",row.names = FALSE)


