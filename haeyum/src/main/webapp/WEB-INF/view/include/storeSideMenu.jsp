<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/storeSideMenu.css" type="text/css" />

<br/>
<br/>
<br/>
<script>
$(document).ready(function(){
	$(".menu-fixed").on("click",function(){
		$("#menu-fixed").addClass("target");
		$("#cont").removeClass("target");
		return false;
	});
	$(".cont").on("click",function(){
		$("#cont").addClass("target");
		$("#menu-fixed").removeClass("target");
		return false;
	});
	
});
</script>
	<div id="cont">
		<div id="menu-fixed">
			<a href="#cont" class="cont"> <i class="material-icons back">&#xE314;</i>
			</a> 
			<a href="#menu-fixed" class="menu-fixed">
				<div class="mLogo">
					<span></span>
				</div>
				<p class="pmenu">MENU</p>
			</a>
			<hr>
			<ul class="menu">
				<li><i class="material-icons"><img src="${pageContext.request.contextPath}/images/beauty.png"/></i>
				<p>뷰티 & 패션</p></li>
				<li><i class="material-icons"><img src="${pageContext.request.contextPath}/images/study.png"/></i>
				<p>교과목</p></li>
				<li><i class="material-icons"><img src="${pageContext.request.contextPath}/images/music.png"/></i>
				<p>음악 & 공연</p></li>
				<li><i class="material-icons"><img src="${pageContext.request.contextPath}/images/it.png"/></i>
				<p>IT</p></li>
				<li><i class="material-icons"><img src="${pageContext.request.contextPath}/images/art.png"/></i>
				<p>미술 & 공예</p></li>
				<li><i class="material-icons"><img src="${pageContext.request.contextPath}/images/sports.png"/></i>
				<p>스포츠</p></li>
				<li><i class="material-icons"><img src="${pageContext.request.contextPath}/images/cook.png"/></i>
				<p>요리</p></li>
				<li><i class="material-icons"><img src="${pageContext.request.contextPath}/images/foreign.png"/></i>
				<p>외국어</p></li>
				<li><i class="material-icons"><img src="${pageContext.request.contextPath}/images/game.png"/></i>
				<p>게임</p></li>
				<li><i class="material-icons"><img src="${pageContext.request.contextPath}/images/etc.png"/></i>
				<p>ETC</p></li>
			</ul>
		</div>
	</div>

	<div id="page">
		<div></div>
	</div>
