---
title: "Project 1 Report (first draft)"
author: "JessLMurray"
date: "9/26/2019"
output: html_document
---
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE, message = FALSE, warning = FALSE)
```

## Urban Ministries of Durham Data Analysis

### How many clients/families use services provided by UMD?

For this question, I first cleaned the data to include only unique client file numbers to represent distinct clients or families who received aid from UMD. **A total of 11,231 clients and familes have been aided by UMD from December of 1990 to July of 2019!**

### Which services are provided most frequently?

To determine the frequency of monetary services provided most often, I made a bar plot of the type of bills paid by category: 
```{r include=FALSE}
setwd("D:/bios611-homework-fall-2019-JessLMurray/bios611-projects-fall-2019-JessLMurray/project_1/data")
library(tidyverse)
library(readxl)  
umd <- read_excel("UMD_Services_Provided_20190719_cleaned 'type of bill paid'.xls")
library(dplyr)
umdclean <- umd %>% filter(Date >= "1983-01-01")
umdclean <- umdclean %>% filter(Date <= "2019-09-15")
#which services are provided most frequently?
colnames(umdclean)[colnames(umdclean)=="Type of Bill Paid"] <- "bill"
umdbills <- umdclean$bill

#remove missing values 
umdbills2 <- na.omit(umdbills)

#convert to a vector
umdbills2 <- as.vector(umdbills2)
class(umdbills2)
umdbills2
```

```{r message=FALSE, echo=FALSE }
barplot(table(umdbills2), main="Bills Paid by UMD", ylab = "Frequency", las=2)
```

### Are there any long-term trends (i.e. from the beginning of data collection to the present) in the quantity of services provided?

To answer this question, I created a histogram that displayed the frequency of the number of unique clients/families served by year: 

```{r include=FALSE}
setwd("D:/bios611-homework-fall-2019-JessLMurray/bios611-projects-fall-2019-JessLMurray/project_1/data")
library(tidyverse)
library(readxl)  
umd <- read_excel("UMD_Services_Provided_20190719_cleaned 'type of bill paid'.xls")
library(dplyr)
umdclean <- umd %>% filter(Date >= "1983-01-01")
umdclean <- umdclean %>% filter(Date <= "2019-09-15")
library(lubridate)
umddate <- umdclean %>% 
  dplyr::mutate(year = lubridate::year(Date), month = lubridate::month(Date), day = lubridate::day(Date))
transform(umddate, year = as.numeric(year))
umdyear <- umddate$year
```

```{r message=FALSE, echo=FALSE }
hist(umdyear, main="Frequency of Clients/Families Aided by UMD per Year", ylab="Year", col="light blue", breaks = 29)
```
