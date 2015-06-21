##function(input, output) {


##output$inputValue <- renderPrint({input$cyl})
##output$prediction <- renderPrint({bestmpg(input$cyl)})

require(rCharts)
require(base64enc)

output$myplot <- renderChart({
  
  n1 <- nPlot(input$specs ~ model, data = cars, type = input$type, height="500", width="900")
  n1$chart(reduceXTicks = FALSE)
  n1$xAxis(staggerLabels = TRUE)
  n1$setTemplate(afterScript='<style> svg text {font-size: 8px;}</style>')
  n1$xAxis(axisLabel = 'Model')
  n1$save('assets/chart2.html', standalone = TRUE)
  
  n1$set(dom = 'myplot', width = 600)
  n1
  
  #carsapp <- as.data.frame(cars),
  #barplot(carsapp[,input$specs], 
  #       main=input$specs,
  #      ylab="Specs",
  #     cex.axis = par("cex.axis"), 
  #    cex.names= 0.7, las=2, 
  #   names.arg=cars$model)
})




##}
