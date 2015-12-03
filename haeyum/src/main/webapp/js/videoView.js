var pos = 0;
var totalSlides;
var sliderWidth;
var watchNo;
var vBookmarkCount = 0;

$(document).ready(function() {
  
  /*NEXT SLIDE*/
  $('#next').click(

      
      function() {

        var p = 90;
        pos++;

        $('.slider-btns#previous').fadeIn(100);

        if (pos == totalSlides) {
          pos = 0;
          p = 0;
          $('.slider-btns#previous').fadeOut(100);
        }

        if (pos == totalSlides - 1) {
          p = 180;
          $('.slider-btns#next').fadeOut(100);
        } else {
          $('.slider-btns#next').fadeIn(100);
        }
        
        $('#slider-wrap ul#slider').animate({
          left : -(330 * pos - p)
        }, {
          duration : 800
        });

        newpos = pos + 1;
        $('#slider-wrap ul li').removeClass('slider-active');
        $('#slider-wrap ul li:nth-child(' + newpos + ')').addClass(
            'slider-active');

      });

  /*PREVIOUS SLIDE*/
  $('#previous').click(
      function() {

        var p = 90;
        pos--;

        if (pos == -1) {
          pos = totalSlides - 1;
          p = 180;
        }

        if (pos == 0) {
          p = 0;
          $('.slider-btns#previous').fadeOut(100);
        }

        $('#slider-wrap ul#slider').animate({
          left : -(330 * pos - p)
        }, {
          duration : 800
        });

        $('.slider-btns#next').fadeIn(100);

        newpos = pos + 1;
        $('#slider-wrap ul li').removeClass('slider-active');
        $('#slider-wrap ul li:nth-child(' + newpos + ')').addClass(
            'slider-active');

      }
  );
  
  var vBookmark = false;
  $("#video-bookmark").click(function() {
    if(vBookmark) {
      vBookmark = !vBookmark;
      $(".control-bookmark-text").css("display", "none");
    } else {
      vBookmark = !vBookmark;
      $(".control-bookmark-text").css("display", "block");
    }
  });
  
  var vBookmarkList = false;
  $("#video-bookmark-list").click(function() {
    if(vBookmarkList) {
      vBookmarkList = !vBookmarkList;
      $(".vTool").css("width", "737");  //북마크
      $(".video-bookmarkList-div").css("display", "none"); //북마크
      
    } else {
      vBookmarkList = !vBookmarkList;
      $(".vTool").css("width", "1037");  //북마크
      $(".video-bookmarkList-div").css("display", "block"); //북마크
    }
  });
  
  $("#bookmark-regist").click(function() {
    vBookmark = !vBookmark;
    $(".control-bookmark-text").css("display", "none");
    $("#vBookmark_ul").append("<li id='bCount" + ++vBookmarkCount+ "'>"+
                                "<div class='bookmark-img'>"+
                                  "<img src='/haeyum/images/bookmark40.png' style='width: 20px; height:24px;' />"+
                                "</div>"+
                                "<p style='float: left; font-size: 10px; margin-bottom: 4px; margin-top: 0px; color: #707070; width: 150px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; box-sizing: border-box; padding: 4px 4px; border: 2px solid #c2c2c2; background-color: white;'>" + $("#bookmark-textBox").val() + "</p>"+
                                "<p class='bTime' style='float: left; font-size: 13px; margin-bottom: 4px; margin-top: 0px; color: #707070; width: 44px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; box-sizing: border-box; padding: 2px 2px; border: 2px solid #c2c2c2; background-color: white; text-align:center; margin-left: 2px;'>" + v_time + "</p>"+
                              "</li>");
    $.ajax({
      type : "post",
      url : "/haeyum/mindMap/bookMarkRegist.do",
      data : {bmTitle : $("#bookmark-textBox").val(),
              bmPlayTime : v_time,
               wNo : watchNo}
    }).done(function() {
      console.log("북마크 콜백");
    });
    
    $("#bookmark-textBox").val("");
    bmarkClick();
  });
  
});  //(document).ready

