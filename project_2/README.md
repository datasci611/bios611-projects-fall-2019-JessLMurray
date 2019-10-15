---
title: "Readme"
author: "JessLMurray"
date: "10/4/2019"
output: html_document
---

## Urban Ministries of Durham Data Set

This project is focused on analysis of goods and services provided by the non-profit organization Urban Ministries of Durham (UMD) to the homeless population of Durham county, North Carolina. Individual clients and families are uniquely identified by a file number and the date of service. Information provided by UMD on variables in the data set are given below:

| Variable | Description |
|:---------|:-----------|
| Client File Number | Family identifier (individual or family) |
| Client File Merge | Separate files were created for one family then merged later |
| Bus Tickets (Number of) | Service discontinued |
| Notes of Service |  |
| Food Provided for | Number of people in the family for which food was provided |
| Food Pounds | Number of pounds of food that each individual or family received when shopping at UMD food pantry |
| Clothing Items | Number of clothing items received per family or individual |
| Diapers | Number of packs of diapers received (individuals/families are given 2 packs of diapers per child, and packs contain 22 diapers on average) |
| School Kits |  |
| Hygiene Kits | Number of kits received per individual or family. Kits contain soap, shampoo, conditioner, lotion, deodorant, a toothbrush, toothpaste, a washcloth, a disposable razor, and a bottle of shaving cream. |
| Financial Support | Money provided. Service discontinued |

## UMD Shiny Dashboard 

While project one focused on descriptive statistics for the data set, project two will focus more on identifying and harnessing trends to allow UMD to anticipate the needs of clients. Analysis will focus on answering the following questions: 
* Are there longitudinal trends present in quantity of different goods of services provided over time?
* Can the level of needed goods and services be predicted based on prior data?
* Does the number of prior visits to UMD correlate to the type and/or amount of goods and services needed?

The shiny dashboard will include predictive tools for determining the amount and/or type of goods and services needed based on the date and the number of prior UMD visits. 

For more information on the services provided by UMD to the Durham county community, visit http://www.umdurham.org/. 
