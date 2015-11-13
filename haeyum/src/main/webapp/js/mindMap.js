/**
 *   MindMap.JS
 */

/* CANVAS 변수 */
var canvas;
var context;

/* FIRST NODE 변수 */
var fNode = 1;
var fNodeArray = [];
var fNodeId;

/* SECOND NODE 변수 */
var sNode = 0;
var sNodeArray = [];
var sNodeId;

/* MENU 변수 */
var fMenu = true;
var sMenu = true;
var menuSelectId;

var drag = false;

// 초기화
$(document).ready(function () {
  canvas = document.getElementById("myCanvas");
  context = canvas.getContext("2d");
  $("#fNode1").draggable();
  $(".menu").css("left", $("#fNode1").position().left + 30);
  $(".menu").css("top", $("#fNode1").position().top + 30);
  $("#fDiv1").css("left", $("#fNode1").position().left - 115);
  $("#fDiv1").css("top", $("#fNode1").position().top - 200);
  var fNodeAdd = [];
  fNodeArray.push(fNodeAdd);
})

// FIRST NODE ADD 이벤트
$(document).on("click", "div[id^='addFNode']", function () {
  $("#menuAddFNode").css("display", "none");
  $("#addFNode" + fNode++).remove();
  var html = "";
  html += "<div class = 'fNode' id = 'fNode" + fNode + "' ></div>";
  html += "<div class = 'menu' id = 'addFNode" + fNode + "' >+</div>";
  html += "<div class = 'menu' id = 'addSNode" + fNode + "' >+</div>";
  html += "<div class = 'menu' id = 'remove" + fNode + "' >-</div>";
  html += "<div class='bookmark-box' id = 'fDiv" + fNode + "'>";
  html += "<a class='boxclose' id='fDiv" + fNode + "' onclick='closeDiv(this)'></a>";
  html += "<div class='bookmark-title' id = 'fWrite" + fNode + "' >";
  html += "<input type = 'button' onclick='fNodeWriteForm(this)' id = 'fNodeForm" + fNode + "' style='float: right;'/>";
  html += "<input type = 'hidden' id = 'fTitle" + fNode + "' value = 'STEP TITLE' style='color:black;' />";
  html += "<h3>STEP TITLE</h3>";
  html += "</div>";
  html += "<div class='description' id = 'fContentForm" + fNode + "' >";
  html += "  <input type = 'hidden' id = 'fContent" + fNode + "' value = 'Step Content'/>Step Content";
  html += "</div>";
  html += "</div>";
  
  
  $(".mView").append(html);
  $("#fNode" + fNode).draggable();
  
  $(".menu[id$=" + fNode + "]").css("left", $("#fNode" + fNode).position().left + 30);
  $(".menu[id$=" + fNode + "]").css("top", $("#fNode" + fNode).position().top + 30);
  $("#fDiv" + fNode).css("left", $("#fNode" + fNode).position().left - 115);
  $("#fDiv" + fNode).css("top", $("#fNode" + fNode).position().top - 200);
  var fNodeAdd = [];
  fNodeArray.push(fNodeAdd);
  
  drawLine();
})

