###  <img src="logo.png" align="right" height="137" />

**Assets repository for the ThinkR email signature.**

Try the different versions of the signature at:

| 🤖  | 🕹️ |
|:-:|:-:|
| ![R](https://img.shields.io/badge/r-%23276DC3.svg?style=for-the-badge&logo=r&logoColor=white)  | [signature-r-psi.vercel.app/](https://signature-r-psi.vercel.app/)  |
| ![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)  | [signature-py.vercel.app/](https://signature-py.vercel.app/)  |
| ![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)  | [signature-js-psi.vercel.app/](https://signature-js-psi.vercel.app/)  |


### How to update the signature?

#### The banner

To update the banner image, replace the `current.png` with a new image with the same name.

    #> assets/banner
    #> ├── current_.png
    #> └── team.jpg

#### The redirection url

To update the redirection url, modify the `script` inside `index.html` at the root of the package:

```html
<script>
  window.location.replace("https://thinkr.fr/blog/");
</script>
```
