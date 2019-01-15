var opened = false;
$(document).on('click','.menu_icon', function() {
  if(opened == false){
      $(".menu").animate({left: 0});
      opened = true;
  }
  else {
    $(".menu").animate({left: "-20vw"});
    opened = false;
  }
});
