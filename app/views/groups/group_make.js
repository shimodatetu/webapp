$(function(){
  alert("asdasdasdas");
  $(".make_thread_cover .big_select").multilineSelectmenu({
    change:function(event,data){
      id = parseInt(data.item.value);
      var html_text = "";
      for(var i = 0;i < gon.subcategory.length;i++){
        if(gon.subcategory[i].bigcategory_id == id){
          html_text += "<option class='add_option'value='"+ gon.subcategory[i].id +"'>"
            +gon.subcategory[i].name_jp+"|"+gon.subcategory[i].name_en+"</option>"
        }
      }
      $(".small_select").append(html_text);
      $(".small_first_option").html("小カテゴリー|Sub Category");
      $(".small_select").multilineSelectmenu('destroy');
      $(".small_select").multilineSelectmenu();
    }
  });

  $(".make_thread_cover .small_select").multilineSelectmenu();
  $(".make_thread_cover .small-category .ui-selectmenu-button").on("click",function(){
    if($('.small_select').length == 1){
      alert("Please Select Category At First(Not Sub Category) \n初めに大カテゴリーを選択してください");
    }
  });


});
