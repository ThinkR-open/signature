# signature <img src="logo.png" align="right" height="137" />

## Try locally

Assets repository for the ThinkR email signature.

Try the different versions of the signature at:

- Python version: todo

- R version: <https://signature-r-psi.vercel.app/>

- JS version: todo

## How to update the signature?

### The banner

To update the banner image, replace the `current.png` with a new image with the same name.

    #> assets/banner
    #> ├── current_.png
    #> └── team.jpg

### The redirection url

To update the redirection url, modify the `script` inside `index.html` at the root of the package:

```html
<script>
  window.location.replace("https://thinkr.fr/blog/");
</script>
```
