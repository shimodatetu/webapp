$(function(){
  if($('.asd').length){
    $(".asd").multilineSelectmenu();
	}
  if($('.big_select').length){
    $(".big_select").multilineSelectmenu({
      change:function(event,data){
        id = parseInt(data.item.value);
        alert("id:"+id);
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
  }

  if($('.small_select').length){
    $(".small_select").multilineSelectmenu({
      change:function(event,data){
        alert("Please Select Category At First(Not Sub Category) 初めに大カテゴリーを選択してください");
      }
    });
  }
  $(".small_select").on("click",function(){
    if(option_there == false){
        alert("Please Select Category At First(Not Sub Category) 初めに大カテゴリーを選択してください");
    }
  });

  
});
