
# Tab 1 content

tab1 <- 
  verticalTabPanelBadge(
  
    # Tab box
    
    title = "Title 1", 
    icon = icon("home", "fa-2x"),
    badge = 
      hidden(
        span(
          id = "successBadge1",
          class = "badge",
          style = "background-color: #469408; color: #fff;",
          "Success"
        ),
        span(
          id = "failureBadge1",
          class = "badge",
          style = "background-color: #a91b0c; color: #fff;",
          "Failure"
        ),
        span(
          id = "warningBadge1",
          class = "badge",
          style = "background-color: #D9831F; color: #fff;",
          "Warning"
        )
      ),
    
    # Content box
    
    tags$button(
      type = "button",
      id = "saveBtn1",
      class = "btn btn-outline-secondary",
      "Save"
    ),
    
    tags$button(
      type = "button",
      id = "warnBtn1",
      class = "btn btn-outline-secondary",
      "Warning"
    ),
    
    tags$button(
      type = "button",
      id = "errorBtn1",
      class = "btn btn-outline-secondary",
      "Error"
    )
  
  )
