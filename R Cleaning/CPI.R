#install.packages("tidyr")
#install.packages("sqldf")
#install.packages("countrycode")
library("countrycode")
library("sqldf")


#improting crop data csv file 
CPI <- read.csv("D:/Data Warehousing/Project/Dataset/final_DS/Final/Raw_Data/Consumer Price Indices.csv", na.strings = c(""), stringsAsFactors = T)
CPI$Country_Code <- countrycode(CPI$Area,'country.name','iso3c')
CPI <- sqldf('select b.Region,b.Sub_Region,a.* from CPI a join Country_Name b on a.Country_Code=b.Country_Code')


CPI <- CPI[ -c(3,5,7,11,13,15:17)]


CPI$Value <- format(round(CPI$Value, 2), nsmall = 2)
CPI$Value <- as.numeric(CPI$Value)
CPI$Year <- 

#Exporting Crop Price data frame to local folder as csv file
write.csv(CPI, file="D:/Data Warehousing/Project/Dataset/final_DS/Final/CPI.csv",row.names = FALSE)


library("tidyr")
gdp = read.csv("D:/Data Warehousing/Project/Dataset/final_DS/w_gdp1.csv", na.strings=c(""), stringsAsFactors = T)

#amazon1 <- gather(United.States,Germany,United.Kingdom,Japan,Rest.of.world,)

colnames(gdp)[1] <- "Country_Name"
colnames(gdp)[2] <- "Country_Code"
colnames(gdp)[3] <- "Indicator_Name"
colnames(gdp)[4] <- "Indicator_Code"
colnames(gdp)[5] <- "Year"
colnames(gdp)[6]  <- "Total_GDP"

gdp1 <- gather(gdp,Year,Total_GDP,-Country_Name,-Country_Code,-Indicator_Name,-Indicator_Code)
help(gather)

gdp1$Year <- gsub("[^0-9]", "", gdp1$Year)

gdp1$Total_GDP <- gdp1$Total_GDP/1000000
gdp1$Total_GDP <- format(round(gdp1$Total_GDP, 2), nsmall = 2)
gdp1$Total_GDP <- as.numeric(gdp1$Total_GDP)
gdp1 <- gdp1[,-3:-4]
gdp1 <- sqldf('select * from gdp1 where Year between 2000 and 2017')
gdp1 <- na.omit(gdp1)
gdp1$Year <- as.numeric(gdp1$Year)

gdp1 <- gdp1[,-1]


write.csv(gdp1, file = "D:/Data Warehousing/Project/Dataset/final_DS/Final/WORLD_GDP.csv",row.names = FALSE)
