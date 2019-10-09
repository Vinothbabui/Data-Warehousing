

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


