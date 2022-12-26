#' mod_copy_button UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
mod_copy_button_ui <- function(id) {
  ns <- NS(id)
  tagList(
    actionButton(
      inputId = ns("copy"),
      class = "btn-secondary",
      icon = icon("clipboard"),
      label = "Copier la signature",
      `data-clipboard-target` = "#mod_preview-preview",
      width = "100%"
    ),
    div(
      class = "position-fixed bottom-0 end-0 p-3",
      style = "z-index: 11",
      div(
        class = "toast align-items-center text-white bg-secondary border-0 hide",
        role = "alert",
        `aria-live` = "assertive",
        `aria-atomic` = "true",
        div(
          class = "toast-body",
          "Copi\u00e9e !"
        )
      )
    )
  )
}

#' mod_copy_button Server Functions
#'
#'
#' @noRd
mod_copy_button_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
  })
}
