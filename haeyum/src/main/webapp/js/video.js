var video;
var p_context;
var lCount = 1;
var iCount = 1;
var iImgCount = 0;
var sNum;
var totalLesson;
var totalItem;
var timeFlag = false;
var duration;
var d_time;
var on = true;  //플레이
var sound = true; //사운드
var currTime;
var v_time;

function Lesson (s_num, l_count, l_playTime, l_text, l_left, l_top, l_color, l_sTime) {
  
  this.s_num = s_num;
  this.l_count = l_count;
  this.l_playTime = l_playTime;
  this.l_text = l_text;
  this.l_left = l_left;
  this.l_top = l_top;
  this.l_color = l_color;
  this.l_sTime = l_sTime;
}

function VItems (s_num, i_count, i_title, i_content, i_price, i_number) {
  this.s_num = s_num;
  this.i_count = i_count;
  this.i_title = i_title;
  this.i_content = i_content;
  this.i_price = i_price;
  this.i_number = i_number;
}

function LessonItemCount (s_num, totalLCount, totalICount) {
  this.s_num = s_num;
  this.totalLCount = totalLCount;
  this.totalICount = totalICount;
}

function ItemImgCount (s_num, i_count, totalImgCount){
  this.s_num = s_num;
  this.i_count = i_count;
  this.totalImgCount = totalImgCount;
}

var lessonArray = new Array();
var itemsArray = new Array();
var liCount = new Array();

var canvasLessonArray = new Array();
//showLesson(currL.l_count , currL.l_playTime, currL.l_text, currL.l_left, currL.l_top, currL.l_color, currL.l_sTime);

function makeLSVG(tag, attrs) {
  var el= document.createElementNS('http://www.w3.org/2000/svg', tag);
  for (var k in attrs)
      el.setAttribute(k, attrs[k]);
  return el;
}

function showLesson(l_count, l_playTime, l_text, l_left, l_top, l_color, l_sTime) {
  
  canvasLessonArray.push(new Lesson(l_count, l_playTime, l_text, l_left, l_top, l_color, l_sTime));
  $("#lessonArea").append("<div class='lessonBox' id='pTime" + l_playTime +"' style='border: 1px solid " + l_color+ "'>" +l_text + "</div>");
//  console.log("left " + $("#pTime" + l_playTime).position().left + "  /  top " + $("#pTime"+l_playTime).position().top);
//  console.log("left " + l_left + "   /  top" + l_top);
  var lessonLine = makeLSVG('line', {id : 'pLine'+l_playTime , x1 : $("#pTime" + l_playTime).position().left+433 , y1 : $("#pTime"+l_playTime).position().top+35, x2 : l_left+983, y2 : l_top+33, stroke : l_color, 'stroke-width' : 1});
  document.getElementById("vSVG").appendChild(lessonLine);
  var lessonCircle = makeLSVG('circle', {id : 'pCircle'+l_playTime , cx: l_left+983, cy: l_top+33, r:10, fill: l_color });
  document.getElementById("vSVG").appendChild(lessonCircle);
  
  $("#pTime" + l_playTime).click(function() {
    var svg = document.getElementById("pLine"+l_playTime);
//    console.log(svg);
    var x = svg.getAttribute('x1');
//    console.log(x);
    svg.setAttribute('x1', 100);
//    console.log(svg);
  });
  
  setTimeout(function() {
    $("#pTime"+l_playTime).remove();
    $("#pLine"+l_playTime).remove();
    $("#pCircle"+l_playTime).remove();
    canvasLessonArray.splice(canvasLessonArray.indexOf2("l_count", l_count),1);
    reDraw();
  }, l_sTime);
}

function reDraw() {
  for (var i = canvasLessonArray.length-1; i >= 0; i--) {
//    console.log("I" + i);
    var getLineIndex = canvasLessonArray[i];
//    if(!getLineIndex) continue; //setTimeout이 진행 되서 이미 remove() 된 경우....
    // 수정아 회식하자..
    var getLine = document.getElementById("pLine" + getLineIndex.l_playTime);
    if(!getLine) continue; //setTimeout이 진행 되서 이미 remove() 된 경우....
    
    getLine.setAttribute('y1', $("#pTime"+getLineIndex.l_playTime).position().top+35);
  }
}


