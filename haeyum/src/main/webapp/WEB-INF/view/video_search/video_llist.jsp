<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset='UTF-8'>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../include/common_top.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/searchVideo1.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/searchVideo2.css"
	type="text/css" />

<!-- <script src='http://cdn.jsdelivr.net/jquery.mixitup/latest/jquery.mixitup.min.js'></script> -->
<script src="${pageContext.request.contextPath}/js/searchVideo.js"></script>


<script>
  $(function() {
    $('#Container').mixItUp();
//     alert("5");
  });
    
  $(document).on("click","button", function() {
	  if (this.value == '1') {
// 	        alert("3");
	    $.ajax({
	      url: "${pageContext.request.contextPath}/list/bestVideo.json",
	      type: "POST",
	      datatype: "JSON",
	      success: function (data, status) {
// 	        alert(data);
	       	bestVideo();
	      },
	      fail:function(){
	      }
	    })
	  } else if (this.value == '2') {
// 	    alert("2");
	  }
	})
	var ch = true;
	function bestVideo(){
//     alert("4");
		if(ch){
		    var html ="";
		    html = "<li class='mix newyork'><img border='0' src='${pageContext.request.contextPath}/images/back.jpg' />";
		    $("#test").html(html);
		  ch = false;
		}
    $('#Container').mixItUp();
  }

// 	$("#1").removeClass().addClass("mix 1");
</script>

</head>
<body class="test">
	<%@include file="../include/topMenu.jsp"%>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<section class="stretch">

		<!-- control buttons -->
		<div class="row">
			<div class="small-12 columns small-centered">
				<fieldset class="controls">
					<div class="row">
						<!-- filter buttons -->
						<div class="small-8 columns" id="controlsfilter">
<!-- 							<label>Filter:</label> -->
							<button class="filter tiny round active" data-filter="all" value="1">최신순</button>
							<button class="filter tiny round" data-filter=".newyork" value="2">인기순</button>
						</div>


					</div>
				</fieldset>
			</div>
		</div>
		<div class="row">
			<!-- container for images -->
			<div class="small-12 columns small-centered">
				<div class="container" id="Container">
					<div class="container-inner">						
						<ul
							class="line-new small-block-grid-3 medium-block-grid-4 large-block-grid-5">
							<li class="mix newyork"><img border="0" src="${pageContext.request.contextPath}/images/back.jpg" /></li>
							<li class="mix newyork"><img border="0"
								src="${pageContext.request.contextPath}/images/back02.jpg" /></li>
							<li class="mix newyork"><img border="0"
								src="${pageContext.request.contextPath}/images/biglogo.png" /></li>
							<li class="mix newyork"><img border="0"
								src="http://placehold.it/1000x800" /></li>
							<li class="mix newyork"><img border="0"
								src="http://placehold.it/1000x800" /></li>
							<li class="mix newyork"><img border="0"
								src="http://placehold.it/1000x800" /></li>
							<li class="mix newyork"><img border="0"
								src="http://placehold.it/1000x800" /></li>
							<li class="mix newyork"><img border="0"
								src="http://placehold.it/1000x800" /></li>
							<li class="mix newyork"><img border="0"
								src="http://placehold.it/1000x800" /></li>	
						</ul>
					</div>
				</div>
			</div>
		</div>

	</section>
</body>
</html>