function bmarkClick () {
  $("#bCount" + vBookmarkCount).click(function() {
    var bTime = $(this).find(".bTime").html().split(":");
    var bMin = bTime[0]*60;
    var bSec = bTime[1];
    video.currentTime = Number(bMin) + Number(bSec);
  });
}

function aVideo(sNo) {
  sNum = sNo;
  $.ajax({
    type: "post",
    url : "/haeyum/mindMap/viewVideo.do",
    data : {sNo : sNo},
    dataType : "json"
      }).done(function (retVal) {
        var productList = new Array();
        var prodcutImgList = new Array();
        $("#slider").html("");
        $("#vBookmark_ul").html("");
        $('#slider-wrap ul#slider').css("left", "0");
        $(".control-video-bookmark").css("display", "block");
        
        $.each(retVal, function(index, data) {
          if(index == "video") {
            $("#myVideo source").attr("src", "../../haeyum/video/"+data.realFileName);
            $("#myVideo")[0].load();
            timeFlag = false;
          }
          else if(index == "lessonList") {
            $.each(retVal[index], function(index2, data2) {
              lessonArray.push(new Lesson (sNo, lCount++, data2.plPlayTime, data2.plLesson, data2.plX, data2.plY, data2.plColor, data2.plStayTime));
            });
          }
          else if(index == "productList") {
            $.each(retVal[index], function(index2, data2) {
              productList.push(data2);
            });
          }
          else if(index == "productImgList"){
            $.each(retVal[index], function(index2, data2) {
              prodcutImgList.push(data2);
            });
          }
          else if(index == "wNo") {
            watchNo = data;
            
          }
          else if(index == "bmarkList") {
            $.each(retVal[index], function(index2, data2) {
              $("#vBookmark_ul").append("<li id='bCount" + ++vBookmarkCount+ "'>"+
                  "<div class='bookmark-img'>"+
                    "<img src='/haeyum/images/bookmark40.png' style='width: 20px; height:24px;' />"+
                  "</div>"+
                  "<p style='float: left; font-size: 10px; margin-bottom: 4px; margin-top: 0px; color: #707070; width: 150px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; box-sizing: border-box; padding: 4px 4px; border: 2px solid #c2c2c2; background-color: white;'>" + data2.bmTitle + "</p>"+
                  "<p class='bTime' style='float: left; font-size: 13px; margin-bottom: 4px; margin-top: 0px; color: #707070; width: 44px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; box-sizing: border-box; padding: 2px 2px; border: 2px solid #c2c2c2; background-color: white; text-align:center; margin-left: 2px;'>" + data2.bmPlayTime + "</p>"+
                "</li>");
              
              bmarkClick();
            });
          }
        });
        
        totalSlides = productList.length;
        sliderWidth = 520;
        $('#slider-wrap ul').width(sliderWidth * totalSlides);
        
        for(var i = 0; i < productList.length; i++){
          
         $("#slider").append("<li class='slider-active store-slider'>"+
                               "<div class='slider-img store-slider'>"+
                                 "<img src='../../haeyum/itemImg/" + prodcutImgList[i].realFileName + "'>"+
                               "</div>"+
                               "<div class='slider-content store-slider'>"+
                                 "<h2>" + productList[i].pName + "</h2>"+
                                 "<div class='slider-rating store-slider'>"+
                                   "<span class='review-count store-slider'>" + productList[i].pPrice + "</span>"+
                                 "</div>"+
                                 "<div class='slider-btn store-slider' onClick='storeBtn(" + productList[i].pNo+ ")'>store</div>"+
                              "</div>"+
                             "</li>");
        }
        
        if(productList.length == 0){
          $(".store-slider").css("display", "none");
        } else if (productList.length == 1) {
          $(".store-slider").css("display", "block");
          $(".slider-btns").css("display", "none");
          $("#slider li:nth-child(1").css("margin-left", "100px");
        } else {
          $(".store-slider").css("display", "block");
          $(".slider-btns").css("display", "block");
          $("#slider li:nth-child(1)").css("margin-left", "10px");
        }
      });
}

function storeBtn(pNo) {
  $(location).attr('href', '/haeyum/store/storeDetail.do?no='+pNo);
  console.log(pNo);
}
