---
title: "Project 3 Report"
author: "JessLMurray"
date: "12/1/2019"
output: html_document
---

```{r setup, include=FALSE}
library(tidyverse)
library(ggplot2)
library(dplyr)
library(lubridate)

#loading in the data from github and taking a look 
client <- read_tsv(url("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/CLIENT_191102.tsv"), na = "**")

disable_entry <- read_tsv("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/DISABILITY_ENTRY_191102.tsv", na = "**")

ee_udes <- read_tsv("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/EE_UDES_191102.tsv", na = "**")

healthins_entry <- read_tsv("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/HEALTH_INS_ENTRY_191102.tsv", na = "**")

#loading in our data that was wrangled from python
entry_exit_LOS <- read_csv("https://raw.githubusercontent.com/datasci611/bios611-projects-fall-2019-JessLMurray/master/project_3/data/entry_exit_LOS.csv", na = '**')

client_LOS <- read_csv("https://raw.githubusercontent.com/datasci611/bios611-projects-fall-2019-JessLMurray/master/project_3/data/client_LOS.csv", na = "**")
View(client_LOS)
```

## Urban Ministries of Durham Data Analysis

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r cars}
summary(cars)
```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.

