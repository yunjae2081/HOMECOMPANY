<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/mypageMain.css" />
<title>Insert title here</title>
<style>
.hit-the-floor {
color: #fff;
font-size: 80px;
font-weight: bold;
font-family: Helvetica;
text-shadow: 0 1px 0 #ccc, 0 2px 0 #c9c9c9, 0 3px 0 #bbb, 0 4px 0 #b9b9b9, 0 5px 0 #aaa, 0 6px 1px rgba(0,0,0,.1), 0 0 5px rgba(0,0,0,.1), 0 1px 3px rgba(0,0,0,.3), 0 3px 5px rgba(0,0,0,.2), 0 5px 10px rgba(0,0,0,.25), 0 10px 10px rgba(0,0,0,.2), 0 20px 20px rgba(0,0,0,.15);
}

.hit-the-floor {
  text-align: center;
}



</style>
<%@include file="../include/common_top.jsp"%>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

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
<body>
	<%@include file="../include/topMenu.jsp"%>


	<section class="stretch">

	
	
	<div class="wrapper preload" style="position: absolute;">
		<center>
			<div class="hit-the-floor" style="padding-bottom: 30px;">
			${user.id}님 MyPage
			</div>

		</center>

		<section class="grid-unit top-left">
			<div class="swing-panel">
				<span class="desc">&nbsp;&nbsp;${user.id}&nbsp;&nbsp;
			<button data-word='비밀번호 변경' id="mdfBtn" class="button btn-lg btn-step2"></button>
				</span>
			<br/>
			<div id="modifyDiv" style="display: none;">
							<div class='modify col-xs-6 form-group' style='margin-left:20px; width:400px;margin-top:10px;'>
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
			<span class="label">아이디<br/><br/>${user.id}<br /></span>
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


		<section class="grid-unit bottom-right" onclick="favoriteList();">
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