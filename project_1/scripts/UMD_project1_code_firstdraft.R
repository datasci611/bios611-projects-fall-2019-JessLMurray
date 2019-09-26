library(tidyverse)

#set wd to current data folder
setwd("D:/bios611-homework-fall-2019-JessLMurray/bios611-projects-fall-2019-JessLMurray/project_1/data")
getwd()

#load in the data
#note - I cleaned up the column for "Type of bill paid" by renaming redundancies in excel with the filter tool
library(readxl)  
umd <- read_excel("UMD_Services_Provided_20190719_cleaned 'type of bill paid'.xls")
View(umd)

#remove all rows with dates prior to 1983 (when UMD was founded)
library(dplyr)
umdclean <- umd %>% filter(Date >= "1983-01-01")
View(umdclean)

#noticed there are some rows with dates in the future - removed those too
umdclean <- umdclean %>% filter(Date <= "2019-09-15")
View(umdclean)

#How many clients/families use services provided by UMD? 
  #find the number of unique client file numbers 
library(dplyr)

colnames(umdclean)[colnames(umdclean)=="client number"] <- "client n"
umdclean

umdunique <- unique(umdclean$`client n`)
length(umdunique)

#how many clients/families used services each year? 
  #separate date column so that year can be used
install.packages("lubridate")
library(lubridate)

umddate <- umdclean %>% 
  dplyr::mutate(year = lubridate::year(Date), month = lubridate::month(Date), day = lubridate::day(Date))
View(umddate)

#convert year column to numeric
transform(umddate, year = as.numeric(year))

#histogram
umdyear <- umddate$year
hist(umdyear)

#which services are provided most frequently?
colnames(umdclean)[colnames(umdclean)=="Type of Bill Paid"] <- "bill"
umdbills <- umdclean$bill
umdbills2 <- na.omit(umdbills)
colnames(umdbills2)[colnames(umdbills2)=="V1"] <- "bill"
View(umdbills2)

library(ggplot2)

ggplot(data.frame(umdbills2), aes(x="V1")) + 
  geom_histogram(stat="count")
