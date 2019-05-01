$(function(){
  $(".make_thread_cover .category_title").on("click",function(){
    var scroll_place = $(".category_panel"+$(this).attr("id")).offset().top;
    scroll_place -= 10;
    $(".category_modal").animate({scrollTop:scroll_place},"normal");
  });
  $(".select_category_url").on("click",function(){
    //name : jp
    //value : en
    $('.make_thread_category .small_select').val(this.id)
    $(".category_modal").modal('hide')
    $(".now_category").html("<div class='add_category'>" + $(this).attr("value") + "</div><div class='add_category'>＞　" + $(this).attr("name") + "</div>")
  })
  $(".scroll_button").on("click",function(){
    $(".category_modal").animate({scrollTop:0},"normal");
  })
});
