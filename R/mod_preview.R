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
    tags$div(
      class = "col-7",
      tags$div(
        class = "card",
        tags$div(
          class = "card-header",
          tags$div(
            class = "buttons",
            div(class = "close"),
            div(class = "minimize"),
            div(class = "zoom")
          )
        ),
        tags$div(
          class = "card-body",
          tags$div(
            id = "body",
            p("Hello la team !"),
            p("Vous pouvez \u00e9diter votre signature depuis cette interface."),
            p("Il vous restera ensuite \u00e0 l\'ins\u00e9rer en signature."),
            HTML("Merci &#128513"),
          ),
          tags$div(
            id = "copy",
            uiOutput(ns("preview"))
          )
        )
      )
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
        filename = app_sys(
          "app", "www", "templates", "thinkr", "template.html"
        ),
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
}
