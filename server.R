library(shiny)
library(plotly)
library(ggplot2)

 loadfile <- read.table("School Data with LL.csv", header = TRUE, sep=";")
 njcountydataset <- data.frame(loadfile)


 data <- njcountydataset
 nms <- names(njcountydataset)


shinyServer <- function(input, output) {

  
  
  #add reactive data information.  
  dataset <- reactive({njcountydataset
  njcountydataset[sample(nrow(njcountydataset), nrow(njcountydataset)),]
  })
  
  output$trendPlot <- renderPlotly({  
    
  if (input$z == "Hispanic")  {
    
    # build graph with ggplot syntax
    plot_ly(njcountydataset, 
            y = njcountydataset$Total , 
            x = njcountydataset$County ,
            z = njcountydataset$Hispanic , 
            type = "scatter3d" , mode = "markers+text"   )
     } else { 
            if (input$z == "Black")  {
            
            # build graph with ggplot syntax
            plot_ly(njcountydataset, 
                    y = njcountydataset$Total , 
                    x = njcountydataset$County ,
                    z = njcountydataset$Black , 
                    type = "scatter3d" , mode = "markers+text"   )
            } else { 
              if (input$z == "White")  {
                
                # build graph with ggplot syntax
                plot_ly(njcountydataset, 
                        y = njcountydataset$Total , 
                        x = njcountydataset$County ,
                        z = njcountydataset$White , 
                        type = "scatter3d" , mode = "markers+text"   )
              }
       
       else  {
    
    # build graph with ggplot syntax
    plot_ly(njcountydataset, 
            y = njcountydataset$Total , 
            x = njcountydataset$County ,
            z = njcountydataset$Other, 
            type = "scatter3d" , mode = "markers+text"   )
  } 
            }}
     
    
  })
  
}
 
