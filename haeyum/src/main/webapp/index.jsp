<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset='UTF-8'>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="WEB-INF/view/include/common_top.jsp" %>
<script>
// 	컨트롤러 호출
// 	window.location.href("${pageContext.request.contextPath}/main.do")
</script>
</head>
<body>
	<% response.sendRedirect("/haeyum/main.do"); %>

</body>
</html>