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

/* THIRD NODE 변수 */
var tNode = 0;
var tNodeId;

/* MENU 변수 */
var fMenu = true;
var sMenu = true;
var tMenu = true;
var menuSelectId;

var drag = false;

var x;
var y;
var allDrag = false;

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
  html += "<div class = 'fNode' id = 'fNode" + fNode + "' >STEP" + fNode + "</div>";
  html += "<div class = 'menu' id = 'addFNode" + fNode + "' >+</div>";
  html += "<div class = 'menu' id = 'addSNode" + fNode + "' >+</div>";
  html += "<div class = 'menu' id = 'remove" + fNode + "' >-</div>";
  html += "<div class='bookmark-box' id = 'fDiv" + fNode + "' >";
  html += "<a class='boxclose' id='fDiv" + fNode + "' onclick='closeDiv(this)'></a>";
  html += "<div class='bookmark-title' id = 'fWrite" + fNode + "' >";
  html += "<input class = 'nodeModifyBtn' type = 'button' onclick='fNodeWriteForm(this)' id = 'fNodeForm" + fNode + "' style='float: right;'/>";
  html += "<input type = 'hidden' id = 'fTitle" + fNode + "' value = 'STEP TITLE' style='color:black;' />";
  html += "<h3>STEP TITLE</h3>";
  html += "</div>";
  html += "<div class='description' id = 'fContentForm" + fNode + "' >";
  html += "  <input type = 'hidden' id = 'fContent" + fNode + "' value = 'Step Content'/>Step Content";
  html += "</div>";
  html += "</div>";
  
  $(".mView").append(html);
  $("#fNode" + fNode).draggable();
  
  $("#addFNode" + fNode).css("left", $("#fNode" + fNode).position().left + 30);
  $("#addFNode" + fNode).css("top", $("#fNode" + fNode).position().top + 30);
  $("#addSNode" + fNode).css("left", $("#fNode" + fNode).position().left + 30);
  $("#addSNode" + fNode).css("top", $("#fNode" + fNode).position().top + 30);
  $("#remove" + fNode).css("left", $("#fNode" + fNode).position().left + 30);
  $("#remove" + fNode).css("top", $("#fNode" + fNode).position().top + 30);
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
  html += "<div class = 'sNode' id = 'sNode" + ++sNode + "' >VIDEO " + sNode + "</div>";
  html += "<div class = 'menu' id = 'addLinkS" + sNode + "' >+</div>";
  html += "<div class = 'menu' id = 'addSubjectS" + sNode + "' >+</div>";
  html += "<div class = 'menu' id = 'nodeRemoveS" + sNode + "' >-</div>";
  html += "<div class='bookmark-box' id = 'sDiv" + sNode + "' >";
  html += "<a class='boxclose' id='sDiv" + sNode + "' onclick='closeDiv(this)'></a>";
  html += "<div class='bookmark-title' id = 'sWrite" + sNode + "' >";
  html += "<input class = 'nodeModifyBtn' type = 'button' onclick='sNodeWriteForm(this)' id = 'sNodeForm" + sNode + "' style='float: right;'/>";
  html += "<input type = 'hidden' id = 'sTitle" + sNode + "' value = 'SECOND TITLE' style='color:black;' />";
  html += "<h3>SECOND TITLE</h3>";
  html += "</div>";
  html += "<div class='description' id = 'sContentForm" + sNode + "'>";
  html += "<input type = 'hidden' id = 'sContent" + sNode + "' value = 'Second Content'/>Second Content";
  html += "</div>";
//  html += "<a style = 'color: white;'>동영상 추가</a>";
  
  //수정이 시작 부분
  html += "<div class='file-upload' id = 'videoInput" + sNode + "'>" +
            "<div class='file-select'>" +
              "<div class='file-select-button' id='fileName" + sNode + "'>Choose File</div>" +
              "<div class='file-select-name' id='noFile" + sNode + "'>No file chosen...</div>" +
              "<input id='chooseFile" + sNode + "' type='file' name='chooseFile" + sNode + "' onchange=playSelectedFile("+sNode+")>" +
            "</div>" +
          "</div>";
  //수정이 끝부분

  html += "</div>";
  
  $(".mView").append(html);
  $("#sNode" + sNode).draggable();
  
  $("#sNode" + sNode).css("left", $("#fNode" + (fNodeNum + 1)).position().left + (50 * sNode));
  $("#sNode" + sNode).css("top", $("#fNode" + (fNodeNum + 1)).position().top + (50 * sNode));
  
  $(".menu[id$=S" + sNode + "]").css("left", $("#sNode" + sNode).position().left + 20);
  $(".menu[id$=S" + sNode + "]").css("top", $("#sNode" + sNode).position().top + 20);
  $("#sDiv" + sNode).css("left", $("#sNode" + sNode).position().left - 125);
  $("#sDiv" + sNode).css("top", $("#sNode" + sNode).position().top - 250);
  
  fNodeArray[fNodeNum].push("sNode" + sNode);
  var sNodeAdd = [];
  sNodeArray.push(sNodeAdd);
  
  drawLine();  
})

// THIRD NODE LINK ADD 이벤트
$(document).on("click", "div[id^='addLinkS']", function () {
  menuId = this.id;
  var sNodeNum = Number(menuId.replace("addLinkS", "")) - 1;
  var html = "";
  
  html += "<div class = 'tNode' id = 'tNode" + ++tNode + "' >LINK</div>";
  html += "<div class = 'menu' id = 'mTNodeRemove" + tNode + "' >-</div>";
  html += "<div class='bookmark-box' id = 'tDiv" + tNode + "' >";
  html += "<a class='boxclose' id='tDiv" + tNode + "' onclick='closeDiv(this)'></a>";
  html += "<div class='bookmark-title' id = 'tWrite" + tNode + "' >";
  html += "<input class = 'nodeModifyBtn' type = 'button' onclick='tLinkWriteForm(this)' id = 'tLinkForm" + tNode + "' style='float: right;'/>";
  html += "<input type = 'hidden' id = 'tLinkTitle" + tNode + "' value = 'THIRD TITLE' style='color:black;' />";
  html += "<h3>THIRD TITLE</h3>";
  html += "</div>";
  html += "<div class='description' id = 'tContentForm" + tNode + "'>";
  html += "<input type = 'hidden' id = 'tLinkContent" + tNode + "' value = 'Third Content'/>Third Content";
  html += "</div>";
  html += "<div id = 'tLinkUrlForm" + tNode + "' >";
  html += "<a id = 'tUrl" + tNode + "' style = 'color: white;'>링크</a>";
  html += "<input type = 'hidden' id = 'tLinkUrl" + tNode + "' name = 'tLinkUrl" + tNode + "' style='color:black; width:100%;' />";
  html += "</div>";
  html += "</div>";

  $(".mView").append(html);
  $("#tNode" + tNode).draggable();

  $("#tNode" + tNode).css("left", $("#sNode" + (sNodeNum + 1)).position().left + 30);
  $("#tNode" + tNode).css("top", $("#sNode" + (sNodeNum + 1)).position().top + 30);
  $("#mTNodeRemove" + tNode).css("left", $("#tNode" + tNode).position().left + 10);
  $("#mTNodeRemove" + tNode).css("top", $("#tNode" + tNode).position().top + 10);
  $("#tDiv" + tNode).css("left", $("#tNode" + tNode).position().left - 140);
  $("#tDiv" + tNode).css("top", $("#tNode" + tNode).position().top - 200);
  sNodeArray[sNodeNum].push("tNode" + tNode);
})

