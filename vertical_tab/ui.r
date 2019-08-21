
  # Shiny app ui framework

  library(shiny)
  library(shinyWidgets)
  library(shinythemes)
  library(shinyjs)
  
  source('functions.r')
  source('tabs/tab1.r')
  source('tabs/tab2.r')
  source('tabs/tab3.r')
  
  ui <- fluidPage(
    
    theme = shinytheme("simplex"),
    
    # tags$head(
    #   tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
    # ),
    
    useShinyjs(),
    
    fluidRow(
      
      column(
        
        width = 10, 
        
        offset = 1,
        
        tags$h2("Update vertical tab panel example:"),
        
        # Edit the CSS using verticalTabsetPanelCustomCSS (in functions folder)?
        
        verticalTabsetPanelCustomCSS(
          
          id = "TABS",
          
          # color = "f1f1f1",
          
          tab1,
          
          tab2,
          
          tab3
        
        )
        
      )
      
    )
    
  )

