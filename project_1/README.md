---
title: "README"
author: "JessLMurray"
date: "9/18/2019"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE)
```

## Urban Ministries of Durham Data Set

This project is focused on analysis of services provided by the non-profit organization Urban Ministries of Durham (UMD) to the homeless population of Durham county, North Carolina. Data were collected from ~1991 to the present, and include information on goods such as food, clothing, bus tickets, diapers, school supplies, hygiene kits, and financial support provided to clients. Individual clients and families are uniquely identified by a file number and the date of service. Information provided by UMD on variables in the data set are given below:

| Variable | Description |
|:---------|:-----------:|
| Client File Number | Family identifier (individual or family) |
| Client File Merge | Separate files were created for one family then merged later |
| Bus Tickets (Number of) | Service discont. |
| Notes of Service |  |
| Food Provided for | Number of people in the family for which food was provided |
| Food Pounds |  |
| Clothing Items |  |
| Diapers |  |
| School Kits |  |
| Hygiene Kits |  |
| Financial Support | Money provided. Service discont. |

## Urban Ministries of Durham Data Analysis

This analysis will focus on answering the following questions: 

* How many clients/families use services provided by UMD?
* For clients who received aid from UMD on more than one occassion, what is the average time interval between services?
* Which services are provided most frequently?
* Are seasonal trends present in the data (i.e. are certain services provided more frequently during specific times of the year?)
* Are there any long-term trends in the quantity and type of services provided? 

Analyses will attempt to combine data provided by UMD with statistics from the U.S. Census Bureau (https://www.census.gov/quickfacts/fact/table/durhamcountynorthcarolina/HSG445217#HSG445217) and the Community Development Council of Durham (http://www.cdcd.org/). 

For more information on the services provided by UMD to the Durham county community, visit http://www.umdurham.org/. 

