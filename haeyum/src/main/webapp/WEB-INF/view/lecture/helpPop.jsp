<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>혜;윰</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
<style type="text/css">
	.help-out {
		width: 600px;
		height: 2500px;
		box-shadow: 0 0 10px 5px #dfdfdf;
	}
	
	.help-node {
		text-align: center;
		margin-top: 40px;
		margin-left: 20px;
		width: 105px;
		float: left;
	}
	
	.help-node2 {
		text-align: left;
		margin-top: 40px;
		padding-top: 21px;
		height: 374px; 
		margin-left: 145px;
		width: 435px;
	}
	
	.help-div {
		margin-top: 50px;
		text-align:center;
		width: 100%;
	}

	.help-div > img{
		margin: 0px auto;
	}
	
	.help-div2 {
		margin: 0px auto;
		margin-top: 20px;
		width: 80%;
		text-align: center;
	}
	
	.video-help {
		margin: 0px auto;
		text-align: center;
	}
</style>
</head>
<body>
<div class = "help-out">
	<div style="width: 100%; text-align: center;">
		<h1>MIND MAP</h1>
	</div>
	<div class = "help-node">
		<img src = "${pageContext.request.contextPath}/images/fNode.PNG"/><br/><br/>
		<img src = "${pageContext.request.contextPath}/images/sNode.PNG"/><br/><br/>
		<img src = "${pageContext.request.contextPath}/images/linkNode.PNG"/><br/><br/>
		<img src = "${pageContext.request.contextPath}/images/asmtNode.PNG"/>
	</div>
	<div class = "help-node2">
		<div style = "width: 100%; height: 127px; vertical-align: middle; ">
			<br/>
			<br/>
			첫 번째 노드는 강좌의 각 챕터를 나타냅니다.
		</div>
		<div style = "width: 100%; height: 110px; vertical-align: middle; ">
			<br/>
			두 번째 노드는 각 챕터의 각 절을 나타냅니다.<br/>
			또한 두 번째 노드에는 강의 동영상을 업로드 합니다.
		</div>
		<div style = "width: 100%; height: 90px; vertical-align: middle; ">
			세 번째  중 링크 노드는 절의 내용과 관련된 <br/>링크를 등록할 수 있습니다.
		</div>
		<div style = "width: 100%; height: 80px; vertical-align: middle; ">
			세 번째 중 과제 노드는 절의 과제를 업로드 합니다.
		</div>
	</div>
	<div class = "help-div">
		<img src="${pageContext.request.contextPath}/images/div.PNG"/><br/>
		<br/>
		각 노드를 클릭하면 해당 노드의 정보를 수정 할 수 있습니다.
		<br/>
		<br/>
		<br/>
		<img src="${pageContext.request.contextPath}/images/excel.PNG" width="500px" height="200px;" />
		<br/>
		MIND MAP는 직접 제작할 수도 있으며, <br/>
		위 그림과 같은 형식의 엑셀 파일을 업로드하여 제작할 수 있습니다.
	</div>
	<div class = "help-div2">
	</div>
	<br/>
	<br/>
	<br/>
	<div style="width: 100%; text-align: center;">
		<h1>VIDEO EDIT</h1>
	</div>
	<br/>
	<br/>
	<div class = "video-help" >
		<img src="${pageContext.request.contextPath}/images/video.PNG" width="500px" height="250px" />
		<br/>
		<br/>
		<img src="${pageContext.request.contextPath}/images/onepoint.png"/>
		<br/>
		<br/>
		두번째 노드에 동영상을 추가하게 되면, 동영상을 편집 할 수 있습니다.<br/>
		포인터를 원하는 위치에 놓고, 색을 변경하거나 자막 노출 시간을 설정하고 자막을 저장할 수 있습니다.
		<br/>
		<br/>
		<br/>
		<br/>
		<img src="${pageContext.request.contextPath}/images/store.PNG"/>
		<br/>
		<br/>
		동영상 편집시 해당 동영상에 포함되는 제품을 등록할 수 있습니다. <br/>제품 사진은 최대 4장까지 등록할수 있습니다.
	</div>
</div>
</body>
</html>