// THIRD NODE ASSIGNMENT ADD 이벤트
$(document).on("click", "div[id^='addSubjectS']", function () {
  menuId = this.id;
  var sNodeNum = Number(menuId.replace("addSubjectS", "")) - 1;
  var html = "";
  
  html += "<div class = 'tNode' id = 'tNode" + ++tNode + "' >ASMT</div>";
  html += "<div class = 'menu' id = 'mTNodeRemove" + tNode + "' >-</div>";
  html += "<div class='bookmark-box' id = 'tDiv" + tNode + "' >";
  html += "<a class='boxclose' id='tDiv" + tNode + "' onclick='closeDiv(this)'></a>";
  html += "<div class='bookmark-title' id = 'tWrite" + tNode + "' >";
  html += "<input type = 'button' class = 'nodeModifyBtn' onclick='tAsmtWriteForm(this)' id = 'tAsmtBtnForm" + tNode + "' style='float: right;'/>";
  html += "<input type = 'hidden' id = 'tAsmtTitle" + tNode + "' value = 'THIRD TITLE' style='color:black;' />";
  html += "<h3>THIRD TITLE</h3>";
  html += "</div>";
  html += "<div class='description' id = 'tContentForm" + tNode + "'>";
  html += "<input type = 'hidden' id = 'tAsmtContent" + tNode + "' value = 'Third Content'/>Third Content";
  html += "</div>";
//  html += "<div id = 'tAsmtForm" + tNode + "' >";
//  html += "<input type = 'file' id = 'tAsmtFile" + tNode + "' name = 'tAsmtFile" + tNode + "' style='color:black; width:100%;' />";
//  html += "</div>";
  
  
  html += "<div class='file-upload' id = 'asmtDIV" + tNode + "'>" +
          "<div class='file-select'>" +
            "<div class='file-select-button' id='fileName" + tNode + "'>Choose File</div>" +
            "<div class='file-select-name' id='tAsmtName" + tNode + "'>No file chosen...</div>" +
            "<input id='tAsmtFile" + tNode + "' type='file' name='tAsmtFile" + tNode + "' onchange='selectASMT(" + tNode + ");'>" +
          "</div>" +
          "</div>";
  
  
  
  
  
  html += "</div>";
  
  $(".mView").append(html);
  $("#tNode" + tNode).draggable();
  
  $("#tNode" + tNode).css("left", $("#sNode" + (sNodeNum + 1)).position().left + 30);
  $("#tNode" + tNode).css("top", $("#sNode" + (sNodeNum + 1)).position().top + 30);
  $("#mTNodeRemove" + tNode).css("left", $("#tNode" + tNode).position().left + 10);
  $("#mTNodeRemove" + tNode).css("top", $("#tNode" + tNode).position().top + 10);
  $("#tDiv" + tNode).css("left", $("#tNode" + tNode).position().left - 140);
  $("#tDiv" + tNode).css("top", $("#tNode" + tNode).position().top - 200);
  sNodeArray[sNodeNum].push("tNode" + tNode);
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
  
  // SECOND 노드 CONTROLLER
  for(var i = 1; i <= sNode; i++){
    $("#addLinkS" + i).css("display", "none");
    $("#addSubjectS" + i).css("display", "none");
    $("#nodeRemoveS" + i).css("display", "none");
    
    $("#sDiv" + i).css("left", $("#sNode" + i).position().left - 125);
    $("#sDiv" + i).css("top", $("#sNode" + i).position().top - 200);
    
  }
  
  // THIRD 노드 CONTROLLER
  for(var i = 1; i <= tNode; i++){
    $("#mTNodeRemove" + i).css("display", "none");
    
    $("#tDiv" + i).css("left", $("#tNode" + i).position().left - 140);
    $("#tDiv" + i).css("top", $("#tNode" + i).position().top - 200);
  }
  
  fMenuOut();
  sMenuOut();
  tMenuOut();
  
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
  tMenuOut();
  
  $("#sDiv" + menuNum).css("left", $("#sNode" + menuNum).position().left - 125);
  $("#sDiv" + menuNum).css("top", $("#sNode" + menuNum).position().top - 200);
  
  drawLine();
})

// THIRD NODE DRAG 이벤트
$(document).on("drag", "div[id^='tNode']", function () {
  divSet();
  tNodeId = this.id;
  var menuNum = Number(tNodeId.replace("tNode", ""));
  $("#mTNodeRemove" + menuNum).css("display", "none");
  
  fMenuOut();
  sMenuOut();
  tMenuOut();
  
  $("#tDiv" + menuNum).css("left", $("#tNode" + menuNum).position().left - 140);
  $("#tDiv" + menuNum).css("top", $("#tNode" + menuNum).position().top - 200);
  
  drawLine();
})

