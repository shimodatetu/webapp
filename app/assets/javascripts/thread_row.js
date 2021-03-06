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

  $('#deleteModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) //モーダルを呼び出すときに使われたボタンを取得
    var recipient = button.data('whatever') //data-whatever の値を取得
    var recipient2 = $(".thread_cover, #"+recipient).prop('outerHTML')//data-whereverの値を取得
    var modal = $(this)  //モーダルを取得
    modal.find('.delete_id').attr("value",recipient) //モーダルのタイトルに値を表示
    modal.find(".delete_html").html(recipient2)
  })
  
});