$(document).ready(function(){
  
  (function localFileVideoPlayerInit(win) {
    
    var URL = win.URL || win.webkitURL;
    var node = document.getElementById('myVideo'); 

//    var displayMessage = (function displayMessageInit() {
//      console.log("적용되는 시점2");
//      
//    return function displayMessage(message, isError) {
//      node.innerHTML = message;
//      node.className = isError ? 'error' : 'info';
//    };
//   }())
   
    
    playSelectedFile = function playSelectedFileInit(event) {
      sNum = event;
      totalLesson = 0;   //한 비디오당 전체 레슨 개수
      totalItem = 0;  //한 비디오당 전체 아이템 개수
      
      var inputNode = document.getElementById("chooseFile" + event);
      var file = inputNode.files[0];
      var type = file.type;
      var videoNode = document.getElementById('myVideo');
      var canPlay = videoNode.canPlayType(type);
      canPlay = (canPlay === '' ? 'no' : canPlay);
      var fileURL = URL.createObjectURL(file);
      videoNode.src = fileURL;
      timeFlag = false;
      var filename = $("#chooseFile" + event).val();
      if (/^\s*$/.test(filename)) {
        $(".file-upload").removeClass('active');
        $("#noFile" + event).text("No file chosen...");
      } else {
//        console.log("성공");
        $("#videoInput" + sNum).addClass('active');
        $("#noFile" + event).text(filename.replace("C:\\fakepath\\", ""));
        $(".vView").css("display", "block");
        $(".v-buttons").css("display", "block");
      }
      $("html, body").animate({scrollTop:$(".vView").offset().top - 200});
    }
    
  }(window));
  
  var p_canvas = document.getElementById("pCanvas");
  video = document.getElementById("myVideo");
  p_context = p_canvas.getContext("2d");
//  var duration;
//  var d_time;
//  var timeFlag = false;
  //자동 플레이일경우
//  var on = true;  //플레이
//  var sound = true; //사운드
//  var currTime;
  
  var previewFlag = true;  //미리보기 여부
  
  function videoUpdate() {
    console.log("update");
    duration = video.duration;
    fDuration = Math.floor(duration);
    var d_rest = (fDuration%60) >= 10 ? fDuration%60 : "0" + fDuration%60;
    d_time = Math.floor(fDuration/60) + ":" + d_rest;
    timeFlag = true;
  }
  
  video.ontimeupdate = function() {
  
    
    if(!timeFlag){
      videoUpdate();
    }
  
    //현재 플레이 되고 있는 시간
    currTime = video.currentTime;
    var fCurrTime = Math.floor(currTime);
    //파일의 전체 플레이 시간
    
    var v_rest = (fCurrTime%60)>=10 ? fCurrTime%60 : "0" + fCurrTime%60;
    v_time = Math.floor(fCurrTime/60) + ":" +  v_rest;
    
    $("#playTime-span").html(v_time + " / " + d_time);
    
    p_context.clearRect(0, 0, p_canvas.clientWidth, p_canvas.clientHeight);
    p_context.fillStyle ="red";
    
    colorEft();
    
    if(previewFlag) {
      var p_index = lessonArray.indexOf2("l_playTime", Math.floor(video.currentTime));
      if(p_index != -1 && lessonArray[p_index].s_num == sNum) {
        var currL = lessonArray[p_index];
        showLesson(currL.l_count , currL.l_playTime, currL.l_text, currL.l_left, currL.l_top, currL.l_color, currL.l_sTime);
      }
    }
  };   //ontimeupdate
  
  p_canvas.onclick = function(e){
    video.currentTime = (e.offsetX/p_canvas.clientWidth)*video.duration;
  }
  
  function colorEft() {
    p_Width = (currTime/duration)*p_canvas.clientWidth;
    if(p_Width > 0) {
      p_context.fillStyle ="red";
      p_context.fillRect(0, 0, p_Width, p_canvas.clientHeight);
    } 
  }
  
  $(".control-bar-in").mouseenter(function(){
    $(this).find(".pCanvas").attr("height", "6").css("top",0);
    colorEft();
  }).
  mouseleave(function(){
    $(this).find(".pCanvas").attr("height", "3").css("top","1.5px");
    colorEft();
  });
  
  
  $("#control-play-button").click(function(){
    var image = $("#play-button img");
    if(on){
      video.pause();
      image.fadeOut('fast', function(){
        image.attr("src", "/haeyum/images/play124.png");
        image.fadeIn('fast');
      });
    } else {
      video.play();
      image.fadeOut('fast', function(){
        image.attr("src", "/haeyum/images/pause.png");
        image.fadeIn('fast');
      });
    }
    on = !on;
  });
  
  $("#vol-button").click(function() {
    var image = $("#vol-button img");
    if(sound){
      sound  =  !sound;
      video.muted = !video.muted;
      image.fadeOut('fast', function() {
        image.attr("src", "/haeyum/images/speaker113.png");
        image.fadeIn('fast');
      });
    } else{
      sound  =  !sound;
      video.muted = !video.muted;
      image.fadeOut('fast', function() {
        image.attr("src", "/haeyum/images/speaker100.png");
        image.fadeIn('fast');
      });
    }
  });
  
  $("#full-button").click(function() {
    
  });
  
  $("#v-comment").click(function(){
    $(".vTool").css("width", "1037");
    $(".v-buttons").css("margin-left", "430px");
    $(this).css("display", "none");
    $("#v-items").css("display", "block");
//    $(".v-preview").css("display", "block");
    $(".lessonDiv").css("display", "block");
    $(".itemsDiv").css("display", "none");
    $(".l-pointer").css("display", "block");
  });
  
  $("#v-items").click(function() {
    $(".v-buttons").css("margin-left", "360px");
    $(".vTool").css("width", "1037");
    $(this).css("display", "none");
    $("#v-comment").css("display", "block");
    $(".itemsDiv").css("display", "block");
    $(".lessonDiv").css("display", "none");
    $(".l-pointer").css("display", "none");
  });
  
  var lessonCount = 0;
  
  addBtn();
  
  function addBtn() { 
    
    $("#round-add-button").click(function() {
//      console.log("add");
      $("#control-play-button").trigger("click");
      $(this).parent().html("<div class='addLesson' id='lesson'" + lCount + "> " +
                              "<textarea rows='2'name='add' id='lText' placeholder='pointer를 이동해주세요...'></textarea>" +
                            "</div>" + 
                            "<div id='round-save-button' class='round-save-button'>save</div>");
      
      $("#vTool").prepend(" <div id='l-pointer' class='l-pointer'> " +
                           " <div  class='l-round' id='pointer'></div> " +
                           " <div class='l-color' id='l-color'>" +
                             " <input type='color' id='p-color' style='width: 40px; ' value='#28e177' /> " +
                           " </div>" +
                           " <div class='l-spinner' id='l-spinner'>" + 
                             " <input id='p-spinner' name='value' size='1' style='border: 2px solid #c2c2c2' />" +
                           " </div>" +
                          " </div>");
      
      $("#pointer").draggable({cursor: "move", cursorAt: {top:22.5, left: 22.5}});
      $("#l-color").draggable();
      $("#l-spinner").draggable();
      
      $(document).on("drag", "#pointer", function(){
        $("#l-color").css("left", $(this).position().left);
        $("#l-spinner").css("left", $(this).position().left);
        $("#l-color").css("top", $(this).position().top);
        $("#l-spinner").css("top", $(this).position().top);
      });
    
      var pClick = false;
      $("#pointer").click(function(){
        if(!pClick){
          $("#l-color").css("display", "block");
          $("#l-spinner").css("display", "block");
        } else {
          $("#l-color").css("display", "none");
          $("#l-spinner").css("display", "none");
        }
        pClick = !pClick;
      });
  
      var l_spinner = $("#p-spinner").spinner();
      l_spinner.spinner("value", 5);
      
      $("#p-color").on("change", function(){
        $("#pointer").css("background-color", $(this).val());
      });
      
      
      $("#round-save-button").click(function() {
//        console.log("clickSave")
        $("#control-play-button").trigger("click");
        
        var l_playTime = Math.floor(video.currentTime);
        var l_text = $("#lText").val();
        var l_left = $("#pointer").position().left;
        var l_top = $("#pointer").position().top;
        var l_color = $("#p-color").val();
        var l_sTime = l_spinner.spinner("value")*1000;
        
        var l_s_rest = (l_playTime%60)>=10 ? l_playTime%60 : "0" + l_playTime%60;
        var l_s_time = Math.floor(l_playTime/60) + ":" +  l_s_rest;
        
        
        if(confirm("등록할거니")){
          console.log("lCount" + lCount);
          lessonArray.push(new Lesson (sNum, lCount, l_playTime, l_text, l_left, l_top, l_color, l_sTime) );
//          console.log("lessonLength : " + lessonArray.length + " / lCount  : " + lCount);
          totalLesson++;

          $("#l-pointer").remove();
          $("#li_" + lCount).html("<div class='addLesson'>" + 
                                                 "<p style='float: left; font-size: 11px; margin-bottom: 4px; margin-top: 0px; color: #707070; width: 210px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; box-sizing: border-box; padding: 4px 4px; border: 2px solid #c2c2c2; background-color: white;'>" + l_text + "</p>" +
                                                 "<p style='float: left; font-size: 11px; margin-bottom: 4px; margin-top: 0px; color: #707070; width: 73px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; box-sizing: border-box; padding: 1px 1px; border: 2px solid #c2c2c2; background-color: white; margin-left: 6.5px;'>" + l_s_time + " / " + d_time + "</p>" +
                                                 "<p style='float: left; font-size: 11px; margin-bottom: 4px; margin-top: 0px; color: #707070; width: 65px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; box-sizing: border-box; padding: 1px 1px; border: 2px solid #c2c2c2; background-color: white; margin-left: 8px;'>" + l_sTime/1000 +" sec</p>" +
                                                 "<p style='float: left; font-size: 11px; margin-bottom: 4px; margin-top: 0px; width: 44px; height: 23px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; box-sizing: border-box; padding: 1px 1px; border: 4px solid #d1d1d1; background-color: " + l_color + "; margin-left: 8px;'></p>" +
                                               "</div>" +
                                               "<div id='l_del_" +  lCount + "' class='round-del-button'>del</div>");
          
          $("#l_del_"+ lCount).click(function(){
             if(confirm("삭제할거니")) {
               
               $(this).parent().remove();
               var del_index = lessonArray.indexOf2("l_count", $(this).attr("id").substring(6).trim());
//               console.log(del_index);
//               console.log(lessonArray[del_index]);
               lessonArray.splice(del_index, 1);  //삭제시 앞으로 index 이동
               totalLesson--;
               
             }
          });
          
          $("#l_ul").prepend("<li id='li_" + ++lCount + "'>" +
                              "<div id='round-add-button' class='round-add-button'>+</div>" +
                            "</li>");
          addBtn();
          
        }
      });  //saveBtn click
      
    });  //addBtn click
    
  };  //addBtn()
  
  iAddBtn();
  
  var popupOpen = false;
  
  function iAddBtn() {
    
    $("#i_round-add-button").click(function(e) {
//      console.log("popup");
      
        
      e.preventDefault();
      var scrTop = $(window).scrollTop();
      $(".backDrop").animate({"opacity":"0.7" +""}, 500);
      $(".box").animate({"opacity":"1.0"}, 500);
      var top = 120;
        
      $("html, body").css("overflow-y","hidden");
      $(".backDrop, .box").css("display","block");
      $(".box").css("top",top+scrTop+"px");
      $(".lessonArea").css("display", "none");
      
      
      if(!popupOpen){
        popupOpen = true;
        
        //iImgCount  이미지 개수 카운트변수 (0부터 시작)
        for (var i = 1; i < 5; i++) {
          iImgCount++
          var display = "none";
          if(i == 1){
            display = "block";
          }
          $("#item_input_file").append("<input type='file'id = 'store_file_" + iImgCount + "' name='sNum" + sNum + "iCount" + iCount + "imgCount" + i + "' style='display: " + display + ";' onchange='selectImage(" + i + ", " + iImgCount + ")'/>");
        }
      } //if 문 종료
    }); //AddBtn 종료
    
  } //iAddBtn() 
  
  
  $(".mat-input").focus(function(){
    $(this).parent().addClass("is-active is-completed");
  });

  $(".mat-input").focusout(function(){
    if($(this).val() === "")
      $(this).parent().removeClass("is-completed");
    $(this).parent().removeClass("is-active");
  });
  
  $(document).on("click", ".backDrop, .close", function() {
    closeBox();
  });
  
  var v_s_count = 0;
  
  // 수량과 가격 체크해서 넣기...
  // 스토어 에 들어갈 이미지와 옵션 체크
  // 강의등록할때 메인 이미지 캡쳐 처리 ...
  // 컨트롤러로 널어갈때 이미지와 비디오 파일을 어떻게 넘여줄것인지 체크 (히든으로 넘겨주는 경우 체크)
  // 컨트롤러로 넘어가서 처리
  // 강의 보여주기
  // 수정이 언제와 수정수정
  
  
    
  $("#store_save").click(function() {
    var pac = $("#v_store_pac").val();
    var strpac = pac.split('/');
    
    if(!strpac[0] || !strpac[1]){
      alert("가격과 개수를 '/'로 구분해주세요  popup창으로 변경할 예정입니다.");
    } else {
    
        if(confirm("등록할거니")) {
          
          popupOpen = false;
          var title = $("#v_store_title").val();
          var content = $("#v_store_content").val();
          var price = $.trim($.trim(strpac[0]));
          var iNumber = $.trim($.trim(strpac[1]));
          
          itemsArray.push(new VItems(sNum, iCount, title, content, price, iNumber));
          totalItem++;
          
          for(var i = 4 ; i > 0; i--) {
            var preview = document.getElementById("store_img_"+i);
            if(preview.src != "/haeyum/images/png12.png") {
//              console.log("img del");
              preview.src = "/haeyum/images/png12.png";
            }
            else {
              $("#store_file_"+iImgCount).remove();
              iImgCount--;
            }
          }
          
          
          $("#i_li_" + iCount).html("<div class='addLesson'>" +
                                           "<p style='float: left; font-size: 11px; margin-bottom: 4px; margin-top: 0px; color: #707070; width: 210px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; box-sizing: border-box; padding: 4px 4px; border: 2px solid #c2c2c2; background-color: white;'>" + title + "</p>" +
                                           "<p style='float: left; font-size: 11px; margin-bottom: 4px; margin-top: 0px; color: #707070; width: 83px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; box-sizing: border-box; padding: 1px 1px; border: 2px solid #c2c2c2; background-color: white; margin-left: 16px;'>" + price + "원</p>" +
                                           "<p style='float: left; font-size: 11px; margin-bottom: 4px; margin-top: 0px; color: #707070; width: 85px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; box-sizing: border-box; padding: 1px 1px; border: 2px solid #c2c2c2; background-color: white; margin-left: 9px;'>" + iNumber + "개</p>" +
                                         "</div>" +
                                         "<div class='round-del-button id='i_del_" + iCount + "'>del</div>");
          closeBox();
          
//          console.log("sdfsdf  " + $("#i_del_" + iCount));
  
          //삭제 안돼.
          //수정아 어디니
          $("#i_del_" + iCount).click(function() {
            if(confirm("삭제할거니")) {
              
              //배열에서 삭제해주기
              
              $(this).parent().remove();
              //        var del_index = lessonArray.indexOf("l_count", $(this).attr("id").substring(6).trim());
              //        console.log(del_index);
              //        console.log(lessonArray[del_index]);
              //        lessonArray.splice(del_index, 1);  //삭제시 앞으로 index 이동
            }
          });
          
          $("#i_ul").prepend("<li id='i_li_" + ++iCount + "'>" +
              "<div id='i_round-add-button' class='round-add-button'>+</div>" +
          "</li>");
  
          iAddBtn();
  
          $("#v_store_title").val("");
          $("#v_store_content").val("");
          $("#v_store_pac").val("");
          
        } //내부if조건 (확인을 눌렀을 경우)
      } //else 조건
    });  //스토어 저장 버튼
  
  
  function closeBox () {
    $(".lessonArea").css("display", "block");
    $(".backDrop, .box").animate({"opacity":"0"}, 500, function () {
      $(".backDrop, .box").css({"display":"none"});
      $("html, body").css("overflow-y","auto");
      $("body").css("overflow-y","auto");
    });
  }
  
  $("#v-view").click(function() {
    video.currentTime = 0;
    console.log("미리보기");
    previewFlag = true;
  });
  
  $("#v-regist").click(function() {
    
    if(confirm("등록할거니")) {
      
      $(".vView").css("display", "none");
      $(".vTool").css("width", "737px");
      $(".v-buttons").css("margin-left", "270px");
      $(".lessonDiv").css("display", "none");
      $(".itemsDiv").css("display", "none");
      $("#v-comment").css("display", "block");
      $("#v-items").css("display", "block");
      $("#l_ul li").not(':first').remove();

      $("#i_ul li").not(':first').remove();
      
      liCount.push(new LessonItemCount(sNum, totalLesson, totalItem));
      //메인이미지 설정확인
      shoot();
    }
    
  });
  
});   //(document)ready

