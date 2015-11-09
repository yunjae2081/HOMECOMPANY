<%@ tag body-content="empty" pageEncoding="euc-kr" %>
<%@ attribute name="pagingInfo"  required="true"  rtexprvalue="true" %>
<%@ attribute name="image"       required="false" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="pageVO"  value="${pageVO}" />
<%
	String objName = (String)jspContext.getAttribute("pageObjName");
	jspContext.setAttribute("pagingInfo", request.getAttribute(objName));
%>
<tr>
	<td align="center">
		<c:choose>
			<c:when test="${pagingInfo.pageNo == 1}" >
		
				<%--
				<img alt="ó������" src="/edu/web/images/board/btn_first.gif">
				--%>
			</c:when>
			<c:otherwise>
				<a href="${pagingInfo.pageUrl}?pageNo=1">
					<c:choose>
						<c:when test="${image == 'Y'}">
							<img alt="ó������" src="/edu/web/images/board/btn_first.gif">
						</c:when>
						<c:otherwise>
							<font size="1px;">[ó��]</font>						
						</c:otherwise>
					</c:choose>	
				</a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${pagingInfo.firstPageInTab == 1}" >
				<%--
				<img alt="����" src="/edu/web/images/board/btn_pre.gif">
				--%>
			</c:when>
			<c:otherwise>
				<a href="${pagingInfo.pageUrl}?pageNo=${pagingInfo.firstPageInTab-1}" >
				<c:choose>
					<c:when test="${image == 'Y'}">
						<img alt="����" src="/edu/web/images/board/btn_pre.gif">
					</c:when>
					<c:otherwise>
						<font size="1px;">[����]</font>						
					</c:otherwise>
				</c:choose>				
				</a>
			</c:otherwise>
		</c:choose>
		<c:forEach var="page" begin="${pagingInfo.firstPageInTab}" end="${pagingInfo.lastPageInTab}"  step="1">
			<c:choose>
				<c:when test="${page != pagingInfo.pageNo}">
					<a href="${pagingInfo.pageUrl}?pageNo=${page}">
						<font size="1px;">[${page}]</font>
					</a>
				</c:when>
			 	<c:otherwise>
					<b><font size="1px;">[${page}]</font></b>
			    </c:otherwise>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${pagingInfo.lastPageInTab == pagingInfo.totalPage}" >
				<%--
				<img alt="����" src="/edu/web/images/board/btn_next.gif">
				--%>
			</c:when>
			<c:otherwise>
				<a href="${pagingInfo.pageUrl}?pageNo=${pagingInfo.lastPageInTab+1}">
				<c:choose>
					<c:when test="${image == 'Y'}">
						<img alt="����" src="/edu/web/images/board/btn_next.gif">
					</c:when>
					<c:otherwise>
						<font size="1px;">[����]</font>						
					</c:otherwise>
				</c:choose>					
				</a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${pagingInfo.pageNo == pagingInfo.totalPage}" >
				<%--
				<img alt="������" src="/edu/web/images/board/btn_last.gif">
				--%>
			</c:when>
			<c:otherwise>
				<a href="${pagingInfo.pageUrl}?pageNo=${pagingInfo.totalPage}">
				<c:choose>
					<c:when test="${image == 'Y'}">
						<img alt="������" src="/edu/web/images/board/btn_last.gif">
					</c:when>
					<c:otherwise>
						<font size="1px;">[������]</font>						
					</c:otherwise>
				</c:choose>					
				</a>
			</c:otherwise>
		</c:choose>
	</td>
</tr>
