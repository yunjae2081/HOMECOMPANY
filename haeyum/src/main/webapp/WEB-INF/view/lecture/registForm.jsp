<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file = "../include/common_top.jsp" %>
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/mindMap.css" />
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/divStyle.css" />
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/input.css" />
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/mindMap.js"></script>
<script src="${pageContext.request.contextPath}/js/input.js"></script>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<section class="stretch">
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<h1>LECTURE REGIST</h1>
<form action="${pageContext.request.contextPath}/lecture/regist.do" enctype="multipart/form-data" method="POST" onsubmit="return upload();">
<fieldset class="span6 reset">
  <div class="form_row">
    <div class="input" id = "title"> 
      <input placeholder="Fill out your lecture Title" type="text" id="name" name = "lTitle" required=""/>
      <label for="name"> TITLE: <span class="blue">*</span></label>
    </div>
  </div>
</fieldset>

  <select name="lCategory" id="sources">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10">10</option>
  </select>
  
<fieldset class="span12 reset">
    <div class="form_row">
      <div class="input">
        <textarea placeholder="Fill out your Lecture Description" id="message" name = "lContent" cols="55" rows="7" required=""></textarea>
        <label for="message">Description: <span class="blue">*</span></label>
      </div>
    </div>
</fieldset>
<h1>MIND MAP</h1>
<div class = "mView">
	<!-- 메뉴 HOVER DIV -->
	<div class = "menuDiv" id = "menuAddFNode">추가</div>
	<div class = "menuDiv" id = "menuAddSNode">자식 추가</div>
	<div class = "menuDiv" id = "menuRemove">삭제</div>

	<div class = "menuDiv" id = "menuAddLinkS">링크 추가</div>
	<div class = "menuDiv" id = "menuAddSubjectS">과제 추가</div>
	<div class = "menuDiv" id = "menuNodeRemoveS">삭제</div>
	
	<div class = "menuDiv" id = "menuTNodeRemove">삭제</div>
	
	<!-- 기본 FIRST NODE -->
	<div class = "fNode" id = "fNode1"></div>
	<div class = "menu" id = "addFNode1">+</div>
	<div class = "menu" id = "addSNode1">+</div>
	<div class = "menu" id = "remove1">-</div>
	<div class="bookmark-box" id = "fDiv1">
		<a class="boxclose" id="fDiv1" onclick="closeDiv(this)"></a>
		<div class="bookmark-title" id = "fWrite1" >
			<input type = "button" onclick="fNodeWriteForm(this)" id = "fNodeForm1" style="float: right;"/>
			<input type = "hidden" id = "fTitle1" value = "STEP TITLE" style="color:black;" />
			<h3>STEP TITLE</h3>
		</div>
		<div class="description" id = "fContentForm1">
			<input type = "hidden" id = "fContent1" value = "Step Content"/>Step Content
		</div>
	</div>
	
	<!-- CANVAS -->
	<canvas class = "myCanvas" id = "myCanvas" width="1200" height="600">
	</canvas>
</div>
<!-- <input type = "button" onclick="checkArr()" value = "배열 확인"/> -->
<br/>
  <fieldset class="span12 reset">
    <div class="form_row">
      <input class="more wider" type="submit" value="REGIST">
    </div>
  </fieldset>
  <div id = "dataDiv">
  </div>
</form>
</section>
</body>
</html>