$(document).on("click" ,".normal",function(e) {
  e.preventDefault();
  var scrTop = $(window).scrollTop();
  $(".backDrop").animate({"opacity":"0.7"}, 500);
  $(".box").animate({"opacity":"1.0"}, 500);
  var top = 150;
  var width = $("body").width();
  $(".box").css({"top":top+scrTop});
  $(".backDrop").css({"top": scrTop});
  
  $("body").css({"overflow-y":"hidden"});
  $(".backDrop, .box").css({"display":"block"});
});
$(document).on("click", ".backDrop, .close", function() {
  closeBox();
});

function closeBox () {
  $(".backDrop, .box").animate({"opacity":"0"}, 500, function () {
    $(".backDrop, .box").css({"display":"none"});
    $("body").css({"overflow-y":"auto"});
  });
}