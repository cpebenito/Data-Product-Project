

library(shiny)
library(dplyr)
library(datasets)
data(mtcars)

cars <- mutate(mtcars, model = rownames(mtcars))
cars <- rename(cars, cylinders = cyl, displacement = disp, horsepower = hp, weight = wt)




shinyUI(
  
  
  
  fluidPage(    
    
    
    titlePanel("Motor Trend Cars 1973-74 models"),
    
    
    sidebarLayout(      
      
      # Sidebar with dropdown selection for input
      sidebarPanel(
        selectInput("specs", "Choose a graph you want to check:", 
                    choices=colnames(cars)),
        
        
        
        checkboxGroupInput("cyl", "How Many Cylinders are you looking at for yor next car?(choose 1 at a time for now)",
                           c("4 cyl" = "4",
                             "6 cyl" = "6",
                             "8 cyl" = "8")),
        
        ##submitButton('Submit'),
        
        dateInput("date", "Date:"),  
        
        
        helpText("About this App: The data in this app came from the R dataset('mtcars'). With this app, the user can see a graphical info of the cars included in the dataset compiled by Motor Trend Cars back in 1974. You can access this by selecting the graph you want to check from the dropdown window above. Also included in this app, is an option to check which of these cars has the best MPG based on the number of cylinders. Please check it out and hope it would show the user how with just a few commands, one can produce a really cool application using Shiny. Thanks for checking - cpebenito ")
      ),
      
      # This is where the barplot will be
      mainPanel(
        plotOutput("carPlot"),
        
        
        h6('Best MPG'),
        h6('Number of Cylinders you entered'),
        verbatimTextOutput("inputValue"),
        h6('The right car for you is a:'),
        verbatimTextOutput("prediction")
      )
      
      
      
      
      
    )
   )
  
  
  
  
)

