library(argonR)
library(htmltools)
library(magrittr)
library(here)

argonInstall(here::here("argonR"))

argonPage(
  title = "ArgonR Static Template",
  author =  "Somebody",
  description = "HTML Static Template",
  navbar = NULL,
  footer = NULL
)

navbar <- argonNavbar(
  id = "main-navbar",
  src = "https://demos.creative-tim.com/argon-design-system/assets/img/brand/white.png",
  # left menu
  argonNavMenu(
    argonDropdown(
      name = "Components",
      size = "lg",
      argonDropdownItem(
        name = "Getting Started",
        description = "Blabla",
        src = "",
        icon = argonIcon("spaceship", color = "white"),
        status = "primary"
      ),
      argonDropdownItem(
        name = "Foundation",
        description = "Blabla",
        src = "",
        icon = argonIcon("palette", color = "white"),
        status = "warning"
      ),
      argonDropdownItem(
        name = "Components",
        description = "Blabla",
        src = "",
        icon = argonIcon("ui-04", color = "white"),
        status = "success"
      )
    )
  ),
  # right menu
  argonNavMenu(
    side = "right",
    argonNavItem(
      name = "facebook",
      src = "https://www.facebook.com",
      icon = icon("facebook-square"),
      tooltip = "Like us on Facebook"
    ),
    argonNavItem(
      name = "instagram",
      src = "https://www.instagram.com",
      icon = icon("instagram"),
      tooltip = "Follow us on Instagram"
    ),
    argonNavItem(
      name = "twitter",
      src = "https://www.twitter.com",
      icon = icon("twitter-square"),
      tooltip = "Follow us on Twitter"
    ),
    argonNavItem(
      name = "github",
      src = "https://www.github.com",
      icon = icon("github"),
      tooltip = "Star us on Github"
    )
  )
 )
 
 footer <- argonFooter(
  has_card = FALSE,
  argonContainer(
    size = "lg",
    argonRow(
      argonColumn(
        width = 6,
        argonIconWrapper(
          iconTag = argonIcon("atom"),
          size = "lg",
          status = "success",
          shadow = TRUE,
          hover_shadow = TRUE
        ),
        argonH1(
          display = 3,
          "Insert anything in the footer"
        ),
        argonLead(
          "The Arctic Ocean freezes every winter and much of 
                         the sea-ice then thaws every summer, and that process 
                         will continue whatever"
        )
        ),
      argonColumn(
        width = 6,
        argonCarousel(
          width = 12,
          id = "carousel2",
          argonCarouselItem(
            src = "http://www.72pxdesigns.com/wp-content/uploads/2017/06/preview-814162.png",
            active = TRUE
          ),
          argonCarouselItem(
            src = "http://www.72pxdesigns.com/wp-content/uploads/2017/06/preview-814162.png",
            active = FALSE
          )
        )
      )
    )
  )
 )
 
 body <- argonSection(
  size = "lg",
  status = "default",
  gradient = TRUE,
  separator = TRUE,
  separator_color = "white",
  shape = TRUE,
  argonColumn(
    argonRow(
      argonColumn(
        width = 6,
        argonH1(
          display = 3, 
          "ArgonR, HTML static template for R", 
          htmltools::span("completed with examples")
        ) %>% argonTextColor(color = "white"),
        argonLead(
          "Argon is a great free UI package based on Bootstrap 
                         4 that includes the most important components and features"
        ) %>% argonTextColor(color = "white")
        ),
      argonColumn(
        width = 6,
        argonImage(
          src = "inst/images/imac.svg",
          floating = TRUE
        ) %>% argonPersp(side = "right")
        %>% argonBlur()
      )
    )
  )
)

# generate the page
 example <- argonPage(
  title = "ArgonR Static Template",
  author =  "Somebody",
  description = "HTML Static Template",
  navbar = navbar,
  footer = footer,
  # main content
  body
 )

 # create the path
 path <- here::here("argonR")

 # generate the static page
 argonPageTemplate(filename = "example", path = path, argonPage = example)
 