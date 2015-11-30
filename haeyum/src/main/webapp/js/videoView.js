$(document).ready(function() {
  var pos = 0;
  var totalSlides = $('#slider-wrap ul li').length;
  var sliderWidth = $('#slider-wrap').width();
  $('#slider-wrap ul').width(sliderWidth * totalSlides);

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

      });
});  //(document).ready

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
            console.log(retVal[index]);
            $.each(retVal[index], function(index2, data2) {
              productList.push(data2);
            });
          }
          else {
            console.log(retVal[index]);
            $.each(retVal[index], function(index2, data2) {
              prodcutImgList.push(data2);
            });
          }
        });
        
        for(var i = 0; i < productList.length; i++){
         $("#slider").append("<li class='slider-active store-slider'>"+
                               "<div class='slider-img store-slider'>"+
                                 "<img src='http://lorempixel.com/320/160/animals/8'>"+
                               "</div>"+
                               "<div class='slider-content store-slider'>"+
                                 "<h2>물건이름</h2>"+
                                 "<div class='slider-rating store-slider'>"+
                                   "<span class='review-count store-slider'>10000원</span>"+
                                 "</div>"+
                                 "<div class='slider-btn store-slider'>store</div>"+
                              "</div>"+
                             "</li>");
        }
        
      });
  
}
