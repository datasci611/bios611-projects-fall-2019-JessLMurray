#helper_functions.R

#function to load in umd data
load_umd = function(){
  umd20 <- read_csv("data/UMD_Services_Provided_20190719_cleaned 'type of bill paid'_cleaned date.csv")
  return(umd20)
}

#function to parse date and transform data
clean_umd = function(){
  umd20 = load_umd()
  umd20 <- umd20 %>%
    separate(Date, sep="/", into = c("month", "day", "year")) %>%
    transform(umd20, year = as.numeric(year))
  return(umd20)
}
umd20 <- clean_umd()

#load BLS data
load_bls = function(){  
  bls_avg <- read_csv("data/BLS_unemployment_avg.csv")
  return(bls_avg)
}

#histogram of the frequency of clients/families aided per year
clean_umdyear = function(){
  umdyear <- umd20$year 
  return(umdyear)
}

numclean_umdyear = function(){
  umdyear <- as.numeric(clean_umdyear)
  return(umdyear)
}

#function for correlation
employ <- function(employ) {
  clientnum = ((employ)*662.9) - 641.2
  return(clientnum)
}

