library(tesseract)
library(splitstackshape)
library(countrycode)  

####### Unstructures data ###########
######## Scraping image data ###############
drought <- as.data.frame(ocr("D:/Data Warehousing/Project/Dataset/final_DS/Final/Hungry.jpg",engine = eng))
colnames(drought) <- "Country"
dro <- cSplit(drought,"Country", "\n", "long")
dro <- dro[-c(1:4,15:17),]
dro$GHI_Score <- gsub("[^0-9 .]","",dro$Country)
dro$Country <- gsub("[^a-z A-Z]","",dro$Country)
dro$GHI_Score <- gsub('5 ', '', dro$GHI_Score)
dro$GHI_Score <- gsub('2372', '23.72', dro$GHI_Score)
dro$GHI_Score <- as.numeric(dro$GHI_Score)
dro$GHI_Score <- format(round(dro$GHI_Score, 2), nsmall = 2)
dro$Country[8:9] <- c("Yeman","Zombia")
dro$countrycode <- countrycode(dro$Country,'country.name','iso3c')
dro$countrycode[8:9] <- c("YEM","ZMB")
write.csv(dro, file = "D:/Data Warehousing/Project/Dataset/final_DS/Final/GHI_Score.csv",row.names = FALSE)

