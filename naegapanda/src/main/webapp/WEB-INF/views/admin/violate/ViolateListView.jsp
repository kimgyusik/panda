<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PANDA</title>
</head>
<body>

	<c:import url="../../common/menubar.jsp"/>
	
	<h1 align="center">게시글 목록</h1>

	<h3 align="center">
		총 게시글 갯수 : ${ pi.listCount }
		<!--<c:if test="${ !empty sessionScope.loginUser }">
			<button onclick="location.href='vinsertView.do';">글쓰기</button>			
		</c:if>-->
		
			<button onclick="location.href='vinsertView.do';">글쓰기</button>
	</h3>
	
	<table align="center" border="1" cellspacing="0" width="700">
		<tr>
			<th>번호</th>
			<th width="300">내용</th>
			<th>판매자</th>
			<th>날짜</th>
			<th>신고자</th>
			<th>처리여부</th>
		</tr>
		<c:forEach items="${ list }" var="v">
			<tr>
				<td align="center">${ v.vNo }</td>
				<td align="left">
					<c:url value="vdetail.do" var="vdetail">
						<c:param name="vNo" value="${ v.vNo }"/>
					</c:url>
					<a href="${ vdetail }">${ v.vContent }</a>
				</td>
				<td align="center">${ v.sNo }</td>
				<td align="center">${ v.vDate }</td>
				<td align="center">${ v.mNo }</td>
				<td align="center">
					<c:if test="${ v.Status eq 'Y' }">
						◎
					</c:if>
					<c:if test="${ v.Status ne 'N' }">
						&nbsp;
					</c:if>
				</td>
			</tr>
		</c:forEach>		
		
		<tr align="center" height="20">
			<td colspan="6">
				
				<!-- [이전] -->
				<c:if test="${ pi.currentPage eq 1 }">
					[◁]
				</c:if>
				<c:if test="${ pi.currentPage ne 1 }">
					<c:url value="vlist.do" var="before">
						<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[◀]</a>
				</c:if>					
				<!-- 번호들 -->
				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4">[${ p }]</font>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url value="vlist.do" var="page">
							<c:param name="currentPage" value="${ p }"/>
						</c:url>
						<a href="${ page }">${ p }</a>
					</c:if>
				</c:forEach>
				<!-- [다음] -->
				<c:if test="${ pi.currentPage eq pi.maxPage }">
					[▷]
				</c:if>
				<c:if test="${ pi.currentPage ne pi.maxPage }">
					<c:url value="vlist.do" var="next">
						<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<a href="${ next }">[▶]</a>
				</c:if>	
					
			</td>
		</tr>
	
	</table>
	
	
	<c:import url="../../common/footer.jsp"/>
	
</body>
</html>