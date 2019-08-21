
# Shiny app server

server <- function(input, output, session) {
  
  observe(
    shinyjs::onclick("saveBtn1", {
      shinyjs::hide(id = "failureBadge1", anim = FALSE)
      shinyjs::hide(id = "warningBadge1", anim = FALSE)
      shinyjs::show(id = "successBadge1", anim = FALSE)
    })
  )
  
  observe(
    shinyjs::onclick("errorBtn1", {
      shinyjs::hide(id = "successBadge1", anim = FALSE)
      shinyjs::hide(id = "warningBadge1", anim = FALSE)
      shinyjs::show(id = "failureBadge1", anim = FALSE)
    })
  )
   
  observe( 
    shinyjs::onclick("warnBtn1", {
      shinyjs::hide(id = "successBadge1", anim = FALSE)
      shinyjs::hide(id = "failureBadge1", anim = FALSE)
      shinyjs::show(id = "warningBadge1", anim = FALSE)
    })
  )
  
}