// SECOND NODE ADD 이벤트
$(document).on("click","div[id^='addSNode']", function () {
  menuId = this.id
  var fNodeNum = Number(menuId.replace("addSNode", "")) - 1;
  var html = "";
  html += "<div class = 'sNode' id = 'sNode" + ++sNode + "' ></div>";
  html += "<div class = 'menu' id = 'addLinkS" + sNode + "' >+</div>";
  html += "<div class = 'menu' id = 'addSubjectS" + sNode + "' >+</div>";
  html += "<div class = 'menu' id = 'nodeRemoveS" + sNode + "' >-</div>";
  html += "<div class='bookmark-box' id = 'sDiv" + sNode + "' >";
  html += "<a class='boxclose' id='sDiv" + sNode + "' onclick='closeDiv(this)'></a>";
  html += "<div class='bookmark-title' id = 'sWrite" + sNode + "' >";
  html += "<input type = 'button' onclick='sNodeWriteForm(this)' id = 'sNodeForm" + sNode + "' style='float: right;'/>";
  html += "<input type = 'hidden' id = 'sTitle" + sNode + "' value = 'SECOND TITLE' style='color:black;' />";
  html += "<h3>SECOND TITLE</h3>";
  html += "</div>";
  html += "<div class='description' id = 'sContentForm" + sNode + "'>";
  html += "<input type = 'hidden' id = 'sContent" + sNode + "' value = 'Second Content'/>Second Content";
  html += "</div>";
  html += "</div>";
  
  $(".mView").append(html);
  $("#sNode" + sNode).draggable();
  
  $("#sNode" + sNode).css("left", $("#fNode" + (fNodeNum + 1)).position().left + (50 * sNode));
  $("#sNode" + sNode).css("top", $("#fNode" + (fNodeNum + 1)).position().top + (50 * sNode));
  
  $(".menu[id$=S" + sNode + "]").css("left", $("#sNode" + sNode).position().left + 20);
  $(".menu[id$=S" + sNode + "]").css("top", $("#sNode" + sNode).position().top + 20);
  $("#sDiv" + sNode).css("left", $("#sNode" + sNode).position().left - 125);
  $("#sDiv" + sNode).css("top", $("#sNode" + sNode).position().top - 200);
  
  fNodeArray[fNodeNum].push("sNode" + sNode);
  var sNodeAdd = [];
  sNodeArray.push(sNodeAdd);
  
  drawLine();  
})

// FIRST NODE DRAG 이벤트
$(document).on("drag", "div[id^='fNode']", function () {
  divSet();
  fNodeId = this.id;
  var menuNum = Number(fNodeId.replace("fNode", ""));
  $("#addFNode" + menuNum).css("display", "none");
  $("#addSNode" + menuNum).css("display", "none");
  $("#remove" + menuNum).css("display", "none");

  drag = true;
  
  // 자식 노드 CONTROLLER
  for(var i = 1; i <= sNode; i++){
    $("#addLinkS" + i).css("display", "none");
    $("#addSubjectS" + i).css("display", "none");
    $("#nodeRemoveS" + i).css("display", "none");
    
    $("#sDiv" + i).css("left", $("#sNode" + i).position().left - 125);
    $("#sDiv" + i).css("top", $("#sNode" + i).position().top - 200);
  }
  
  fMenuOut();
  sMenuOut();
  
  $("#fDiv" + menuNum).css("left", $("#fNode" + menuNum).position().left - 115);
  $("#fDiv" + menuNum).css("top", $("#fNode" + menuNum).position().top - 200);
  
  drawLine();
})

// SECOND NODE DRAG 이벤트
$(document).on("drag", "div[id^='sNode']", function () {
  divSet();
  sNodeId = this.id;
  var menuNum = Number(sNodeId.replace("sNode", ""));
  $("#addLinkS" + menuNum).css("display", "none");
  $("#addSubjectS" + menuNum).css("display", "none");
  $("#nodeRemoveS" + menuNum).css("display", "none");
  
  fMenuOut();
  sMenuOut();
  
  $("#sDiv" + menuNum).css("left", $("#sNode" + menuNum).position().left - 125);
  $("#sDiv" + menuNum).css("top", $("#sNode" + menuNum).position().top - 200);
  
  drawLine();
})

// FIRST NODE CLICK 이벤트
$(document).on("click", "div[id^='fNode']", function () {
  divSet();
  sMenuOut();
  if(fNodeId != this.id) {
    fMenuOut();
  }
  
  fNodeId = this.id;
  var menuNum = Number(fNodeId.replace("fNode", ""));

  if(fMenu) {
    $("#addFNode" + menuNum).css("display", "block");
    $("#addFNode" + menuNum).css("left", $("#" + fNodeId).position().left - 70)
    
    $("#addSNode" + menuNum).css("display", "block");
    $("#addSNode" + menuNum).css("left", $("#" + fNodeId).position().left - 50);
    $("#addSNode" + menuNum).css("top", $("#" + fNodeId).position().top + 87);
    $("#addSNode" + menuNum).css("transition-delay", ".1s");
    
    $("#remove" + menuNum).css("display", "block");
    $("#remove" + menuNum).css("left", $("#" + fNodeId).position().left + 1);
    $("#remove" + menuNum).css("top", $("#" + fNodeId).position().top + 120);
    $("#remove" + menuNum).css("transition-delay", ".2s");
    $("#fDiv" + menuNum).css("display", "inline-table")
    fMenu = false;
  } else {
    $("#addFNode" + menuNum).css("left", $("#" + fNodeId).position().left + 30)
    $("#addFNode" + menuNum).css("top", $("#" + fNodeId).position().top + 30)
    
    $("#addSNode" + menuNum).css("left", $("#" + fNodeId).position().left + 30)
    $("#addSNode" + menuNum).css("top", $("#" + fNodeId).position().top + 30)
    
    $("#remove" + menuNum).css("left", $("#" + fNodeId).position().left + 30)
    $("#remove" + menuNum).css("top", $("#" + fNodeId).position().top + 30)
    
    $("#fDiv" + menuNum).css("display", "none");
    fMenu = true;
  }
})

