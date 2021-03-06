<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file = "../include/common_top.jsp" %>
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/mindMap.css" />
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/divStyle.css" />
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
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
  canvas = document.getElementById("myCanvas");
  context = canvas.getContext("2d");
	
  <c:forEach var = "flist" items = "${fList}">
	  var html = "";
	  html += "<div class = 'fNode' id = '${flist.fName}' ></div>";
	  html += "<div class='bookmark-box' id = 'fDiv" + ++fNode + "' >";
	  html += "<a class='boxclose' id='fDiv" + fNode + "' onclick='closeDiv(this)'></a>";
	  html += "<div class='bookmark-title' id = 'fWrite" + fNode + "' >";
	  html += "<h3>${flist.fTitle}</h3>";
	  html += "</div>";
	  html += "<div class='description' id = 'fContentForm" + fNode + "' >";
	  html += "  <input type = 'hidden' id = 'fContent" + fNode + "' value = '${flist.fContent}'/>${flist.fContent}";
	  html += "</div>";
	  html += "</div>";
	  
	  $(".mView").append(html);
	  $("#fNode" + fNode).css("left", '${flist.fX}' + 'px')
	  $("#fNode" + fNode).css("top", '${flist.fY}' + 'px')
	  $("#fDiv" + fNode).css("left", $("#fNode" + fNode).position().left - 115);
	  $("#fDiv" + fNode).css("top", $("#fNode" + fNode).position().top - 200);

	  var fNodeAdd = [];
	  fNodeArray.push(fNodeAdd);
  </c:forEach>
  
  <c:forEach var = "slist" items="${sList}">
  	var fNodeNum = Number("${slist.fName}".replace("fNode",""));
	  var html = "";
	  html += "<div class = 'sNode' id = 'sNode" + ++sNode + "' ></div>";
	  html += "<div class='bookmark-box' id = 'sDiv" + sNode + "' >";
	  html += "<a class='boxclose' id='sDiv" + sNode + "' onclick='closeDiv(this)'></a>";
	  html += "<div class='bookmark-title' id = 'sWrite" + sNode + "' >";
	  html += "<input type = 'hidden' id = 'sTitle" + sNode + "' value = 'SECOND TITLE' style='color:black;' />";
	  html += "<h3>${slist.sTitle}</h3>";
	  html += "</div>";
	  html += "<div class='description' id = 'sContentForm" + sNode + "'>";
	  html += "<input type = 'hidden' id = 'sContent" + sNode + "' value = 'Second Content'/>${slist.sContent}";
	  html += "</div>";
	  html += "<a style = 'color: white;'>동영상 보기</a>";
	  html += "</div>";
	  
	  $(".mView").append(html);
	  
	  $("#sNode" + sNode).css("left", "${slist.sX}" + 'px');
	  $("#sNode" + sNode).css("top", "${slist.sY}" + 'px');
	  
	  $("#sDiv" + sNode).css("left", $("#sNode" + sNode).position().left - 125);
	  $("#sDiv" + sNode).css("top", $("#sNode" + sNode).position().top - 200);
	  
	  fNodeArray[fNodeNum-1].push("sNode" + sNode);
	  var sNodeAdd = [];
	  sNodeArray.push(sNodeAdd);
  </c:forEach>
  
  <c:forEach var = "tlist" items = "${tList}">
	 	var html = "";
  	var sNodeNum = Number("${tlist.sName}".replace("sNode",""));
	  html += "<div class = 'tNode' id = '${tlist.tName}' ></div>";
	  
	  sNodeArray[sNodeNum-1].push("${tlist.tName}");
	  tNode++;
	  $(".mView").append(html);
	  
	  $("#" + "${tlist.tName}").css("left", "${tlist.tX}" + 'px');
	  $("#" + "${tlist.tName}").css("top", "${tlist.tY}" + 'px');
  </c:forEach>
  
  <c:forEach var = "tlink" items = "${tLink}">
	 	var html = "";
		var tNodeNum = Number("${tlink.tName}".replace("tNode", ""));
	  html += "<div class='bookmark-box' id = 'tDiv" + tNodeNum + "' >";
	  html += "<a class='boxclose' id='tDiv" + tNodeNum + "' onclick='closeDiv(this)'></a>";
	  html += "<div class='bookmark-title' id = 'tWrite" + tNodeNum + "' >";
	  html += "<input type = 'hidden' id = 'tLinkTitle" + tNodeNum + "' value = 'THIRD TITLE' style='color:black;' />";
	  html += "<h3>${tlink.linkTitle}</h3>";
	  html += "</div>";
	  html += "<div class='description' id = 'tContentForm" + tNodeNum + "'>";
	  html += "<input type = 'hidden' id = 'tLinkContent" + tNodeNum + "' value = 'Third Content'/>${tlink.linkContent}";
	  html += "</div>";
	  html += "<div id = 'tLinkUrlForm" + tNodeNum + "' >";
	  html += "<a href = '${tlink.lUrl}' id = 'tUrl" + tNodeNum + "' style = 'color: white;'>링크</a>";
	  html += "<input type = 'hidden' id = 'tLinkUrl" + tNodeNum + "' name = 'tLinkUrl" + tNodeNum + "' style='color:black; width:100%;' />";
	  html += "</div>";
	  html += "</div>";
	  
	  $(".mView").append(html);
	  
	  $("#tDiv" + tNodeNum).css("left", $("#tNode" + tNodeNum).position().left -140);
	  $("#tDiv" + tNodeNum).css("top", $("#tNode" + tNodeNum).position().top - 200);
	  $("#tNode" + tNodeNum).html("LINK")
  </c:forEach>
  
  <c:forEach var = "tfile" items = "${tFile}">
	 	var html = "";
		var tNodeNum = Number("${tfile.tName}".replace("tNode", ""));
	  html += "<div class='bookmark-box' id = 'tDiv" + tNodeNum + "' >";
	  html += "<a class='boxclose' id='tDiv" + tNodeNum + "' onclick='closeDiv(this)'></a>";
	  html += "<div class='bookmark-title' id = 'tWrite" + tNodeNum + "' >";
	  html += "<input type = 'hidden' id = 'tAsmtTitle" + tNodeNum + "' value = 'THIRD TITLE' style='color:black;' />";
	  html += "<h3>${tfile.aTitle}</h3>";
	  html += "</div>";
	  html += "<div class='description' id = 'tContentForm" + tNodeNum + "'>";
	  html += "<input type = 'hidden' id = 'tAsmtContent" + tNodeNum + "' value = 'Third Content'/>${tfile.aContent}";
	  html += "</div>";
	  html += "<div id = 'tAsmtForm" + tNodeNum + "' >";
	  html += "<a href = '${pageContext.request.contextPath}/fileDownload?orgFileName=${tfile.orgFileName}&realFileName=${tfile.realFileName}' >${tfile.orgFileName}<a/>";
	  html += "</div>";
	  html += "</div>";

	  $(".mView").append(html);
	  
	  $("#tDiv" + tNodeNum).css("left", $("#tNode" + tNodeNum).position().left -140);
	  $("#tDiv" + tNodeNum).css("top", $("#tNode" + tNodeNum).position().top - 200);
	  $("#tNode" + tNodeNum).html("ASMT")
  </c:forEach>
  
  
  drawLine();
})

