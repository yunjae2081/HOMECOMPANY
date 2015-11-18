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
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/mindMap.js"></script>
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
	<form action="" onsubmit="return upload();">
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
		<input type = "button" onclick="checkArrs()" value = "배열 확인"/>
		<div id = "dataDiv">
		</div>
		<input type = "submit" value = "등록"/>
	</form>
	</section>
</body>
</html>