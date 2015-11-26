<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/storeSideMenu.css" type="text/css" />
<script>
$(document).ready(function(){
	$(".menu-fixed").on("click",function(){
		$(".menu-fixed").find(".pmenu").hide();
		$(".menu-fixed .mLogo").css({"height":0,"margin":0})
		$("#menu-fixed").addClass("target");
		$("#cont").removeClass("target");
		$(".cont .mLogo").css({"margin-top":"0","height":"70px"});
		$(".cont .pmenu").show();
		
		return false;
	});
	$(".cont").on("click",function(){
		$(".cont").find(".pmenu").hide();
		$(".cont .mLogo").css({"height":0,"margin":0});
		$("#cont").addClass("target");
		$("#menu-fixed").removeClass("target");
		$(".menu-fixed .mLogo").css({"margin-top":"70px","height":"70px"});
		$(".menu-fixed .pmenu").show();
		return false;
	});
	

	$(".sideBtn").on("click", function(){
 	  var category = this.id;
		location.href = "${pageContext.request.contextPath}/side/video.do?category=" + category;
	});
	
});
</script>
	<div id="cont">
		<div id="menu-fixed">
			<a href="#" class="cont"> 
				<i class="material-icons back">
					<div class="mLogo">
						<span></span>
					</div>
				</i>
				<p class="pmenu">MENU</p>
			</a> 
			<a href="#" class="menu-fixed">
				<div class="mLogo">
					<span></span>
				</div>
				<p class="pmenu">MENU</p>
			</a>
			<hr>
			<ul class="menu">
				<li><i class="material-icons"><img class="sideBtn" id="1" src="${pageContext.request.contextPath}/images/minibeauty.png"/></i>
				<p>뷰티 & 패션</p></li>
				<li><i class="material-icons"><img class="sideBtn" id="2" src="${pageContext.request.contextPath}/images/ministudy.png"/></i>
				<p>교과목</p></li>
				<li><i class="material-icons"><img class="sideBtn" id="3" src="${pageContext.request.contextPath}/images/minimusic.png"/></i>
				<p>음악 & 공연</p></li>
				<li><i class="material-icons"><img class="sideBtn" id="4" src="${pageContext.request.contextPath}/images/miniit.png"/></i>
				<p>IT</p></li>
				<li><i class="material-icons"><img class="sideBtn" id="5" src="${pageContext.request.contextPath}/images/miniart.png"/></i>
				<p>미술 & 공예</p></li>
				<li><i class="material-icons"><img class="sideBtn" id="6" src="${pageContext.request.contextPath}/images/minisport.png"/></i>
				<p>스포츠</p></li>
				<li><i class="material-icons"><img class="sideBtn" id="7" src="${pageContext.request.contextPath}/images/minicook.png"/></i>
				<p>요리</p></li>
				<li><i class="material-icons"><img class="sideBtn" id="8" src="${pageContext.request.contextPath}/images/miniforeign.png"/></i>
				<p>외국어</p></li>
				<li><i class="material-icons"><img class="sideBtn" id="9" src="${pageContext.request.contextPath}/images/minigame.png"/></i>
				<p>게임</p></li>
				<li><i class="material-icons"><img class="sideBtn" id="10" src="${pageContext.request.contextPath}/images/minietc.png"/></i>
				<p>ETC</p></li>
			</ul>
		</div>
	</div>
	</div>
