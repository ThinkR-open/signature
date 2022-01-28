#' mod_preview UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
mod_preview_ui <- function(id) {
  ns <- NS(id)
  tagList(
    column(
      width = 7,
      h1("Fill the form to create your e-mail signature"),
      tags$div(
        class = "preview",
        tags$div(
          class = "header",
          p("Preview")
        ),
        tags$div(
          class = "signature",
          id = "copy",
          uiOutput(ns("preview"))
        )
      ),
      mod_copy_button_ui("mod_copy_button")
    )
  )
}

#' mod_preview Server Functions
#'
#' @noRd
mod_preview_server <- function(id, global) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    output$preview <- renderUI({
      htmlTemplate(
        filename = app_sys("app", "www", "templates", "thinkr", "template.html"),
        firstname = global$firstname,
        lastname = global$lastname,
        jobtitle = global$jobtitle,
        email = global$email,
        email_url = global$email_url,
        phone = global$phone,
        phone_url = global$phone_url,
        linkedin = global$linkedin,
        twitter = global$twitter,
        youtube = global$youtube,
        github = global$github,
        twitch = global$twitch
      )
    })
  })

  mod_copy_button_server("mod_copy_button")
}