#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  global <- reactiveValues()

  mod_form_server("mod_form", global = global)
  mod_preview_server("mod_preview", global = global)
}