// FIRST NODE CLICK 이벤트
$(document).on("click", "div[id^='fNode']", function () {
  divSet();
  sMenu = true;
  tMenu = true;
  if(fNodeId != this.id) {
    fMenu = true;
  }
  
  fNodeId = this.id;
  var menuNum = Number(fNodeId.replace("fNode", ""));

  if(fMenu) {
    $("#fDiv" + menuNum).css("display", "inline-table")
    fMenu = false;
  } else {
    $("#fDiv" + menuNum).css("display", "none");
    fMenu = true;
  }
})

// SECOND NODE CLICK 이벤트
$(document).on("click", "div[id^='sNode']", function () {
  divSet();
  fMenu = true;
  tMenu = true;
  if(sNodeId != this.id) {
    sMenu = true;
  }
  
  sNodeId = this.id;
  var menuNum = Number(sNodeId.replace("sNode", ""));

  if(sMenu) {
    $("#sDiv" + menuNum).css("display", "inline-table")
    sMenu = false;
  } else {
    $("#sDiv" + menuNum).css("display", "none");
    sMenu = true;
  }
})

// THIRD NODE CLICK 이벤트
$(document).on("click", "div[id^='tNode']", function () {
  divSet();
  fMenu = true;
  sMenu = true;
  if(tNodeId != this.id) {
    tMenu = true;
  }
  
  tNodeId = this.id;
  var menuNum = Number(tNodeId.replace("tNode", ""));
  
  if(tMenu) {
    $("#tDiv" + menuNum).css("display", "inline-table")
    
    tMenu = false;
  } else {
    $("#tDiv" + menuNum).css("display", "none");
    tMenu = true;
  }
})

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
</script>
</head>
<body>
<div class = "mView">
	<!-- CANVAS -->
	<canvas class = "myCanvas" id = "myCanvas" width="1200" height="600">
	</canvas>
</div>
</body>
</html>