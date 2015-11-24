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
		/*
		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if($("#id").val()==""){
			alert("이메일을 입력해주세요.");
			return false;
		}else{
			if(!regEmail.test($("#id").val())){
				
			alert("이메일 형식이 맞지 않습니다.");
			$("#id").focus();
			return false;
			
			}
		}
		*/
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
			alert("이름을 입력해주세요.");
			$("#jName").focus();
			return false;
		}else if($("#jPassword").val==""){
			alert("패스워드 입력");
			$("#jPassword").focus();
			return false;		
		}else if($("#jPassword").val()!=$("#jPasswordChk").val()){
			alert("비밀번호가 맞지않다.");
			$("#jPasswordChk").focus();
			return false;
		}
		if($("#jId").val()==""){
			alert("이메일을 입력해주세요.");
			$("jId").focus();
			return false;
		}else{
			if(!regEmail.test($("#jId").val())){
				
			alert("이메일 형식이 맞지 않습니다.");
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