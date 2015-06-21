
library(shiny)
library(datasets)
library(dplyr)

data(mtcars)


cars <- mutate(mtcars, model = rownames(mtcars))
cars <- rename(cars, cylinders = cyl, displacement = disp, horsepower = hp, weight = wt)

cars4 <- filter(cars, cylinders=="4")
best4 <- cars4[which.max(cars4$mpg),12]; mpg4<-cars4[which.max(cars4$mpg),1]
bmpg4 <- data.frame(best4, mpg4)

cars6 <- filter(cars, cylinders=="6"); mpg6<-cars6[which.max(cars6$mpg),1]
best6 <- cars6[which.max(cars6$mpg),12]
bmpg6 <- data.frame(best6, mpg6)

cars8 <- filter(cars, cylinders=="8")
best8 <- cars8[which.max(cars8$mpg),12]; mpg8<-cars8[which.max(cars8$mpg),1]
bmpg8 <- data.frame(best8, mpg8)




bestmpg <- function(cyl) {
  
  if(cyl=='4'){
    bmpg4
  } 
  else {
    if(cyl=='6'){
      bmpg6
    } 
    else {
      bmpg8
      
    }

  }  
  
}  
  
shinyServer(function(input, output) {
  
  
  
  
  
  output$inputValue <- renderPrint({input$cyl})
  output$prediction <- renderPrint({bestmpg(input$cyl)})
  
  output$carPlot <- renderPlot({
    
    barplot(cars[,input$specs], 
            main=input$specs,
            ylab="Specs",
            cex.axis = par("cex.axis"), 
            cex.names= 0.7, las=2, 
            names.arg=cars$model)
              })
  
  
  
  
   }
)

