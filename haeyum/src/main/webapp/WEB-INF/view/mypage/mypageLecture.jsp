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
<script src="${pageContext.request.contextPath}/js/mypageLecture.js"></script>
<script>
$(document).ready(function(){
		callAjax(1);
})

function callAjax(tabNum,reqPage){
	$.ajax({
		url:"${pageContext.request.contextPath}/mypage/lectureList.json",
		type:"POST",
		datatype:"JSON",
		data:{tabNumber:tabNum, reqPage:reqPage}
		}).done(function(data,status){
			var pagevo = data.pagevo;
			
			if (tabNum == 1) {
				var llist = data.llist;
				lList(llist);
				page(pagevo,tabNum);
			}else {
				var wlist = data.wlist;
				wList(wlist);
				page(pagevo, tabNum);
			}
	})
}

function lList(llist){
	var Html="";
		Html+="<h4>Regist Lecture List</h4>";
	$.each(llist,function(index,value){
		Html+="<div id='item-list'>"
		Html+="<ul>"
		Html+="<li>"
		Html+="<a class='expand'>"
		Html+="<div class='right-arrow'>+</div>"
		Html+="<div><img class='icon'src='../images/studyImg.png'></div>"
		Html+="<h2>" + llist[index].lNo + "&nbsp;&nbsp;" + llist[index].lCategory + "&nbsp;&nbsp;" + llist[index].lTitle + "</h2>"
		Html+="<span>" + llist[index].lRegDate + "</span>"
		Html+="</a>"
		Html+="<div class='detail'>"
		Html+="<div>"
		Html+="<span>" + llist[index].lContent + "</span>"
		Html+="</div><br/>"
		Html+="<span>"
		Html+="<a href='#'>"
		Html+="<img src='../images/moveIcon.png' style='height: 20px;margin-top: 5px;margin-right: 5px;'>"
		Html+="</a>"
		Html+="</span>"
		Html+="<span>"
		Html+="<a href='#'>"
		Html+="<img src='../images/modifyIcon.png' style='height: 20px;margin-top: 5px;'>"
		Html+="</a>"           
		Html+="</span>"
		Html+="<span>"
		Html+="<a href='#'>"
		Html+="<img src='../images/deleteIcon.png' style='height: 20px;margin-top: 5px;'>"
		Html+="</a>"
		Html+="</span>"
		Html+="</div>"
		Html+="</li>"
		Html+="</ul>"
		Html+="</div>"
	})
		Html+="<br/>"
		Html+="<br/>"
		Html+="<div align='center' id='registPage'></div>";
	$("#registBox").html(Html);
	
}

function wList(wlist){
	var Html="";
	
		Html+="<h4>Studied Lecture List</h4>"
	$.each(wlist,function(index,value){
		Html+="<div id='item-list'>"
		Html+="<ul>"
		Html+="<li>"
		Html+="<a class='expand'>"
		Html+="<div class='right-arrow'>+</div>"
		Html+="<div style='width: 400px;'>"
		Html+="<div><img class='icon'src='../images/studyImg.png'></div>"
		Html+="<h2>" + wlist[index].lNo + "&nbsp;&nbsp;" + wlist[index].lTitle+ "</h2>"
		Html+="<span>"+ wlist[index].lRegDate+ "</span>"
		Html+="<span></span><br/>"
		Html+="</div>"
		Html+="</a>"
		Html+="<div class='detail'>"
		Html+="<div><span>"+ wlist[index].lContent+ "</span>"
		Html+="<span>내용</span>"
		Html+="</div>"
		Html+="<br/>"
		Html+="<div>질문QnA</div>"
		Html+="</div>"
		Html+="</li>"
		Html+="</ul>"
	})
		Html+="<br/>"
		Html+="<br/>"
		Html+="<div align='center' id='studiesPage'></div>"
	$("#studiesBox").html(Html);
}


function page(pagevo,tabNum){
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
			$("#registPage").html(Html);
		} else {
			$("#studiesPage").html(Html);
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
				$("#registPage").append(Html);
			} else {
				$("#studiesPage").append(Html);
			}
}
function move(tabNum,reqPage){
	$.ajax({
		url:"${pageContext.request.contextPath}/mypage/lectureList.json",
		type:"POST",
		datatype:"JSON",
		data:{tabNumber:tabNum, reqPage:reqPage}
		}).done(function(data,status){
			if(tabNum==1){				
				var pagevo=data.pagevo;
				var llist = data.llist;
				page(pagevo);
				lList(llist);
			}else{
				var pagevo=data.pagevo;
				var wlist = data.wlist;
				page(pagevo);
				wList(wlist);
			}
		})
}

$(document).on("click","#registBtn",function(){
	callAjax(1);
})

$(document).on("click","#studiedBtn",function(){
	callAjax(2);
})

</script>
</head>
<body class="lectureClass" >
<%@include file="../include/topMenu.jsp"%>
<section class="stretch">

<div style="padding-top: 200px;"></div>
<div class="lectureForm">

<div class="mypagetitle">
Lecture
</div>

<div class="tab">

<ul class="tabs">
		<li><a id="registBtn" href="#">Regist Lecture</a></li>
		<li><a id="studiedBtn" href="#">Studied Lecture</a></li>

</ul>

<div class="tab_content">

<!-- Resist Lecture -->
<div class="tabs_item" id = "registBox">




</div>

<!-- Studied Lecture -->
<div class="tabs_item" id="studiesBox">




</div>
</div>
</div>


</div>
</section>

<div style="margin-top:-130px;">
<%@include file="../include/footer.jsp" %>
</div>


</body>
</html>