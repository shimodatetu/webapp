$(function(){
  var last_elem;
  $('.thread_cover').each(function(i, elem){
    last_elem = elem;
    if(i == 0){
      $(elem).attr("style","border-radius:5px;");
    }
    else {
      $(elem).attr("class","thread_cover thread_not_first")
    }
    if(i == 1){
      $(elem).attr("style","border-top-right-radius:5px;"+
      "border-top-left-radius:5px; margin-top:20px;");
    }
    var jp_height = $(elem).find(".jp_content_row .post_content_text").height();
    var en_height = $(elem).find(".en_content_row .post_content_text").height();
    var row = Math.max(jp_height,en_height) / 22;
    $(elem).find(".jp_content_row").attr("style","-webkit-line-clamp:"+row);
    $(elem).find(".en_content_row").attr("style","-webkit-line-clamp:"+row);
  });
  $(last_elem).attr("style","border-bottom-right-radius:5px;"+
  "border-bottom-left-radius:5px");
  var options ={"backdrop":"static"}
  //$('#sampleModal').modal(options);
  $("#sampleModal .en_post").click(function(){
    $(".en_data").empty();
    $(".jp_data").empty();
    $(".from_jp").attr("style","display:none");
    $(".from_enjp").attr("style","display:none");
    $(".from_en").attr("style","");
    $(".btn_send").attr("id","en");
    var text = $(".en_form").val();
    if(text == ""){
      $(".en_data").append("Nothing is written.");
    }
    else {
      $(".en_data").append(text);
    }
  })
  $(".words_post_button").click(function(){
    if($(".user_login").attr("id") == "true"){
      var options ={"backdrop":"static"}
      $('#sampleModal').modal(options);
    }
    else {
      alert("If you want to post, you need to login or sign in.\n投稿するには、ログインかサインインが必要です。");
    }
  });
  $("#sampleModal .enjp_post").click(function(){
    $(".en_data").empty();
    $(".jp_data").empty();
    $(".from_jp").attr("style","display:none");
    $(".from_enjp").attr("style","");
    $(".from_en").attr("style","display:none");
    $(".btn_send").attr("id","enjp");
    var text_en = $(".en_form").val();
    var text_jp = $(".jp_form").val();
    if(text_en == ""){
      $(".en_data").append("Nothing is written.");
    }
    else {
      $(".en_data").append(text_en);
    }
    if(text_jp == ""){
      $(".jp_data").append("何も書かれていません");
    }
    else {
      $(".jp_data").append(text_jp);
    }
  })
  $("#sampleModal .jp_post").click(function(){
    $(".en_data").empty();
    $(".jp_data").empty();
    $(".from_jp").attr("style","");
    $(".from_enjp").attr("style","display:none");
    $(".from_en").attr("style","display:none");
    $(".btn_send").attr("id","jp");
    var text = $(".jp_form").val();
    if(text == ""){
      $(".jp_data").append("何も書かれていません");
    }
    else {
      $(".jp_data").append(text);
    }
  })
});
