<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file = "../include/common_top.jsp" %>
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/mindMap.css" />
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
	<div class = "mView">
		<div class = "fNode" id = "fNode1"></div>
		<div class = "menu" id = "addFNode"></div>
		<div class = "menu" id = "addSNode"></div>
		<div class = "menu" id = "remove"></div>
		<canvas class = "myCanvas" id = "myCanvas" width="1200" height="600">
		</canvas>
	</div>
	</section>
</body>
</html>