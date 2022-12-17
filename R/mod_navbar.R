#' mod_navbar UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_navbar_ui <- function(id) {
  ns <- NS(id)
  tagList(
    tags$nav(
      class = "navbar navbar-light bg-transparent",
      tags$a(
        class = "navbar-brand",
        href = "#",
        "Signature"
      )
    )
  )
}

#' mod_navbar Server Functions
#'
#' @importFrom bslib bs_theme_update
#'
#' @noRd
mod_navbar_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
  })
}
