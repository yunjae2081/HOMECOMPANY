/* CANVAS 변수 */
var canvas;
var context;

/* FIRST NODE 변수 */
var fNode = 0;
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


$(document).ready(function () {

  $(".menu").css("background-color", "#F1F1F1");
})

$(document).on("click" ,".normal",function(e) {
  e.preventDefault();
  var scrTop = $(window).scrollTop();
  $(".backDrop").animate({"opacity":"0.7"}, 500);
  $(".box").animate({"opacity":"1.0"}, 500);
  var top = 150;
  var width = $("body").width();
  $(".box").css({"top":top+scrTop});
  $(".backDrop").css({"top": scrTop});
  
  $("body, html").css({"overflow-y":"hidden"});
  $(".backDrop, .box").css({"display":"block"});
  
});

$(document).on("click" ,".normal",function(e) {
  var lNo = this.id;
  $.ajax({
    url: "mindMap.json",
    type: "POST",
    datatype: "JSON",
    data: {lNo:lNo},
    success: function(data, status) {
      mindMapView(data);
    }
  })
})

$(document).on("click", ".backDrop, .close", function() {
  closeBox();
});

function closeBox () {
  $(".backDrop, .box").animate({"opacity":"0"}, 500, function () {
    $(".backDrop, .box").css({"display":"none"});
    $("body, html").css({"overflow-y":"auto"});
  });
}

