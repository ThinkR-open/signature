test_that("Test module: mod_copy_button UI", {
  
  html <- rvest::minimal_html(mod_copy_button_ui("mod_copy"))
  button <- rvest::html_element(html, "button")
  expect_equal(
    rvest::html_attr(button, "id"),
    "mod_copy-copy"
  )
})
