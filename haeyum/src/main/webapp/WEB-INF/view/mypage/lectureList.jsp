<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/lectureList.css" />
<title>Insert title here</title>
<%@include file="../include/common_top.jsp"%>

<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>

$(document).ready(function() { 

	(function ($) { 
		$('.tab ul.tabs').addClass('active').find('> li:eq(0)').addClass('current');
		
		$('.tab ul.tabs li a').click(function (g) { 
			var tab = $(this).closest('.tab'), 
				index = $(this).closest('li').index();
			
			tab.find('ul.tabs > li').removeClass('current');
			$(this).closest('li').addClass('current');
			
			tab.find('.tab_content').find('div.tabs_item').not('div.tabs_item:eq(' + index + ')').slideUp();
			tab.find('.tab_content').find('div.tabs_item:eq(' + index + ')').slideDown();
			
			g.preventDefault();
		} );
	})(jQuery);
		
	var flag =false;
	$("#sLecture").click(function(){
		$("#sLectureDiv").css("display","block");
			flag = true;
			
	})	
	
});


$(function() {
	  $(".expand").on( "click", function() {
	    $(this).next().slideToggle(100);
	    $expand = $(this).find(">:first-child");
	    
	    if($expand.text() == "+") {
	      $expand.text("-");
	    } else {
	      $expand.text("+");
	    }
	  });
	});
	


</script>
</head>
<body>
<%@include file="../include/topMenu.jsp"%>
<section class="stretch">

<div style="padding-top:300px;"></div>

<div class="tab">

<ul class="tabs">
		<li><a href="#">Regist Lecture</a></li>
		<li><a id="sLecture" href="#">Studied Lecture</a></li>

</ul>

<div class="tab_content">

<!-- Resist Lecture -->
<div class="tabs_item">
<h4>Regist Lecture List</h4>

<c:forEach var="list" items="${list}">
<div id="item-list">
<ul>
  <li>
    <a class="expand">
    <div class="right-arrow">+</div>
    <div><img class="icon"src="../images/videoImg.png"></div>
    <h2>${list.lNo}&nbsp;&nbsp;${list.lCategory}&nbsp;&nbsp;${list.lTitle}</h2>
    <span>${list.lRegDate}</span>
    </a>
    <div class="detail">
      <div>
      	
      		<span>${list.lContent}</span>
      </div><br/>
      
      <span class="btn btn-default">이동</span>
      <span class="btn btn-default">수정</span>
      <span class="btn btn-default">삭제</span>
    </div>
  </li>



</ul>
</div>
</c:forEach>
<div align="center" style="padding-top: 20px;">
<c:import url="/WEB-INF/view/mypage/pageNavi.jsp"></c:import>
</div>
</div>

<!-- Studied Lecture -->
<div class="tabs_item">
<h4>Studied Lecture List</h4>
<c:forEach var="wlist" items="${wlist}">
<div id="item-list">
<div id="sLectureDiv" style="display: none;">
<ul>
  <li>
    <a class="expand">
    <div class="right-arrow">+</div>
    <div style="width: 400px;">
    <div><img class="icon"src="../images/videoImg.png"></div>
    <h2>${wlist.wNo} ${wlist.lTitle}</h2>
    <span>${wlist.wStartDate}</span>
    <span>ddd</span><br/>
    </div>
    </a>

    <div class="detail">
      <div><span>뭐넣징</span>
      		<span>룰루랄라</span>
      </div>
     <br/>
     	<div>질문QnA</div>
    </div>
  </li>



</ul>
</div>
</div>
</c:forEach>
		
</div>
</div>



</div>
</section>
</body>
</html>