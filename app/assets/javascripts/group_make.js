$(function(){
  $(".big_select").on("change",function(event){
    $(".add_option").remove();
    var id = $(this).val();
    for(var i = 0;i < gon.category.length;i++) {
      if(gon.category[i].id == id){
        put_subcategory(id);
        return;
      }
    }
  });

});

function put_subcategory(id){
  var html_text = "";
  for(var i = 0;i < gon.subcategory.length;i++){
    if(gon.subcategory[i].bigcategory_id == id){
      if(gon.lang != "jap"){
        html_text += "<option class='add_option'value='"+ gon.subcategory[i].id +"'>"+gon.subcategory[i].name_en+"</option>"
      }
      else {
        html_text += "<option class='add_option'value='"+ gon.subcategory[i].id +"'>"+gon.subcategory[i].name_jp+"</option>"
      }
    }
  }
  $(".small_select").append(html_text);
}
