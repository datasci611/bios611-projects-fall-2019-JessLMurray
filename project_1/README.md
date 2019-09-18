---
title: "README"
author: "JessLMurray"
date: "9/18/2019"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Urban Ministries of Durham Data Analysis

This project is focused on analysis of services provided by the non-profit organization Urban Ministries of Durham (UMD) to to the homeless population of Durham county, North Carolina. Data was collected from ~1991 to the present, and includes information on goods such as food, clothing, bus tickets, diapers, school supplies, hygiene kits, and financial support provided to clients. Individual clients and families are uniquely identified by a file number and the date of service. Information provided by UMD on variables in the data set are given below:

```{r message=FALSE}
library("tidyverse")
suppressWarnings(library(tidyverse))
metadata <- data.frame("Client File Number" = "family identifier (individual or family", "Client File Merge" = "separate files were created for one family and merged later", "Bus Tickets (Number of)" = "Service discontinued.", "Notes of Service" = "", "Food Provided for" = "Number of People in the family for which food was provided", "Food Pounds" = "", "Clothing Items" = "", "Diapers" = "", "School Kits" = "", "Hygiene Kits" = "", "Financial Support" = "Money provided to clients. Service discontinued.")
metadata
```
For more information on the services provided by UMD to the Durham county community, visit http://www.umdurham.org/. 
