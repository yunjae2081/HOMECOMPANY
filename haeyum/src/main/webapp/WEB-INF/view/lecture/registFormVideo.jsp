<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file = "../include/common_top.jsp" %>
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/video.css" />
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/video.js"></script>
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
	<div class = "vView">
		<canvas class="vCanvas" id="vCanvas" width = "730" height = "445">
		</canvas>
		<div class="vDiv">
			<video id="myVideo" loop="loop" autoplay="autoplay" width="730" height="445" >
				<source src="${pageContext.request.contextPath}/images/standing.mp4" />
			</video>
		</div>
		<canvas class="pCanvas" id="pCanvas" width="700" height="3">
		</canvas>
		<div class="videobottom">
			<div class="progress">
			</div>
		</div>
		<div>
			<input id="progress" type="range" min="0" max="100" step="1" style="width: 740px;" />
		</div>
	</div>
	</section>
</body>
</html>