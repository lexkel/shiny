library(shinythemes)
library(shiny)
library(here)

# Define UI for application that plots random distributions
shinyUI(fluidPage(theme = shinytheme("simplex"),

  # Application title
  titlePanel(div(img(height = 50, width = 150, src = "capture.png"), "Forecast Profile Mock-up")),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      # Input: Slider for the number of bins ----
      sliderInput("obs",
                  "Number of observations:",
                  min = 1,
                  max = 1000,
                  value = 500)
    ),

    # Main panel for displaying outputs ----
    mainPanel(
      plotOutput("distPlot")
    )
  )
  )
)
