<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/mypageMain.css" />
<title>혜;윰</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
<%@include file="../include/common_top.jsp"%>
<script>



function lectureList() {
	location.href = "lectureList.do";
}
function storeList() {
	location.href = "storeList.do";
}
function favoriteList(){
	location.href = "favoriteList.do";
}

jQuery(function() {

	$(window).load(function() {

		$('.wrapper').removeClass('preload');

	});

});

$(document).ready(function(){
	
	var mdfFlag = false;
	
	$("#mdfBtn").click(function(){
		$("#modifyDiv").toggle("slow");
		if(!mdfFlag){

			$("#modifyDiv").css("display", "block");
			mdfFlag = true;
		} else {
			$("#modifyDiv").css("display", "none");
			mdfFlag = false;	
		}
	})
	$("#chk").click(function(){
		if($("#mPass").val() == $("#mPassChk").val()){
		$.ajax({
			url:"${pageContext.request.contextPath}/mypage/modify.json",
			type:"POST",
			datatype:"json",
			data: {pPass: $("#pPass").val(),mPass:$("#mPass").val()}
				
		}).done(function(response){
				alert("등록");
				})
		}else{
			alert("안돼");
		}
		
	})
	
		
})





</script>
</head>
<body style="background: #f1f1f1;">
	<%@include file="../include/topMenu.jsp"%>


	<section class="stretch">

<!-- 호오 -->


<!--  -->
	
	<div class="wrapper preload" style="position: absolute;">
		<center>
			<div class="hit-the-floor" style="padding-bottom: 50px;">
			 MyPage
			</div>

		</center>
		<a href="#">
		<section class="grid-unit top-left">
			<div class="swing-panel">
				<span class="desc">&nbsp;&nbsp;${user.id}<br/>
			<button data-word='비밀번호 변경' id="mdfBtn" class="button btn-lg btn-step2" style="vertical-align: top; margin: 22px;"></button>
				</span>
			<br/>
			<div id="modifyDiv" style="display: none;">
							<div class='modify col-xs-6 form-group' style='margin-left:16px; width:400px;margin-top:92px;'>
							<input id='pPass' type='password' class='form-control' size='20' placeholder="현재 비밀번호" style="margin-bottom: 10px; height: 40px;"/>
							<input id='mPass' type='password' class='form-control' size='20' placeholder="새로운 비밀번호"style="margin-bottom: 10px;height: 40px;"/>
							<input id='mPassChk' type='password' class='form-control' size='20'placeholder="새로운 비밀번호 확인"style="margin-bottom: 10px;height: 40px;"/>
							<button type='button' id='chk' value='확인' class='btn btn-default btn-sm'>확인</button>
							<button type='reset' value='취소' class='btn btn-default btn-sm'>취소</button>
							</div>
			
			</div>
			
			</div>
			<div class="sphere"></div>
			<span class="entypo-vcard icon fa fa-user"></span>
			<span class="label" style="vertical-align: middle;">회원 아이디<br/><br/>${user.id}<br /></span>
		</section>
		</a>

		<a href="#">
		<section class="grid-unit top-right" onclick="lectureList();">
		<div class="swing-panel">
			<span class="desc">강좌 등록/시청</span>
		</div>
		<div class="sphere"></div>
		<span class="entypo-tools icon fa  fa-desktop"></span> <span
			class="label">LECTURE</span> \ </section></a>


		<a href="#">
		<section class="grid-unit bottom-left" onclick="storeList();">
		<div class="swing-panel">
			<span class="desc">물품 구매/판매</span>
		</div>
		<div class="sphere"></div>
		<span class="entypo-tools icon fa fa-shopping-cart"></span> <span
			class="label">STORE</span> </section></a>

		<a href="#">
		<section class="grid-unit bottom-right" onclick="favoriteList();">
		<div class="swing-panel">
			<span class="desc">즐겨찾기</span>
		</div>
		<div class="sphere"></div>
		<span class="entypo-tools icon fa fa-star"></span> <span class="label">FAVORITE</span>
		</section></a>
	</div>



	<!-- end wrapper --> </section>


<div style="margin-top:-135px;">
<%@include file="../include/footer.jsp" %>
</div>

</body>

</html>