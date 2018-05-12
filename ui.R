library(shiny)
library(plotly)
library(ggplot2)  




loadfile <- read.table("School Data with LL.csv", header = TRUE, sep=";")
njcountydataset <- data.frame(loadfile)

data <- njcountydataset
nms <- names(njcountydataset)

shinyUI(fluidPage(

  headerPanel("NJ County Student Statistics Explorer"),
  sidebarPanel(
   
    h4("About"),
    p('This Application with display 3D representation of Total size of Student body by NJ County in relation to user selected choice below:'),
    
    selectInput('x', 'X', choices =  "Total" , selected = "Total" ),
    selectInput('y', 'Y', choices = "County", selected = "County" ),
   
    
    h4("How to Use"),
    p('Pick Category to display in Z dimention (X and Y are static) and see what happens') ,
    selectInput('z', 'Z', choices = nms[5:8] )
    ##selectInput('z', 'Z', choices = c("White","Black","Hispanic","Other") ) 
  ),

  mainPanel(
    
    h3("This Plot spins, try it "),
    plotlyOutput('trendPlot', height = "500px")
  )
)
)