// SECOND NODE CLICK 이벤트
$(document).on("click", "div[id^='sNode']", function () {
  divSet();
  fMenuOut();
  if(sNodeId != this.id) {
      sMenuOut();
  }
  
  sNodeId = this.id;
  var menuNum = Number(sNodeId.replace("sNode", ""));

  if(sMenu) {
    $("#addLinkS" + menuNum).css("display", "block");
    $("#addLinkS" + menuNum).css("left", $("#" + sNodeId).position().left - 65);
    $("#addLinkS" + menuNum).css("top", $("#" + sNodeId).position().top + 25);
    
    $("#addSubjectS" + menuNum).css("display", "block");
    $("#addSubjectS" + menuNum).css("left", $("#" + sNodeId).position().left - 50);
    $("#addSubjectS" + menuNum).css("top", $("#" + sNodeId).position().top + 77);
    $("#addSubjectS" + menuNum).css("transition-delay", ".1s");
    
    $("#nodeRemoveS" + menuNum).css("display", "block");
    $("#nodeRemoveS" + menuNum).css("left", $("#" + sNodeId).position().left + 1);
    $("#nodeRemoveS" + menuNum).css("top", $("#" + sNodeId).position().top + 100);
    $("#nodeRemoveS" + menuNum).css("transition-delay", ".2s");
    $("#sDiv" + menuNum).css("display", "inline-table")
    sMenu = false;
  } else {
    $("#addLinkS" + menuNum).css("left", $("#" + sNodeId).position().left + 20)
    $("#addLinkS" + menuNum).css("top", $("#" + sNodeId).position().top + 20)
    
    $("#addSubjectS" + menuNum).css("left", $("#" + sNodeId).position().left + 20)
    $("#addSubjectS" + menuNum).css("top", $("#" + sNodeId).position().top + 20)
    
    $("#nodeRemoveS" + menuNum).css("left", $("#" + sNodeId).position().left + 20)
    $("#nodeRemoveS" + menuNum).css("top", $("#" + sNodeId).position().top + 20)
    
    $("#sDiv" + menuNum).css("display", "none");
    sMenu = true;
  }
})

// FIRST NODE MENU 정보
$(document).on("mouseenter", "div[id^='addFNode']", function () {
  var selectId = this.id
  var selectNo = Number(selectId.replace("addFNode", ""));
  $("#menuAddFNode").css("left", $("#addFNode" + selectNo).position().left - 30)
  $("#menuAddFNode").css("top", $("#addFNode" + selectNo).position().top - 30)
  $("#menuAddFNode").css("display", "block");
})

$(document).on("mouseout", "div[id^='addFNode']", function () {
  $("#menuAddFNode").css("display", "none");
})

// FIRST NODE MENU 정보
$(document).on("mouseenter", "div[id^='addSNode']", function () {
  var selectId = this.id
  var selectNo = Number(selectId.replace("addSNode", ""));
  $("#menuAddSNode").css("left", $("#addSNode" + selectNo).position().left - 30)
  $("#menuAddSNode").css("top", $("#addSNode" + selectNo).position().top - 30)
  $("#menuAddSNode").css("display", "block");
})

$(document).on("mouseout", "div[id^='addSNode']", function () {
  $("#menuAddSNode").css("display", "none");
})

// FIRST NODE MENU 정보
$(document).on("mouseenter", "div[id^='remove']", function () {
  var selectId = this.id
  var selectNo = Number(selectId.replace("remove", ""));
  $("#menuRemove").css("left", $("#remove" + selectNo).position().left - 30)
  $("#menuRemove").css("top", $("#remove" + selectNo).position().top - 30)
  $("#menuRemove").css("display", "block");
})

