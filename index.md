---
title       : Developing Data Product using Slidify
subtitle    : App for Motor Trend Cars Dataset (1973-74)
author      : cpebenito
job         : 
framework   : io2012      # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [shiny, interactive, nvd3, bootstrap] 
mode        : selfcontained # {standalone, draft, selfcontained}
knit        : slidify::knit2slides
ext_widgets : {rCharts: [libraries/nvd3]}
runtime     : shiny
--- 

## About this App: 



The data in this app came from the R dataset('mtcars'). With this app, the user can see a graphical info of the cars included in the dataset compiled by Motor Trend Cars back in 1974. 

1. The graph can be accessed by selecting one of the parameters in the dropdown window. 

2. Also included in this app, is an option to check which of these cars has the best MPG based on the number of cylinders. 

3. Check this [link](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html) for more information about the dataset.



Please check it out and hope it would show the user how with just a few commands, one can produce a really cool application using Shiny. 



Thanks for checking.

--- .class #id 

## Let's view the dataset


```
##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
## Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```

---

## Structure of Dataset(mtcars)


```
## 'data.frame':	32 obs. of  11 variables:
##  $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
##  $ cyl : num  6 6 4 6 8 6 8 4 4 6 ...
##  $ disp: num  160 160 108 258 360 ...
##  $ hp  : num  110 110 93 110 175 105 245 62 95 123 ...
##  $ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
##  $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
##  $ qsec: num  16.5 17 18.6 19.4 17 ...
##  $ vs  : num  0 0 1 1 0 1 0 1 1 1 ...
##  $ am  : num  1 1 1 0 0 0 0 0 0 0 ...
##  $ gear: num  4 4 4 3 3 3 3 4 4 4 ...
##  $ carb: num  4 4 1 1 2 1 4 2 2 4 ...
```

---

## Slide for App


## Image of Shiny App

<img src="/assets/img/mtchart2.png" width="800" height="400" />

--- 


```r
slidifyUI(    
    
  titlePanel("Motor Trend Cars 1973-74 models"),
   sidebarLayout(      
      sidebarPanel(
         selectInput('trans', 'Transmission Type (Automatic = 0, Manual =1)', c('0', '1')),
        selectInput('specs', 'Choose the Specifications you want to check:', 
                    choices=colnames(cars)),
       
       # checkboxGroupInput("cyl", "How Many Cylinders are you looking at for yor next car?(choose 1 at a time for now)",
        #                   c("4 cyl" = "4",
         #                    "6 cyl" = "6",
          #                   "8 cyl" = "8")),
        
        submitButton('Submit'),
        
      #  dateInput("date", "Date:"),  
       
        helpText ("About this App: The data in this app came from the R dataset mtcars")
      
                 
     ),
        
      # This is where the barplot will be
      mainPanel(
    
      #cat('<iframe src="assets/fig/n1.html" width=20%, height=100></iframe>')
        #tags$div(id = 'nvd3plot', class='shiny-html-output nvd3 rChart')
       )
            
    )
   )
```

```
## <div class="row-fluid">
##   <h2>Motor Trend Cars 1973-74 models</h2>
##   <div class="row">
##     <div class="col-sm-4">
##       <form class="well">
##         <div class="form-group shiny-input-container">
##           <label class="control-label" for="trans">Transmission Type (Automatic = 0, Manual =1)</label>
##           <div>
##             <select id="trans"><option value="0" selected>0</option>
## <option value="1">1</option></select>
##             <script type="application/json" data-for="trans" data-nonempty="">{}</script>
##           </div>
##         </div>
##         <div class="form-group shiny-input-container">
##           <label class="control-label" for="specs">Choose the Specifications you want to check:</label>
##           <div>
##             <select id="specs"><option value="mpg" selected>mpg</option>
## <option value="cyl">cyl</option>
## <option value="disp">disp</option>
## <option value="hp">hp</option>
## <option value="drat">drat</option>
## <option value="wt">wt</option>
## <option value="qsec">qsec</option>
## <option value="vs">vs</option>
## <option value="am">am</option>
## <option value="gear">gear</option>
## <option value="carb">carb</option>
## <option value="model">model</option></select>
##             <script type="application/json" data-for="specs" data-nonempty="">{}</script>
##           </div>
##         </div>
##         <div>
##           <button type="submit" class="btn btn-primary">Submit</button>
##         </div>
##         <span class="help-block">About this App: The data in this app came from the R dataset mtcars</span>
##       </form>
##     </div>
##     <div class="col-sm-8"></div>
##   </div>
## </div>
```


---

## Bar Plot of ShinyApp

Check this [link](https://cpebenito.shinyapps.io/PeerProject) for a live demo of the App

<iframe src="assets/fig/n1.html" width=50%, height=200></iframe>


