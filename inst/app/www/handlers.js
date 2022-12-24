$(document).ready(function(){
    $("#mod_form-mod_copy_button-copy").click(function(){
        new Clipboard('#mod_form-mod_copy_button-copy');
        $('.toast').toast('show');
    });
  });