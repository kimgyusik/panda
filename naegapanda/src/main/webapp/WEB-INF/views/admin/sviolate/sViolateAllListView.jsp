<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a:visited { 
		color: black; 
		text-decoration: none;
	}
</style>

</head>
<body>

	<div class="super_container">

      <c:import url="../../common/menubar.jsp"/> 

      <c:import url="../../common/admin.jsp"/> 
      
   </div>


	<div class="bs-example">

   
   	<h3 style="font-weight:bold;">신고 회원 관리</h3><br>
				<br>

<table class="table table-hover">
					  	<thead>
						    <tr>
							      <td scope="col" width="90" align="center"><b>회원번호</b></td>
							      <td scope="col" width="100" align="center"><b>판매자</b></td>
							      <td scope="col" width="250" align="center"><b>스토어명</b></td>							 
							      <th scope="col" width="80">신고횟수</th>
							      <td scope="col" width="120" align="center"><b>날짜</b></td>
							      <th scope="col" width="80">회원상태</th>
						    </tr>
						</thead>
						
						<tbody>
							
									<c:forEach items="${ list }" var="sv"> 
											<c:url value="sViolatePersonalList.do" var="sviolatelist">
					 						    <c:param name="sNo" value="${ sv.sNo }"/>
											</c:url>
									<tr>
										<td align="center">
											<a href="${ sviolatelist }">${sv.sNo}</a>
										</td>
										<td align="center">
											<a href="${ sviolatelist }">${sv.sName}</a>
										</td>
										<td align="center">
											<a href="${ sviolatelist }">${sv.storeName}</a>
										</td>
										<td align="center">
											<a href="${ sviolatelist }">${sv.sViolate}</a>
										</td>
										<td align="center">
											<a href="${ sviolatelist }">${sv.vDate}</a>
										</td>
										<td align="center">
											<a href="${ pviolatelist }">${sv.sStatus}</a>
										</td>
							  			
								    </tr>
								    
	 						    </c:forEach> 
					  </tbody>
					  
				</table>
				
				 <!-- 페이징~~ -->
				<div align="center">
					<table>
						<tr align="center" height="20">
							<td colspan="6">
								
								<!-- [이전] -->
								<c:if test="${ pi.currentPage eq 1 }">
									[◁]
								</c:if>
								<c:if test="${ pi.currentPage ne 1 }">
									<c:url value="sViolateAllList.do" var="before">
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
										<c:url value="sViolateAllList.do" var="page">
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
									<c:url value="sViolateAllList.do" var="next">
										<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
									</c:url>
									<a href="${ next }">[▶]</a>
								</c:if>	
						
							</td>
						</tr>
					
					</table>
				</div> 
   </div>


	<c:import url="../../common/adminFooter.jsp"/> 
	<c:import url="../../common/footer.jsp"/>

</body>
</html>