function mindMapView(data) {
  /* DATA 변수 */
  var lVO = data.lVO;
  var fList = data.fList;
  var sList = data.sList;
  var tList = data.tList;
  var tLink = data.tLink;
  var tFile = data.tFile;
  var html = "";
  
  fNode = 0;
  sNode = 0;
  tNode = 0;
  fNodeArray.splice(0, fNodeArray.length);
  sNodeArray.splice(0, sNodeArray.length);
  $(".box").html("<div class = 'mView'></div>");
  $(".mView").css("border", "0px");
  $(".mView").css("overflow", "visible");
  $(".mView").css("float", "left");
  $(".mView").css("background-color", "white");
  $(".mView").html("<canvas class = 'myCanvas' id = 'myCanvas' width='1200' height='600'></canvas>");
  html += "<div class = 'contentDiv'>"
  html += "<div class = 'title-out' ><h1>" + lVO.lTitle + "</h1></div>";
  html += "<img class='close' src='/haeyum/images/close.jpg' />";
  html += "<hr id = 'hr1'/>";
  html += "<hr id = 'hr2'/>";
  html += "<h2>" + lVO.lContent + "</h2>";
  html += "<div class = 'linkBtn'>MOVE !</div>";
  html += "</div>";
  $(".box").append(html);
  $(".mView").css("margin", "0px");
  
  canvas = document.getElementById("myCanvas");
  context = canvas.getContext("2d");
  
  for (var i = 0; i < fList.length; i++) {
    var html = "";
    html += "<div class = 'fNode' id = '" + fList[i].fName + "' ></div>";
    html += "<div class='bookmark-box' id = 'fDiv" + ++fNode + "' >";
    html += "<a class='boxclose' id='fDiv" + fNode + "' onclick='closeDiv(this)'></a>";
    html += "<div class='bookmark-title' id = 'fWrite" + fNode + "' >";
    html += "<h3>" + fList[i].fTitle + "</h3>";
    html += "</div>";
    html += "<div class='description' id = 'fContentForm" + fNode + "' >";
    html += "  <input type = 'hidden' id = 'fContent" + fNode + "' value = ''/>" + fList[i].fContent;
    html += "</div>";
    html += "</div>";
    
    $(".mView").append(html);
    $("#fNode" + fNode).css("left", fList[i].fX + 'px')
    $("#fNode" + fNode).css("top", fList[i].fY + 'px')
    $("#fNode" + fNode).html("STEP" + fNode);
    $("#fDiv" + fNode).css("left", $("#fNode" + fNode).position().left - 115);
    $("#fDiv" + fNode).css("top", $("#fNode" + fNode).position().top - 200);

    var fNodeAdd = [];
    fNodeArray.push(fNodeAdd);
  }
  
  for (var i = 0; i < sList.length; i++) {
    var fNodeNameTemp = sList[i].fName;
    var fNodeNum = Number(fNodeNameTemp.replace("fNode",""));
    var html = "";
    html += "<div class = 'sNode' id = 'sNode" + ++sNode + "' ></div>";
    html += "<div class='bookmark-box' id = 'sDiv" + sNode + "' >";
    html += "<a class='boxclose' id='sDiv" + sNode + "' onclick='closeDiv(this)'></a>";
    html += "<div class='bookmark-title' id = 'sWrite" + sNode + "' >";
    html += "<input type = 'hidden' id = 'sTitle" + sNode + "' value = 'SECOND TITLE' style='color:black;' />";
    html += "<h3>" + sList[i].sTitle + "</h3>";
    html += "</div>";
    html += "<div class='description' id = 'sContentForm" + sNode + "'>";
    html += "<input type = 'hidden' id = 'sContent" + sNode + "' value = 'Second Content'/>" + sList[i].sContent;
    html += "</div>";
    html += "</div>";
    
    $(".mView").append(html);
    
    $("#sNode" + sNode).css("left", sList[i].sX + 'px');
    $("#sNode" + sNode).css("top", sList[i].sY + 'px');
    
    $("#sDiv" + sNode).css("left", $("#sNode" + sNode).position().left - 125);
    $("#sDiv" + sNode).css("top", $("#sNode" + sNode).position().top - 200);
    
    fNodeArray[fNodeNum-1].push("sNode" + sNode);
    var sNodeAdd = [];
    sNodeArray.push(sNodeAdd);
  }
  
  for (var i = 0; i < tList.length; i++) {
    var html = "";
    var sNodeNum = Number(tList[i].sName.replace("sNode",""));
    html += "<div class = 'tNode' id = '" + tList[i].tName + "' ></div>";
    
    sNodeArray[sNodeNum-1].push(tList[i].tName);
    tNode++;
    $(".mView").append(html);
    
    $("#" + tList[i].tName).css("left", tList[i].tX + 'px');
    $("#" + tList[i].tName).css("top", tList[i].tY + 'px');
  }
  
  for (var i = 0; i < tLink.length; i++) {
    var html = "";
    var tNodeNum = Number(tLink[i].tName.replace("tNode", ""));
    html += "<div class='bookmark-box' id = 'tDiv" + tNodeNum + "' >";
    html += "<a class='boxclose' id='tDiv" + tNodeNum + "' onclick='closeDiv(this)'></a>";
    html += "<div class='bookmark-title' id = 'tWrite" + tNodeNum + "' >";
    html += "<input type = 'hidden' id = 'tLinkTitle" + tNodeNum + "' value = 'THIRD TITLE' style='color:black;' />";
    html += "<h3>" + tLink[i].linkTitle + "</h3>";
    html += "</div>";
    html += "<div class='description' id = 'tContentForm" + tNodeNum + "'>";
    html += "<input type = 'hidden' id = 'tLinkContent" + tNodeNum + "' value = 'Third Content'/>" + tLink[i].linkContent;
    html += "</div>";
    html += "<div id = 'tLinkUrlForm" + tNodeNum + "' >";
    html += "<a href = '" + tLink[i].lUrl + "' id = 'tUrl" + tNodeNum + "' style = 'color: white;'>링크</a>";
    html += "<input type = 'hidden' id = 'tLinkUrl" + tNodeNum + "' name = 'tLinkUrl" + tNodeNum + "' style='color:black; width:100%;' />";
    html += "</div>";
    html += "</div>";
    
    $(".mView").append(html);
    
    $("#tDiv" + tNodeNum).css("left", $("#tNode" + tNodeNum).position().left -140);
    $("#tDiv" + tNodeNum).css("top", $("#tNode" + tNodeNum).position().top - 200);
    $("#tNode" + tNodeNum).html("LINK")
  }
  
  for (var i = 0; i < tFile.length; i++) {
    var html = "";
    var tNodeNum = Number(tFile[i].tName.replace("tNode", ""));
    html += "<div class='bookmark-box' id = 'tDiv" + tNodeNum + "' >";
    html += "<a class='boxclose' id='tDiv" + tNodeNum + "' onclick='closeDiv(this)'></a>";
    html += "<div class='bookmark-title' id = 'tWrite" + tNodeNum + "' >";
    html += "<input type = 'hidden' id = 'tAsmtTitle" + tNodeNum + "' value = 'THIRD TITLE' style='color:black;' />";
    html += "<h3>" + tFile[i].aTitle + "</h3>";
    html += "</div>";
    html += "<div class='description' id = 'tContentForm" + tNodeNum + "'>";
    html += "<input type = 'hidden' id = 'tAsmtContent" + tNodeNum + "' value = 'Third Content'/>" + tFile[i].aContent;
    html += "</div>";
    html += "<div id = 'tAsmtForm" + tNodeNum + "' >";
    html += "<a href = '${pageContext.request.contextPath}/fileDownload?orgFileName=" + tFile[i].orgFileName + "&realFileName=" + tFile[i].realFileName + "' >" + tFile[i].orgFileName + "<a/>";
    html += "</div>";
    html += "</div>";

    $(".mView").append(html);
    
    $("#tDiv" + tNodeNum).css("left", $("#tNode" + tNodeNum).position().left -140);
    $("#tDiv" + tNodeNum).css("top", $("#tNode" + tNodeNum).position().top - 200);
    $("#tNode" + tNodeNum).html("ASMT")
  }
  
  
  
  drawLine();
}

