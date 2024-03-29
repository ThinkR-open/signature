#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    fixedPage(
      theme = signature_theme(),
      mod_navbar_ui("mod_navbar"),
      tags$div(
        class = "row g-5",
        mod_form_ui("mod_form"),
        mod_preview_ui("mod_preview")
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#'
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www", app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "signature"
    ),
    tags$script(
      src = "https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.5.10/clipboard.min.js"
    )
  )
}

#' signature_theme
#'
#' @importFrom bslib bs_theme bs_add_rules
#' @importFrom sass sass_file
#'
#' @noRd
signature_theme <- function() {
  bs_theme(
    version = 5,
    primary = "#494955",
    secondary = "#F15522"
  ) %>%
    bs_add_rules(
      sass_file(app_sys("app", "www", "custom.sass"))
    )
}
