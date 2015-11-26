<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset='UTF-8'>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../include/common_top.jsp"%>
<%@include file="../include/searchSideMenu.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/searchVideo.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/lightbox.css"
	type="text/css" />

<script src="${pageContext.request.contextPath}/js/searchVideo.js"></script>
<script src="${pageContext.request.contextPath}/js/lightbox.js"></script>
<script>

var flag = 0; // 인기순 0, 최신순 1 구분

var b_scroll = 0; // 인기순의 비디오 무한 스크롤
var b_scroll_no = 16; // 인기순의 가져오는 비디오의 갯수
var b_scroll_block = 0; // 인기순의 비디오 무한 스크롤 방지 해제(값이 있을 때)

var l_scroll = 0; // 최신순의 비디오 무한 스크롤
var l_scroll_no = 16; // 최신순의 가져오는 비디오의 갯수
var l_scroll_block = 0; // 최신순의 비디오 무한 스크롤 방지 해제(값이 있을 때)

$(document).on("click","button", function() {
  if (this.value == '1') { // 인기순의 버튼을 눌렀음
    flag = 0;
    b_scroll_no = 16; // 인기순의 버튼을 눌렀으니 다시 비디오 갯수 초기화
    b_scroll_block = 0; // 인기순의 버튼을 눌렀으니 무한 스크롤 방지 해제
    l_scroll_block = 0; // 최신순의 버튼을 눌렀으니 무한 스크롤 방지 해제
    $.ajax({
      url: "${pageContext.request.contextPath}/store/bestProduct.json",
      type: "POST",
      datatype: "JSON",
      success: function (data, status) {
        b_scroll = 0;
        bestVideo(data);
        boxAction();
      },
      fail:function(){
      }
    })
  } else if (this.value == '2') { // 최신순의 버튼을 눌렀음
    flag = 1;
    l_scroll_no = 16; // 최신순의 버튼을 눌렀으니 다시 비디오 갯수 초기화
    b_scroll_block = 0; // 인기순의 버튼을 눌렀으니 무한 스크롤 방지 해제
    l_scroll_block = 0; // 최신순의 버튼을 눌렀으니 무한 스크롤 방지 해제
    $.ajax({
      url: "${pageContext.request.contextPath}/store/latestProduct.json",
      type: "POST",
      datatype: "JSON",
      success: function (data, status) {
        l_scroll = 0;
        latestVideo(data);
        boxAction();
      },
      fail:function(){
      }
    })
  }
  
});

$(document).ready(function(){
  boxAction();
  $(document).scroll(function() {
    if(b_scroll_block == 0 && l_scroll_block == 0){ // 모든 상황에서 무한 스크롤 방지 해제
		var scrollHeight = $(window).scrollTop() + $(window).height();
		var documentHeight = $(document).height();
		
		if(scrollHeight >= documentHeight){
		  if(flag == 0){
		    $.ajax({
		      url: "${pageContext.request.contextPath}/store/bestProductExtend.json",
		      type: "POST",
		      datatype: "JSON",
		      data: {no:b_scroll_no},
		      success: function (data, status) {
		        b_scroll = 1;
		        
		        if(data != ""){
		        	bestVideo(data);
		        	boxAction();		        
		        }
		        else {// 인기순의 비디오를 더이상 가져 올 것이 없을 때
		          b_scroll_block = 1; // 값이 없으므로 무한 스크롤 방지
		        }
		      },
		      fail:function(){
		      }
		    })
		  }
		  else if(flag == 1){
		    $.ajax({
		      url: "${pageContext.request.contextPath}/store/latestProductExtend.json",
		      type: "POST",
		      datatype: "JSON",
		      data: {no:l_scroll_no},
		      success: function (data, status) {
		        l_scroll = 1;
		        
		        if(data != ""){
		        	latestVideo(data);
		        	boxAction();		        
		        }
		        else {// 최신순의 비디오를 더이상 가져 올 것이 없을 때
		          l_scroll_block = 1; // 값이 없으므로 무한 스크롤 방지
		        }
		      },
		      fail:function(){
		      }
		    })
		  }
		  
		}
		
	}});
});

function bestVideo(data){ // 인기순 비디오 정렬
  var html = "";
  if(b_scroll == 0){ // 처음 인기순 버튼을 눌렀을 때 가져 올 값
    html ="<ul>";
  	$.each(data, function(index, value) {
    	  html += "<li><a class='normal' href='#'><img src='${pageContext.request.contextPath}/images/storeImg/" + data[index].fileName + "' /></a><div class='info'>"
      	html += "<h3>" + data[index].title + "</h3>"
     	 	html += "<p>" + data[index].content + "</p></div></li>"
  	})
 	 	html += "</ul>";
    	  $(".box-list-wrap").html(html);
	}
  else if(b_scroll == 1){ // 무한 스크롤로 가져 올 값
    $.each(data, function(index, value) {
  	  html += "<li><a class='normal' href='#'><img src='${pageContext.request.contextPath}/images/storeImg" + data[index].fileName + "' /></a><div class='info'>"
    	html += "<h3>" + data[index].title + "</h3>"
   	 html += "<p>" + data[index].content + "</p></div></li>"
	})
			b_scroll_no += 8; // 다음 가져올 데이터의 첫번째 수
  	  $(".box-list-wrap > ul").append(html);
	}
}

function latestVideo(data){ // 최신순 비디오 정렬
  var html = "";
  if(l_scroll == 0){ // 처음 최신순 버튼을 눌렀을 때 가져 올 값
    html ="<ul>";
  	$.each(data, function(index, value) {
    	  html += "<li><a class='normal' href='#'><img src='${pageContext.request.contextPath}/images/storeImg" + data[index].fileName + "' /></a><div class='info'>"
      	html += "<h3>" + data[index].title + "</h3>"
     	 	html += "<p>" + data[index].content + "</p></div></li>"
  	})
 	 	html += "</ul>";
    	  $(".box-list-wrap").html(html);
	}
  else if(l_scroll == 1){ // 무한 스크롤로 가져 올 값
    $.each(data, function(index, value) {
  	  html += "<li><a class='normal' href='#'><img src='${pageContext.request.contextPath}/images/storeImg" + data[index].fileName + "' /></a><div class='info'>"
    	html += "<h3>" + data[index].title + "</h3>"
   	 html += "<p>" + data[index].content + "</p></div></li>"
	})
			l_scroll_no += 8; // 다음 가져올 데이터의 첫번째 수
  	  $(".box-list-wrap > ul").append(html);
	}
}
</script>

</head>
<body class="background-white">
<%@include file="../include/topMenu.jsp" %>

<section class="stretch box-slide" style="margin-top:200px; height:auto;">  
	
	<div class="box-list-btn">  
		<ul>
			<li><button type="button" value="1">인기순</button></li>
			<li><button type="button" value="2">최신순</button></li>
		</ul>
	</div>
<div class='container-inner'>
	
	<div class="box-list-wrap">
		<ul>
		<c:forEach var="video" items="${list }">
			<li>
				<a class='normal' href='#'>
					<img class="imgBtn" src="${pageContext.request.contextPath}/images/storeImg/${video.fileName }" />
				</a>
				<div class='info'>
					<h3>${video.title }</h3>
					<p>${video.content }</p>
				</div>
			</li>			
		</c:forEach>
		
    </ul>
	</div>
	
	<div class = "backDrop">	</div>
		<div class = "box" style="width:1200px; height:400px; position:absolute; left:50%; margin-left:-600px; background:red;">
			
			<img class="close" src="${pageContext.request.contextPath}/images/close.jpg" />
		</div>
</div>

 </section>  
</body>
</html>