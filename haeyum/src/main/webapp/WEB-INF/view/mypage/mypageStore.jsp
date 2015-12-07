<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>혜;윰</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/storeList.css" />
<%@include file="../include/common_top.jsp"%>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/mypageStore.js"></script>
<script>

$(document).ready(function(){
	callAjax(1);
})

function callAjax(tabNum, reqPage) {
	$.ajax({
	url:"${pageContext.request.contextPath}/mypage/storeList.json",
	type:"POST",
	datatype:"JSON",
	data:{tabNumber:tabNum, reqPage:reqPage}
	}).done(function(data,status){
		var pagevo=data.pagevo;
		
		if (tabNum == 1) {
			var slist = data.slist;
			sList(slist);
			page(pagevo,tabNum);
		}else {
			var blist = data.blist;
			bList(blist);
			page(pagevo, tabNum);
		}
	})
}

function sList(slist){
	var Html="";

	$.each(slist,function(index,value){
		Html+="<li class='product-item'>"
		Html+="<span class='product-price list-only' style='font-style: italic; '>" + slist[index].sellNo + "</span>"
		Html+="<span class='product-name'>" + slist[index].pName + "</span>"
		Html+="<span class='product-price grid-only'>판매 가격 : " + slist[index].pPrice + "원</span>"
		Html+="<span class='grid-only' style='margin-left: 50px;'>" + slist[index].pRegDate + "</span>"
		Html+="<br/>"
		Html+="<span class='grid-only'>판매 수량 : " + slist[index].sellCount + "</span>"
		Html+="<br/>"
		Html+="<span class='grid-only'>제품 내용 :<br/>" + slist[index].pContent + "</span>"
		Html+="<div class='pull-right'>"
		Html+="<span class='list-only'style='margin-right: 20px;font-size: 15px;'>판매수량 :" + slist[index].sellCount + "</span>"
		Html+="<span class='list-only' style='margin-right: 20px;font-size: 15px;'>" + slist[index].pRegDate + "</span>"
		Html+="<span class='product-progress'>"
		Html+="<span class='product-progress-labels'>"
		Html+="<span class='product-completes'>"
		Html+="<a href='../store/storeDetail.do?no=" + slist[index].pNo + "'>"
		Html+="<img src='../images/moveIcon.png' style='height: 30px;margin-top: 5px;margin-right: 5px;'>"
		Html+="</a>"
		Html+="</span>"
		Html+="<span class='product-completes'>"
		Html+="<a href='#'>"
		Html+="<img src='../images/modifyIcon.png' style='height: 30px;margin-top: 5px;'>"
		Html+="</a>"           
		Html+="</span>"
		Html+="<span class='product-completes'>"
		Html+="<a href='#'>"
		Html+="<img src='../images/deleteIcon.png' style='height: 30px;margin-top: 5px;'>"
		Html+="</a>"
		Html+="</span>"
		Html+="</span>"
		Html+="</span>"
		Html+="</div>"
		Html+="</li>"
	})
	
	$("#sellBox").html(Html);
}

function bList(blist){
	var Html="";
	
	$.each(blist,function(index,value){
		Html+="<li class='product-item'>"
		Html+="<span class='product-price list-only' style='font-style: italic; '>" + blist[index].buyNo + "</span>"
		Html+="<span class='product-name'>" + blist[index].pName + "</span>"
		Html+="<span class='product-price grid-only'>판매 가격 : " + blist[index].pPrice + " 원</span>"
		Html+="<span class='grid-only' style='margin-left: 50px;'>" + blist[index].buyDate + "</span>"
		Html+="<br/>"
		Html+="<span class='grid-only'>구매 수량 : " + blist[index].buyCount + "</span>"
		Html+="<br/>"
		Html+="<span class='grid-only'>제품 내용 :<br/>" + blist[index].pCount + "</span>"
		Html+="<div class='pull-right'>"
		Html+="<span class='list-only'style='margin-right: 20px;font-size: 15px;'>구매수량 :" + blist[index].bCount + "</span>"
		Html+="<span class='list-only' style='margin-right: 20px;font-size: 15px;'>" + blist[index].buyDate + "</span>"
		Html+="<span class='product-progress'>"
		Html+="<span class='product-progress-labels'>"
		Html+="<span class='product-completes'>"
		Html+="<a href='../store/storeDetail.do?no=" + blist[index].pNo + "'>"
		Html+="<img src='../images/moveIcon.png' style='height: 30px;margin-top: 5px;margin-right: 5px;'>"
		Html+="</a>"
		Html+="</span>"
		Html+="<span class='product-completes'>"
		Html+="<a href='#'>"
		Html+="<img src='../images/modifyIcon.png' style='height: 30px;margin-top: 5px;'>"
		Html+="</a>"     
		Html+="</span>"
		Html+="<span class='product-completes'>"
		Html+="<a href='#'>"
		Html+="<img src='../images/deleteIcon.png' style='height: 30px;margin-top: 5px;'>"
		Html+="</a>"
		Html+="</span>"
		Html+="</span>"
		Html+="</span>"
		Html+="</div>"
		Html+="</li>"
	})
	$("#buyBox").html(Html);
}

