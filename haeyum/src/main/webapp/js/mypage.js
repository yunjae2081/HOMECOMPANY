


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

	
	

	