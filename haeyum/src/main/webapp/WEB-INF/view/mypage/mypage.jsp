<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/mypageMain.css" />
<title>Insert title here</title>
<%@include file="../include/common_top.jsp"%>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="https://storage.googleapis.com/code.getmdl.io/1.0.2/material.min.js"></script>
<script>
	$(document).ready(function(){
		$("#lectureList").click(function(){
			location.href="lectureList.do";
			
		})
	})
</script>
<link rel="stylesheet"
	href="https://storage.googleapis.com/code.getmdl.io/1.0.2/material.blue-orange.min.css">
<!-- Material Design icon font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
	<%@include file="../include/topMenu.jsp"%>

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<section class="stretch">

	<div class="mainDiv" style="margin: 0 auto;">
		<div class="mdl-card mdl-shadow--2dp demo-card-square">
			<div class="mdl-card__title mdl-card__accent mdl-card--expand">
				<div style="margin: 0 auto;text-align: center;">
					${user.id}<br /> <br /> 
					${user.name}<br /> <br />

					<form name="mdfForm" action="" method="POST" onsubmit="">
					<div>
					<ul>
						<li class="block">
						<input type="checkbox" name="item"id="item1" />
						<label for="item1"><i aria-hidden="true"></i>비밀번호 변경</label>
							<ul class="options">
								<li><i aria-hidden="true"></i><input type="password" size="20" placeholder="현재 비밀번호"></li>
								<li><i aria-hidden="true"></i><input type="password" size="20"placeholder="새 비밀번호"></li>
								<li><i aria-hidden="true"></i><input type="password" size="20"placeholder="새 비밀번호 재입력"></li>
							
							<button class="btn btn-default" type="submit">확인</button>
							<button class="btn btn-default" type="reset" >취소</button>
							</ul></li>
					</ul>
					</div>
		
					</form>					

				</div>
			</div>
		</div>

		<!-- Square card -->
		<div class="mdl-card mdl-shadow--2dp demo-card-square">
			<div class="mdl-card__title mdl-card--expand">
				<h2 class="mdl-card__title-text">강의 등록&시청 list</h2>
			</div>
			<div class="mdl-card__supporting-text">두번째</div>
			<div class="mdl-card__actions mdl-card--border">
				<a id="lectureList" class="mdl-button mdl-button--accent mdl-js-button mdl-js-ripple-effect">
					click </a>
			</div>
		</div>
		<!-- Square card -->
		<div class="mdl-card mdl-shadow--2dp demo-card-square">
			<div class="mdl-card__title mdl-card--expand">
				<h2 class="mdl-card__title-text">물품 구매&판매 list</h2>
			</div>
			<div class="mdl-card__supporting-text">세번째</div>
			<div class="mdl-card__actions mdl-card--border">
				<a
					class="mdl-button mdl-button--accent mdl-js-button mdl-js-ripple-effect">
					click </a>
			</div>
		</div>
		<!-- Square card -->
		<div class="mdl-card mdl-shadow--2dp demo-card-square">
			<div class="mdl-card__title mdl-card--expand">
				<h2 class="mdl-card__title-text">즐겨찾기</h2>
			</div>
			<div class="mdl-card__supporting-text">네번째</div>
			<div class="mdl-card__actions mdl-card--border">
				<a
					class="mdl-button mdl-button--accent mdl-js-button mdl-js-ripple-effect">
					click </a>
			</div>
		</div>
	</div>


	</section>





</body>

</html>