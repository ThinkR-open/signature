test_that("Test module: mod_form UI", {
  html <- rvest::minimal_html(mod_form_ui("mod_form"))
  expect_length(
    rvest::html_element(html, "#mod_form-firstname-label"),
    2
  )
  expect_length(
    rvest::html_element(html, "#mod_form-lastname-label"),
    2
  )
  expect_length(
    rvest::html_element(html, "#mod_form-jobtitle-label"),
    2
  )
})

test_that("Test module: mod_form Server", {
  testServer(mod_form_server, args = list(global = reactiveValues()), {
    expect_true(inherits(local, "reactivevalues"))
    session$setInputs(x = 0)
    expect_equal(
      local$github,
      "https://raw.githubusercontent.com/ThinkR-open/signature"
    )

    expect_equal(
      global$firstname,
      "{{ pr\u00e9nom }}"
    )
    session$setInputs(firstname = "Arthur")
    expect_equal(
      global$firstname,
      "Arthur"
    )

    expect_equal(
      global$lastname,
      character(0)
    )
    session$setInputs(lastname = "Breant")
    expect_equal(
      global$lastname,
      "Breant"
    )

    expect_equal(
      global$jobtitle,
      character(0)
    )
    session$setInputs(jobtitle = "Consultant")
    expect_equal(
      global$jobtitle,
      "Consultant"
    )

    expect_equal(
      reactiveValuesToList(global),
      list(
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
    )

    session$setInputs(twitter = "abcd")
    expect_snapshot(global$twitter)
  })
})
