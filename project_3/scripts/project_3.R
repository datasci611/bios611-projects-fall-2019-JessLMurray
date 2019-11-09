library(tidyverse)

#setting the working directory
getwd()
setwd("D:/bios611-projects-fall-2019-JessLMurray/project_3/scripts")

#loading in the data from github and taking a look 
client <- read_tsv(url("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/CLIENT_191102.tsv"), na = "**")
View(client)

disable_entry <- read_tsv("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/DISABILITY_ENTRY_191102.tsv", na = "**")
View(disable_entry)

disable_exit <- read_tsv("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/DISABILITY_EXIT_191102.tsv", na = "**")
View(disable_exit)

ee_reviews <- read_tsv("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/EE_REVIEWS_191102.tsv", na = "**")
View(disable_reviews)

ee_udes <- read_tsv("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/EE_UDES_191102.tsv", na = "**")
View(ee_udes)

entry_exit <- read_tsv("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/ENTRY_EXIT_191102.tsv", na = "**")
View(entry_exit)

healthins_entry <- read_tsv("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/HEALTH_INS_ENTRY_191102.tsv", na = "**")
View(healthins_entry)

healthins_exit <- read_tsv("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/HEALTH_INS_EXIT_191102.tsv", na = "**")
View(healthins_exit)

income_entry <- read_tsv("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/INCOME_ENTRY_191102.tsv", na = "**")
View(income_entry)

income_exit <- read_tsv("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/INCOME_EXIT_191102.tsv", na = "**")
View(income_exit)

noncash_entry <- read_tsv("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/NONCASH_ENTRY_191102.tsv", na = "**")
View(noncash_entry)

noncash_exit <- read_tsv("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/NONCASH_EXIT_191102.tsv", na = "**")
View(noncash_exit)

provider <- read_tsv("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/PROVIDER_191102.tsv", na = "**")
View(provider)

spdat_fam <- read_tsv("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/VI_SPDAT_FAM_V2_191102.tsv", na = "**")
View(spdat_fam)

spdat_ind <- read_tsv("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/VI_SPDAT_IND_V2_191102.tsv", na = "**")
View(spdat_ind)

spdat_v1 <- read_tsv("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/VI_SPDAT_V1_191102.tsv", na = "**")
View(spdat_v1)
