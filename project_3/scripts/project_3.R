library(tidyverse)
library(ggplot2)
library(dplyr)
library(lubridate)
install.packages("Hmisc")
library(Hmisc)

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
View(ee_reviews)

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

#getting descriptive stats on a few variables
agehist = hist(client$'Client Age at Entry', 
     main = "Histogram of Client Age at Entry", 
     xlab = "Client Age", 
     col = "light blue")
summary(client$`Client Age at Entry`)
#Looks like the median age of clients is 46 with a range of 18-81 yo

#seeing if there are differences in age distribution by gender or race 
transform(client, 'Client Age at Entry' = as.numeric(as.character('Client Age at Entry')))
class(client$`Client Age at Entry`)

agebygender = ggplot(client, aes(x=client$'Client Age at Entry', fill = client$`Client Gender`, color = client$`Client Gender`)) + 
  geom_histogram(alpha = 0.5, position = 'dodge')+
  theme(legend.position = 'bottom')+
  theme(legend.title = element_blank())+
  labs(title = "Distribution of Age by Gender", x = "Client Age at Entry", y = "Count", legend = "Gender") 

ggsave("Age_Distribution_by_Gender.png", height =3, width = 5)

#using lubridate package to get the overall length of stay at UMD
LOS_entrydate = entry_exit$`Entry Date`
entrydate = mdy(entry_exit$`Entry Date`)
View(entrydate)

LOS_exitdate = entry_exit$`Exit Date`
exitdate = mdy(entry_exit$`Exit Date`)
View(exitdate)

len = difftime(exitdate, entrydate, units = "weeks")
len = round(len, digits = 0)
View(len)
length_of_stay = data.frame(len)

#adding back the client ID variable
clientid = entry_exit$`Client Unique ID`
clientid = data.frame(clientid)

ageatentry = client$'Client Age at Entry' 
age = data.frame(ageatentry)

LOS = data.frame(clientid, length_of_stay, age)
View(LOS)

