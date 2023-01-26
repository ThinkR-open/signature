
<!-- README.md is generated from README.Rmd. Please edit that file -->

# signature <img src="man/figures/logo.png" align="right" height="137" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/ThinkR-open/signature/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ThinkR-open/signature/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/ThinkR-open/signature/branch/main/graph/badge.svg)](https://app.codecov.io/gh/ThinkR-open/signature?branch=main)
<!-- badges: end -->

## Demo

Try the app at **<https://connect.thinkr.fr/signature/>**

## Try locally

``` r
remotes::install_github("ThinkR-open/signature")
```

then:

``` r
signature::run_app()
```

## Description

This application offers a **graphical interface** to **simplify the
creation and/or maintenance of your email signature**.

No more struggling with images or getting lost in the HTML code, the
application offers a series of inputs to update the signature.

Enter your name, first name, email and other information to fill in your
signature.

This application also proposes to **copy the HTML code** via a button in
order to **paste it in the parameters of your mailbox**.

Finally, the banner (image at the bottom of the signature) and the
redirection by clicking on it are easy to update. No more asking
everyone to update their signature to update the banner and the
redirection.

Now you just have to :  
- modify the image stored in this repo to update the banner  
- modify the link of the html file at the root of the project

## How to update the signature?

### The banner

To update the banner image, replace the `current_banner.png` with a new
image with the same name.

    #> inst/app/www/templates/thinkr/assets
    #> ├── current_banner.png
    #> └── logo.jpg

### The redirection url

To update the redirection url, modify the `script` inside `index.html`
at the root of the package:

``` html
<script>
  window.location.replace("https://thinkr.fr/blog/");
</script>
```

### The look of the signature

To change the look of the signature more generally, you need to modify
the HTML inside `template.html`

    #> inst/app/www/templates/thinkr
    #> ├── assets
    #> │   ├── current_banner.png
    #> │   └── logo.jpg
    #> ├── icon.html
    #> └── template.html

## Mockup

This application was built and firstly designed on Figma:  
<https://www.figma.com/file/u95KvEqgWLB8arxt7saZcJ/Untitled?node-id=0%3A1&t=CN1gLBLC5YN1SEOg-1>

## Code of Conduct

Please note that the signature project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