// FIRST NODE CLICK 이벤트
$(document).on("click", "div[id^='fNode']", function () {
  divSet();
  sMenuOut();
  tMenuOut();
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
  tMenuOut();
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

// THIRD NODE CLICK 이벤트
$(document).on("click", "div[id^='tNode']", function () {
  divSet();
  fMenuOut();
  sMenuOut();
  if(tNodeId != this.id) {
    tMenuOut();
  }
  
  tNodeId = this.id;
  var menuNum = Number(tNodeId.replace("tNode", ""));
  
  if(tMenu) {
    $("#mTNodeRemove" + menuNum).css("display", "block");
    $("#mTNodeRemove" + menuNum).css("left", $("#" + tNodeId).position().left - 55);
    $("#mTNodeRemove" + menuNum).css("top", $("#" + tNodeId).position().top + 35);
    
    $("#tDiv" + menuNum).css("display", "inline-table")
    
    tMenu = false;
  } else {
    $("#mTNodeRemove" + menuNum).css("left", $("#" + tNodeId).position().left + 10)
    $("#mTNodeRemove" + menuNum).css("top", $("#" + tNodeId).position().top + 10)
    
    $("#tDiv" + menuNum).css("display", "none");
    tMenu = true;
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

// SECOND NODE MENU 정보
$(document).on("mouseenter", "div[id^='addLinkS']", function () {
  var selectId = this.id
  var selectNo = Number(selectId.replace("addLinkS", ""));
  $("#menuAddLinkS").css("left", $("#addLinkS" + selectNo).position().left - 30)
  $("#menuAddLinkS").css("top", $("#addLinkS" + selectNo).position().top - 30)
  $("#menuAddLinkS").css("display", "block");
})

$(document).on("mouseout", "div[id^='addLinkS']", function () {
  $("#menuAddLinkS").css("display", "none");
})

// SECOND NODE MENU 정보
$(document).on("mouseenter", "div[id^='addSubjectS']", function () {
  var selectId = this.id
  var selectNo = Number(selectId.replace("addSubjectS", ""));
  $("#menuAddSubjectS").css("left", $("#addSubjectS" + selectNo).position().left - 30)
  $("#menuAddSubjectS").css("top", $("#addSubjectS" + selectNo).position().top - 30)
  $("#menuAddSubjectS").css("display", "block");
})

$(document).on("mouseout", "div[id^='addSubjectS']", function () {
  $("#menuAddSubjectS").css("display", "none");
})

// SECOND NODE MENU 정보
$(document).on("mouseenter", "div[id^='nodeRemoveS']", function () {
  var selectId = this.id
  var selectNo = Number(selectId.replace("nodeRemoveS", ""));
  $("#menuNodeRemoveS").css("left", $("#nodeRemoveS" + selectNo).position().left - 30)
  $("#menuNodeRemoveS").css("top", $("#nodeRemoveS" + selectNo).position().top - 30)
  $("#menuNodeRemoveS").css("display", "block");
})

$(document).on("mouseout", "div[id^='nodeRemoveS']", function () {
  $("#menuNodeRemoveS").css("display", "none");
})

// THIRD NODE MENU 정보
$(document).on("mouseenter", "div[id^='mTNodeRemove']", function () {
  var selectId = this.id
  var selectNo = Number(selectId.replace("mTNodeRemove", ""));
  $("#menuTNodeRemove").css("left", $("#mTNodeRemove" + selectNo).position().left - 30)
  $("#menuTNodeRemove").css("top", $("#mTNodeRemove" + selectNo).position().top - 30)
  $("#menuTNodeRemove").css("display", "block");
})

$(document).on("mouseout", "div[id^='mTNodeRemove']", function () {
  $("#menuTNodeRemove").css("display", "none");
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
        tMenuOut();
      })
      var tNodeArrayTemp = sNodeArray[sNodeNumTemp-1];
      for(var j = 0; j < tNodeArrayTemp.length; j++) {
        var tNodeIdTemp = tNodeArrayTemp[j];
        var tNodeNumTemp = Number(tNodeIdTemp.replace("tNode", ""));
        $("#" + tNodeIdTemp).animate({left:$("#sNode" + sNodeNumTemp).position().left + 50 * (i+1), top:$("#sNode" + sNodeNumTemp).position().top + 50}, {duration: 700, step:function() {
          drawLine();
          $("#tDiv" + tNodeNumTemp).css("left", $("#" + tNodeIdTemp).position().left - 125);
          $("#tDiv" + tNodeNumTemp).css("top", $("#" + tNodeIdTemp).position().top - 200);
        }}).promise().done(function() { 
//          fMenuOut();
//          sMenuOut();
//          tMenuOut();
        })
      }
    }
  }
  drag = false;
})

// FIRST NODE DELETE
$(document).on("click", "div[id^='remove']", function () {
  if(fNodeArray.length == 1) {
    alert("첫 번째 STEP는 삭제할 수 없습니다.");
    return;
  }
  var deleteId = this.id;
  var deleteNum = Number(deleteId.replace("remove", ""));
  
  var sNodeArrTemp = fNodeArray[deleteNum - 1];
  for (var i = 0; i < sNodeArrTemp.length; i++) {
    var sNodeIdTemp = sNodeArrTemp[i];
    var sNodeNumTemp = Number(sNodeIdTemp.replace("sNode", "")) - 1;
    var tNodeArrTemp = sNodeArray[sNodeNumTemp - i];
    
    // TNODE 삭제
    for (var j = 0; j < tNodeArrTemp.length; j++) {
      var tNodeIdTemp = tNodeArrTemp[j];
      var tNodeNumTemp = Number(tNodeIdTemp.replace("tNode", ""));
      $("#" + tNodeIdTemp).remove();
      $("#mTNodeRemove" + tNodeNumTemp).remove();
      $("#tDiv" + tNodeNumTemp).remove();
      tNode--;
    }
    
    // SECOND NODE 삭제
    $("#" + sNodeIdTemp).remove();
    $("#sDiv" + (sNodeNumTemp + 1)).remove();
    $(".menu[id$='S" + (sNodeNumTemp + 1) + "']").remove();
    sNodeArray.splice(sNodeNumTemp - i, 1);
    sNode--;
  }
  
  // 윤재야 그러면 안돼 
  //왜 혼자 집가니.
  //ㅉㅉ
  //조장이 왜그러닝.
  //워후후후후우웅우

  // TNODE 재정렬
  var tNum = 1;
  for (var i = 0; i < sNodeArray.length; i ++) {
    var tNodeArrTemp = sNodeArray[i];
    for(var j = 0; j < tNodeArrTemp.length; j++) {
      var tNodeIdTemp = tNodeArrTemp[j];
      var tNodeNumTemp = Number(tNodeIdTemp.replace("tNode", ""));
      $("#mTNodeRemove" + tNodeNumTemp).attr("id", "mTNodeRemove" + tNum);
      $("div[id='tDiv" + tNodeNumTemp + "']").attr("id", "tDiv" + tNum);
      $("a[id='tDiv" + tNodeNumTemp + "']").attr("id", "tDiv" + tNum);
      $("#tWrite" + tNodeNumTemp).attr("id", "tWrite" + tNum);
      $("#tContentForm" + tNodeNumTemp).attr("id", "tContentForm" + tNum);
      if($("#tLinkTitle" + tNodeNumTemp).val() != null) {
        $("#tLinkForm" + tNodeNumTemp).attr("id", "tLinkForm" + tNum);
        $("#tLinkTitle" + tNodeNumTemp).attr("id", "tLinkTitle" + tNum);
        $("#tLinkContent" + tNodeNumTemp).attr("id", "tLinkContent" + tNum);
        $("#tLinkUrlForm" + tNodeNumTemp).attr("id", "tLinkUrlForm" + tNum);
        $("a[id='tUrl" + tNodeNumTemp + "']").attr("id", "tUrl" + tNum);
        $("#tLinkUrl" + tNodeNumTemp).attr("id", "tLinkUrl" + tNum);
      } else {
        $("#tAsmtBtnForm" + tNodeNumTemp).attr("id", "tAsmtBtnForm" + tNum);
        $("#tAsmtForm" + tNodeNumTemp).attr("id", "tAsmtForm" + tNum);
        $("#tAsmtTitle" + tNodeNumTemp).attr("id", "tAsmtTitle" + tNum);
        $("#tAsmtContent" + tNodeNumTemp).attr("id", "tAsmtContent" + tNum);
        $("#tAsmtFile" + tNodeNumTemp).attr("id", "tAsmtFile" + tNum);
      }
      
      $("#" + tNodeIdTemp).removeAttr("id").attr("id", "tNode" + tNum);
      tNodeArrTemp[j] = "tNode" + tNum;
      tNum++;
    }
  }
  
  // FIRST NODE 삭제
  fNodeArray.splice(deleteNum - 1, 1);
  $("#fNode" + deleteNum).remove();
  $("#fDiv" + deleteNum).remove();
  $("#addFNode" + deleteNum).remove();
  $("#addSNode" + deleteNum).remove();
  $("#remove" + deleteNum).remove();
  $("#menuRemove").css("display", "none");
  fNode--;
  
  // FIRST 정렬
  var fNum = deleteNum + 1;
  for (var i = deleteNum; i <= fNodeArray.length; i++) {
    $("#fNode" + fNum).attr("id", "fNode" + i);
    $("#addFNode" + fNum).attr("id", "addFNode" + i);
    $("#addSNode" + fNum).attr("id", "addSNode" + i);
    $("#remove" + fNum).attr("id", "remove" + i);
    $("div[id='fDiv" + fNum + "']").attr("id", "fDiv" + i);
    $("a[id='fDiv" + fNum + "']").attr("id", "fDiv" + i);
    $("#fWrite" + fNum).attr("id", "fWrite" + i);
    $("#fNodeForm" + fNum).attr("id", "fNodeForm" + i);
    $("#fTitle" + fNum).attr("id", "fTitle" + i);
    $("#fContentForm" + fNum).attr("id", "fContentForm" + i);
    $("#fContent" + fNum).attr("id", "fContent" + i);
    fNum++;
  }
  
  // SECOND 정렬
  var sNum = 1;
  for (var i = 0; i < fNodeArray.length; i++) {
    var sNodeArrTemp = fNodeArray[i];
    for (var j = 0; j < sNodeArrTemp.length; j++) {
      var sNodeIdTemp = sNodeArrTemp[j];
      var sNumTemp = Number(sNodeIdTemp.replace("sNode",""))
      $("#" + sNodeIdTemp).attr("id", "sNode" + sNum);
      $("#addLinkS" + sNumTemp).attr("id", "addLinkS" + sNum);
      $("#addSubjectS" + sNumTemp).attr("id", "addSubjectS" + sNum);
      $("#nodeRemoveS" + sNumTemp).attr("id", "nodeRemoveS" + sNum);
      $("div[id='sDiv" + sNumTemp + "']").attr("id", "sDiv" + sNum);
      $("a[id='sDiv" + sNumTemp + "']").attr("id", "sDiv" + sNum);
      $("#sWrite" + sNumTemp).attr("id", "sWrite" + sNum);
      $("#sNodeForm" + sNumTemp).attr("id", "sNodeForm" + sNum);
      $("#sTitle" + sNumTemp).attr("id", "sTitle" + sNum);
      $("#sContentForm" + sNumTemp).attr("id", "sContentForm" + sNum);
      $("#sContent" + sNumTemp).attr("id", "sContent" + sNum);
      
      sNodeArrTemp[j] = "sNode" + sNum;
      sNum++;
    }
  }
  
  // FIRST NODE 마지막 노드의 ADD 메뉴 추가
  if($("#addFNode" + fNode).attr("id") == null) {
    $(".mView").append("<div class = 'menu' id = 'addFNode" + fNode + "' >+</div>");
  }
  
  drawLine();
})

// SECOND NODE DELETE
$(document).on("click", "div[id^='nodeRemoveS']", function () {
  var deleteId = this.id;
  var deleteNum = Number(deleteId.replace("nodeRemoveS", ""));
  var sNodeDelId = "sNode" + deleteNum;
  
  var fNodeNumTemp;
  for (var i = 0; i < fNodeArray.length; i++) {
    var sNodeArrTemp = fNodeArray[i];
    for(var j = 0; j < sNodeArrTemp.length; j++) {
      if(sNodeDelId == sNodeArrTemp[j]) {
        fNodeNumTemp = i;
        break;
      }
    }
  }
  
  var sNodeArrTemp = fNodeArray[fNodeNumTemp];
  for(var i = 0; i < sNodeArrTemp.length; i++) {
    console.log(sNodeArrTemp[i]);
  }
  var index;
  index = fNodeArray[fNodeNumTemp].indexOf("sNode" + deleteNum);
  sNodeArrTemp.splice(index, 1);
  
  var tNodeArrTemp = sNodeArray[deleteNum - 1];
  // TNODE 삭제
  for (var j = 0; j < tNodeArrTemp.length; j++) {
    var tNodeIdTemp = tNodeArrTemp[j];
    var tNodeNumTemp = Number(tNodeIdTemp.replace("tNode", ""));
    $("#" + tNodeIdTemp).remove();
    $("#mTNodeRemove" + tNodeNumTemp).remove();
    $("#tDiv" + tNodeNumTemp).remove();
    tNode--;
  }
  
  // SECOND NODE 삭제
  $("#" + sNodeDelId).remove();
  $("#sDiv" + deleteNum).remove();
  $(".menu[id$='S" + deleteNum + "']").remove();
  sNodeArray.splice((deleteNum - 1), 1);
  sNode--;
  
  sNodeSort();
  tNodeSort();
  $("#menuNodeRemoveS").css("display", "none")
  drawLine();
})

// THIRD NODE DELETE
$(document).on("click", "div[id^='mTNodeRemove']", function () {
  var deleteId = this.id;
  var deleteNum = Number(deleteId.replace("mTNodeRemove", ""));
  var tNodeDelId = "tNode" + deleteNum;
  
  var sNodeNumTemp;
  for (var i = 0; i < sNodeArray.length; i++) {
    var tNodeArrTemp = sNodeArray[i];
    for(var j = 0; j < tNodeArrTemp.length; j++) {
      if(tNodeDelId == tNodeArrTemp[j]) {
        sNodeNumTemp = i;
        break;
      }
    }
  }
  
  var tNodeArrTemp = sNodeArray[sNodeNumTemp];
  var index = tNodeArrTemp.indexOf("tNode" + deleteNum);
  tNodeArrTemp.splice(index, 1);
  
  // THIRD NODE 삭제
  $("#" + tNodeDelId).remove();
  $("#tDiv" + deleteNum).remove();
  $("#mTNodeRemove" + deleteNum).remove();
  $("#menuTNodeRemove").css("display", "none");
  tNode--;
  
  tNodeSort();
  drawLine();
  
})

// NODE DIV 닫기
function closeDiv(id) {
  divId = id.id;
  $("#" + divId).css("display", "none");
}

function checkArr() {
  console.log("FNODE 배열")
  for(var i = 0; i < fNode; i++) {
    console.log(fNodeArray[i]);
  }

  console.log("SNODE 배열")
  for(var i = 0; i < sNode; i++) {
    console.log(sNodeArray[i]);
  }
}

// NODE DIV OFF & 위치 조정
function divSet() {
  for (var i = 1; i <= fNode; i++) {
    $("#fDiv" + i ).css("display", "none");
    $("#fDiv" + i).css({top:$("#fNode" + i).position().top - 200, left:$("#fNode" + i).position().left - 115});
  }
  
  for (var i = 1; i <= sNode; i ++) {
    $("#sDiv" + i ).css("display", "none");
    $("#sDiv" + i).css({top:$("#sNode" + i).position().top - 250, left:$("#sNode" + i).position().left - 125});
  };
  
  for (var i = 1; i <= tNode; i ++) {
    $("#tDiv" + i ).css("display", "none");
    $("#tDiv" + i).css({top:$("#tNode" + i).position().top - 250, left:$("#tNode" + i).position().left - 140});
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
  
  // SECOND NODE와 THIRD NODE 연결
  for (var i = 1; i <= sNode; i++) {
    var sNodeLeft = ($("#sNode" + i).position().left + 50);
    var sNodeTop = ($("#sNode" + i).position().top + 50);
    if(sNodeArray[i-1] != null) {
      var tNodeArr = sNodeArray[i-1];
      for(var j = 0; j < tNodeArr.length; j++) {
        var tNodeLeft = $("#" + tNodeArr[j]).position().left + 35;
        var tNodeTop = $("#" + tNodeArr [j]).position().top + 35;
//        var len = Math.sqrt(Math.pow((sNodeLeft-tNodeLeft), 2) + Math.pow((sNodeTop-tNodeTop), 2));
//        if (len> 300) {
//          $("#" + tNodeArr[j]).animate({left:(sNodeLeft + (50*j)) + "px", top:(sNodeTop + 100) + "px"}, {duration: 0.0001})
//          tNodeLeft = $("#" + tNodeArr[j]).position().left + 35;
//          tNodeTop = $("#" + tNodeArr[j]).position().top + 35;
//          context.beginPath();
//          context.moveTo(sNodeLeft, sNodeTop);
//          context.bezierCurveTo(sNodeLeft, tNodeTop, tNodeLeft, tNodeTop, tNodeLeft, tNodeTop);
//          context.stroke();
//        }
        context.beginPath();
        context.moveTo(sNodeLeft, sNodeTop);
        context.bezierCurveTo(sNodeLeft, tNodeTop, tNodeLeft, tNodeTop, tNodeLeft, tNodeTop);
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
   $("#fContentForm" + formNum).html("<textarea rows='3' cols='29' id = 'fText" + formNum +"' style='color:black'>" + $("#fContent" + formNum).val() + "</textarea>")
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
   html += $("#fText" + formNum).val().replace(/\n/gi, "<br/>");
   
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
    $("#sContentForm" + formNum).html("<textarea rows='3' cols='29' id = 'sText" + formNum +"' style='color:black'>" + $("#sContent" + formNum).val() + "</textarea>")
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
    html += $("#sText" + formNum).val().replace(/\n/gi, "<br/>");
    $("#sContentForm" + formNum).html(html);
    $("#sText" + formNum).remove();
  }
}

// LINK NODE 내용 작성
function tLinkWriteForm(id) {
  var formNum = Number(id.id.replace("tLinkForm", ""));
  if($("#tText" + formNum).val() == null) {
    $("#tLinkTitle" + formNum).removeAttr("type").attr("type", "text");
    $("#tWrite" + formNum +  "> h3").remove();
    $("#tContentForm" + formNum).html("<textarea rows='3' cols='29' id = 'tText" + formNum +"' style='color:black'>" + $("#tLinkContent" + formNum).val() + "</textarea>")
    $("#tLinkUrl" + formNum).removeAttr("type").attr("type", "text");
  }else {
    if($("#tLinkTitle" + formNum).val() == "") {
      alert("SECOND의 제목을 입력해 주세요.")
      $("#tLinkTitle" + formNum).focus();
      return;
    }
    
    if($("#tText" + formNum).val() == "") {
      alert("SECOND의 내용을 입력해 주세요.")
      $("#tText" + formNum).focus();
      return;
    }
    
    if($("#tLinkUrl" + formNum).val() == "") {
      alert("LINK URL을 입력해 주세요.")
      $("#tLinkUrl" + formNum).focus();
      return;
    }
    
    var html = "";
    $("#tWrite" + formNum).append("<h3>" + $("#tLinkTitle" + formNum).val() + "</h3>");
    $("#tLinkTitle" + formNum).removeAttr("type").attr("type", "hidden");
    $("#tLinkUrl" + formNum).removeAttr("type").attr("type", "hidden");
    $("#tUrl" + formNum).attr("href", $("#tLinkUrl" + formNum).val());
    html += "<input type = 'hidden' id = 'tLinkContent" + formNum +"' value = '" + $("#tText" + formNum).val() + "' />";
    html += $("#tText" + formNum).val().replace(/\n/gi, "<br/>");
    $("#tContentForm" + formNum).html(html);
    $("#tText" + formNum).remove();
  }
}

// ASSINGMENT NODE 내용 작성
function tAsmtWriteForm(id) {
  var formNum = Number(id.id.replace("tAsmtBtnForm", ""));
  if($("#tText" + formNum).val() == null) {
    $("#tAsmtTitle" + formNum).removeAttr("type").attr("type", "text");
    $("#tWrite" + formNum +  "> h3").remove();
    $("#tContentForm" + formNum).html("<textarea rows='3' cols='29' id = 'tText" + formNum +"' style='color:black'>" + $("#tAsmtContent" + formNum).val() + "</textarea>")
  }else {
    if($("#tAsmtTitle" + formNum).val() == "") {
      alert("SECOND의 제목을 입력해 주세요.")
      $("#tAsmtTitle" + formNum).focus();
      return;
    }
    
    if($("#tText" + formNum).val() == "") {
      alert("SECOND의 내용을 입력해 주세요.")
      $("#tText" + formNum).focus();
      return;
    }
    
    var html = "";
    $("#tWrite" + formNum).append("<h3>" + $("#tAsmtTitle" + formNum).val() + "</h3>");
    $("#tAsmtTitle" + formNum).removeAttr("type").attr("type", "hidden");
    html += "<input type = 'hidden' id = 'tAsmtContent" + formNum +"' value = '" + $("#tText" + formNum).val() + "' />";
    html += $("#tText" + formNum).val().replace(/\n/gi, "<br/>");
    $("#tContentForm" + formNum).html(html);
    $("#tText" + formNum).remove();
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
    $("#addLinkS" + i).css("left", $("#sNode" + i).position().left + 20)
    $("#addLinkS" + i).css("top", $("#sNode" + i).position().top + 20)
    
    $("#addSubjectS" + i).css("left", $("#sNode" + i).position().left + 20)
    $("#addSubjectS" + i).css("top", $("#sNode" + i).position().top + 20)
    
    $("#nodeRemoveS" + i).css("left", $("#sNode" + i).position().left + 20)
    $("#nodeRemoveS" + i).css("top", $("#sNode" + i).position().top + 20)
  }
  sMenu = true;
}

// THIRD NODE MENU OFF
function tMenuOut() {
  for(var i = 1; i <= tNode; i++) {
    $("#mTNodeRemove" + i).css("left", $("#tNode" + i).position().left + 10)
    $("#mTNodeRemove" + i).css("top", $("#tNode" + i).position().top + 10)
  }
  tMenu = true;
}

// sNode 정렬
function sNodeSort() {
  var sNum = 1;
  for (var i = 0; i < fNodeArray.length; i++) {
    var sNodeArrTemp = fNodeArray[i];
    for (var j = 0; j < sNodeArrTemp.length; j++) {
      var sNodeIdTemp = sNodeArrTemp[j];
      var sNumTemp = Number(sNodeIdTemp.replace("sNode",""))
      $("#" + sNodeIdTemp).attr("id", "sNode" + sNum);
      $("#addLinkS" + sNumTemp).attr("id", "addLinkS" + sNum);
      $("#addSubjectS" + sNumTemp).attr("id", "addSubjectS" + sNum);
      $("#nodeRemoveS" + sNumTemp).attr("id", "nodeRemoveS" + sNum);
      $("div[id='sDiv" + sNumTemp + "']").attr("id", "sDiv" + sNum);
      $("a[id='sDiv" + sNumTemp + "']").attr("id", "sDiv" + sNum);
      $("#sWrite" + sNumTemp).attr("id", "sWrite" + sNum);
      $("#sNodeForm" + sNumTemp).attr("id", "sNodeForm" + sNum);
      $("#sTitle" + sNumTemp).attr("id", "sTitle" + sNum);
      $("#sContentForm" + sNumTemp).attr("id", "sContentForm" + sNum);
      $("#sContent" + sNumTemp).attr("id", "sContent" + sNum);
//      alert(sNodeIdTemp);
//      alert(sNum + "번 정렬");
      sNodeArrTemp[j] = "sNode" + sNum;
      sNum++;
    }
  }
}

// tNode 정렬
function tNodeSort() {
  var tNum = 1;
  for (var i = 0; i < sNodeArray.length; i ++) {
    var tNodeArrTemp = sNodeArray[i];
    for(var j = 0; j < tNodeArrTemp.length; j++) {
      var tNodeIdTemp = tNodeArrTemp[j];
      var tNodeNumTemp = Number(tNodeIdTemp.replace("tNode", ""));
      $("#mTNodeRemove" + tNodeNumTemp).attr("id", "mTNodeRemove" + tNum);
      $("div[id='tDiv" + tNodeNumTemp + "']").attr("id", "tDiv" + tNum);
      $("a[id='tDiv" + tNodeNumTemp + "']").attr("id", "tDiv" + tNum);
      $("#tWrite" + tNodeNumTemp).attr("id", "tWrite" + tNum);
      $("#tContentForm" + tNodeNumTemp).attr("id", "tContentForm" + tNum);
      if($("#tLinkTitle" + tNodeNumTemp).val() != null) {
        $("#tLinkForm" + tNodeNumTemp).attr("id", "tLinkForm" + tNum);
        $("#tLinkTitle" + tNodeNumTemp).attr("id", "tLinkTitle" + tNum);
        $("#tLinkContent" + tNodeNumTemp).attr("id", "tLinkContent" + tNum);
        $("#tLinkUrlForm" + tNodeNumTemp).attr("id", "tLinkUrlForm" + tNum);
        $("a[id='tUrl" + tNodeNumTemp + "']").attr("id", "tUrl" + tNum);
        $("#tLinkUrl" + tNodeNumTemp).attr("id", "tLinkUrl" + tNum);
      } else {
        $("#tAsmtBtnForm" + tNodeNumTemp).attr("id", "tAsmtBtnForm" + tNum);
        $("#tAsmtForm" + tNodeNumTemp).attr("id", "tAsmtForm" + tNum);
        $("#tAsmtTitle" + tNodeNumTemp).attr("id", "tAsmtTitle" + tNum);
        $("#tAsmtContent" + tNodeNumTemp).attr("id", "tAsmtContent" + tNum);
        $("#tAsmtFile" + tNodeNumTemp).attr("id", "tAsmtFile" + tNum);
      }

      
      $("#" + tNodeIdTemp).removeAttr("id").attr("id", "tNode" + tNum);
      tNodeArrTemp[j] = "tNode" + tNum;
      tNum++;
    }
  }
}

// 저장할 데이터 추출
function upload() {
  // FNODE DATA
  var html = "";
  for (var i = 0; i < fNodeArray.length; i++) {
    var fNodeNum = i + 1;
    html += "<input type='hidden' name = 'fName" + fNodeNum + "' value ='fNode" + fNodeNum  + "' />";
    html += "<input type='hidden' name = 'fX" + fNodeNum + "' value ='" + $("#fNode" + fNodeNum).position().left + "' />";
    html += "<input type='hidden' name = 'fY" + fNodeNum + "' value ='" + $("#fNode" + fNodeNum).position().top + "' />";
    html += "<input type='hidden' name = 'fTitle" + fNodeNum + "' value ='" + $("#fTitle" + fNodeNum).val() + "' />";
    html += "<input type='hidden' name = 'fContent" + fNodeNum + "' value ='" + $("#fContent" + fNodeNum).val() + "' />";
  }
  
  // SECOND DATA
  for (var i = 0; i < fNodeArray.length; i++) {
    var sNodeArrTemp = fNodeArray[i];
    for (var j = 0; j < sNodeArrTemp.length; j++) {
      var sNodeNum = Number(sNodeArrTemp[j].replace("sNode", ""));
      var fName = "fNode" + (i + 1);
      html += "<input type='hidden' name = 'sPname" + sNodeNum + "' value = '" + fName + "' />";
      html += "<input type='hidden' name  = 'sName" + sNodeNum + "' value ='sNode" + sNodeNum + "' />";
      html += "<input type='hidden' name = 'sX" + sNodeNum + "' value ='" + $("#sNode" + sNodeNum).position().left + "' />";
      html += "<input type='hidden' name = 'sY" + sNodeNum + "' value ='" + $("#sNode" + sNodeNum).position().top + "' />";
      html += "<input type='hidden' name = 'sTitle" + sNodeNum + "' value ='" + $("#sTitle" + sNodeNum).val() + "' />";
      html += "<input type='hidden' name = 'sContent" + sNodeNum + "' value ='" + $("#sContent" + sNodeNum).val() + "' />";
    }
  }
  
  // THIRD DATA
  for (var i = 0; i < sNodeArray.length; i++) {
    var tNodeArrTemp = sNodeArray[i];
    for (var j = 0; j < tNodeArrTemp.length; j++) {
      var tNodeNum = Number(tNodeArrTemp[j].replace("tNode", ""));
      var sName = "sNode" + (i + 1);
      html += "<input type='hidden' name = 'tPname" + tNodeNum + "' value = '" + sName + "' />";
      html += "<input type='hidden' name = 'tName" + tNodeNum + "' value ='tNode" + tNodeNum + "' />";
      html += "<input type='hidden' name = 'tX" + tNodeNum + "' value ='" + $("#tNode" + tNodeNum).position().left + "' />";
      html += "<input type='hidden' name = 'tY" + tNodeNum + "' value ='" + $("#tNode" + tNodeNum).position().top + "' />";
      if($("#tLinkTitle" + tNodeNum).val() != null) {
        html += "<input type='hidden' name = 'tLinkTitle" + tNodeNum + "' value ='" + $("#tLinkTitle" + tNodeNum).val() + "' />"
        html += "<input type='hidden' name = 'tLinkContent" + tNodeNum + "' value ='" + $("#tLinkContent" + tNodeNum).val() + "' />"
        html += "<input type='hidden' name = 'tLinkURL" + tNodeNum + "' value ='" + $("#tLinkURL" + tNodeNum).val() + "' />"
      } else {
        html += "<input type='hidden' name = 'tAsmtTitle" + tNodeNum + "' value ='" + $("#tAsmtTitle" + tNodeNum).val() + "' />"
        html += "<input type='hidden' name = 'tAsmtContent" + tNodeNum + "' value ='" + $("#tAsmtContent" + tNodeNum).val() + "' />"
      }
    }
  }
  
  // INDEX DATA
  html += "<input type='hidden' name = 'fNodeIndex' value = "+ fNode +" />";
  html += "<input type='hidden' name = 'sNodeIndex' value = "+ sNode +" />";
  html += "<input type='hidden' name = 'tNodeIndex' value = "+ tNode +" />";
  
  //// 수정이부분
  // 전체 배열 길기
  html += "<input type='hidden' name='lessonIndex' value='" + lessonArray.length + "'/>";
  html += "<input type='hidden' name='itemIndex' value='" + itemsArray.length + "'/>";
  html += "<input type='hidden' name='lessonitemCountIndex' value='" + liCount.length + "'/>";
  
  // V_INDEX DATA
  for(var i = 0; i < liCount.length; i++) {
//    html += "<input type='hidden' name='liCountSNum" + liCount[i].s_num + "' value='" + liCount[i].s_num + "' />";
    console.log("totalCount");
    console.log("s_num" + liCount[i].s_num);
    console.log("lession" + liCount[i].totalLCount);
    console.log("item" + liCount[i].totalICount);
    html += "<input type='hidden' name='totalLCount" + liCount[i].s_num + "' value='" + liCount[i].totalLCount + "'/>"
    html += "<input type='hidden' name='totalICount" + liCount[i].s_num + "' value='" + liCount[i].totalICount + "'/>"
  }
  // LESSON DATA
  for(var i = 0; i < lessonArray.length; i++) {
    console.log("lesson-sNum" + lessonArray[i].s_num);
    console.log("lesson-count" + lessonArray[i].l_count);
    html += "<input type='hidden' name = 'lesson-sNum" + lessonArray[i].l_count + "' value='" + lessonArray[i].s_num + "' />";
//    html += "<input type='hidden' name = 'lesson-lCount" + lessonArray[i].l_count + "' value='" + lessonArray[i].l_count + "' />";
    html += "<input type='hidden' name = 'lesson-lPlayTime" + lessonArray[i].l_count + "' value='" + lessonArray[i].l_playTime + "' />";
    html += "<input type='hidden' name = 'lesson-lText" + lessonArray[i].l_count + "' value='" + lessonArray[i].l_text + "' />";
    html += "<input type='hidden' name = 'lesson-lLeft" + lessonArray[i].l_count + "' value='" + lessonArray[i].l_left + "' />";
    html += "<input type='hidden' name = 'lesson-lTop" + lessonArray[i].l_count + "' value='" + lessonArray[i].l_top + "' />";
    html += "<input type='hidden' name = 'lesson-lColor" + lessonArray[i].l_count + "' value='" + lessonArray[i].l_color + "' />";
    html += "<input type='hidden' name = 'lesson-lSTime" + lessonArray[i].l_count + "' value='" + lessonArray[i].l_sTime + "' />";
  }
  
  // ITEM DATA
  for(var i = 0; i < itemsArray.length; i++) {
    console.log("item-sNum" + itemsArray[i].s_num);
    console.log("item-count" + itemsArray[i].i_count);
    html += "<input type='hidden' name = 'item-sNum" + itemsArray[i].i_count + "' value='" + itemsArray[i].s_num + "' />";
//    html += "<input type='hidden' name = 'item-iCount" + itemsArray[i].i_count + "' value='" + itemsArray[i].i_count + "' />";
    html += "<input type='hidden' name = 'item-iTitle" + itemsArray[i].i_count + "' value='" + itemsArray[i].i_title + "' />";
    html += "<input type='hidden' name = 'item-iContent" + itemsArray[i].i_count + "' value='" + itemsArray[i].i_content + "' />";
    html += "<input type='hidden' name = 'item-iPrice" + itemsArray[i].i_count + "' value='" + itemsArray[i].i_price + "' />";
    html += "<input type='hidden' name = 'item-iNumber" + itemsArray[i].i_count + "' value='" + itemsArray[i].i_number + "' />";
  }
  ////
  
  
  
  $("#dataDiv").html(html);
  return true;
}

function selectASMT(num) {
  var fileName = $("#tAsmtFile" + num).val();
  $("#tAsmtName" + num).text(fileName.replace("C:\\fakepath\\", ""));
  $("#asmtDIV" + num).addClass("active");
}

function selectExcel() {
  var fileName = $("#excelFile").val();
  $("#excelName").text(fileName.replace("C:\\fakepath\\", ""));
  $("#excelinput").addClass("active");
  
  var formData = new FormData();
  formData.append("excelFile", $("input[name='excelFile']")[0].files[0]);
  
  $.ajax({
    url:"excelUpload.json",
    data:formData,
    processData:false,
    contentType:false,
    type:'POST',
    success:function(data, status) {
      drawExcel(data);
    }
  })
}

function drawExcel(data) {
  var fList = data.fList;
  var sList = data.sList;
  var tList = data.tList;
  var tLink = data.tLink;
  
  $(".menu").remove();
  $("div[id^='fNode']").remove();
  $("div[id^='sNode']").remove();
  $("div[id^='tNode']").remove();
  $("div[id^='fDiv").remove();
  $("div[id^='sDiv").remove();
  $("div[id^='tDiv").remove();
  
  fNode = 0;
  sNode = 0;
  tNode = 0;
  
  fNodeArray.splice(0, fNodeArray.length);
  sNodeArray.splice(0, sNodeArray.length);
  
  for (var i = 0; i < fList.length; i++) {
    var html = "";
    html += "<div class = 'fNode' id = 'fNode" + ++fNode + "' >STEP" + fNode + "</div>";
    html += "<div class = 'menu' id = 'addFNode" + fNode + "' >+</div>";
    html += "<div class = 'menu' id = 'addSNode" + fNode + "' >+</div>";
    html += "<div class = 'menu' id = 'remove" + fNode + "' >-</div>";
    html += "<div class='bookmark-box' id = 'fDiv" + fNode + "' >";
    html += "<a class='boxclose' id='fDiv" + fNode + "' onclick='closeDiv(this)'></a>";
    html += "<div class='bookmark-title' id = 'fWrite" + fNode + "' >";
    html += "<input type = 'button' onclick='fNodeWriteForm(this)' id = 'fNodeForm" + fNode + "' style='float: right;'/>";
    html += "<input type = 'hidden' id = 'fTitle" + fNode + "' value = '" + fList[i].fTItle + "' style='color:black;' />";
    html += "<h3>" + fList[i].fTItle + "</h3>";
    html += "</div>";
    html += "<div class='description' id = 'fContentForm" + fNode + "' >";
    html += "  <input type = 'hidden' id = 'fContent" + fNode + "' value = 'Step Content'/>Step Content";
    html += "</div>";
    html += "</div>";
    
    $(".mView").append(html);
    $("#fNode" + fNode).draggable();
    
    $("#fNode" + fNode).css("left", fList[i].fX + 'px');
    $("#fNode" + fNode).css("top", fList[i].fY + 'px');
    
    $("#addFNode" + fNode).css("left", $("#fNode" + fNode).position().left + 30);
    $("#addFNode" + fNode).css("top", $("#fNode" + fNode).position().top + 30);
    $("#addSNode" + fNode).css("left", $("#fNode" + fNode).position().left + 30);
    $("#addSNode" + fNode).css("top", $("#fNode" + fNode).position().top + 30);
    $("#remove" + fNode).css("left", $("#fNode" + fNode).position().left + 30);
    $("#remove" + fNode).css("top", $("#fNode" + fNode).position().top + 30);
    $("#fDiv" + fNode).css("left", $("#fNode" + fNode).position().left - 115);
    $("#fDiv" + fNode).css("top", $("#fNode" + fNode).position().top - 200);
    var fNodeAdd = [];
    fNodeArray.push(fNodeAdd);

    if(i != fNodeArray.length) {
      $("#addFNode" + fNode).remove();
    }
  }
  
  for (var i = 0; i < sList.length; i++) {
    var fNodeNum = Number(sList[i].fName.replace("fNode", "")) - 1;
    var html = "";
    html += "<div class = 'sNode' id = 'sNode" + ++sNode + "' >VIDEO " + sNode + "</div>";
    html += "<div class = 'menu' id = 'addLinkS" + sNode + "' >+</div>";
    html += "<div class = 'menu' id = 'addSubjectS" + sNode + "' >+</div>";
    html += "<div class = 'menu' id = 'nodeRemoveS" + sNode + "' >-</div>";
    html += "<div class='bookmark-box' id = 'sDiv" + sNode + "' >";
    html += "<a class='boxclose' id='sDiv" + sNode + "' onclick='closeDiv(this)'></a>";
    html += "<div class='bookmark-title' id = 'sWrite" + sNode + "' >";
    html += "<input type = 'button' onclick='sNodeWriteForm(this)' id = 'sNodeForm" + sNode + "' style='float: right;'/>";
    html += "<input type = 'hidden' id = 'sTitle" + sNode + "' value = '" + sList[i].sTitle + "' style='color:black;' />";
    html += "<h3>SECOND TITLE</h3>";
    html += "</div>";
    html += "<div class='description' id = 'sContentForm" + sNode + "'>";
    html += "<input type = 'hidden' id = 'sContent" + sNode + "' value = 'Second Content'/>Second Content";
    html += "</div>";
//      html += "<a style = 'color: white;'>동영상 추가</a>";
    
    //수정이 시작 부분
    html += "<div class='file-upload'>" +
    "<div class='file-select'>" +
    "<div class='file-select-button' id='fileName" + sNode + "'>Choose File</div>" +
    "<div class='file-select-name' id='noFile" + sNode + "'>No file chosen...</div>" +
    "<input id='chooseFile" + sNode + "' type='file' name='chooseFile" + sNode + "' onchange=playSelectedFile("+sNode+")>" +
    "</div>" +
    "</div>";
    //수정이 끝부분
    
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
  }

  for (var i = 0; i < tLink.length; i++) {
    var sNodeNum = Number(tList[i].sName.replace("sNode", "")) - 1;
    var html = "";
    
    html += "<div class = 'tNode' id = 'tNode" + ++tNode + "' >LINK</div>";
    html += "<div class = 'menu' id = 'mTNodeRemove" + tNode + "' >-</div>";
    html += "<div class='bookmark-box' id = 'tDiv" + tNode + "' >";
    html += "<a class='boxclose' id='tDiv" + tNode + "' onclick='closeDiv(this)'></a>";
    html += "<div class='bookmark-title' id = 'tWrite" + tNode + "' >";
    html += "<input type = 'button' onclick='tLinkWriteForm(this)' id = 'tLinkForm" + tNode + "' style='float: right;'/>";
    html += "<input type = 'hidden' id = 'tLinkTitle" + tNode + "' value = '" + tLink[i].linkTitle + "' style='color:black;' />";
    html += "<h3>" + tLink[i].linkTitle + "</h3>";
    html += "</div>";
    html += "<div class='description' id = 'tContentForm" + tNode + "'>";
    html += "<input type = 'hidden' id = 'tLinkContent" + tNode + "' value = 'Third Content'/>Third Content";
    html += "</div>";
    html += "<div id = 'tLinkUrlForm" + tNode + "' >";
    html += "<a id = 'tUrl" + tNode + "' target = '_blank' href = '" + tLink[i].lUrl + "' style = 'color: white;'>링크</a>";
    html += "<input type = 'hidden' id = 'tLinkUrl" + tNode + "' name = 'tLinkUrl" + tNode + "' value = '" + tLink[i].lUrl + "' style='color:black; width:100%;' />";
    html += "</div>";
    html += "</div>";

    $(".mView").append(html);
    $("#tNode" + tNode).draggable();

    $("#tNode" + tNode).css("left", $("#sNode" + (sNodeNum + 1)).position().left + 30);
    $("#tNode" + tNode).css("top", $("#sNode" + (sNodeNum + 1)).position().top + 30);
    $("#mTNodeRemove" + tNode).css("left", $("#tNode" + tNode).position().left + 10);
    $("#mTNodeRemove" + tNode).css("top", $("#tNode" + tNode).position().top + 10);
    $("#tDiv" + tNode).css("left", $("#tNode" + tNode).position().left - 140);
    $("#tDiv" + tNode).css("top", $("#tNode" + tNode).position().top - 200);
    sNodeArray[sNodeNum].push("tNode" + tNode);
  }
  drawLine();  
}

//전체 drag 이벤트
var fNodePreX = [];
var fNodePreY = [];
var sNodePreX = [];
var sNodePreY = [];
var tNodePreX = [];
var tNodePreY = [];
$(document).on("mousedown",".myCanvas", function () {
  x = event.clientX;
  y = event.clientY;
  fNodePreX.splice(0, fNodePreX.length)
  fNodePreY.splice(0, fNodePreY.length)
  sNodePreX.splice(0, sNodePreX.length)
  sNodePreY.splice(0, sNodePreY.length)
  tNodePreX.splice(0, tNodePreX.length)
  tNodePreY.splice(0, tNodePreY.length)
  for (var i = 1; i <= fNode; i++) {
    fNodePreX.push($("#fNode" + i).position().left);
    fNodePreY.push($("#fNode" + i).position().top);
  }
  for (var i = 1; i <= sNode; i++) {
    sNodePreX.push($("#sNode" + i).position().left);
    sNodePreY.push($("#sNode" + i).position().top);
  }
  for (var i = 1; i <= tNode; i++) {
    tNodePreX.push($("#tNode" + i).position().left);
    tNodePreY.push($("#tNode" + i).position().top);
  }
  $(".myCanvas").addClass("move");
  allDrag = true;
})

$(document).on("mousemove", ".myCanvas", function() {
  if(allDrag) {
    $(".menu").css("display", "none");
    for (var i = 1; i <= fNode; i++) {
      $("#fNode" + i).css("left", fNodePreX[i-1] - (x-event.clientX) / 3);
      $("#fNode" + i).css("top", fNodePreY[i-1] - (y-event.clientY) / 3);
      fMenuOut();
    }
    for (var i = 1; i <= sNode; i++) {
      $("#sNode" + i).css("left", sNodePreX[i-1] - (x-event.clientX) / 3);
      $("#sNode" + i).css("top", sNodePreY[i-1] - (y-event.clientY) / 3);
      divSet();
      sMenuOut();
    }
    for (var i = 1; i <= tNode; i++) {
      $("#tNode" + i).css("left", tNodePreX[i-1] - (x-event.clientX) / 3);
      $("#tNode" + i).css("top", tNodePreY[i-1] - (y-event.clientY) / 3);
      divSet();
      tMenuOut();
    }
    divSet();
    drawLine();
  }
}) 

$(document).on("mouseup", ".myCanvas", function () {
  $(".myCanvas").removeClass("move");
  allDrag = false;;
})

function confirm () {
  $("#registBtn").css("display", "block");
  return false;
}

$(document).on("click", "#registCancle", function () {
  $("#registBtn").css("display", "none");
})

$(document).on("click", "#registEnter", function () {
  $("#registBtn").css("display", "none");
  var form = document.getElementById("mapForm");
  upload();
  form.submit();
})

