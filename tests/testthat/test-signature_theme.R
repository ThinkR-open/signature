test_that("signature_theme works", {
  theme <- signature_theme()
  testthat::expect_true(inherits(theme, "bs_version_5"))
})