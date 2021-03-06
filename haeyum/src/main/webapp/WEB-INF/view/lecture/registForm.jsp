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
<body style="background: #f1f1f1;">
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
<form id = "mapForm" action="${pageContext.request.contextPath}/lecture/regist.do" enctype="multipart/form-data" method="POST" onsubmit="return upload();">
<fieldset class="span6 reset">
  <div class="form_row">
    <div class="input" id = "title"> 
      <input placeholder="Fill out your lecture Title" type="text" id="name" name = "lTitle" required=""/>
      <label for="name"> TITLE: <span class="blue">*</span></label>
    </div>
  </div>
</fieldset>

<div class="dropp">
  <div class="dropp-header">
    <span class="dropp-header__title js-value" style="margin-left:10px;margin-top:5px;">category</span>
    <a href="#" class="dropp-header__btn js-dropp-action"><i class="icon"></i></a>
  </div>
  <div class="dropp-body">
    <label for="optA">&nbsp;&nbsp;뷰티 & 패션<input type="radio" id="optA" name="lCategory" value="1"/></label>
    <label for="optB">&nbsp;&nbsp;교과목<input type="radio" id="optB" name="lCategory" value="2"/></label>
    <label for="optC">&nbsp;&nbsp;음악 & 공연<input type="radio" id="optC" name="lCategory" value="3"/></label>
    <label for="optD">&nbsp;&nbsp;IT<input type="radio" id="optD" name="lCategory" value="4"/></label>
    <label for="optE">&nbsp;&nbsp;미술 & 공예<input type="radio" id="optE" name="lCategory" value="5"/></label>
    <label for="optF">&nbsp;&nbsp;스포츠<input type="radio" id="optF" name="lCategory" value="6"/></label>
    <label for="optG">&nbsp;&nbsp;요리<input type="radio" id="optG" name="lCategory" value="7"/></label>
    <label for="optH">&nbsp;&nbsp;외국어<input type="radio" id="optH" name="lCategory" value="8"/></label>
    <label for="optI">&nbsp;&nbsp;게임<input type="radio" id="optI" name="lCategory" value="9"/></label>
    <label for="optJ">&nbsp;&nbsp;Etc<input type="radio" id="optJ" name="lCategory" value="10"/></label>
  </div>
</div>
  
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