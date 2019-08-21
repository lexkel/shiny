
  library(shiny)
  library(argonR)
  library(argonDash)
  library(shinyWidgets)
  
  argonProgressCustom <- function (value, text = "Task completed", status = "primary") 
  {
    stopifnot(value <= 100)
    progressWrapper <- htmltools::tags$div(class = "progress-wrapper")
    progressTag <- htmltools::tags$div(class = "progress-info")
    progressLabel <- if (!is.null(text)) {
      htmltools::tags$div(class = "progress-label", htmltools::tags$span(text))
    }
    progressPercent <- htmltools::tags$div(class = "progress-percentage", 
                                           htmltools::span(paste0(value, "%")))
    progressBar <- htmltools::tags$div(class = "progress", 
                                       htmltools::tags$div(class = paste0("progress-bar bg-", 
                                                                          status), role = "progressbar", `aria-valuenow` = value, 
                                                           `aria-valuemin` = "0", `aria-valuemax` = "100", 
                                                           style = paste0("width: ", value, "%;")))
    progressTag <- htmltools::tagAppendChildren(progressTag, 
                                                progressLabel, progressPercent)
    htmltools::tagAppendChildren(progressWrapper, progressTag, 
                                 progressBar)
  }
  
  ui <- fluidPage(
    
    br(),
    
    h1("REMPLAN Rapid cost benefit ratio calculator", align = "center"),
    
    setBackgroundColor(color = "ghostwhite"),
    
    useArgonDash(),
    
    fluidRow(
      
      column(
        
        width = 12,
        
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
            uiOutput("progress1")
          ),
          argonTab(
            tabName = "Costs",
            active = FALSE,
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
            plotOutput("distPlot2"),
            uiOutput("progress2")
          ),
          argonTab(
            tabName = "Benefits",
            active = FALSE,
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
            plotOutput("distPlot3"),
            uiOutput("progress3")
          ),
          argonTab(
            tabName = "Summary",
            active = FALSE,
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
            plotOutput("distPlot4"),
            uiOutput("progress4")
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
        hover_lift = TRUE,
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
        hover_lift = TRUE,
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
        hover_lift = TRUE,
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
    
  }
  
  shinyApp(ui, server)