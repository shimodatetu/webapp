var option_there = false;
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
  $(".small_select").on("click",function(){
    if(option_there == false){
      if(gon.lang != "jap"){
        alert("Please Select Category At First(Not Sub Category)");
      }
      else {
        alert("初めに大カテゴリーを選択してください");
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
  if(gon.lang != "jap"){
    $(".small_first_option").html("Please Select");
  }
  else {
    $(".small_first_option").html("選択してください");
  }
  option_there = true;
}
