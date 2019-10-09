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
colnames(crops_data)[16] <- "Yeild_Production"

crop_yield <- gather(crops_data,Year,Yeild_Production,-Country,-Country.Name,-Country.RegionId,-Country.FrenchName,-Element,-Element.Name,-Element.FrenchName,-Item,-Item.Name,-Item.Definition,-Item.FrenchName,-Scale,-Units)
crop_yield$Year <- gsub("[^0-9]","",crop_yield$Year)


###crop_yield <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/crop_data.csv", na.strings = c(""), stringsAsFactors = T)
crop_yield <- crop_yield[ -c(1,3:8,10:12)]

crop_yield$Country_Code <- countrycode(crop_yield$Country.Name,'country.name','iso3c')

crop_yield <- sqldf('select distinct b.Sub_Region,b.Region,a.* from crop_yield a join Country_Name b on a.Country_Code=b.Country_Code')
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
crops_data <- sqldf('select distinct b.Sub_Region,b.Region,a.* from crops_data a join Country_Name b on a.Country_Code=b.Country_Code')
crop_yield <- sqldf('select distinct b.Harvest_Area,a.* from crop_yield a join crops_data b where a.Country_Code = b.Country_Code and a.Crop = b.item and a.Year = b.Year')


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


crop_yield <- sqldf('select distinct b.Category,b.Item,a.* from crop_yield a join crop_list b on a.Crop = b.Crop')
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


CPI<-  sqldf('select distinct * from CPI where Year between 2000 and 2016')
  
#Exporting Crop Price data frame to local folder as csv file
write.csv(CPI, file="D:/Data Warehousing/Project/Dataset/final_DS/Final/CPI.csv",row.names = FALSE)


############Global GDP##########
gdp = read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Population.csv", na.strings=c(""), stringsAsFactors = T)

#amazon1 <- gather(United.States,Germany,United.Kingdom,Japan,Rest.of.world,)
gdp = gdp[,c(2:4,11,23)]

gdp <- na.omit(gdp)
gdp$GDP....per.capita. <- as.numeric(gdp$GDP....per.capita.)


write.csv(gdp, file = "D:/Data Warehousing/Project/Dataset/final_DS/Final/WORLD_GDP.csv",row.names = FALSE)

#Exporting Crop Price data frame to local folder as csv file
organic <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/global-organic-farming.csv", na.strings=c(""), stringsAsFactors = T)
organic$Area.in.hectares <- (organic$Area.in.hectares * 1000000)


write.csv(organic, file = "D:/Data Warehousing/Project/Dataset/final_DS/Final/organic-farming-worldwide.csv",row.names = FALSE)

#########################GHI##################################3



