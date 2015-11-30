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
<%@include file="../include/storeSideMenu.jsp"%>
<link rel="stylesheet"href="${pageContext.request.contextPath}/css/storeSearch.css"type="text/css" />
<link rel="stylesheet"href="${pageContext.request.contextPath}/css/searchVideo.css"type="text/css" />
<link rel="stylesheet"href="${pageContext.request.contextPath}/css/lightbox.css"type="text/css" />
<link rel="stylesheet"href="${pageContext.request.contextPath}/css/storeSearch.css"type="text/css" />

<script src="${pageContext.request.contextPath}/js/searchVideo.js"></script>
<script>
var title = "${title}";

var flag = 0; // 인기순 0, 최신순 1 구분

var b_scroll = 0; // 인기순의 스토어 무한 스크롤
var b_scroll_no = 16; // 인기순의 가져오는 스토어의 갯수
var b_scroll_block = 0; // 인기순의 스토어 무한 스크롤 방지 해제(값이 있을 때)

var l_scroll = 0; // 최신순의 스토어 무한 스크롤
var l_scroll_no = 16; // 최신순의 가져오는 스토어의 갯수
var l_scroll_block = 0; // 최신순의 스토어 무한 스크롤 방지 해제(값이 있을 때)

$(document).on("click","button", function() {
  if (this.value == '1') { // 인기순의 버튼을 눌렀음
    flag = 0;
    b_scroll_no = 16; // 인기순의 버튼을 눌렀으니 다시 스토어 갯수 초기화
    b_scroll_block = 0; // 인기순의 버튼을 눌렀으니 무한 스크롤 방지 해제
    l_scroll_block = 0; // 최신순의 버튼을 눌렀으니 무한 스크롤 방지 해제
    $.ajax({
      url: "${pageContext.request.contextPath}/store/bestSearch.json",
      type: "POST",
      datatype: "JSON",
      data: {title:title},
      success: function (data, status) {
        b_scroll = 0;
        bestStore(data);
        boxAction();
      },
      fail:function(){
      }
    })
  } else if (this.value == '2') { // 최신순의 버튼을 눌렀음
    flag = 1;
    l_scroll_no = 16; // 최신순의 버튼을 눌렀으니 다시 스토어 갯수 초기화
    b_scroll_block = 0; // 인기순의 버튼을 눌렀으니 무한 스크롤 방지 해제
    l_scroll_block = 0; // 최신순의 버튼을 눌렀으니 무한 스크롤 방지 해제
    $.ajax({
      url: "${pageContext.request.contextPath}/store/latestSearch.json",
      type: "POST",
      datatype: "JSON",
      data: {title:title},
      success: function (data, status) {
        l_scroll = 0;
        latestStore(data);
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
		      url: "${pageContext.request.contextPath}/store/bestSearchExtend.json",
		      type: "POST",
		      datatype: "JSON",
		      data: {title:title, no:b_scroll_no},
		      success: function (data, status) {
		        b_scroll = 1;
		        
		        if(data != ""){
		          bestStore(data);
		        	boxAction();		        
		        }
		        else {// 인기순의 스토어를 더이상 가져 올 것이 없을 때
		          b_scroll_block = 1; // 값이 없으므로 무한 스크롤 방지
		        }
		      },
		      fail:function(){
		      }
		    })
		  }
		  else if(flag == 1){
		    $.ajax({
		      url: "${pageContext.request.contextPath}/store/latestSearchExtend.json",
		      type: "POST",
		      datatype: "JSON",
		      data: {title:title, no:l_scroll_no},
		      success: function (data, status) {
		        l_scroll = 1;
		        
		        if(data != ""){
		          latestStore(data);
		        	boxAction();		        
		        }
		        else {// 최신순의 스토어를 더이상 가져 올 것이 없을 때
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

function bestStore(data){ // 인기순 스토어 정렬
  var html = "";
  if(b_scroll == 0){ // 처음 인기순 버튼을 눌렀을 때 가져 올 값
    html ="<ul>";
  	$.each(data, function(index, value) {
    	  html += "<li><a class='normal' href='${pageContext.request.contextPath}/store/storeDetail.do?no=" + data[index].no + "'><img src='${pageContext.request.contextPath}/itemImg/" + data[index].fileName + "' /></a><div class='info'>"
      	html += "<h3>" + data[index].name + "</h3>"
      	html += "<br />"      	
      	html += "<p>" + data[index].price + "</p>"
     	 	html += "<p>" + data[index].content + "</p></div></li>"
  	})
 	 	html += "</ul>";
    	  $(".box-list-wrap").html(html);
	}
  else if(b_scroll == 1){ // 무한 스크롤로 가져 올 값
    $.each(data, function(index, value) {
  	  html += "<li><a class='normal' href='${pageContext.request.contextPath}/store/storeDetail.do?no=" + data[index].no + "'><img src='${pageContext.request.contextPath}/itemImg/" + data[index].fileName + "' /></a><div class='info'>"
    	html += "<h3>" + data[index].name + "</h3>"
    	html += "<br />"
    	html += "<p>" + data[index].price + "</p>"
   	 html += "<p>" + data[index].content + "</p></div></li>"
	})
			b_scroll_no += 8; // 다음 가져올 데이터의 첫번째 수
  	  $(".box-list-wrap > ul").append(html);
	}
}

function latestStore(data){ // 최신순 스토어 정렬
  var html = "";
  if(l_scroll == 0){ // 처음 최신순 버튼을 눌렀을 때 가져 올 값
    html ="<ul>";
  	$.each(data, function(index, value) {
    	  html += "<li><a class='normal' href='${pageContext.request.contextPath}/store/storeDetail.do?no=" + data[index].no + "'><img src='${pageContext.request.contextPath}/itemImg/" + data[index].fileName + "' /></a><div class='info'>"
      	html += "<h3>" + data[index].name + "</h3>"
      	html += "<br />"
      	html += "<p>" + data[index].price + "</p>"
     	 	html += "<p>" + data[index].content + "</p></div></li>"
  	})
 	 	html += "</ul>";
    	  $(".box-list-wrap").html(html);
	}
  else if(l_scroll == 1){ // 무한 스크롤로 가져 올 값
    $.each(data, function(index, value) {
  	  html += "<li><a class='normal' href='${pageContext.request.contextPath}/store/storeDetail.do?no=" + data[index].no + "'><img src='${pageContext.request.contextPath}/itemImg/" + data[index].fileName + "' /></a><div class='info'>"
    	html += "<h3>" + data[index].name + "</h3>"
    	html += "<br />"
    	html += "<p>" + data[index].price + "</p>"
   	 html += "<p>" + data[index].content + "</p></div></li>"
	})
			l_scroll_no += 8; // 다음 가져올 데이터의 첫번째 수
  	  $(".box-list-wrap > ul").append(html);
	}
}

$(document).ready(function(){
  $(".search-wrapper input").on("mouseenter", function(){
      $(".search-wrapper button").css("background-color", "#4aba10");
  });
	$(".search-wrapper input").on("mouseenter", function(){
      $(".search-wrapper button").css("background-color", "" );
   });
});

//search
function nullCheck(){
    if($("#title").val()  == ""){
      return false;
    }
    else{
      return true;
    }
  }
  

  
$(document).on("click", "#ttte",function() {
  document.forms["searchForm"].submit();
})


</script>

</head>
<body class="background-white">
<%@include file="../include/topMenu.jsp" %>

<section class="stretch box-slide" style="margin-top:200px; height:auto;">  
	
	<div class="box-list-btn">  
      <ul>
         <li><button type="button" value="1">인기순</button></li>
         <li><button type="button" value="2">최신순</button></li>
        
      <li style="float: right;">
      	<form id = "searchForm" class="search-wrapper cf" action="${pageContext.request.contextPath}/store/search.do" method="GET" onsubmit="return nullCheck()" >
        	<input id="title" name="title" type="text" placeholder="Search">
        	<button type="submit" id = "ttte">
        		<span class="fontawesome-search"></span>
        	</button>
				</form>
      </li>
      
      </ul>
   
   
   
   </div>
		
<div class='container-inner'>
	
	<div class="box-list-wrap">
		<ul>
		<c:forEach var="item" items="${list }">
			<li>
				<a class='normal' href="${pageContext.request.contextPath}/store/storeDetail.do?no=${item.no }" >
					<img class="imgBtn" src="${pageContext.request.contextPath}/itemImg/${item.fileName }" />
				</a>
				<div class='info'>
					<h3>${item.name }</h3>
					<br />
					<p>${item.price } 원</p>
					<p>${item.content }</p>
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