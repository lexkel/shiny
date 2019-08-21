
library(shiny)
library(shinythemes)
library(shinyjs)
library(shinyWidgets)

ui <- shinyUI(
  
  fluidPage(
    
    theme = shinytheme("simplex"),
    
    useShinyjs(),
    
    fluidRow(
      
      column(
        
        offset = 1,
        
        width = 4,
        
        tags$h2("Shiny themes templates"),
        
        navlistPanel(
          "Header A",
          tabPanel("Component 1"),
          tabPanel("Component 2"),
          "Header B",
          tabPanel("Component 3"),
          tabPanel("Component 4"),
          "Header C",
          tabPanel("Component 5")
        )
        
      ),
      
      column(
        
        width = 7,
        
        plotOutput(outputId = "distPlot")
        
      )
      
      
    ) 
    
  )
  
)