//LINE 그리기
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


//FIRST NODE CLICK 이벤트
$(document).on("mouseenter", "div[id^='fNode']", function () {
  divSet();
  fNodeId = this.id;
  var menuNum = Number(fNodeId.replace("fNode", ""));
  $("#fDiv" + menuNum).css("display", "inline-table")
})

$(document).on("mouseout", "div[id^='fNode']", function () {
  fNodeId = this.id;
  var menuNum = Number(fNodeId.replace("fNode", ""));
  $("#fDiv" + menuNum).css("display", "none");
})

//SECOND NODE CLICK 이벤트
$(document).on("mouseenter", "div[id^='sNode']", function () {
  divSet();
  sNodeId = this.id;
  var menuNum = Number(sNodeId.replace("sNode", ""));
   $("#sDiv" + menuNum).css("display", "inline-table")
})

$(document).on("mouseout", "div[id^='sNode']", function () {
  sNodeId = this.id;
  var menuNum = Number(sNodeId.replace("sNode", ""));
  $("#sDiv" + menuNum).css("display", "none");
})

//THIRD NODE CLICK 이벤트
$(document).on("mouseenter", "div[id^='tNode']", function () {
  divSet();
  tNodeId = this.id;
  var menuNum = Number(tNodeId.replace("tNode", ""));
  $("#tDiv" + menuNum).css("display", "inline-table")
})

$(document).on("mouseout", "div[id^='tNode']", function () {
  tNodeId = this.id;
  var menuNum = Number(tNodeId.replace("tNode", ""));
  $("#tDiv" + menuNum).css("display", "none");
})

//NODE DIV OFF & 위치 조정
function divSet() {
  for (var i = 1; i <= fNode; i++) {
    $("#fDiv" + i ).css("display", "none");
    $("#fDiv" + i).css({top:$("#fNode" + i).position().top - 200, left:$("#fNode" + i).position().left - 115});
  }
  
  for (var i = 1; i <= sNode; i ++) {
    $("#sDiv" + i ).css("display", "none");
    $("#sDiv" + i).css({top:$("#sNode" + i).position().top - 200, left:$("#sNode" + i).position().left - 125});
  };
  
  for (var i = 1; i <= tNode; i ++) {
    $("#tDiv" + i ).css("display", "none");
    $("#tDiv" + i).css({top:$("#tNode" + i).position().top - 200, left:$("#tNode" + i).position().left - 140});
  };
  
}

//NODE DIV 닫기
function closeDiv(id) {
  divId = id.id;
  $("#" + divId).css("display", "none");
  fMenu = true;
}


//전체 drag 이벤트
var fNodePreX = [];
var fNodePreY = [];
var sNodePreX = [];
var sNodePreY = [];
var tNodePreX = [];
var tNodePreY = [];
var allDrag = false;
$(document).on("mousedown",".myCanvas", function () {
  x = event.clientX;
  y = event.clientY;
  fNodePreX.splice(0, fNodePreX.length);
  fNodePreY.splice(0, fNodePreY.length);
  sNodePreX.splice(0, sNodePreX.length);
  sNodePreY.splice(0, sNodePreY.length);
  tNodePreX.splice(0, tNodePreX.length);
  tNodePreY.splice(0, tNodePreY.length);
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
  allDrag = true;
})

$(document).on("mousemove", ".myCanvas", function() {
  if(allDrag) {
    for (var i = 1; i <= fNode; i++) {
      $("#fNode" + i).css("left", fNodePreX[i-1] - (x-event.clientX) / 2);
      $("#fNode" + i).css("top", fNodePreY[i-1] - (y-event.clientY) / 2);
    }
    for (var i = 1; i <= sNode; i++) {
      $("#sNode" + i).css("left", sNodePreX[i-1] - (x-event.clientX) / 2);
      $("#sNode" + i).css("top", sNodePreY[i-1] - (y-event.clientY) / 2);
      divSet();
    }
    for (var i = 1; i <= tNode; i++) {
      $("#tNode" + i).css("left", tNodePreX[i-1] - (x-event.clientX) / 2);
      $("#tNode" + i).css("top", tNodePreY[i-1] - (y-event.clientY) / 2);
      divSet();
    }
    divSet();
    drawLine();
  }
})

$(document).on("mouseup", ".myCanvas", function () {
  allDrag = false;;
})

$(document).on("mouseenter", ".myCanvas", function () {
  $(".myCanvas").addClass("move");
})

$(document).on("mouseout", ".myCanvas", function () {
  $(".myCanvas").removeClass("move");
  allDrag = false;;
})
