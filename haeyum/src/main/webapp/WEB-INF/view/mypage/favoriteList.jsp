<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'>
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/favoriteList.css" />
<title>혜;윰</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
<%@include file="../include/common_top.jsp"%>
</head>
<script>
$(document).ready(function(){

	callAjax();
})
	function callAjax(reqPage){
	
	$.ajax({
		url:"${pageContext.request.contextPath}/mypage/favoriteList.json",
		type:"POST",
		datatype:"JSON",
		data:{reqPage:reqPage}
	}).done(function(data,status){
		var pagevo = data.pagevo;
		var flist = data.flist;
		fList(flist);
		page(pagevo);
	})

function fList(flist){
	var Html="";
	
		Html+="<div class='row'>"
		Html+="<ul class='items'>"
	$.each(flist,function(index,value){
		Html+="<li>"
		Html+="<a href='../mindMap/view.do?lNo=" + flist[index].lNo + "'>"
		Html+="<figure>"
		Html+="<img style='height: 250px;' src='${pageContext.request.contextPath}/mainImg/" + flist[index].lRealFileName + "'/>"
		Html+="<h1 class='title'>" + flist[index].lNo + "&nbsp;" + flist[index].lTitle + "</h1>"
		Html+="<div class='description contentClass'>"+ flist[index].lContent + "</div>"
		Html+="</figure>"
		Html+="</a>"
		Html+="</li>"
	})
		Html+="</ul>"
		Html+="</div>"
		$("#favoriteBox").html(Html);
}

function page(pagevo){
	var Html="";

	  if(pagevo.reqPage == 1)
	    Html += "처음&nbsp;";
	  else
	    Html += "<a href = 'javascript:callAjax("+ 1 +");' >처음</a>&nbsp;"
	  
	  if(pagevo.start == 1)
	    Html += "◀&nbsp;";
	  else
	    Html += "<a href = 'javascript:callAjax("+ (pagevo.start-1) +");' >◀</a>&nbsp;"

		for(var i=pagevo.start;i<=pagevo.end;i++){
			if(i ==pagevo.reqPage){
				Html+="[" + (i) + "]"
					continue;
	}
		Html+="<a href='javascript:callAjax("+ (i) +");'>[" + (i) + "]</a>";
}
			$("#favoritePage").html(Html);
		
		Html = "";
		if(pagevo.end == pagevo.lastPage)
		  Html += "▶&nbsp;";
		else
		  Html += "<a href = 'javascript:callAjax("+ (pagevo.end+1) +");' >▶</a>&nbsp;"
		
		if(pagevo.reqPage == pagevo.lastPage)
		  Html += "마지막&nbsp;";
		else
		  Html += "<a href = 'javascript:callAjax("+ pagevo.lastPage +");' >마지막</a>&nbsp;"
		  
				$("#favoritePage").append(Html);
}

function move(reqPage){
	$.ajax({
		url:"${pageContext.request.contextPath}/mypage/favoriteList.json",
		type:"POST",
		datatype:"JSON",
		data:{reqPage:reqPage}
	}).done(function(data,status){
		var pagevo = data.pagevo;
		var flist = data.flist;
		page(pagevo);
		fList(flist);
	})
	}
}	

</script>
<body class="favoriteClass">
<%@include file="../include/topMenu.jsp"%>
<section class="stretch"> 


<div style="padding-top: 200px;"></div>
<div class="favForm" style="height: 1300px;">

<div class="mypagetitle">
Lecture favorites
</div>
<div id="favoriteBox" style="padding-bottom: 30px;"></div>
<div align='center' id='favoritePage'></div>
</div>
</section>

<div style="margin-top:-50px;">
<%@include file="../include/footer.jsp" %>
</div>


</body>
</html>