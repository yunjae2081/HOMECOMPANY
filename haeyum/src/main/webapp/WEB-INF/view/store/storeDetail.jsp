<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../include/common_top.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/storeDetail.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/purchase.css" type="text/css" />

</head>
<body>
<%@include file="../include/storeSideMenu.jsp" %>
	<%@include file="../include/topMenu.jsp" %>
<script src="${pageContext.request.contextPath}/js/avgrund.js"></script>


<script>
console.dir($.fn.avgrund);
</script>
	
	<div class="body" style="padding-top: 140px">
		<div class="bodyWrap">    
    <div class="productStage" style="margin-bottom: 100px">
        <div class="folderTab clearFix">
    <div class="breadCrumbs">
      <a href="${pageContext.request.contextPath}/side/video.do?category=${cate.lCategory}">${cate.cateName}</a> > 
      <a href="${pageContext.request.contextPath}/mindMap/view.do?lNo=${lecture.lNo}">${lecture.lTitle}</a>
    </div></div>
  <div class="botBorder clearFix">
      <div class="productImage">
      	<span class="productBigImage">
        <img src="${pageContext.request.contextPath}/itemImg/${prdImg[0].realFileName}">
        </span>
        
        <div class="productSmallImage" style="padding-right: 20px;">
          <ul class="imageList">
          	<c:choose>
          		<c:when test="${empty prdImg[1].realFileName}">
            		<li><a href="#"><img src="${pageContext.request.contextPath}/images/png12.png"></a></li>
          		</c:when>
          		<c:otherwise>
		            <li><a href="#"><img src="${pageContext.request.contextPath}/itemImg/${prdImg[1].realFileName}"></a></li>
          		</c:otherwise>
            </c:choose>
          	<c:choose>
          		<c:when test="${empty prdImg[2].realFileName}">
            		<li><a href="#"><img src="${pageContext.request.contextPath}/images/png12.png"></a></li>
          		</c:when>
          		<c:otherwise>
		            <li><a href="#"><img src="${pageContext.request.contextPath}/itemImg/${prdImg[2].realFileName}"></a></li>
          		</c:otherwise>
            </c:choose>
          	<c:choose>
          		<c:when test="${empty prdImg[3].realFileName}">
            		<li><a href="#"><img src="${pageContext.request.contextPath}/images/png12.png"></a></li>
          		</c:when>
          		<c:otherwise>
		            <li><a href="#"><img src="${pageContext.request.contextPath}/itemImg/${prdImg[3].realFileName}"></a></li>
          		</c:otherwise>
            </c:choose>
          </ul>
          </div>
      </div>
      <div class="overview">
        <h1>${pVo.pName}</h1>
        <h2>${pVo.pId}</h2>
        <h3>${pVo.pPrice}&#8361;</h3>
        <br/><br/><br/>

		<div class="prdCount">수량 : <input type="number" step="1" min="1" max="${pVo.pCount}" value="1" style="width: 40px"/> / ${pVo.pCount}</div>
        <div class="button add" id="show">상품 구매</div>
	</div>
	
        
<script src="${pageContext.request.contextPath}/js/purchase.js">
</script>        
                   
      </div>
        
     <div class="info">
          <h3>상품 상세 설명</h3>
          <ul class="specs">
          	<li>
         	 <br/>
          	 ${pVo.pContent}
          	</li>
          </ul>
        
       </div> 
        
       
     </div>
    </div> 
      
    <div class="sidebar slim">
          
      <div class="folderTab sub clearFix">
        <h3>강의 다른 상품</h3>
      </div>
      <div class="botBorder">
      <c:forEach var="sideList" items="${sideList}" >
        <div class="product vtop slim">
            <a href="${pageContext.request.contextPath}/store/storeDetail.do?no=${sideList.pNO}">
               <div class="smallBox"><img src="${pageContext.request.contextPath}/itemImg/${sideList.realFileName}" style="width: 92px; height: 92px"></div>
               <span class="manuName">${sideList.pName}</span>
               <span class="prodName">${sideList.pPrice}&#8361;</span>
            </a>
        </div>
       </c:forEach>
      </div>    
          
    </div>
</div>
</body>
</html>