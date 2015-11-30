<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
@import url(http://fonts.googleapis.com/css?family=Roboto);
.text {
  width: 100%;
  text-align: center;
  height: 50px;
  line-height: 50px;
  font-size: 30px;
  position: absolute;
  top: 0;
  bottom: 0;
  margin: auto;
}
.text .content {
  display: inline;
}
.text .dash {
  display: inline-block;
  height: 3px;
  width: 20px;
  background-color: #3498db;
  animation: blink .5s infinite linear;
}

@keyframes blink {
  0% {
    opacity: 1;
  }
  99% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}


</style>
<%@include file="include/common_top.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/videoMain.css" type="text/css" />
</head>
<script>
(function () {
    var app;
    $(document).ready(function () {
        return app.init();
    });
    app = {
        text: 'Hello. How to make a MindMap?',
        index: 0,
        chars: 0,
        speed: 100,
        container: '.text .content',
        init: function () {
            this.chars = this.text.length;
            return this.write();
        },
        write: function () {
            $(this.container).append(this.text[this.index]);
            if (this.index < this.chars) {
                this.index++;
                return window.setTimeout(function () {
                    return app.write();
                }, this.speed);
            }
        }
    };
}.call(this));

</script>
<body style="background-color: #F6F6F6">
<%@include file="include/topMenu.jsp" %>
	<div style="padding-top: 140px;"></div>
	<section class="stretch">
	<div class="navigation" id="nav_var_b">
		<div id="main-content">
			<section id="categories">
				<div class="container_16">
					<div style="padding-top: 150px;"></div>
					<ul>

						<li>
							<a href="#"	class="subject_toggle flip-container flipper block red"> 
								<span class="flipper-front"> 
									<i class="icon">
										<span><img src="images/beauty.png" alt="" /></span>
										<span>뷰티 & 패션</span>
									</i> 
								</span>
								<span class="flipper-back"> 
									<span class="courses">${clist[0].cntCurri}
										<span>강의 개수</span>
									</span> 
									<span class="videos">${vlist[0].cntVideo}
										<span>총 동영상 개수</span>
									</span>
								</span>
							</a>
						</li>

						<li>
							<a href="#" class="subject_toggle flip-container flipper block plum"> 
								<span class="flipper-front"> 
									<i class="icon">
										<span><img src="images/study.png" alt="" /></span>
										<span>교과목</span>
									</i> 
								</span> 
								<span class="flipper-back"> 
									<span class="courses">${clist[1].cntCurri}
										<span>강의 개수</span>
									</span> 
									<span class="videos">${vlist[1].cntVideo}
										<span>총 동영상 개수</span>
									</span>
								</span>
							</a>
						</li>

						<li><a
							href="#"
							class="subject_toggle flip-container flipper block teal"> <span
								class="flipper-front"> <i class="icon"><span><img src="images/music.png" alt="" /></span><span>음악 & 공연</span></i> <span
									class="title">Music / Performance</span>
							</span> <span class="flipper-back"> 
									<span class="courses">${clist[2].cntCurri}
										<span>강의 개수</span>
									</span> 
									<span class="videos">${vlist[2].cntVideo}
										<span>총 동영상 개수</span>
									</span>
								</span>
						</a></li>

						<li>
							<a href="#"	class="subject_toggle flip-container flipper block orange"> 
								<span class="flipper-front"> 
									<i class="icon">
										<span><img src="images/it.png" alt="" /></span>
										<span>IT</span>
									</i> 
								</span>
								<span class="flipper-back"> 
									<span class="courses">${clist[3].cntCurri}
										<span>강의 개수</span>
									</span> 
									<span class="videos">${vlist[3].cntVideo}
										<span>총 동영상 개수</span>
									</span>
								</span>
							</a>
						</li>

						<li>
							<a href="#"	class="subject_toggle flip-container flipper block purple"> 
								<span class="flipper-front"> 
									<i class="icon">
										<span><img src="images/art.png" alt="" /></span>
										<span>미술 & 공예</span>
									</i> 
								</span>
								<span class="flipper-back"> 
									<span class="courses">${clist[4].cntCurri}
										<span>강의 개수</span>
									</span> 
									<span class="videos">${vlist[4].cntVideo}
										<span>총 동영상 개수</span>
									</span>
								</span>
							</a>
						</li>

						<li>
							<a href="#"	class="subject_toggle flip-container flipper block blue"> 
								<span class="flipper-front"> 
									<i class="icon">
										<span><img src="images/sports.png" alt="" /></span>
										<span>스포츠</span>
									</i> 
								</span>
								<span class="flipper-back"> 
									<span class="courses">${clist[5].cntCurri}
										<span>강의 개수</span>
									</span> 
									<span class="videos">${vlist[5].cntVideo}
										<span>총 동영상 개수</span>
									</span>
								</span>
							</a>
						</li>

						<li>
							<a href="#"	class="subject_toggle flip-container flipper block green"> 
								<span class="flipper-front"> 
									<i class="icon">
										<span><img src="images/cook.png" alt="" /></span>
										<span>요리</span>
									</i> 
								</span>
								<span class="flipper-back"> 
									<span class="courses">${clist[6].cntCurri}
										<span>강의 개수</span>
									</span> 
									<span class="videos">${vlist[6].cntVideo}
										<span>총 동영상 개수</span>
									</span>
								</span>
							</a>
						</li>

						<li>
							<a href="#"	class="subject_toggle flip-container flipper block yellow"> 
								<span class="flipper-front"> 
									<i class="icon">
										<span><img src="images/foreign.png" alt="" /></span>
										<span>외국어</span>
									</i> 
								</span>
								<span class="flipper-back"> 
									<span class="courses">${clist[7].cntCurri}
										<span>강의 개수</span>
									</span> 
									<span class="videos">${vlist[7].cntVideo}
										<span>총 동영상 개수</span>
									</span>
								</span>
							</a>
						</li>
						
						<li>
							<a href="#"	class="subject_toggle flip-container flipper block army"> 
								<span class="flipper-front"> 
									<i class="icon">
										<span><img src="images/game.png" alt="" /></span>
										<span>게임</span>
									</i> 
								</span>
								<span class="flipper-back"> 
									<span class="courses">${clist[8].cntCurri}
										<span>강의 개수</span>
									</span> 
									<span class="videos">${vlist[8].cntVideo}
										<span>총 동영상 개수</span>
									</span>
								</span>
							</a>
						</li>

						<li>
							<a href="#"	class="subject_toggle flip-container flipper block sky"> 
								<span class="flipper-front"> 
									<i class="icon">
										<span><img src="images/etc.png" alt="" /></span>
										<span>Etc</span>
									</i> 
								</span>
								<span class="flipper-back"> 
									<span class="courses">${clist[9].cntCurri}
										<span>강의 개수</span>
									</span> 
									<span class="videos">${vlist[9].cntVideo}
										<span>총 동영상 개수</span>
									</span>
								</span>
							</a>
						</li>
							
					</ul>
				</div>
			</section>
		</div>
	</div>
		<div class="pc-tab" style="max-width:90%">
			<input checked="checked" id="tab1" type="radio" name="pct" />
			<input id="tab2" type="radio" name="pct" />
			  <nav style="position:static;">
			    <ul>
			      <li class="tab-menu tab1">
			        <label for="tab1">popularity</label>
			      </li>
			      <li class="tab-menu tab2">
			        <label for="tab2">newest</label>
			      </li>
			    </ul>
			  </nav>
			  
		  
			  <section>
			  
			  <!-- 인기영상 -->
			    <div class="tab1">
			    
			    	<div id="carousel">
					<div id="container" class="container">
						<figure id="spinner" style="padding-top: 50px;">
							<video  controls="controls" src="${pageContext.request.contextPath}/images/december.mp4"></video>
							<video  controls="controls" src="${pageContext.request.contextPath}/images/december.mp4"></video>
							<video  controls="controls" src="${pageContext.request.contextPath}/images/december.mp4"></video>
							<video  controls="controls" src="${pageContext.request.contextPath}/images/december.mp4"></video>
							<video  controls="controls" src="${pageContext.request.contextPath}/images/december.mp4"></video>
							<video  controls="controls" src="${pageContext.request.contextPath}/images/december.mp4"></video>
						</figure>
					</div>
				<div id="pager"></div>
				</div>

			<span style="float: left" id="spinL" class="ss-icon" onclick="galleryspin('-')">&lt;</span>
			<span style="float: right" id="spinR" class="ss-icon" onclick="galleryspin('')">&gt;</span>
			
			</div>
			
			<!-- 최신영상 -->
			    <div class="tab2">
			    	<div id="carousel">
					<div id="container" class="container">
						<figure id="spinner" style="padding-top: 50px;">
							<video controls="controls" src="${pageContext.request.contextPath}/images/december.mp4"></video>
							<video controls="controls" src="${pageContext.request.contextPath}/images/december.mp4"></video>
							<video controls="controls" src="${pageContext.request.contextPath}/images/december.mp4"></video>
							<video controls="controls" src="${pageContext.request.contextPath}/images/december.mp4"></video>
							<video controls="controls" src="${pageContext.request.contextPath}/images/december.mp4"></video>
							<video controls="controls" src="${pageContext.request.contextPath}/images/december.mp4"></video>
						</figure>
					</div>
			<span style="float: left" class="ss-icon spinL" onclick="galleryspin('-')">&lt;</span>
			<span style="float: right" class="ss-icon spinR" onclick="galleryspin('')">&gt;</span>
				<div id="pager"></div>
				</div>

			
			</div>
			
			
			
			<div style="padding-top: 50px;padding-bottom:50px; border-bottom: 1px solid black;"> </div>
			</div>
		<div class="introVideo">
		<div class="videoDiv">
		<video style="height: 95%; controls="controls" src="${pageContext.request.contextPath}/images/december.mp4">
		</video>
		</div>
		
		<div class="introText">
			
		<div class="introContent">
			<div class='text' >
		  	<div class='content'></div>
		  	<div class='dash'></div>	
			</div>
		</div>
		<div>
		<article>마인드맵 소개글 </article>
		</div>
		</div>
		
		</div>

			</section>

	</section>
<%@include file="include/footer.jsp" %>
</body>
</html>