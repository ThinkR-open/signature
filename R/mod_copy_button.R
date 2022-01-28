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
      icon = icon("google"),
      label = "Copy for Gmail signature",
      `data-clipboard-target` = "#mod_preview-preview",
      width = "100%"
    )
  )
}

#' mod_copy_button Server Functions
#'
#' @importFrom whereami cat_where whereami
#' @importFrom shinyalert shinyalert
#'
#' @noRd
mod_copy_button_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    observeEvent(input$copy, {
      cat_where(whereami())

      shinyalert(
        title = "Copied!",
        text = HTML(
          'Paste it to <a href="https://mail.google.com/mail/u/0/#settings/general" style="color: rgb(225, 98, 89); font-weight:600" target="_blank">Gmail</a> > Settings > See all settings > Signature'
        ),
        html = TRUE,
        type = "success",
        closeOnEsc = TRUE,
        closeOnClickOutside = TRUE,
        animation = "pop"
      )
    })
  })
}