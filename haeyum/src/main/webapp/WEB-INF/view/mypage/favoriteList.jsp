<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/favoriteList.css" />
<title>Favorite List</title>
<%@include file="../include/common_top.jsp"%>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>

</script>
</head>
<body style="overflow: hidden;">
<%@include file="../include/topMenu.jsp"%>
<section class="stretch"> 

<div style="padding-top: 300px;"></div>
<div style="margin-left:200px;padding-top:100px; background-color:#fff; width:1200px;height:100%;">
<c:forEach var="list" items="${list}">
	${list.lTitle}
</c:forEach>


<br/></br>





</div>
<div align="center" style="padding-top: 20px;">
<c:import url="/WEB-INF/view/mypage/pageNavi.jsp"></c:import></div>
</section>



</body>
</html>