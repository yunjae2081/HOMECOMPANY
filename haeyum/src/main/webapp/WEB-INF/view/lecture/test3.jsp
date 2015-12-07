<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file = "../include/common_top.jsp" %>
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/registLecture.css" />
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/mindMap.css" />
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/divStyle.css" />
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/input.css" />
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/video.css" />
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/video.js"></script>
<script src="${pageContext.request.contextPath}/js/mindMap.js"></script>
<script src="${pageContext.request.contextPath}/js/input.js"></script>
<script>
function openPop() {
  window.open("helpPop.do",
  	"searchPop",
  	"width=640, height=900, scrollbars=yes, resizable=false"
  );
}
</script>
</head>
<body style="background: #f1f1f1;">
<%@ include file="../include/topMenu.jsp" %>

<section class="stretch">
<div style="padding-top: 150px;"></div>
<div class="regForm" style="margin-bottom: 100px;">
<div class="topBanner">
			
				<div data-title="Create Yure Lecture" class="dialog-box_info" style="font-size: 17px;padding-top: 52px;line-height: 32px;">
				  <em></em>
				  혜;윰은 체계화 된 커리큘럼을 제작할 수 있도록 마인드 맵을 제공합니다. 각각의 노드마다 정보를 담을 수 있으며, 가장 큰 노드에는 챕터의 제목과 내용, 두번째 노드에는 각 절에대한 동영상을 등록할 수 있습니다. 등록된 동영상은 OnePointLesson을 통하여 편집을 할 수 있고, 동영상 마다 원하는 제품을 등록하여 판매 할 수 있습니다. 사용자는 이렇게 체계화된 마인드 맵 커리큘럼으로 원하는 강좌를 들을 수 있고, 또한 강좌에 나오는 제품이나 관련된 링크, 과제 등을 받아서 사용할 수 있습니다.
				<div class="helpBtn">
				<button type="button" onclick="openPop()" class="btn btn-success">도움말</button>
				
				</div>
				</div>


</div>
	
	<div class="lectureMakeId"> LECTURE CREATED BY&nbsp;&nbsp;&nbsp;&nbsp;<strong>${user.id}</strong>
</div>

<form id = "mapForm" action="${pageContext.request.contextPath}/lecture/regist.do" enctype="multipart/form-data" method="POST" onsubmit="return upload();">
<div class="redactor-div">
	<div class="redactor-title">Let's Begin...</div>
	<div class="redactor-inner">
		<fieldset class="span6 reset">
		  <div class="form_row">
		    <div class="input" id = "title"> 
		      <input placeholder="Fill out your lecture Title" type="text" id="name" name = "lTitle" required=""/>
		      <label for="name"> TITLE: <span class="blue">*</span></label>
		    </div>
		  </div>
		</fieldset>
		
		<div class="dropp">
		  <div class="dropp-header">
		    <span class="dropp-header__title js-value" style="margin-left:10px;margin-top:5px;">category</span>
		    <a href="#" class="dropp-header__btn js-dropp-action"><i class="icon"></i></a>
		  </div>
		  <div class="dropp-body">
		    <label for="optA">&nbsp;&nbsp;뷰티 & 패션<input type="radio" id="optA" name="lCategory" checked="checked" value="1"/></label>
		    <label for="optB">&nbsp;&nbsp;교과목<input type="radio" id="optB" name="lCategory" value="2"/></label>
		    <label for="optC">&nbsp;&nbsp;음악 & 공연<input type="radio" id="optC" name="lCategory" value="3"/></label>
		    <label for="optD">&nbsp;&nbsp;IT<input type="radio" id="optD" name="lCategory" value="4"/></label>
		    <label for="optE">&nbsp;&nbsp;미술 & 공예<input type="radio" id="optE" name="lCategory" value="5"/></label>
		    <label for="optF">&nbsp;&nbsp;스포츠<input type="radio" id="optF" name="lCategory" value="6"/></label>
		    <label for="optG">&nbsp;&nbsp;요리<input type="radio" id="optG" name="lCategory" value="7"/></label>
		    <label for="optH">&nbsp;&nbsp;외국어<input type="radio" id="optH" name="lCategory" value="8"/></label>
		    <label for="optI">&nbsp;&nbsp;게임<input type="radio" id="optI" name="lCategory" value="9"/></label>
		    <label for="optJ">&nbsp;&nbsp;Etc<input type="radio" id="optJ" name="lCategory" value="10"/></label>
		  </div>
		</div>

		<fieldset class="span12 reset">
		    <div class="form_row">
		      <div class="input">
		        <textarea placeholder="Fill out your Lecture Description" id="message" name = "lContent" cols="55" rows="7" required=""></textarea>
		        <label for="message">Description: <span class="blue">*</span></label>
		      </div>
		    </div>
		</fieldset>
	</div>
</div>
<div class = "mView" style="border: 2px solid #5893B0;">

<!-- 엑셀 업로드  -->
	<div class="curriculum">
		<div class="curr-realFile">
			<div class = "file-upload" id= "excelinput">
	   	 <div class="file-select">
	   	  <div class="file-select-button" id="fileName">EXCEL UPLOAD</div>
	 	    <div class="file-select-name" id="excelName">No file chosen...</div>
	 	    <input id="excelFile" type="file" name="excelFile" onchange="selectExcel();">
	 	   </div>
   	 </div>
   	</div>
	</div>
	<!-- 메뉴 HOVER DIV -->
	<div class = "menuDiv" id = "menuAddFNode">추가</div>
	<div class = "menuDiv" id = "menuAddSNode">자식 추가</div>
	<div class = "menuDiv" id = "menuRemove">삭제</div>

	<div class = "menuDiv" id = "menuAddLinkS">링크 추가</div>
	<div class = "menuDiv" id = "menuAddSubjectS">과제 추가</div>
	<div class = "menuDiv" id = "menuNodeRemoveS">삭제</div>
	
	<div class = "menuDiv" id = "menuTNodeRemove">삭제</div>
	
	<!-- 기본 FIRST NODE -->
	<div class = "fNode" id = "fNode1">STEP1</div>
	<div class = "menu" id = "addFNode1">+</div>
	<div class = "menu" id = "addSNode1">+</div>
	<div class = "menu" id = "remove1">-</div>
	<div class="bookmark-box" id = "fDiv1">
		<a class="boxclose" id="fDiv1" onclick="closeDiv(this)"></a>
		<div class="bookmark-title" id = "fWrite1" >
			<input type = "button" class = "nodeModifyBtn" onclick="fNodeWriteForm(this)" id = "fNodeForm1" style="float: right;"/>
			<input type = "hidden" id = "fTitle1" value = "STEP TITLE" style="color:black;" />
			<h3>STEP TITLE</h3>
		</div>
		<div class="description" id = "fContentForm1">
			<input type = "hidden" id = "fContent1" value = "Step Content"/>Step Content
		</div>
	</div>
	
	<!-- CANVAS -->
	<canvas class = "myCanvas" id = "myCanvas" width="1200" height="600">
	</canvas>
</div>
<!-- <input type = "button" onclick="checkArr()" value = "배열 확인"/> -->
<br/>
  <%@ include file="test.jsp" %>
  <fieldset class="span12 reset">
    <div class="form_row">
      <input class="more wider" type="submit" value="REGIST">
    </div>
  </fieldset>
  <div id = "dataDiv">
  </div>
</form>
</div>
</section>
<div style="margin-left: -50px;margin-top:790px; ">
<%@include file="../include/footer.jsp" %>
</div>
</body>
</html>