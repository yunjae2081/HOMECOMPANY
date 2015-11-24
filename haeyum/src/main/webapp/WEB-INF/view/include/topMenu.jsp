<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="styleSheet"href="${pageContext.request.contextPath}/css/login.css" />
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="${pageContext.request.contextPath}/js/kakao.js"></script>
<script src="${pageContext.request.contextPath}/js/login.js"></script>
<script>

//search
function nullCheck(){
    if($("#title").val()  == ""){
      return false;
    }
    else{
      return true;
    }
  }



</script>

<header class="header">
	<div class="container-fluid">
		<nav>
			<div class="container">
				<div class="nav-top clearfix">
					<div class="logo">
						<a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/logo.png" style="width: 155px; height: 65px"/></a>
					</div>
					<div class="search hidden-xs">
						<form action="${pageContext.request.contextPath}/search/video.do" method="GET" onsubmit="return nullCheck()" >
		                   <input id="title" name="title" placeholder="Search" type="text">
							<button class="search-submit" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
					</div>
					<button class="navbar-toggle" data-target=".navbar-collapse"
						data-toggle="collapse" type="button">
						<span class="sr-only">Toggle navigation</span><i
							class="fa fa-bars"></i>
					</button>
				</div>
			</div>

			<div class="main-nav navbar-collapse collapse">
				<div class="container">
					<div class="minilogo">
					<a href="${pageContext.request.contextPath}/index.jsp">
						<img src="${pageContext.request.contextPath}/images/logo.png" style="width: 105px; height: 45px"/>
						</a>
					</div>
					<ul class="nav nav-justified">
						<li><a class="active" href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
						<li><a href="${pageContext.request.contextPath}/list/listVideo.do">Search</a></li>
						<li><a href="#">Lecture</a></li>
						<li><a href="${pageContext.request.contextPath}/store/storeList.do">Store</a></li>
						<c:choose>
						<c:when test="${empty user}">
						<li><a onclick="loginClick();">Login</a></li>
						
						<div id="loginDiv" style="display: none; float:right;">
							  <div class="login-box">
							    <div class="lb-header">
							      <a href="#" class="active" id="login-box-link">Login</a>
							      <a href="#" id="signup-box-link">Sign Up</a>
							    </div>
							    
							    <!-- 로그인 -->
							    <div class="email-login">
							    <div class="social-login">
							      <a href="#">
							      	
							      	<div id="kakao-logged-group"></div>
							      	
							      	
							      </a>
							    </div>
							      <div class="u-form-group">
							        <input id="id" type="email" placeholder="Email" style="margin-top: 20px;"/>
							      </div>
							      <div class="u-form-group">
							        <input id="password" type="password" placeholder="Password"/>
							      </div>
							      <div class="u-form-group">
							        <button id="loginBtn">Login</button>
							      </div>
							      <!-- 
							      <div class="u-form-group">
							        <a href="#" class="forgot-password">Forgot password?</a>
							      </div>
							       -->
							    </div>
							    <!-- 회원가입 -->
							    <div class="email-signup">
							    <div class="u-form-group">
							        <input id="jName"type="text" placeholder="Name"/>
							      </div>
							      <div class="u-form-group">
							        <input id="jId" type="email" placeholder="Email" maxlength="12"/>
							      </div>
							      <div class="u-form-group">
							        <input id="jPassword" type="password" placeholder="Password" maxlength="12"/>
							      </div>
							      <div class="u-form-group">
							        <input id="jPasswordChk" type="password" placeholder="Confirm Password" maxlength="12"/>
							      </div>
							      <div class="u-form-group">
							        <button id="signBtn">Sign Up</button>
							      </div>
							    </div>
							  </div>
							</div>									
						</c:when>
						<c:otherwise>
						
						<li><a href="${pageContext.request.contextPath}/mypage/mypageMember.do">Mypage</a></li>
						<li><a onclick="outclick();">Logout</a></li>															
						</c:otherwise>
						</c:choose>				
					</ul>
				</div>
			</div>
		</nav>
		<!-- /end nav -->

	</div>
</header>