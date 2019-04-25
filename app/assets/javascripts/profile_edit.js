
$(function(){
  $(".profile_image_input").on("change",function(){
    $('#image_submit').click();
  });
  $(".profile_history_change3").click(function(){
    history.replaceState('','','3');
  })
  $(".profile_history_change2").click(function(){
    history.replaceState('','','2');
  })
})
