/*定制单 隐藏*/

$(document).ready(function(){
  $(".pro .hide").click(function(){
    $(this).parents(".pro").hide("slow");
  });
  $(".sheji .hide").click(function(){
    $(this).parents(".sheji").hide("slow");
  });
});