<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:choose>
		<c:when test="${pageVO.pageNo == 1}">◀◀	</c:when>
		<c:otherwise>
			<a href="${pageVO.uri}?pageNo=1">◀◀	</a>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${pageVO.beginPage == 1}">◀	</c:when>
		<c:otherwise>
			<a href="${pageVO.uri}?pageNo=${pageVO.beginPage - 1}">◀	</a>
		</c:otherwise>
	</c:choose>
	
	<c:forEach var = "i" begin="${pageVO.beginPage}" end="${pageVO.endPage}">
		<c:choose>
			<c:when test="${i == pageVO.pageNo}">
				<strong>${i}</strong>
			</c:when>
			<c:otherwise>
				<a href = "${pageVO.uri}?pageNo=${i}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
		<c:choose>
		<c:when test="${pageVO.lastPage == pageVO.endPage}">▶	</c:when>
		<c:otherwise>
			<a href="${pageVO.uri}?pageNo=${pageVO.endPage+1}">▶	</a>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${pageVO.pageNo == pageVO.lastPage}">▶▶</c:when>
		<c:otherwise>
			<a href="${pageVO.uri}?pageNo=${pageVO.lastPage}">▶▶</a>
		</c:otherwise>
	</c:choose>