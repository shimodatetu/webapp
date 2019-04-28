$(function(){
  var last_elem;
  $('.thread_page .thread_cover').each(function(i, elem){
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
    var row = (Math.max(jp_height,en_height) - 10) / 22;
    $(elem).find(".jp_content_row").attr("style","margin:7px; -webkit-line-clamp:"+row.to_i);
    $(elem).find(".en_content_row").attr("style","margin:7px; -webkit-line-clamp:"+row.to_i);
  });
  if(i > 1){
    $(last_elem).attr("style","border-bottom-right-radius:5px;"+
    "border-bottom-left-radius:5px");
  }
  var options ={"backdrop":"static"}
  $(".thread_page .words_post_button").click(function(){
    if(gon.login){
      var options = {"backdrop":"static"};
      $('#sampleModal-'+this.id).modal(options);
    }
    else {
      alert("If you want to post, you need to login or sign in.\n投稿するには、ログインかサインインが必要です。");
    }
  });
});
