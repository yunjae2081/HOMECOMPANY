<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'>
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/favoriteList.css" />
<title>Insert title here</title>
<%@include file="../include/common_top.jsp"%>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body class="favoriteClass">
<%@include file="../include/topMenu.jsp"%>
<section class="stretch"> 


<div style="padding-top: 200px;"></div>
<div class="favForm">

<div class="mypagetitle">
Lecture favorites
</div>

<c:forEach var="list" items="${list}">
<div class="row">
	<ul class="items">

		<li>
			<a href="#">
				<figure>
					<img style="height: 250px;" src="${pageContext.request.contextPath}/images/${list.lRealFileName}"/>
					<h1 class="title">${list.lNo}.&nbsp;${list.lTitle}</h1>
					<div class="description contentClass">
					강의내용${list.lContent}
					</div>
				</figure>
			</a>
			</li>
		<!-- 곧 지울것 -->
		<li>
			<a href="#">
				<figure>
					<img style="height: 250px;" src="${pageContext.request.contextPath}/images/${list.lRealFileName}"/>
					<h1 class="title">2.&nbsp;타이틀</h1>
					<div class="description contentClass">
					강의내용2
					</div>
				</figure>
			</a>
		</li>
		<li>
			<a href="#">
				<figure>
					<img style="height: 250px;" src="${pageContext.request.contextPath}/images/${list.lRealFileName}"/>
					<h1 class="title">3.&nbsp;타이틀</h1>
					<div class="description contentClass">
					강의내용3
					</div>
				</figure>
			</a>
		</li>
		<li>
			<a href="#">
				<figure>
					<img style="height: 250px;" src="${pageContext.request.contextPath}/images/${list.lRealFileName}"/>
					<h1 class="title">3.&nbsp;타이틀</h1>
					<div class="description contentClass">
					강의내용3
					</div>
				</figure>
			</a>
		</li>

		<!-- ///////////////////// -->
		
		
		
	</ul>
	</div>
		 
		
</c:forEach>










<div align="center" style="padding-top: 40px;padding-bottom: 40px;">
<c:import url="/WEB-INF/view/mypage/pageNavi.jsp"></c:import>
</div>

</div>
</section>


</body>
</html>