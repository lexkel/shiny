
# Shiny app functions

verticalTabPanelBadge <- function (title, ..., value = title, icon = NULL, badge = NULL, box_height = "160px") 
{
  tabbox <- tags$a(href = "#", class = "list-group-item text-center", 
                   style = if (!is.null(box_height)) 
                     paste("height:", box_height), `data-value` = value, 
                   `data-toggle` = "tab", if (!is.null(icon)) 
                     tags$h4(icon), tags$h4(title),
                   badge)
  
  tabcontent <- tags$div(class = "bhoechie-tab-content", `data-value` = value, ...)
  
  list(tabbox = tabbox, tabcontent = tabcontent)
}

verticalTabsetPanelCustomCSS <- function(..., selected = NULL, id = NULL, color = "#112446", contentWidth = 9, menuSide = "left") {
  stopifnot(is.numeric(contentWidth))
  stopifnot(contentWidth >= 1, contentWidth <= 12)
  menuSide <- match.arg(menuSide, choices = c("right", "left"))
  tabs <- list(...)
  if (is.null(id)) {
    id <- paste(sample(c(letters, LETTERS), 24, TRUE), collapse = "")
  }
  if (is.null(selected)) {
    indice <- 1
  } else {
    values <- lapply(
      X = tabs,
      FUN = function(x) {
        tagGetAttribute(tag = x$tabcontent, attr = "data-value")
      }
    )
    values <- unlist(values)
    indice <- which(values == selected)
    if (length(indice) < 1)
      indice <- 1
  }
  tabs[[indice]]$tabcontent$attribs$class <- paste(
    tabs[[indice]]$tabcontent$attribs$class, "active"
  )
  tabs[[indice]]$tabbox$attribs$class <- paste(
    tabs[[indice]]$tabbox$attribs$class, "active"
  )
  if (identical(menuSide, "left")) {
    vtabTag <- tags$div(
      class="col-sm-12 vrtc-tab-panel-container tabbable",
      id = if(is.null(id)) id else paste0(id,"-tabbable"),
      tags$div(
        class = sprintf("col-sm-%s vrtc-tab-panel-menu vrtc-tab-panel-menu-%s", 12 - contentWidth, menuSide),
        tags$div(
          class="list-group vertical-tab-panel",
          lapply(X = tabs, FUN = `[[`, "tabbox"),
          id=id
        )
      ),
      tags$div(
        class = sprintf("col-sm-%s vrtc-tab-panel  tab-content", contentWidth),
        lapply(X = tabs, FUN = `[[`, "tabcontent")
      )
    )
  } else {
    vtabTag <- tags$div(
      class="col-sm-12 vrtc-tab-panel-container tabbable",
      id = if(is.null(id)) id else paste0(id,"-tabbable"),
      tags$div(
        class = sprintf("col-sm-%s vrtc-tab-panel  tab-content", contentWidth),
        lapply(X = tabs, FUN = `[[`, "tabcontent")
      ),
      tags$div(
        class = sprintf("col-sm-%s vrtc-tab-panel-menu vrtc-tab-panel-menu-%s", 12 - contentWidth, menuSide),
        tags$div(
          class="list-group vertical-tab-panel",
          id = id,
          lapply(X = tabs, FUN = `[[`, "tabbox")
        )
      )
    )
  }
  
  vtabStyle <- tags$style(
    HTML(sprintf(
      "#%s-tabbable > div.vrtc-tab-panel-menu div.list-group>a.active .fa{background-color: %s;background-image: %s !important;}",
      id, color, color
    )),
    HTML(sprintf(
      "#%s-tabbable > div.vrtc-tab-panel-menu.vrtc-tab-panel-menu-left div.list-group>a.active:after{border-left: 10px solid %s !important;}",
      id, color
    )),
    HTML(sprintf(
      "#%s-tabbable > div.vrtc-tab-panel-menu.vrtc-tab-panel-menu-right div.list-group>a.active:after{border-right: 10px solid %s !important;}",
      id, color
    )),
    HTML(sprintf(
      "#%s-tabbable > div.vrtc-tab-panel-menu div.list-group>a .glyphicon,
      #%s-tabbable > div.vrtc-tab-panel-menu div.list-group>a .fa {color: %s !important;}",
      id, id, color
    )),
    HTML(sprintf(
      "#%s-tabbable > div.vrtc-tab-panel-menu div.list-group>a.active,
      #%s-tabbable > div.vrtc-tab-panel-menu div.list-group>a.active .glyphicon,
      #%s-tabbable > div.vrtc-tab-panel-menu div.list-group>a.active .fa{
       background-color: %s !important; background-image: %s !important; color: #ffffff !important;
      }",
      id, id, id, color, color
    )),
    HTML(sprintf(
      "#%s-tabbable > div.vrtc-tab-panel-menu.vrtc-tab-panel-menu-left div.list-group>a.active:after{border-left: 10px solid %s !important;}",
      id, color
    )),
    HTML(sprintf(
      "#%s-tabbable > div.vrtc-tab-panel-menu.vrtc-tab-panel-menu-right div.list-group>a.active:after{border-right: 10px solid %s !important;}",
      id, color
    ))
  )
  
  tagList(
    htmltools::htmlDependency(
      name = "vertical-tab",
      version = "0.1.0",
      src = c(href="shinyWidgets/vertical-tab-panel"),
      script = c("vertical-tab-panel.js", "vertical-tab-panel-bindings.js")#,
      # stylesheet = "vertical-tab-panel.css"
    ),
    vtabStyle,
    vtabTag
  )
}