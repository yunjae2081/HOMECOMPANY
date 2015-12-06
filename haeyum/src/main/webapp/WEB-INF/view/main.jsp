<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
@import url(http://fonts.googleapis.com/css?family=Roboto);
.text {
  width: 100%;
  text-align: center;
  height: 50px;
  line-height: 50px;
  font-size: 30px;
  position: absolute;
/*   top: 0; */
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

.introVideo h1{
	font-size: 40px;
	font-family: 'Hanna', serif;
	margin-top: 25px;
	margin-bottom: 20px;
	font-weight: lighter;
	
}

@font-face {
  font-family: 'Jeju Gothic';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/ea/jejugothic/v3/JejuGothic-Regular.eot);
  src: url(//fonts.gstatic.com/ea/jejugothic/v3/JejuGothic-Regular.eot?#iefix) format('embedded-opentype'),
       url(//fonts.gstatic.com/ea/jejugothic/v3/JejuGothic-Regular.woff2) format('woff2'),
       url(//fonts.gstatic.com/ea/jejugothic/v3/JejuGothic-Regular.woff) format('woff'),
       url(//fonts.gstatic.com/ea/jejugothic/v3/JejuGothic-Regular.ttf) format('truetype');
}


</style>
<%@include file="include/common_top.jsp" %>
<script src="${pageContext.request.contextPath}/js/lightbox.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/videoMain.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/lightbox.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mindMap.css" type="text/css" />
</head>
<script>
(function () {
    var app;
    var oneTime = true;
    $(document).ready(function () {
      
      if("${user}" != "") {
        $(".alertDiv").css("display", "block");
        $(".alertDiv").animate({duration:5000}, function () {
        	$(".alertDiv").fadeOut(2000);
        })
      }
      $(window).scroll(function(event) {
        if($(window).scrollTop() > 1200 && oneTime) {
          oneTime = false;
          return app.init();
        }
      })
//         return app.init();
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
<!-- 
 -->
<div data-title="Hello" class="alertDiv dialog-box_info">
	<h2>${user.name}님</h2>
	<hr class="style15">
	<h1>좋은 하루 되세요</h1>
</div>
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
							<a href="${pageContext.request.contextPath}/side/video.do?category=1"	class="subject_toggle flip-container flipper block red"> 
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
							<a href="${pageContext.request.contextPath}/side/video.do?category=2" class="subject_toggle flip-container flipper block plum"> 
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
							href="${pageContext.request.contextPath}/side/video.do?category=3"
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
							<a href="${pageContext.request.contextPath}/side/video.do?category=4"	class="subject_toggle flip-container flipper block orange"> 
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
							<a href="${pageContext.request.contextPath}/side/video.do?category=5"	class="subject_toggle flip-container flipper block purple"> 
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
							<a href="${pageContext.request.contextPath}/side/video.do?category=6"	class="subject_toggle flip-container flipper block blue"> 
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
							<a href="${pageContext.request.contextPath}/side/video.do?category=7"	class="subject_toggle flip-container flipper block green"> 
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
							<a href="${pageContext.request.contextPath}/side/video.do?category=8"	class="subject_toggle flip-container flipper block yellow"> 
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
							<a href="${pageContext.request.contextPath}/side/video.do?category=9"	class="subject_toggle flip-container flipper block army"> 
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
							<a href="${pageContext.request.contextPath}/side/video.do?category=10"	class="subject_toggle flip-container flipper block sky"> 
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
	
	<!--요기부터 최신.인기 -->
		<!-- 인기? -->

		<div class="introVideo">
			<h1>인기강좌</h1>
			<div class="chartList">
				<c:forEach var="best" items="${best}">
					<a href="javascript:viewDetail(${best.bestNo})" > <!-- light박스 -->
					<div class="chartItem">
						<div class="lectureImg"><img src="${pageContext.request.contextPath}/images/${best.fileName}"></div>
						<div class="lectureText">
							<h3>${best.title}</h3> <br/>
							<h4>${best.content}</h4></div>
					</div>
					</a>
				</c:forEach>
			</div>
		</div>
		
		<!-- 최신? -->
		<div class="introVideo">
		<h1>최신강좌</h1>
			<div class="chartList">
				<c:forEach var="latest" items="${latest}">
					<a href="javascript:viewDetail(${latest.latestNo})"> <!-- light박스 -->
					<div class="chartItem">
						<div class="lectureImg"><img src="${pageContext.request.contextPath}/images/${latest.fileName}"></div>
						<div class="lectureText">
							<h3>${latest.title}</h3> <br/>
							<h4>${latest.content}</h4></div>
					</div>
					</a>
				</c:forEach>
			</div>
		</div>
		
		<div class = "backDrop">	</div>
		<div class = "box" id = "hoverDiv">
		<div class = "mView">
			<canvas class = "myCanvas" id = "myCanvas" width="1200" height="600"></canvas>
		</div>
			<img class="close" src="${pageContext.request.contextPath}/images/close.jpg" />
		</div>

	
	<!-- 요기까쥐 -->
		<div class="introVideo">
		<div class="videoDiv">
		<video style="height: 95%;" controls="controls" src="${pageContext.request.contextPath}/images/december.mp4">
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