$(document).on("mouseout", "div[id^='remove']", function () {
  $("#menuRemove").css("display", "none");
})

// FIRST NODE MOUSEUP 이벤트
$(document).on("mouseup" ,"div[id^='fNode']", function () {
  if(drag){
    fNodeId = this.id
    fNodeNum = Number(fNodeId.replace("fNode", "") - 1);
    var sNodeArrayTemp = fNodeArray[fNodeNum];
    for(var i = 0; i < sNodeArrayTemp.length; i++){
      var sNodeIdTemp = sNodeArrayTemp[i];
      var sNodeNumTemp = Number(sNodeIdTemp.replace("sNode", ""));
      $("#" + sNodeIdTemp).animate({left:$("#fNode" + (fNodeNum + 1)).position().left + 50 * (i+1), top:$("#fNode" + (fNodeNum + 1)).position().top + 50}, {duration: 700, step:function() {
        drawLine();
        $("#sDiv" + sNodeNumTemp).css("left", $("#" + sNodeIdTemp).position().left - 125);
        $("#sDiv" + sNodeNumTemp).css("top", $("#" + sNodeIdTemp).position().top - 200);
      }}).promise().done(function() { 
        fMenuOut();
        sMenuOut();
      })
    }
  }
  drag = false;
})

// NODE DIV 닫기
function closeDiv(id) {
  divId = id.id;
  $("#" + divId).css("display", "none");
}

// NODE DIV OFF & 위치 조정
function divSet() {
  for (var i = 1; i <= fNode; i++) {
    $("#fDiv" + i ).css("display", "none");
    $("#fDiv" + i).css({top:$("#fNode" + i).position().top - 200, left:$("#fNode" + i).position().left - 115});
  }
  
  for (var i = 1; i <= sNode; i ++) {
    $("#sDiv" + i ).css("display", "none");
    $("#sDiv" + i).css({top:$("#sNode" + i).position().top - 200, left:$("#sNode" + i).position().left - 125});
  };
}

// LINE 그리기
function drawLine() {
  canvas.width = canvas.width;
  context.lineWidth = 4;
  context.strokeStyle="#486d7b";
  
  // FIRST NODE 연결
  for (var i = 1; i < fNode; i++) {
    var fNodeLeft1 = ($("#fNode" + i).position().left + 50);
    var fNodeTop1 = ($("#fNode" + i).position().top + 50);
    var fNodeLeft2 = ($("#fNode" + (i + 1)).position().left + 50);
    var fNodeTop2 = ($("#fNode" + (i + 1)).position().top + 50);
    context.beginPath();
    context.moveTo(fNodeLeft1, fNodeTop1);
    context.bezierCurveTo(fNodeLeft1, fNodeTop2, fNodeLeft2, fNodeTop2, fNodeLeft2, fNodeTop2);
    context.stroke();
  }
  
  // FIRST NODE와 SECOND NODE 연결
  for (var i = 1; i <= fNode; i++) {
    var fNodeLeft = ($("#fNode" + i).position().left + 50);
    var fNodeTop = ($("#fNode" + i).position().top + 50);
    if(fNodeArray[i-1] != null) {
      var sNodeArrTemp = fNodeArray[i-1];
      for(var j = 0; j < sNodeArrTemp.length; j++) {
        var childLeft = $("#" + sNodeArrTemp[j]).position().left + 35;
        var childTop = $("#" + sNodeArrTemp[j]).position().top + 35;
//        var len = Math.sqrt(Math.pow((fNodeLeft-childLeft), 2) + Math.pow((fNodeTop-childTop), 2));
//        if (len> 300) {
//        $("#" + sNodeArrTemp[j]).animate({left:(fNodeLeft + (50*j)) + "px", top:(fNodeTop + 100) + "px"}, {duration: 0.0001})
//          childLeft = $("#" + sNodeArrTemp[j]).position().left + 35;
//          childTop = $("#" + sNodeArrTemp[j]).position().top + 35;
//          context.beginPath();
//          context.moveTo(fNodeLeft, fNodeTop);
//          context.bezierCurveTo(fNodeLeft, childTop, childLeft, childTop, childLeft, childTop);
//          context.stroke();
//        }
        context.beginPath();
        context.moveTo(fNodeLeft, fNodeTop);
        context.bezierCurveTo(fNodeLeft, childTop, childLeft, childTop, childLeft, childTop);
        context.stroke();
      }
    }  
  }
}