function page(pagevo, tabNum){
	var Html="";
	
	 	  if(pagevo.reqPage == 1)
		    Html += "처음&nbsp;";
		  else
		    Html += "<a href = 'javascript:callAjax(" + tabNum + ","+ 1 +");' >처음</a>&nbsp;"
		  
		  if(pagevo.start == 1)
		    Html += "◀&nbsp;";
		  else
		    Html += "<a href = 'javascript:callAjax(" + tabNum + ","+ (pagevo.start-1) +");' >◀</a>&nbsp;"

	for(var i=pagevo.start;i<=pagevo.end;i++){
		if(i ==pagevo.reqPage){
			Html+="[" + (i) + "]"
			continue;
		}
			Html+="<a href='javascript:callAjax(" + tabNum + ","+ (i) +");'>[" + (i) + "]</a>";
	}
	if(tabNum == 1) {
		$(".sellPage").html(Html);
	} else {
		$(".buyPage").html(Html);
	}
	
	  Html = "";
	  if(pagevo.end == pagevo.lastPage)
	    Html += "▶&nbsp;";
	  else
	    Html += "<a href = 'javascript:callAjax(" + tabNum + ","+ (pagevo.end+1) +");' >▶</a>&nbsp;"

    if(pagevo.reqPage == pagevo.lastPage)
	    Html += "마지막&nbsp;";
	  else
	    Html += "<a href = 'javascript:callAjax(" + tabNum + ","+ pagevo.lastPage +");' >마지막</a>&nbsp;"
	    
		if(tabNum == 1) {
			$(".sellPage").append(Html);
		} else {
			$(".buyPage").append(Html);
		}
		
	    
	  
}

function move(tabNum, reqPage){
	$.ajax({
		url:"${pageContext.request.contextPath}/mypage/storeList.json",
		type:"POST",
		datatype:"JSON",
		data:{tabNumber:tabNum, reqPage:reqPage}
		}).done(function(data,status){
			if(tabNum == 1) {
				var pagevo=data.pagevo;
				var slist = data.slist;
				page(pagevo);
				sList(slist);
			} else {
				var pagevo=data.pagevo;
				var blist = data.blist;
				page(pagevo);
				bList(blist);
			}
		})
	
	
}

$(document).on("click", "#sellBtn", function(){
	callAjax(1);
})

$(document).on("click", "#buyBtn", function(){
	callAjax(2);
})

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
		<li><a id="sellBtn" href="">SELL</a></li>
		<li><a id="buyBtn" href="">BUY</a></li>
</ul>

<div class="tab_content">
<div class="tabs_item">

<h4>판매 List</h4>

<div style="box-sizing: border-box; width: 1000px; margin: 0 auto;">
<span class="toggler active" data-toggle="grid"><span class="entypo-layout"></span></span>
<span class="toggler" data-toggle="list"><span class="entypo-list"></span></span>

<ul class="products grid" id="sellBox"></ul>
<div class="sellPage"></div>

</div>

</div>

<div class="tabs_item">
<h4>구매 List</h4>

<div style="box-sizing: border-box; width: 1000px; margin: 0 auto;">
<span class="toggler active" data-toggle="grid"><span class="entypo-layout"></span></span>
<span class="toggler" data-toggle="list"><span class="entypo-list"></span></span>

<ul class="products grid" id="buyBox"></ul>
<div class="buyPage" align="center"></div>


</div>

</div>

</div>

</div>

</div>

<div style="margin-top:900px; margin-left: -202px;">
<%@include file="../include/footer.jsp" %>
</div>
</section>
</body>
</html>