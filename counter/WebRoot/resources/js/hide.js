/*定制单 隐藏*/

$(document).ready(function(){
  $(".demo .hide").click(function(){
    $(this).parents(".demo").hide("slow");
  });
  $(".sheji .hide").click(function(){
    $(this).parents(".sheji").hide("slow");
  });
});