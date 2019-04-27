

$(function(){
  $('.lang_bar_cover #slider').slider({
    formatter: function(value) {
      if(true){
        var en_per = value / 10;
        var jp_per = (1000 - value) / 10;
        if(value < 100){
          $(".en_position").attr("style","display:none;");
          $(".jp_position").attr("style","width:calc(100%)");
          $(".post_content_position_space").attr("style","display:none;");
        }
        else if(value > 900){
          $(".en_position").attr("style","width:calc(100%)");
          $(".jp_position").attr("style","display:none");
          $(".post_content_position_space").attr("style","display:none;");
        }
        else{
          $(".en_position").attr("style","width:calc("+en_per+"% - 15px)");
          $(".jp_position").attr("style","width:calc("+jp_per+"% - 15px)");
          $(".post_content_position_space").removeAttr("style");
        }
      }
    }
  });
});
