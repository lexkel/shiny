
  library(shiny)
  library(argonR)
  library(argonDash)
  library(shinyWidgets)
  library(shinyjs)
  
  source('functions.r')
  
  num_pages <- 4
  
  ui <- fluidPage(
    
    shinyjs::useShinyjs(),
    
    br(),
    
    h1("REMPLAN Rapid cost benefit ratio calculator", align = "center"),
    
    setBackgroundColor(color = "ghostwhite"),
    
    useArgonDash(),
    
    fluidRow(
      
      column(
        
        width = 12,
        
        # align = "center",
        
        argonTabSet(
          id = "tab-1",
          card_wrapper = TRUE,
          horizontal = TRUE,
          circle = FALSE,
          size = "sm",
          width = 12,
          iconList = list("cloud-upload-96", "credit-card", "spaceship", "single-copy-04"),
          argonTab(
            tabName = "Start",
            active = TRUE,
            div(
              style = "height: 520px;",
              prettyRadioButtons(
                inputId = "dist",
                inline = TRUE,
                animation = "pulse",
                label = "Distribution type:",
                c(
                  "Normal" = "norm",
                  "Uniform" = "unif",
                  "Log-normal" = "lnorm",
                  "Exponential" = "exp"
                )
              ),
              plotOutput("distPlot1"),
              uiOutput(
                "progress1", 
                style = "position: absolute; bottom: 0px; width: 97.5%; padding-bottom: 20px;"
              )
            )
          ),
          argonTab(
            tabName = "Costs",
            active = FALSE,
            div(
              style = "height: 520px;",
              uiOutput(
                "progress2",
                style = "position: absolute; bottom: 0px; width: 97.5%; padding-bottom: 20px;"  
              )
            )
          ),
          argonTab(
            tabName = "Benefits",
            active = FALSE,
            div(
              style = "height: 520px;",
              hidden(
                div(
                  class = "page",
                  id = "page1tab3",
                  tags$h3("Forecast methodology")
                ),
                div(
                  class = "page",
                  style = "height: 520px;",
                  id = "page2tab3",
                  tags$h3("Forecast methodology")                ),
                div(
                  class = "page",
                  style = "height: 520px;",
                  id = "page3tab3",
                  tags$h3("Forecast methodology")
                ),
                div(
                  class = "page",
                  style = "height: 520px;",
                  id = "page4tab3",
                  tags$h3("Forecast methodology")
                )
              ),
              uiOutput(
                "progress3", 
                style = "position: absolute; bottom: 0px; width: 97.5%; padding-bottom: 20px;"
              ),
              div(
                style = "position: absolute; top: 0px; right: 40px; padding-top: 40px;",
                hidden(
                  lapply(seq(num_pages), function(i) {
                    div(
                      class = "page_indicator_tab3",
                      id = paste0("page_indicator_tab3", i),
                      tags$p("Page", i, "of ", num_pages)
                    )
                  })
                ),
                actionButton(
                  inputId = "prevBtn3", 
                  label = NULL,
                  icon = icon("chevron-left", class = "fa-1x")),
                actionButton(
                  inputId = "nextBtn3", 
                  label = NULL,
                  icon = icon("chevron-right", class = "fa-1x"))
              )
            )
          ),
          argonTab(
            tabName = "Summary",
            active = FALSE,
            div(
              style = "height: 520px;",
              hidden(
                div(
                  class = "page",
                  id = "page1tab4",
                  tags$h3("Forecast methodology")
                ),
                div(
                  class = "page",
                  style = "height: 52px;",
                  id = "page2tab4",
                  tags$h3("Forecast methodology")                ),
                div(
                  class = "page",
                  style = "height: 520px;",
                  id = "page3tab4",
                  tags$h3("Forecast methodology")
                ),
                div(
                  class = "page",
                  style = "height: 520px;",
                  id = "page4tab4",
                  tags$h3("Forecast methodology")
                )
              ),
              uiOutput(
                "progress4",
                style = "position: absolute; bottom: 0px; width: 97.5%; padding-bottom: 20px;"  
              ),
              div(
                style = "position: absolute; top: 0px; right: 40px; padding-top: 40px;",
                hidden(
                  lapply(seq(num_pages), function(i) {
                    div(
                      class = "page_indicator_tab4",
                      id = paste0("page_indicator_tab4", i),
                      tags$p("Page", i, "of ", num_pages)
                    )
                  })
                ),
                actionButton(
                  inputId = "prevBtn4", 
                  label = NULL,
                  icon = icon("chevron-left", class = "fa-1x")),
                actionButton(
                  inputId = "nextBtn4", 
                  label = NULL,
                  icon = icon("chevron-right", class = "fa-1x"))
              )
            )
          )
        )
      )
      
    ),
    
    br(),
    
    fluidRow(
      
      argonInfoCard(
        title = "Estimated costs",
        value = "$1,000,000",
        stat = 75,
        stat_icon = "arrow-up",
        description = "in the first two years of construction",
        icon = "chart-bar",
        icon_background = "success",
        hover_lift = FALSE,
        shadow = FALSE,
        width = 4
      ),
      
      argonInfoCard(
        title = "Estimated benefits",
        value = textOutput("value"),
        stat = -3.48,
        stat_icon = "arrow-down",
        description = "Since last week",
        icon = "chart-pie",
        icon_background = "warning",
        hover_lift = FALSE,
        shadow = FALSE,
        width = 4
      ),
      
      argonInfoCard(
        title = "Estimate rate of return",
        value = "3.5%",
        stat = 12,
        stat_icon = "arrow-up",
        description = "Since last month",
        icon = "percent",
        icon_background = "info",
        hover_lift = FALSE,
        width = 4
      )
      
    )
    
  )
  
  server <- function(input, output, session) {
    
    output$progress1 <- renderUI({
        argonProgress(value = 25, status = "danger", text = "Completion percentage")
    })
    
    output$progress2 <- renderUI({
      argonProgress(value = 50, status = "warning", text = "Completion percentage")
    })
    
    output$progress3 <- renderUI({
      argonProgress(value = 75, status = "warning", text = "Completion percentage")
    })
    
    output$progress4 <- renderUI({
      argonProgressCustom(value = 100, status = "success", text = "Completion percentage")
    })
    
    output$distPlot1 <- renderPlot({
      dist <- switch(input$dist,
                     norm = rnorm,
                     unif = runif,
                     lnorm = rlnorm,
                     exp = rexp,
                     rnorm)
      hist(dist(500))
    })
    
    output$distPlot2 <- renderPlot({
      dist <- switch(input$dist,
                     norm = rnorm,
                     unif = runif,
                     lnorm = rlnorm,
                     exp = rexp,
                     rnorm)
      hist(dist(500))
    })
    
    output$distPlot3 <- renderPlot({
      dist <- switch(input$dist,
                     norm = rnorm,
                     unif = runif,
                     lnorm = rlnorm,
                     exp = rexp,
                     rnorm)
      hist(dist(500))
    })
    
    output$distPlot4 <- renderPlot({
      dist <- switch(input$dist,
                     norm = rnorm,
                     unif = runif,
                     lnorm = rlnorm,
                     exp = rexp,
                     rnorm)
      hist(dist(500))
    })
    
    output$value <- renderText(input$valueBox)
    
    # --- methodology pages toggle
    
    # Tab 3 page buttons
    
    rv3 <- reactiveValues(page = 1)
    
    observe({
      toggleState(id = "prevBtn3", condition = rv3$page > 1)
      toggleState(id = "nextBtn3", condition = rv3$page < num_pages)
      hide(selector = ".page")
      show(paste0("page", rv3$page))
      hide(selector = ".page_indicator_tab3")
      show(paste0("page_indicator_tab3", rv3$page))
    })
    
    navPage3 <- function(direction) {
      rv3$page <- rv3$page + direction
    }
    
    observeEvent(input$prevBtn3, navPage3(-1))
    observeEvent(input$nextBtn3, navPage3(1))
    
    # Tab 4 page buttons
    
    rv4 <- reactiveValues(page = 1)
    
    observe({
      toggleState(id = "prevBtn4", condition = rv4$page > 1)
      toggleState(id = "nextBtn4", condition = rv4$page < num_pages)
      hide(selector = ".page")
      show(paste0("page", rv4$page))
      hide(selector = ".page_indicator_tab4")
      show(paste0("page_indicator_tab4", rv4$page))
    })
    
    navPage4 <- function(direction) {
      rv4$page <- rv4$page + direction
    }
    
    observeEvent(input$prevBtn4, navPage4(-1))
    observeEvent(input$nextBtn4, navPage4(1))
    
  }
  
  shinyApp(ui, server)