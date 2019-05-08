$(function(){
  var last_elem;
  var id = -1;
  $('.thread_page .thread_cover').each(function(i, elem){
    var jp_height = $(elem).find(".jp_content_row .post_content_text").height();
    var en_height = $(elem).find(".en_content_row .post_content_text").height();
    var row = (Math.max(jp_height,en_height) - 10) / 22;
    $(elem).find(".jp_content_row").attr("style","-webkit-line-clamp:"+Math.ceil(row));
    $(elem).find(".en_content_row").attr("style","-webkit-line-clamp:"+Math.ceil(row));
  });
  var options ={"backdrop":"static"}
  $(".thread_page .words_post_button").click(function(){
    if($(".user_login").attr("id") == "true"){
      var options = {"backdrop":"static"};
      $('#sampleModal-'+this.id).modal(options);
    }
    else {
      alert("If you want to post, you need to login or sign in.\n投稿するには、ログインかサインインが必要です。");
    }
  });
});
