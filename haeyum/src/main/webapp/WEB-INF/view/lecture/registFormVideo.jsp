<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file = "../include/common_top.jsp" %>
<link rel="styleSheet" href="${pageContext.request.contextPath}/css/video.css" />
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/video.js"></script>
</head>
<body>
	<%@ include file="../include/topMenu.jsp" %>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<section class="stretch">
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<div class = "backDrop">	</div>
	<div class = "box">
		<div class="largeImage" >
		
			<div class="popup-div">
			
  			<div class="mat-div">
		   	 	<label for="first-name" class="mat-label">Title</label>
   				<input type="text" id="v_store_title" class="mat-input" id="first-name">
  			</div>
  
 			  <div class="mat-div">
 	 			  <label for="first-name" class="mat-label">Content</label>
 	 		 		<textarea rows="2" id="v_store_content" class="mat-input" id="last-name"></textarea>
 		 		</div>

  		  <div class="mat-div">
  		 	  <label for="address" class="mat-label">price/count (원 "/" 개)</label>
 	 	 		 	<input type="text" class="mat-input" id="v_store_pac" >
	 		  </div>
	  
  			<div class="img-div"><img id="store_img_1" src="${pageContext.request.contextPath}/images/png12.png" style="width: 90px; height: 90px;"></div>
 			  <div class="img-div"><img id="store_img_2" src="${pageContext.request.contextPath}/images/png12.png" style="width: 90px; height: 90px;"></div>
		 	  <div class="img-div"><img id="store_img_3" src="${pageContext.request.contextPath}/images/png12.png" style="width: 90px; height: 90px;"></div>
		 	  <div class="img-div"><img id="store_img_4" src="${pageContext.request.contextPath}/images/png12.png" style="width: 90px; height: 90px;"></div>
				
				<div class="store_image_hidden">
	  			<input type="file" id = "store_file_1" style="display: block;" onchange="selectImage(1)"/>
	  			<input type="file" id = "store_file_2" style="display: none;" onchange="selectImage(2)"/>
	  			<input type="file" id = "store_file_3" style="display: none;" onchange="selectImage(3)"/>
	  			<input type="file" id = "store_file_4" style="display: none;" onchange="selectImage(4)"/>
				</div>
				
				<div id='store_save' class='round-save-button' style="margin-right: 185px;">ok</div>
			</div>
		</div>
	<img class="close" src="${pageContext.request.contextPath}/images/close.jpg" />
	</div>
	
	<div class = "vView">
		
		<div class="file-upload">
			<div class="file-select">
				<div class="file-select-button" id="fileName">Choose File</div>
				<div class="file-select-name" id="noFile">No file chosen...</div>
				<input id="chooseFile"type="file" name="chooseFile" accept="vdeio/*">
			</div>
		</div>
		
		<div class="vTool" id="vTool">
	
			<div class="vDiv">
				<svg id="vSVG" class="vCanvas" width = "730" height = "445" xmlns="http://www.w3.org/2000/svg">
				</svg>
<!-- 				<canvas class="vCanvas" id="vCanvas" width = "730" height = "445"></canvas> -->
				
				<div class="lessonArea" id="lessonArea">
				</div>
				
				<video id="myVideo" loop="loop" autoplay="autoplay" width="730" height="445" >
<%-- 					<source src="${pageContext.request.contextPath}/images/standing.mp4" /> --%>
				</video>
				<div class="control-bar">
					<div class="control-bar-in">
						<canvas class="pCanvas" id="pCanvas" width="700" height="3"></canvas>
					</div>
					
					<div class="videobottom">
						
						<div class="controls">
						
							<div class="control-play-button" id="control-play-button">
								<div class="play-button" id="play-button">
									<img alt="" src="${pageContext.request.contextPath}/images/pause.png" style="width: 20px; height:20px; ">
								</div>
							</div>
							
							<div class="control-vol-button">
								<div class="vol-button">
									<img src="${pageContext.request.contextPath}/images/speaker100.png" style="width: 20px; height:20px;" />
								</div>
							</div>
							
							<div class="control-playTime-div">
								<div class="playTime-div">
									<span id="playTime-span" style="color: white;"></span>
								</div>
							</div>
							
							<div>
								<div class="control-full-button">
									<div class="full-button">
										<img src="${pageContext.request.contextPath}/images/switch27.png" style="width: 25px; height:20px;" />
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
			
			<div class="lessonDiv">
				<article>
					<ul id="l_ul">
						<li id="li_1">
    							<div id="round-add-button" class="round-add-button">+</div>
						</li>
						
					</ul>
				</article>
			</div>
		
			<div class="itemsDiv">
				<article>
					<ul id="i_ul">
						<li id="i_li_1">
    						<div id="i_round-add-button" class="round-add-button">+</div>
						</li>
					</ul>
				</article>
			</div>
			
		</div>

		<div class="v-buttons">
  		<div id="v-comment" class="v-btn v-comment">One Point Lesson</div>
  		<div id="v-items" class="v-btn v-items">Add Items</div>
  		<div id="v-view" class="v-btn v-preview">Preview</div>
  		<div id="v-regist" class="v-btn v-regist">Registration</div>
		</div>
	</div>
	
	
	</section>
</body>
</html>