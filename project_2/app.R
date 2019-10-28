
#app.R
library(tidyverse)
library(tidyr)
library(dplyr)
library(ggplot2)
library(shiny)
library(devtools)
source("helper_functions.R")

#rsconnect::setAccountInfo(name='jesslmurray', token='5CCB97C7AAF85C4C2932DB47530A2B8A', secret='rXMqDS/itm6+4GqDYROWYlwCEmBcVK6QIislFrOG')
#load in the data
#note - I cleaned up the dates and the column for "Type of bill paid" by renaming redundancies in excel with the filter tool
#see helper functions script for description of functions
load_umd()
clean_umd()
umd20 <- clean_umd()
bls_avg<-load_bls()
bls_avg
umdyear <- umd20$year
umdyear <- as.numeric(umdyear)

histo <- hist(umdyear, main="Frequency of Clients/Families Aided by UMD
              per Year", ylab="Year", col="light blue")
counts <- histo$counts

blscorr <- data.frame("Clients/Families Aided Per Year" = counts, 
                      "Unemployment Rate (Percent)" = bls_avg$`avg_unemployment`)
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
  output$clients <- renderText({
    paste('Predicted Number of Clients/Families Aided per Year =', employ(input$Unemployment.Rate..Percent.))
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
#rsconnect::deployApp("D:/bios611-projects-fall-2019-JessLMurray/project_2")