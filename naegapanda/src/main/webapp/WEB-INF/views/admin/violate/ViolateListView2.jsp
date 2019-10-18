<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PANDA</title>

<style>
	.outer{
		width:900px;
		height: 1250px;
		margin-left: 300px;
		margin-top:50px; 
	}	
</style>

</head>
<body>

	<div class="super_container">

   <c:import url="../../common/menubar.jsp"/> 

   <c:import url="../../common/admin.jsp"/> 
   
	</div>
		<div class="bs-example">
			<!-- <div class="outer"> -->
				<h3 style="font-weight:bold;">신고 게시글</h3><br>
				<br>
				<table class="table table-hover">
					  	<thead>
						    <tr>
							      <th scope="col">No.</th>
							      <th scope="col" width="250">제목</th>
							      <th scope="col" width="80">판매자</th>
							      <th scope="col" width="80">신고자</th>
							      <th scope="col" width="120">날짜</th>
							      <th scope="col">처리여부</th>
						    </tr>
						</thead>
						
						<tbody>
							<c:forEach items="${ list }" var="v"> 
								
								<tr>
									<th scope="row">${v.vNo}</th>
									<td>${v.vTitle}</td>
									<td>${v.sName}</td>
									<td>${v.mName}</td>
									<td>${v.vDate}</td>
									<td>
										<c:if test="${ v.vStatus eq 'Y' }">
											◎
										</c:if>
										<c:if test="${ v.vStatus ne 'N' }">
											&nbsp;
										</c:if>
									</td>
							    </tr>
							    
 						    </c:forEach> 
					  </tbody>
					  
				</table>
				
				
					<!-- 페이징 -->		  
				<div align="center">
					<table>
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
										<font color="blue" size="4">[${ p }]</font>
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
				</div>
			<!-- </div> -->
	</div>

	
	<c:import url="../../common/adminFooter.jsp"/> 
	<c:import url="../../common/footer.jsp"/>
	
</body>
</html>