// FIRST NODE 내용 작성
function fNodeWriteForm(id) {
  var formNum = Number(id.id.replace("fNodeForm", ""));
  if($("#fText" + formNum).val() == null) {
   $("#fTitle" + formNum).removeAttr("type").attr("type", "text");
   $("#fWrite" + formNum +  "> h3").remove();
   $("#fContentForm" + formNum).html("<textarea rows='100%' cols='29' id = 'fText" + formNum +"' style='color:black'>" + $("#fContent" + formNum).val() + "</textarea>")
   ch = false;
  }else {
   if($("#fTitle" + formNum).val() == "") {
     alert("STEP의 제목을 입력해 주세요.")
     $("#fTitle" + formNum).focus();
     return;
   }
   
   if($("#fText" + formNum).val() == "") {
     alert("STEP의 내용을 입력해 주세요.")
     $("#fText" + formNum).focus();
     return;
   }
   
   var html = "";
   $("#fWrite" + formNum).append("<h3>" + $("#fTitle" + formNum).val() + "</h3>");
   $("#fTitle" + formNum).removeAttr("type").attr("type", "hidden");
   html += "<input type = 'hidden' id = 'fContent" + formNum +"' value = '" + $("#fText" + formNum).val() + "' />";
   html += $("#fText" + formNum).val();
   $("#fContentForm" + formNum).html(html);
   $("#fText" + formNum).remove();
  }
}

// SECOND NODE 내용 작성
function sNodeWriteForm(id) {
  var formNum = Number(id.id.replace("sNodeForm", ""));
  if($("#sText" + formNum).val() == null) {
    $("#sTitle" + formNum).removeAttr("type").attr("type", "text");
    $("#sWrite" + formNum +  "> h3").remove();
    $("#sContentForm" + formNum).html("<textarea rows='100%' cols='29' id = 'sText" + formNum +"' style='color:black'>" + $("#sContent" + formNum).val() + "</textarea>")
    ch = false;
  }else {
    if($("#sTitle" + formNum).val() == "") {
      alert("SECOND의 제목을 입력해 주세요.")
      $("#sTitle" + formNum).focus();
      return;
    }
    
    if($("#sText" + formNum).val() == "") {
      alert("SECOND의 내용을 입력해 주세요.")
      $("#sText" + formNum).focus();
      return;
    }
    
    var html = "";
    $("#sWrite" + formNum).append("<h3>" + $("#sTitle" + formNum).val() + "</h3>");
    $("#sTitle" + formNum).removeAttr("type").attr("type", "hidden");
    html += "<input type = 'hidden' id = 'sContent" + formNum +"' value = '" + $("#sText" + formNum).val() + "' />";
    html += $("#sText" + formNum).val();
    $("#sContentForm" + formNum).html(html);
    $("#sText" + formNum).remove();
  }
}

// FIRST NODE MENU OFF
function fMenuOut() {
  for(var i = 1; i <= fNode; i++) {
    $("#addFNode" + i).css("left", $("#fNode" + i).position().left + 30)
    $("#addFNode" + i).css("top", $("#fNode" + i).position().top + 30)
    
    $("#addSNode" + i).css("left", $("#fNode" + i).position().left + 30)
    $("#addSNode" + i).css("top", $("#fNode" + i).position().top + 30)
    
    $("#remove" + i).css("left", $("#fNode" + i).position().left + 30)
    $("#remove" + i).css("top", $("#fNode" + i).position().top + 30)
  }
  fMenu = true;
}

// SECOND NODE MENU OFF
function sMenuOut() {
  for(var i = 1; i <= sNode; i++) {
    console.log(i)
    $("#addLinkS" + i).css("left", $("#sNode" + i).position().left + 20)
    $("#addLinkS" + i).css("top", $("#sNode" + i).position().top + 20)
    
    $("#addSubjectS" + i).css("left", $("#sNode" + i).position().left + 20)
    $("#addSubjectS" + i).css("top", $("#sNode" + i).position().top + 20)
    
    $("#nodeRemoveS" + i).css("left", $("#sNode" + i).position().left + 20)
    $("#nodeRemoveS" + i).css("top", $("#sNode" + i).position().top + 20)
  }
  sMenu = true;
}