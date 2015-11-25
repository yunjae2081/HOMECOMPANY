<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/storeList.css" />
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/lectureList.css" />
<%@include file="../include/common_top.jsp"%>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>

(function () {
    $(function () {
        return $('[data-toggle]').on('click', function () {
            var toggle;
            toggle = $(this).addClass('active').attr('data-toggle');
            $(this).siblings('[data-toggle]').removeClass('active');
            return $('.products').removeClass('grid list').addClass(toggle);
        });
    });
}.call(this));


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
	
});




</script>
</head>
<body class="storeClass">
<%@include file="../include/topMenu.jsp"%>
<section class="stretch">


<div style="padding-top: 200px;"></div>
<div class="storeForm">

<div class="mypagetitle">
Store
</div>

<div class="tab">

<ul class="tabs">
		<li><a href="#">판매</a></li>
		<li><a href="#">구매</a></li>
</ul>


<div class="tab_content">

<div class="tabs_item">
<h4>판매 List</h4>

<div style="box-sizing: border-box; width: 1000px; margin: 0 auto;">
<span class="toggler active" data-toggle="grid"><span class="entypo-layout"></span></span>
<span class="toggler" data-toggle="list"><span class="entypo-list"></span></span>

<ul class="products grid">
<c:forEach var="list" items="${list}">

  <li class="product-item">
    
     <span class="product-price list-only" style="font-style: italic; ">${list.sellNo}</span>
    <span class="product-name">${list.pName}</span>
    <span class="product-price grid-only">판매 가격 : ${list.pPrice} 원</span>
    <span class="grid-only" style="margin-left: 50px;">${list.pRegDate}</span>
    <br/>
    <span class="grid-only">판매 수량 : ${list.sellCount}</span>
	<br/>
	<span class="grid-only">제품 내용 :<br/>${list.pContent}</span>
	
	

    <div class="pull-right">
       <span class="list-only"style="margin-right: 20px;">판매수량 :${list.sellCount}</span>
       <span class="list-only" style="margin-right: 20px;">${list.pRegDate}</span>
      <span class="product-progress">
       
        <span class="product-progress-labels">
			 <span class="product-completes btn btn-default">이동</span>
          <span class="product-completes btn btn-default">수정</span>
           <span class="product-completes btn btn-default">삭제</span>
        </span>
      </span>
      
     
    </div>
  </li>
</c:forEach>

<div align="center" style="padding-top: 20px;">
<c:import url="/WEB-INF/view/mypage/pageNavi.jsp"></c:import></div>
</ul>
</div>

</div>

<div class="tabs_item">
<h4>구매 List</h4>

<div style="box-sizing: border-box; width: 1000px; margin: 0 auto;padding-left:20px;">
<span class="toggler active" data-toggle="grid"><span class="entypo-layout"></span></span>
<span class="toggler" data-toggle="list"><span class="entypo-list"></span></span>

<ul class="products grid">
<c:forEach var="list" items="${list}">

  <li class="product-item">
    
     <span class="product-price list-only" style="font-style: italic; ">${list.sellNo}</span>
    <span class="product-name">${list.pName}</span>
    <span class="product-price grid-only">판매 가격 : ${list.pPrice} 원</span>
    <span class="grid-only" style="margin-left: 50px;">${list.pRegDate}</span>
    <br/>
    <span class="grid-only">판매 수량 : ${list.sellCount}</span>
	<br/>
	<span class="grid-only">제품 내용 :<br/>${list.pContent}</span>
	
	

    <div class="pull-right">
       <span class="list-only"style="margin-right: 20px;">판매수량 :${list.sellCount}</span>
       <span class="list-only" style="margin-right: 20px;">${list.pRegDate}</span>
      <span class="product-progress">
       
        <span class="product-progress-labels">
			 <span class="product-completes btn btn-default">이동</span>
          <span class="product-completes btn btn-default">수정</span>
           <span class="product-completes btn btn-default">삭제</span>
        </span>
      </span>
      
     
    </div>
  </li>
</c:forEach>

<div align="center" style="padding-top: 20px;">
<c:import url="/WEB-INF/view/mypage/pageNavi.jsp"></c:import></div>
</ul>
</div>

</div>



</div>
</div>

</div>
</section>
</body>
</html>