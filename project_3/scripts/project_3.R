library(tidyverse)
library(ggplot2)
library(dplyr)
library(lubridate)

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

#plotting distribution of age by gender
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

#distribution of length of stay
len_decimal = difftime(exitdate,entrydate, units = "weeks")
len_decimal = round(len_decimal, digits = 1)
View(len_decimal)
len_decimal = data.frame(len_decimal)
len_decimal = as.numeric(unlist(len_decimal))
hist(len_decimal)
LOShist = ggplot(client, aes(x=len_decimal)) + 
  geom_histogram(color = "black", fill = "light blue")+
  theme(legend.position = 'bottom')+
  theme(legend.title = element_blank())+
  labs(title = "Distribution of Length of Stay (Weeks)", x = "Length of Stay", y = "Count") + 
  xlim(0,50)  
LOShist

ggsave("LOS_Distribution.png", height =3, width = 5)

LOShistzoom = ggplot(client, aes(x=len_decimal)) + 
  geom_histogram(bins = 25, color = "black", fill = "light blue")+
  theme(legend.position = 'bottom')+
  theme(legend.title = element_blank())+
  labs(title = "Distribution of Length of Stay (Weeks)", x = "Length of Stay (Weeks)", y = "Count") + 
  xlim(0,5) 
LOShistzoom

ggsave("LOS_Distribution_0-5wks.png", height =3, width = 5)

summary(len_decimal)
#average LOS is 5.7 weeks, with range of 0-128 weeks. median LOS = 2.3 weeks (best to use median since there is right skew to LOS distribution)

#adding back the client ID variable
clientid = entry_exit$`Client Unique ID`
clientid = data.frame(clientid)

ageatentry = client$'Client Age at Entry' 
age = data.frame(ageatentry)

LOS = data.frame(clientid, length_of_stay, age)
View(LOS)

#plotting length of stay by age
losage = ggplot(LOS, aes(x=ageatentry, y=len)) + 
  geom_hex() + 
  labs(title = "Distribution of Length of Stay by Age", x = "Client Age at Entry (y)", y = "Length of Stay (Weeks)")
losage

ggsave("Distribution_LOS_by_Age.png", height=3, width=5)

#plotting length of stay by gender 
LOS = na.omit(data.frame(clientid, length_of_stay, age, client$`Client Gender`))
View(LOS)

LOSbygender = ggplot(LOS, aes(x=LOS$'len', fill = LOS$client..Client.Gender. , color = LOS$client..Client.Gender.)) + 
  geom_histogram(alpha = 0.5, position = 'dodge')+
  theme(legend.position = 'bottom')+
  theme(legend.title = element_blank())+
  labs(title = "Distribution of Length of Stay by Gender", x = "Length of Stay (Weeks)", y = "Count", legend = "Gender") +
  xlim(0,50)
LOSbygender

ggsave("LOS_Distribution_by_Gender.png", height =3, width = 5)

#distribution of race
racetable = table(na.omit(client$`Client Primary Race`))
prop.table(racetable)
#72.9% of clients are black or AA, and 24.8% of clients are white. 1.7% of clients are American Indian or Alaskan native. 

# re-order levels
reorder_size <- function(x) {
  factor(x, levels = names(sort(table(x), decreasing = TRUE)))
}

racebar = ggplot(na.omit(client), aes(x = reorder_size(`Client Primary Race`))) +
  geom_bar(fill = "salmon") +
  xlab("Client Primary Race") +
  theme(axis.text.x = element_text(angle = 65, hjust = 1)) +  
  labs(title = "Distribution of Client Race") + 
  theme(axis.text = element_text(size=4))
  
racebar

ggsave("Racial_distribution.png", height=3, width=5)


#i want to see if there is a racial difference in length of stay. since the vast majority of clients are black or white, i will remove clients who are not black or white so i can more easily visualize racial differences 
LOS = na.omit(data.frame(clientid, length_of_stay, age, client$`Client Gender`, client$`Client Primary Race`))
View(LOS)             

LOSbw = LOS %>% filter(LOS$client..Client.Primary.Race. %in% c("White (HUD)", "Black or African American (HUD)"))
View(LOSbw)

LOSbyrace = ggplot(LOSbw, aes(x=LOSbw$'len', fill = LOSbw$client..Client.Primary.Race. , color = LOSbw$client..Client.Primary.Race.)) + 
  geom_histogram(alpha = 0.5, position = 'dodge')+
  theme(legend.position = 'bottom')+
  theme(legend.title = element_blank())+
  labs(title = "Distribution of Length of Stay by Race (Black or White)", x = "Length of Stay (Weeks)", y = "Count", legend = "Race") +
  xlim(0,50)
LOSbyrace

ggsave("Length_of_Stay_by_Race.png", height = 3, width = 5)


