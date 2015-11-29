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
<script src="${pageContext.request.contextPath}/js/mypage.js"></script>
</head>
<body style="background: #f1f1f1;">
	<%@include file="../include/topMenu.jsp"%>


	<section class="stretch">

	
	
	<div class="wrapper preload" style="position: absolute;">
		<center>
			<div class="hit-the-floor" style="padding-bottom: 50px;">
			 MyPage
			</div>

		</center>

		<section class="grid-unit top-left">
			<div class="swing-panel">
				<span class="desc">&nbsp;&nbsp;${user.id}&nbsp;&nbsp;
			<button data-word='비밀번호 변경' id="mdfBtn" class="button btn-lg btn-step2" style="vertical-align: top;"></button>
				</span>
			<br/>
			<form id="modifyDiv" style="display: none;">
							<div class='modify col-xs-6 form-group' style='margin-left:20px; width:400px;margin-top:10px;'>
							<input id='pPass' type='password' class='form-control' size='20' placeholder="현재 비밀번호" style="margin-bottom: 10px; height: 40px;"/>
							<input id='mPass' type='password' class='form-control' size='20' placeholder="새로운 비밀번호"style="margin-bottom: 10px;height: 40px;"/>
							<input id='mPassChk' type='password' class='form-control' size='20'placeholder="새로운 비밀번호 확인"style="margin-bottom: 10px;height: 40px;"/>
							<button type='button' id='chk' value='확인' class='btn btn-default btn-sm'>확인</button>
							<button type='reset' value='취소' class='btn btn-default btn-sm'>취소</button>
							</div>
			
			</form>
			
			</div>
			<div class="sphere"></div>
			<span class="entypo-vcard icon fa fa-user"></span>
			<span class="label"><br/>${user.id} 님<br /></span>
		</section>


		<section class="grid-unit top-right" onclick="lectureList();">
		<div class="swing-panel">
			<span class="desc">강좌 등록/시청</span>
		</div>
		<div class="sphere"></div>
		<span class="entypo-tools icon fa  fa-desktop"></span> <span
			class="label">LECTURE</span> \ </section>



		<section class="grid-unit bottom-left" onclick="storeList();">
		<div class="swing-panel">
			<span class="desc">물품 구매/판매</span>
		</div>
		<div class="sphere"></div>
		<span class="entypo-tools icon fa fa-shopping-cart"></span> <span
			class="label">STORE</span> </section>


		<section class="grid-unit bottom-right" onclick="favoriteList();">
		<div class="swing-panel">
			<span class="desc">즐겨찾기</span>
		</div>
		<div class="sphere"></div>
		<span class="entypo-tools icon fa fa-star"></span> <span class="label">FAVORITE</span>
		</section>
	</div>
	

	<!-- end wrapper --> </section>




</body>

</html>