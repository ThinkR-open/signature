test_that("Test module: mod_preview UI", {
  # div #copy is used for copying the signature
  html <- rvest::minimal_html(mod_preview_ui("mod_preview"))
  expect_length(
    rvest::html_element(html, "#copy"),
    2
  )
})

test_that("Test module: mod_preview Server", {
  testServer(
    mod_preview_server,
    args = list(
      global = list(
        github = NULL,
        firstname = "Arthur",
        youtube = NULL,
        jobtitle = "Consultant",
        twitter = NULL,
        linkedin = NULL,
        email = character(0),
        phone = NULL,
        email_url = structure(character(0), class = c("glue", "character")),
        twitch = NULL,
        lastname = "Breant",
        phone_url = structure(character(0), class = c("glue", "character"))
      )
    ),
    {
      expect_length(output$preview, 2)
      expect_equal(names(output$preview), c("html", "deps"))
      expect_snapshot(output$preview)
    }
  )
})
