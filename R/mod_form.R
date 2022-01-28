#' mod_form UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
mod_form_ui <- function(id) {
  ns <- NS(id)
  tagList(
    column(
      width = 5,
      tags$div(
        class = "form",
        textInput(
          inputId = ns("firstname"),
          label = "Your first name",
          placeholder = "John",
          width = "80%"
        ),
        textInput(
          inputId = ns("lastname"),
          label = "Your last name",
          placeholder = "Doe",
          width = "80%"
        ),
        textInput(
          inputId = ns("jobtitle"),
          label = "Your job title",
          placeholder = "Analyst",
          width = "80%"
        ),
        textInput(
          inputId = ns("email"),
          label = "Your email",
          placeholder = "you@thinkr.fr",
          width = "80%"
        ),
        textInput(
          inputId = ns("phone"),
          label = "Your phone number",
          value = "+33+(0)+x.xx.xx.xx.xx",
          placeholder = "+33+(0)+x.xx.xx.xx.xx",
          width = "80%"
        ),
        textInput(
          inputId = ns("github"),
          label = "Github url",
          value = "https://github.com/ThinkR-open",
          placeholder = "https://github.com/{you}",
          width = "80%"
        ),
        textInput(
          inputId = ns("linkedin"),
          label = "Linkedin url",
          value = "https://fr.linkedin.com/company/thinkr-sas",
          placeholder = "https://www.linkedin.com/in/{you}/",
          width = "80%"
        ),
        textInput(
          inputId = ns("twitter"),
          label = "Twitter url",
          value = "https://twitter.com/thinkR_fr",
          placeholder = "https://twitter.com/{you}",
          width = "80%"
        ),
        textInput(
          inputId = ns("youtube"),
          label = "Youtube url",
          value = "https://www.youtube.com/channel/UCE3OyQLmrQ5tnKc9qDIZbtw",
          placeholder = "https://www.youtube.com/channel/{you}",
          width = "80%"
        ),
        textInput(
          inputId = ns("twitch"),
          label = "Twitch url",
          value = "https://www.twitch.tv/thinkr_fr",
          placeholder = "https://www.twitch.tv/{you}",
          width = "80%"
        )
      )
    )
  )
}

#' mod_form Server Functions
#'
#' @importFrom stringr str_to_title str_to_lower
#' @importFrom glue glue
#' @importFrom whereami cat_where whereami
#'
#' @noRd
mod_form_server <- function(id, global) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    local <- reactiveValues(
      twitter_src = "https://raw.githubusercontent.com/ThinkR-open/signature/main/inst/app/www/icons/twitter.gif",
      linkedin_src = "https://raw.githubusercontent.com/ThinkR-open/signature/main/inst/app/www/icons/linkedin.png",
      youtube_src = "https://raw.githubusercontent.com/ThinkR-open/signature/main/inst/app/www/icons/youtube.png",
      github_src = "https://raw.githubusercontent.com/ThinkR-open/signature/main/inst/app/www/icons/github.png",
      twitch_src = "https://raw.githubusercontent.com/ThinkR-open/signature/main/inst/app/www/icons/twitch.gif"
    )

    observeEvent(NULL, ignoreNULL = FALSE, ignoreInit = FALSE, once = TRUE, {
      cat_where(whereami())

      global$firstname <- "{{ firstname }}"
      global$lastname <- "{{ lastname }}"
      global$jobtitle <- "{{ jobtitle }}"
      global$email <- "{{ email }}"
      global$phone <- "{{ phone }}"

      global$twitter <- create_icon(
        href = input$twitter,
        src = local$twitter_src
      )

      global$linkedin <- create_icon(
        href = input$linkedin,
        src = local$linkedin_src
      )

      global$youtube <- create_icon(
        href = input$youtube,
        src = local$youtube_src
      )

      global$github <- create_icon(
        href = input$github,
        src = local$github_src
      )

      global$twitch <- create_icon(
        href = input$twitch,
        src = local$twitch_src
      )
    })

    observeEvent(
      c(
        input$firstname,
        input$lastname,
        input$jobtitle,
        input$email,
        input$phone,
        input$linkedin,
        input$twitter,
        input$youtube,
        input$github,
        input$twitch
      ),
      ignoreInit = TRUE,
      {
        global$firstname <- str_to_title(input$firstname)
        global$lastname <- str_to_title(input$lastname)
        global$jobtitle <- str_to_title(input$jobtitle)

        global$email <- str_to_lower(input$email)
        global$email_url <- glue("mailto:", global$email)

        global$phone <- input$phone
        global$phone_url <- glue("tel:", global$phone)

        global$youtube <- input$youtube

        if (!is.null(input$linkedin) & input$linkedin != "") {
          global$linkedin <- create_icon(
            href = input$linkedin,
            src = local$linkedin_src
          )
        } else {
          global$linkedin <- NULL
        }

        if (!is.null(input$twitter) & input$twitter != "") {
          global$twitter <- create_icon(
            href = input$twitter,
            src = local$twitter_src
          )
        } else {
          global$twitter <- NULL
        }

        if (!is.null(input$youtube) & input$youtube != "") {
          global$youtube <- create_icon(
            href = input$youtube,
            src = local$youtube_src
          )
        } else {
          global$youtube <- NULL
        }

        if (!is.null(input$github) & input$github != "") {
          global$github <- create_icon(
            href = input$github,
            src = local$github_src
          )
        } else {
          global$github <- NULL
        }

        if (!is.null(input$twitch) & input$twitch != "") {
          global$twitch <- create_icon(
            href = input$twitch,
            src = local$twitch_src
          )
        } else {
          global$twitch <- NULL
        }
      }
    )
  })
}