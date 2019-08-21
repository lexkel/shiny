
library(shiny)
library(shinythemes)
library(shinyjs)
library(shinyWidgets)

server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = 10)
    
    hist(
      x, 
      breaks = bins, 
      col = "#75AADB", 
      border = "white",
      xlab = "Waiting time to next eruption (in mins)",
      main = "Histogram of waiting times"
    )
    
  })
  
}