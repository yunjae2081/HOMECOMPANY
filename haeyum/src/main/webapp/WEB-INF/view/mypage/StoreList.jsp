<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/storeList.css" />
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

</script>
</head>
<body>
<%@include file="../include/topMenu.jsp"%>
<section class="stretch">

<div style="padding-top:300px;"></div>
<div style="box-sizing: border-box; width: 1000px; margin: 0 auto;padding-left:60px;">
<span class="toggler active" data-toggle="grid"><span class="entypo-layout"></span></span>
<span class="toggler" data-toggle="list"><span class="entypo-list"></span></span>

<ul class="products grid">
<c:forEach var="list" items="${list}">

  <li class="product-item">
    
     <span class="product-price list-only" style="font-style: italic; ">${list.sellNo}</span>
    <span class="product-name">${list.pName}</span>
    <span class="product-price grid-only">${list.pPrice}</span>
    <span class="grid-only">판매수량 :${list.sellCount}</span>
	<span class="grid-only">${list.pContent}</span>
	
	

    <div class="pull-right">
       <span class="list-only"style="margin-right: 20px;">판매수량 :${list.sellCount}</span>
       <span style="margin-right: 20px;">${list.pRegDate}</span>
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
<c:import url="/WEB-INF/view/mypage/pageNavi.jsp"></c:import>
</div>
</ul>
</div>


</section>
</body>
</html>