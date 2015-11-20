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

<script>

	function lectureList() {
		location.href = "lectureList.do";
	}
	function storeList() {
		location.href = "storeList.do";
	}

	jQuery(function() {

		$(window).load(function() {

			$('.wrapper').removeClass('preload');

		});

	});

	$(document).ready(function(){
		
		var mdfFlag = false;
		
		$("#mdfBtn").click(function(){
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
<body>
	<%@include file="../include/topMenu.jsp"%>


	<section class="stretch">

	
	
	<div class="wrapper preload" style="position: absolute;">
		<center>
			<h2 style="font-size: 50px; padding-bottom: 30px;">MY PAGE</h2>
		</center>

		<section class="grid-unit top-left">
			<div class="swing-panel">
				<span class="desc">${user.id}<br /><br/>
			<button id="mdfBtn" type="button" class="btn btn-link btn-lg btn-step2">비밀번호 변경</button></span>
			<div id="modifyDiv" style="display: none;">
							<div class='modify col-xs-6 form-group' style='width:320px;margin-top:10px;'>
							<label for='pPass'>현재 비밀번호</label>
							<input id='pPass' type='password' class='form-control' size='20'/>
							<label for='mPass'>새로운 비밀번호</label>
							<input id='mPass' type='password' class='form-control' size='20' />
							<label for='mPassChk'>새로운 비밀번호 확인</label>
							<input id='mPassChk' type='password' class='form-control' size='20'/>
							<button type='button' id='chk' value='확인' class='btn btn-default btn-sm'>확인</button>
							<button type='reset' value='취소' class='btn btn-default btn-sm'>취소</button>
							</div>
			
			</div>
			
			</div>
			<div class="sphere"></div>
			<span class="entypo-vcard icon fa fa-user"></span>
			<span class="label">아이디<br/> <br/>${user.id}<br /></span>
		</section>


		<section class="grid-unit top-right" onclick="lectureList();">
		<div class="swing-panel">
			<span class="desc">강좌 등록/시청 list</span>
		</div>
		<div class="sphere"></div>
		<span class="entypo-tools icon fa  fa-desktop"></span> <span
			class="label">강좌 등록/시청 list</span> \ </section>



		<section class="grid-unit bottom-left" onclick="storeList();">
		<div class="swing-panel">
			<span class="desc">물품 구매/판매 List</span>
		</div>
		<div class="sphere"></div>
		<span class="entypo-tools icon fa fa-shopping-cart"></span> <span
			class="label">물품 구매/판매 List</span> </section>


		<section class="grid-unit bottom-right">
		<div class="swing-panel">
			<span class="desc">즐겨찾기</span>
		</div>
		<div class="sphere"></div>
		<span class="entypo-tools icon fa fa-star"></span> <span class="label">즐겨찾기</span>
		</section>
	</div>
	

	<!-- end wrapper --> </section>




</body>

</html>