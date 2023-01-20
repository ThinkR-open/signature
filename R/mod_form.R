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
    tags$div(
      class = "col-5",
      mod_copy_button_ui(ns("mod_copy_button")),
      tags$div(
        class = "form",
        accordion(
          id = "form-accordion",
          items = tagList(
            accordion_item(
              accordion_id = "form-accordion",
              item_id = "personnal",
              item_header = "Informations personnelles",
              button_id = "personnalButton",
              open = TRUE,
              textInput(
                inputId = ns("firstname"),
                label = "Pr\u00e9nom",
                placeholder = "John",
                width = "100%"
              ) %>%
                tagAppendAttributes(class = "form-control-sm"),
              textInput(
                inputId = ns("lastname"),
                label = "Nom",
                placeholder = "Doe",
                width = "100%"
              ) %>%
                tagAppendAttributes(class = "form-control-sm")
            ),
            accordion_item(
              accordion_id = "form-accordion",
              item_id = "professional",
              item_header = "Informations professionnelles",
              button_id = "professionalButton",
              open = FALSE,
              textInput(
                inputId = ns("jobtitle"),
                label = "Titre du poste",
                placeholder = "Consultant & formateur",
                width = "100%"
              ) %>%
                tagAppendAttributes(class = "form-control-sm"),
              textInput(
                inputId = ns("email"),
                label = "Email",
                placeholder = "you@thinkr.fr",
                width = "100%"
              ) %>%
                tagAppendAttributes(class = "form-control-sm"),
              textInput(
                inputId = ns("phone"),
                label = "Num\u00e9ro de t\u00e9l\u00e9phone",
                value = "+33+(0)+x.xx.xx.xx.xx",
                placeholder = "+33+(0)+x.xx.xx.xx.xx",
                width = "100%"
              ) %>%
                tagAppendAttributes(class = "form-control-sm")
            ),
            accordion_item(
              accordion_id = "form-accordion",
              item_id = "social",
              item_header = "R\u00e9seaux sociaux",
              button_id = "socialButton",
              open = FALSE,
              textInput(
                inputId = ns("github"),
                label = "Github",
                value = "https://github.com/ThinkR-open",
                placeholder = "https://github.com/{you}",
                width = "100%"
              ) %>%
                tagAppendAttributes(class = "form-control-sm"),
              textInput(
                inputId = ns("linkedin"),
                label = "Linkedin",
                value = "https://fr.linkedin.com/company/thinkr-sas",
                placeholder = "https://www.linkedin.com/in/{you}/",
                width = "100%"
              ) %>%
                tagAppendAttributes(class = "form-control-sm"),
              textInput(
                inputId = ns("twitter"),
                label = "Twitter",
                value = "https://twitter.com/thinkR_fr",
                placeholder = "https://twitter.com/{you}",
                width = "100%"
              ) %>%
                tagAppendAttributes(class = "form-control-sm"),
              textInput(
                inputId = ns("youtube"),
                label = "Youtube",
                value = "https://www.youtube.com/channel/UCE3OyQLmrQ5tnKc9qDIZbtw",
                placeholder = "https://www.youtube.com/channel/{you}",
                width = "100%"
              ) %>%
                tagAppendAttributes(class = "form-control-sm"),
              textInput(
                inputId = ns("twitch"),
                label = "Twitch",
                value = "https://www.twitch.tv/thinkr_fr",
                placeholder = "https://www.twitch.tv/{you}",
                width = "100%"
              ) %>%
                tagAppendAttributes(class = "form-control-sm")
            )
          )
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
    
    mod_copy_button_server("mod_copy_button")
    
    local <- reactiveValues()
  
    observeEvent(NULL, ignoreNULL = FALSE, ignoreInit = FALSE, once = TRUE, {
      cat_where(whereami())

      local$github <- "https://raw.githubusercontent.com/ThinkR-open/signature/"
      local$github_icons <- file.path(
        local$github, "main", "inst", "app", "www", "icons"
      )
      local$twitter_src <- file.path(local$github_icons, "twitter.gif")
      local$linkedin_src <- file.path(local$github_icons, "linkedin.png")
      local$youtube_src <- file.path(local$github_icons, "youtube.png")
      local$github_src <- file.path(local$github_icons, "github.png")
      local$twitch_src <- file.path(local$github_icons, "twitch.gif")

      lapply(
        c(
          "twitter",
          "linkedin",
          "youtube",
          "github",
          "twitch"
        ),
        function(x) {
          global[[x]] <- create_icon(
            href = input[[paste0(x)]],
            src = local[[paste0(x, "_src")]]
          )
        }
      )

      global$firstname <- "{{ pr\u00e9nom }}"
      global$lastname <- "{{ nom }}"
      global$jobtitle <- "{{ titre du poste }}"
      global$email <- "{{ email }}"
      global$phone <- "{{ t\u00e9l\u00e9phone }}"
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
        cat_where(whereami())
        
        global$firstname <- str_to_title(input$firstname)
        global$lastname <- str_to_title(input$lastname)
        global$jobtitle <- str_to_title(input$jobtitle)

        global$email <- str_to_lower(input$email)
        global$email_url <- glue("mailto:", global$email)

        global$phone <- input$phone
        global$phone_url <- glue("tel:", global$phone)

        global$youtube <- input$youtube
        
        global$linkedin <- create_icon(
          href = input$linkedin,
          src = local$linkedin_src
        )

        global$twitter <- create_icon(
          href = input$twitter,
          src = local$twitter_src
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
      }
    )
  })
}
