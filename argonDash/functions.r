
argonProgressCustom <- function (value, text = "Task completed", status = "primary") 
{
  stopifnot(value <= 100)
  progressWrapper <- 
    htmltools::tags$div(
      class = "progress-wrapper"
    )
  progressTag <- 
    htmltools::tags$div(
      class = "progress-info"
    )
  progressLabel <- if (!is.null(text)) {
    htmltools::tags$div(
      class = "progress-label", htmltools::tags$span(text)
    )
  }
  progressPercent <- 
    htmltools::tags$div(
      class = "progress-percentage", htmltools::span(paste0(value, "%"))
      )
  progressBar <- 
    htmltools::tags$div(
      class = "progress", 
        htmltools::tags$div(
          class = paste0("progress-bar bg-", status), 
          role = "progressbar", 
          `aria-valuenow` = value, 
          `aria-valuemin` = "0", 
          `aria-valuemax` = "100", 
          style = paste0("width: ", value, "%;"))
      )
  progressTag <- 
    htmltools::tagAppendChildren(
      progressTag, 
      progressLabel, 
      progressPercent
    )
  htmltools::tagAppendChildren(
    progressWrapper, 
    progressTag, 
    progressBar
  )
}