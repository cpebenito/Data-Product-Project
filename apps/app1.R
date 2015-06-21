
require(rCharts)
#require(base64enc)
  
output$nvd3plot <- renderChart({
  cars1 = as.data.frame(cars)
  
  n1 <- nPlot(mpg ~ model, group = 'am', type = 'multiBarChart',
              data = subset(cars1, am == input$trans)
  )
  
  n1$save('assets/fig/n1.html', cdn=T)
  #n1$set(height = 350, width = 600)
  #n1$show('inline', include_assets = TRUE, cdn = TRUE)
  #cat("<style>.rChart {height: 400px;}</style>")
  #n1$show('inline')
  #<iframe src="assets/fig/n1.html" width=100%, height=600></iframe>  
}) 

