#app.R
library(tidyverse)
library(readxl) 
library(dplyr)
library(lubridate)
library(readxl)  
library(ggplot2)
library(shiny)
library(devtools)

rsconnect::setAccountInfo(name='jesslmurray', token='5CCB97C7AAF85C4C2932DB47530A2B8A', secret='rXMqDS/itm6+4GqDYROWYlwCEmBcVK6QIislFrOG')
#load in the data
#note - I cleaned up the column for "Type of bill paid" by renaming redundancies in excel with the filter tool

umd <- read_excel("UMD_Services_Provided_20190719_cleaned 'type of bill paid'.xls")

#remove all rows with mistyped dates 
library(dplyr)
umdclean <- umd %>% 
  filter(Date >= "1983-01-01") %>% 
  filter(Date <= "2019-09-15")

#separate out dates for plotting purposes 
umdclean <- umdclean %>% 
  mutate(year = lubridate::year(Date), month = lubridate::month(Date), day = lubridate::day(Date))

transform(umdclean, year = as.numeric(year))

umd20 <- umdclean %>%
  filter(Date >= "1999-01-01")

bls_avg <- read_excel("BLS_unemployment_avg.xls")

#histogram of the frequency of clients/families aided per year
umdyear <- umd20$year
histo <- hist(umdyear, main="Frequency of Clients/Families Aided by UMD
              per Year", ylab="Year", col="light blue")
counts <- histo$counts
counts

#correlation between the unemployment rate and the number of clients/families aided per year 
blscorr <- data.frame("Clients/Families Aided Per Year" = counts, 
                      "Unemployment Rate (Percent)" = bls_avg$`avg_unemployment`)
ggplot(blscorr, aes(x=Unemployment.Rate..Percent., y=Clients.Families.Aided.Per.Year)) + 
  geom_point() + 
  geom_smooth(method = 'lm', se=TRUE, formula=y~x) + 
  labs(x="Average Unemployment Rate (Percent)", y="Clients/Families Aided Per Year", 
       title = "National Unemployment vs. Number of Clients/Families Aided per Year")

model = lm(blscorr$Clients.Families.Aided.Per.Year ~ blscorr$Unemployment.Rate..Percent.)
summary(model)

#function for correlation
employ <- function(employ) {
  clientnum = ((employ)*662.9) - 641.2
  return(clientnum)
}

#define UI
ui <- fluidPage(
  
  #App title
  titlePanel("Predicting the Number of Clients/Families Aided by UMD Per Year Based on National Unemployment Rate"),
  
  #sidebar layout with input and output definitions
  sidebarLayout(
    
    #sidebar panel, input
    sidebarPanel(
      numericInput("Unemployment.Rate..Percent.", "Unemployment Rate (Percent)", value = 5, min = 0, max = NA, step = NA, width = NULL)
    ),
    
    #main panel for displaying outputs
    mainPanel(
      
      #output: scatter plot
      tabsetPanel(type = "tabs",
                  tabPanel("Model Prediction", textOutput("clients")), # dependent variable (clients aided/yr) output
                  tabPanel("Scatterplot", plotOutput("blscorr")), # Plot
                  tabPanel("Model Summary Stats", verbatimTextOutput("summary")) # Regression output
                 
      )
      
    )
  )
)

#define server logic for making figure 
server <- function(input, output) {
  
  # dependent variable (clients aided/yr) output
  output$clients <- renderPrint({
     paste('Predicted Clients/Families Aided per Year =', employ(input$Unemployment.Rate..Percent.))
           })
  
  # Scatterplot output
  output$blscorr <- renderPlot({
    ggplot(blscorr, aes(x=Unemployment.Rate..Percent., y=Clients.Families.Aided.Per.Year)) + 
      geom_point() + 
      geom_smooth(method = 'lm', se=TRUE, formula=y~x) + 
      labs(x="Average Unemployment Rate (Percent)", y="Clients/Families Aided Per Year", 
           title = "Clients/Families Aided per Year vs. National Unemployment")
  }, height=400)
  
  # Regression output
  output$summary <- renderPrint({
    fit <- lm(blscorr$Clients.Families.Aided.Per.Year ~ blscorr$Unemployment.Rate..Percent.)
    summary(fit)
  })
  
}

shinyApp(ui = ui, server = server)
rsconnect::deployApp("D:/bios611-projects-fall-2019-JessLMurray/project_2")

traceback()
