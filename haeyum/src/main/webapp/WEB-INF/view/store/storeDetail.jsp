<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../include/common_top.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/storeDetail.css" type="text/css" />
</head>
<body>
<%@include file="../include/storeSideMenu.jsp" %>
	<%@include file="../include/topMenu.jsp" %>
	<br/><br/><br/><br/><br/><br/><br/><br/>
	
	<div class="bodyWrap">    
    <div class="productStage">
        <div class="folderTab clearFix">
    <div class="breadCrumbs">
      <a href="#">카테고리</a> > 
      <a href="#">강의명</a> > 
    </div></div>
  <div class="botBorder clearFix">
      <div class="productImage">
        <img src="${pageContext.request.contextPath}/images/example.jpg" style="width: 300px; height: 300px;">
          <ul class="imageList">
            <li><a href="#"><img src="http://placehold.it/92x92"></a></li>
            <li><a href="#"><img src="http://placehold.it/92x92"></a></li>
            <li><a href="#"><img src="http://placehold.it/92x92"></a></li>
          </ul>
              <span><a href="#"><b>View More</b></a></span>
      </div>
      <div class="overview">
        <h1>[기타교본] 포인트 기타교본2</h1>
        <h2>편집부</h2>
        <h3>8,000원</h3>
        <br/>

        <div class="button add">장바구니</div>
        <div class="button wish">바로 결제</div>
                   
      </div>
        
     <div class="info">
          <h3>상품 상세 설명</h3>
          <ul class="specs">
          	<li>
         	 <br/>
          	 요요기요기요기요기요기요기요기
          	</li>
          </ul>
        
       </div> 
        
       
     </div>
    </div> 
      
    <div class="sidebar slim">
          
      <div class="folderTab sub clearFix">
        <h3>Related Kits</h3>
      </div>
      <div class="botBorder">
        <div class="product vtop slim">
            <a href="#">
               <div class="smallBox"><img src="http://placehold.it/92x92"></div>
               <span class="manuName">Product Group</span>
               <span class="prodName">Product Name</span>
            </a>
        </div>
          <div class="product vtop slim">
            <a href="#">
               <div class="smallBox"><img src="http://placehold.it/92x92"></div>
               <span class="manuName">Product Group</span>
               <span class="prodName">Product Name</span>
            </a>
        </div>
        <div class="product vtop slim">
            <a href="#">
               <div class="smallBox"><img src="http://placehold.it/92x92"></div>
               <span class="manuName">Product Group</span>
               <span class="prodName">Product Name</span>
            </a>
        </div>
        <div class="product vtop slim">
            <a href="#">
               <div class="smallBox"><img src="http://placehold.it/92x92"></div>
               <span class="manuName">Product Group</span>
               <span class="prodName">Product Name</span>
            </a>
        </div>
      </div>    
          
    </div>
</div>
</body>
</html>