var sCheck = -1;
Array.prototype.indexOf2 = function objectIndexOf(property, value) {
  if (sCheck == value) {
    return -1;
  } else {
    sCheck = value;
  }
  for(var i = 0, len = this.length; i < len; i++){
      if(this[i][property] == value) return i;
  }
  return -1;
}


function selectImage(imgNum, currImgCount) {
  
//  console.log("바뀔 img number" + imgNum);
//  console.log("바뀐 파일 번호" + currImgCount);
  var preview = document.getElementById("store_img_"+imgNum);
  var file = document.getElementById("store_file_"+currImgCount).files[0];
  var reader = new FileReader();
  
  reader.onloadend = function (){
    preview.src = reader.result;
  }
  
  if(file) {
//    console.log("성공");
    reader.readAsDataURL(file);
    if(imgNum < 4){
      $("#store_file_"+currImgCount).css("display", "none");
      $("#store_file_"+ ++currImgCount).css("display", "block");
    } else {
      $("#store_file_"+currImgCount).css("display", "none");
    }
  } else {
//    console.log("실패");
    preview.src = "http://localhost/haeyum/images/png12.png";
  }
  
}

function shoot() {
  var cap_canvas = capture();
  var cap_img = cap_canvas.toDataURL("image/png");
//  console.log(cap_img);
//  console.log($("#v-capture-outer"));
//  $("#v-capture-outer").append("<input type='image' name='v_capture_" + sNum + "' src='" + cap_img + "' />");
  $("#v-capture-outer").append("<input type='hidden' name='v_capture_test1" + sNum + "' value='" + cap_img + "' />");
  
}

function capture() {
  var scaleFactor = 0.3;
  var cap_w = video.videoWidth * scaleFactor;
  var cap_h = video.videoHeight * scaleFactor;
  
  var cap_canvas = document.createElement('canvas');
  cap_canvas.width = cap_w;
  cap_canvas.height = cap_h;
  cap_canvas.setAttribute("id", "v_capture"+sNum);
  var cap_context = cap_canvas.getContext('2d');
  cap_context.drawImage(video, 0, 0, cap_w, cap_h );
  return cap_canvas;
}
