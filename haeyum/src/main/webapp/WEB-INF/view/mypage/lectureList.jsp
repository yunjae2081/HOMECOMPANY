<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<%@include file="../include/common_top.jsp"%>
<style>

#item-list ul {
  padding: 0;
  padding-top:50px;
  margin:0 auto;
  width:1000px;

  font-family: Arial, sans serif;
  color: #555;
}

#item-list ul > li {
  list-style: none;
  border-top: 1px solid #ddd;
  display: block;
  padding: 15px;
  overflow: hidden;
}

#item-list ul:last-child {
  border-bottom: 1px solid #ddd;
}

#item-list ul > li:hover {
  background: #efefef;
}

.button {
  padding: 8px 12px;
  font-size: 14px;
  background: #ccc;
  display: block:
  width: 200px;
  border-radius: 3px;
  cursor: pointer;
}

.expand {
  display: block;
  text-decoration: none;
  color: #555;
  cursor: pointer;
}

h2 {
  padding: 0;
  margin: 0 0 5px 0;
  font-size: 18px;
}

span {
  font-size: 14px;
}

.detail {
  margin: 20px 0 0 0;
  display: none;
  line-height: 22px;
}

.right-arrow {
  width: 10px;
  height: 10px;
  float: left;
  font-weight: bold;
  font-size: 20px;
  margin: 15px 15px 0 0;
}

.icon {
  height: 50px;
  width: 50px;
  float: left;
  margin: 0 15px 0 0;
}



</style>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
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

<h2 style="padding-top: 200px;">등록한 강좌 list</h2>

<c:forEach var="list" items="${list}">
<div id="item-list">
<ul>
  <li>
    <a class="expand">
    <div class="right-arrow">+</div>
    <div class="icon london"></div>
    <h2>${list.lTitle}</h2>
    <span>${list.lCategory}</span>
    </a>
    
    <div class="detail">
      <div><span></span></div><br/>
      
      <span class="button">이동</span>
    </div>
  </li>
  
</ul>
</div>

</c:forEach>





</body>
</html>