var video
var p_context;
var lCount = 1;

function Lesson (l_count, l_playTime, l_text, l_left, l_top, l_color, l_sTime) {
  
  this.sName = '1';
  this.l_count = l_count;
  this.l_playTime = l_playTime;
  this.l_text = l_text;
  this.l_left = l_left;
  this.l_top = l_top;
  this.l_color = l_color;
  this.l_sTime = l_sTime;
}



var lessonArray = new Array();

function LessonCount (sName, totalCount) {
  this.sName = sName;
  this.totalCount = totalCount;
}

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
  console.log("left " + $("#pTime" + l_playTime).position().left + "  /  top " + $("#pTime"+l_playTime).position().top);
  console.log("left " + l_left + "   /  top" + l_top);
  var lessonLine = makeLSVG('line', {id : 'pLine'+l_playTime , x1 : $("#pTime" + l_playTime).position().left+433 , y1 : $("#pTime"+l_playTime).position().top+35, x2 : l_left+983, y2 : l_top+33, stroke : l_color, 'stroke-width' : 1});
  document.getElementById("vSVG").appendChild(lessonLine);
  var lessonCircle = makeLSVG('circle', {id : 'pCircle'+l_playTime , cx: l_left+983, cy: l_top+33, r:10, fill: l_color });
  document.getElementById("vSVG").appendChild(lessonCircle);
  
  $("#pTime" + l_playTime).click(function() {
    var svg = document.getElementById("pLine"+l_playTime);
    console.log(svg);
    var x = svg.getAttribute('x1');
    console.log(x);
    svg.setAttribute('x1', 100);
    console.log(svg);
  });
  
  setTimeout(function() {
    $("#pTime"+l_playTime).remove();
    $("#pLine"+l_playTime).remove();
    $("#pCircle"+l_playTime).remove();
    canvasLessonArray.splice(canvasLessonArray.indexOf("l_count", l_count),1);
    reDraw();
  }, l_sTime);
}

function reDraw() {
  for (var i = canvasLessonArray.length-1; i >= 0; i--) {
    console.log("I" + i);
    var getLineIndex = canvasLessonArray[i];
//    if(!getLineIndex) continue; //setTimeout이 진행 되서 이미 remove() 된 경우....
    
    var getLine = document.getElementById("pLine" + getLineIndex.l_playTime);
    if(!getLine) continue; //setTimeout이 진행 되서 이미 remove() 된 경우....
    
    getLine.setAttribute('y1', $("#pTime"+getLineIndex.l_playTime).position().top+35);
  }
}


$(document).ready(function(){
  
  (function localFileVideoPlayerInit(win) {
    
    var URL = win.URL || win.webkitURL, displayMessage = (function displayMessageInit() {
      
    var node = document.getElementById('myVideo');  
    return function displayMessage(message, isError) {
      node.innerHTML = message;
      node.className = isError ? 'error' : 'info';
    };
   }()), inputNode = document.getElementById('chooseFile');
    
    playSelectedFile = function playSelectedFileInit(event) {
      var file = inputNode.files[0];
      var type = file.type;
      var videoNode = document.getElementById('myVideo');
      var canPlay = videoNode.canPlayType(type);
      canPlay = (canPlay === '' ? 'no' : canPlay);
      var fileURL = URL.createObjectURL(file);
      videoNode.src = fileURL;
    }
    
    inputNode.addEventListener('change', playSelectedFile, false);
  }(window));
  
  $('#chooseFile').bind('change', function() {
    timeFlag = false;
    var filename = $("#chooseFile").val();
    if (/^\s*$/.test(filename)) {
      $(".file-upload").removeClass('active');
      $("#noFile").text("No file chosen...");
    } else {
      $(".file-upload").addClass('active');
      $("#noFile").text(filename.replace("C:\\fakepath\\", ""));
    }
  });
  
  var p_canvas = document.getElementById("pCanvas");
  video = document.getElementById("myVideo");
  p_context = p_canvas.getContext("2d");
  var duration;
  var d_time;
  var timeFlag = false;
  //자동 플레이일경우
  var on = true;
  var currTime;
  
  var previewFlag = true;  //미리보기 여부
  
  video.ontimeupdate = function() {
  
    
    if(!timeFlag){
      console.log("update");
      duration = video.duration;
      fDuration = Math.floor(duration);
      var d_rest = (fDuration%60) >= 10 ? fDuration%60 : "0" + fDuration%60;
      d_time = Math.floor(fDuration/60) + ":" + d_rest;
      timeFlag = true;
    }
  
    //현재 플레이 되고 있는 시간
    currTime = video.currentTime;
    var fCurrTime = Math.floor(currTime);
    //파일의 전체 플레이 시간
    
    var v_rest = (fCurrTime%60)>=10 ? fCurrTime%60 : "0" + fCurrTime%60;
    var v_time = Math.floor(fCurrTime/60) + ":" +  v_rest;
    
    $("#playTime-span").html(v_time + " / " + d_time);
    
    p_context.clearRect(0, 0, p_canvas.clientWidth, p_canvas.clientHeight);
    p_context.fillStyle ="red";
    
    colorEft();
    
    if(previewFlag) {
      var p_index = lessonArray.indexOf("l_playTime", Math.floor(video.currentTime));
      if(p_index != -1) {
        console.log("p_index " + p_index);
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
        image.attr("src", "images/play124.png");
        image.fadeIn('fast');
      });
    } else {
      video.play();
      image.fadeOut('fast', function(){
        image.attr("src", "images/pause.png");
        image.fadeIn('fast');
      });
    }
    on = !on;
  });
  
  $("#v-comment").click(function(){
    $(".vTool").css("width", "1037");
    $(this).css("display", "none");
    $("#v-items").css("display", "block");
//    $(".v-preview").css("display", "block");
    $(".lessonDiv").css("display", "block");
    $(".itemsDiv").css("display", "none");
  });
  
  $("#v-items").click(function() {
    $(".vTool").css("width", "1037");
    $(this).css("display", "none");
    $("#v-comment").css("display", "block");
    $(".itemsDiv").css("display", "block");
    $(".lessonDiv").css("display", "none");
  });
  
  var lessonCount = 0;
  
  addBtn();
  
  function addBtn() { 
    
    $("#round-add-button").click(function() {
      console.log("add");
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
          lessonArray.push(new Lesson (lCount, l_playTime, l_text, l_left, l_top, l_color, l_sTime) );

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
               var del_index = lessonArray.indexOf("l_count", $(this).attr("id").substring(6).trim());
               console.log(del_index);
               console.log(lessonArray[del_index]);
               lessonArray.splice(del_index, 1);  //삭제시 앞으로 index 이동
               
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
  
  $("#v-view").click(function() {
    video.currentTime = 0;
    console.log("미리보기");
    previewFlag = true;
  });
  
});   //(document)ready

var sCheck = -1;
Array.prototype.indexOf = function objectIndexOf(property, value) {
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
