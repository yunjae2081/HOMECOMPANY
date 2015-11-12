var video
var p_context;
$(document).ready(function(){
  var p_canvas = document.getElementById("pCanvas");
  video = document.getElementById("myVideo");
  p_context = p_canvas.getContext("2d");
  var duration;
  var d_time;
  var timeFlag = false;
 
  video.ontimeupdate = function() {
  
    if(!timeFlag){
      duration = video.duration;
      fDuration = Math.floor(duration);
      var d_rest = (fDuration%60) >= 10 ? fDuration%60 : "0" + fDuration%60;
      d_time = Math.floor(fDuration/60) + ":" + d_rest;
      timeFlag = true;
    }
  
    //현재 플레이 되고 있는 시간
    var currTime = video.currentTime;
    var fCurrTime = Math.floor(currTime);
    //파일의 전체 플레이 시간
    
    var v_rest = (fCurrTime%60)>=10 ? fCurrTime%60 : "0" + fCurrTime%60;
    var v_time = Math.floor(fCurrTime/60) + ":" + v_rest;
    
    console.log(v_time +"/" + d_time);
    
    p_context.clearRect(0, 0, p_canvas.clientWidth, p_canvas.clientHeight);
    p_context.fillStyle ="red";
    
    var p_Width = (currTime/duration)*p_canvas.clientWidth;
    if(p_Width > 0) {
      p_context.fillRect(0, 0, p_Width, p_canvas.clientHeight);
    }
  };
  
  
  p_canvas.onclick = function(e){
    video.currentTime = (e.offsetX/p_canvas.clientWidth)*video.duration;
  }
  
  $("#pCanvas").hover(function(){
    $(this).attr("height", "6");
    console.log("in");
  },
  function(){
    $(this).attr("height", "3");
  })
  
})
