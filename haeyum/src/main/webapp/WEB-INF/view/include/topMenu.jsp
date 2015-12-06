<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="styleSheet"href="${pageContext.request.contextPath}/css/login.css" />
<script>
function loginClick(){
	var f= false;
	$("#loginDiv").slideToggle(700);
	if(!f){
		$("#loginDiv").css("display","block");
		f=true;
	}else{
		$("#loginDiv").css("display","none");
		f=false;
	}
	
}
	
$(document).ready(function(){
	
	$(".email-signup").hide();
	$("#signup-box-link").click(function(){
	  $(".email-login").fadeOut(100);
	  $(".email-signup").delay(100).fadeIn(100);
	  $("#login-box-link").removeClass("active");
	  $("#signup-box-link").addClass("active");
	});
	$("#login-box-link").click(function(){
	  $(".email-login").delay(100).fadeIn(100);;
	  $(".email-signup").fadeOut(100);
	  $("#login-box-link").addClass("active");
	  $("#signup-box-link").removeClass("active");
	});



	$("#loginBtn").click(function(){
		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if($("#id").val()==""){
			$("#alertEmail").css("display","block");			
			$("#alertEmail").fadeOut(2000);
			return false;
		}else{
			if(!regEmail.test($("#id").val())){
				$("#EmailAlert").css("display","block");			
				$("#EmailAlert").fadeOut(2000);
			$("#id").focus();
			return false;
			
			}
		}
		$.ajax({
			url:"${pageContext.request.contextPath}/member/login.json",
			type:"POST",
			datatype:"json",
			data:{id:$("#id").val(),password:$("#password").val()}
		}).done(function(respnse){
			location.reload();
		})

			
	})
	
	
	$("#signBtn").click(function(){
		
		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if($("#jName").val()==""){
			$("#jNameAlert").css("display","block");			
			$("#jNameAlert").fadeOut(2000);
			$("#jName").focus();
			return false;
		}else if($("#jPassword").val()==""){
			$("#jPassAlert").css("display","block");			
			$("#jPassAlert").fadeOut(2000);
			$("#jPassword").focus();
			return false;		
		}else if($("#jPassword").val()!=$("#jPasswordChk").val()){
			$("#jPassChkAlert").css("display","block");			
			$("#jPassChkAlert").fadeOut(2000);
			$("#jPasswordChk").focus();
			return false;
		}
		if($("#jId").val()==""){
			$("#jIdAlert").css("display","block");			
			$("#jIdAlert").fadeOut(2000);
			$("jId").focus();
			return false;
		}else{
			if(!regEmail.test($("#jId").val())){
				$("#EmailAlert").css("display","block");			
				$("#EmailAlert").fadeOut(2000);
			$("jId").focus();
			return false;
			
			}
		}
		
		$.ajax({
			url:"${pageContext.request.contextPath}/member/join.json",
			type:"POST",
			datatype:"json",
			data:{name:$("#jName").val(),
					  id:$("#jId").val(),
					  password:$("#jPassword").val()}
		}).done(function(response){
			location.reload();
		})
		
	})
	
	
})
	//이상하다..
	function outclick(){
		console.log("logout");
		$.ajax({
			url:"${pageContext.request.contextPath}/member/logout.json",
			type:"POST",
			datatype:"json"
		}).done(function(response){
 			location.href="${pageContext.request.contextPath}/index.jsp";
	})
	}



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
<!-- alert -->
<div id = 'alertEmail' data-title="EMAIL" class="alertDiv dialog-box_info" style="display: none;left: 64%">
	<h3>이메일을 입력해주세요.</h3>
	<hr class="style15">
</div>
<div id = 'EmailAlert' data-title="EMAIL" class="alertDiv dialog-box_info" style="display: none;left: 64%">
	<h3>이메일을 올바르게 입력해주세요.</h3>
	<hr class="style15">
</div>
<div id = 'jNameAlert' data-title="NAME" class="alertDiv dialog-box_info" style="display: none;left: 64%;padding-top: 3%;">
	<h3>이름을 입력해주세요.</h3>
	<hr class="style15">
</div>
<div id = 'jEmailAlert' data-title="EMAIL" class="alertDiv dialog-box_info" style="display: none;left: 64%;padding-top: 3%;">
	<h3>이메일을 입력해주세요.</h3>
	<hr class="style15">
</div>
<div id = 'jPassAlert' data-title="PASSWORD" class="alertDiv dialog-box_info" style="display: none;left: 64%;padding-top: 3%;">
	<h3>비밀번호를 입력해주세요.</h3>
	<hr class="style15">
</div>
<div id = 'jPassChkAlert' data-title="PASSWORD" class="alertDiv dialog-box_info" style="display: none;left: 64%;padding-top: 3%;">
	<h3>비밀번호가 일치하지 않습니다.</h3>
	<hr class="style15">
</div>
<div id = 'jIdAlert' data-title="NAME" class="alertDiv dialog-box_info" style="display: none;left: 64%;padding-top: 3%;">
	<h3>이메일을 입력해주세요.</h3>
	<hr class="style15">
</div>
<!--  -->

</div>
	<div class="container-fluid">
		<nav>
			<div class="container">
				<div class="nav-top clearfix">
					<div class="logo">
						<a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/logo.png" style="width: 155px; height: 65px"/></a>
					</div>
					<div class="search hidden-xs">
						<form action="${pageContext.request.contextPath}/search/video.do" method="GET" onsubmit="return nullCheck()" >
		                   <input id="title" name="title" placeholder="Search" type="text" required="required">
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
						<li><a href="${pageContext.request.contextPath}/lecture/registForm.do">Lecture</a></li>
						<!--  -->
						<li><a href="${pageContext.request.contextPath}/store/storeList.do">Store</a></li>
						<c:choose>
						<c:when test="${empty user}">
						<li><a onclick="loginClick();"style="overflow: hidden;">Login</a></li>
						
													
						</c:when>
						<c:otherwise>
						<li><a class="topLoginBtn" href="${pageContext.request.contextPath}/mypage/mypageMember.do">Mypage</a></li>						
						<li><a class="topLoginBtn"onclick="outclick();">Logout</a></li>															
						</c:otherwise>
						</c:choose>				
					</ul>
				</div>
			</div>
			<!-- 로그인DIV -->
				<div id="loginDiv" style="display: none;margin-left: 900px;">
							  <div class="login-box">
							    <div class="lb-header">
							      <a href="#" class="active" id="login-box-link">Login</a>
							      <a href="#" id="signup-box-link">Sign Up</a>
							    </div>
							    
							    <!-- 로그인 -->
							    <div class="email-login">
							    <div class="social-login">
								
							       <a href="" class="faceBtn">Login with Facebook</a>
							      	
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
							        <input id="jId" type="email" placeholder="Email"/>
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
							<!-- 로그인 DIV end -->
		
		
		</nav>
		<!-- /end nav -->

	</div>
</header>