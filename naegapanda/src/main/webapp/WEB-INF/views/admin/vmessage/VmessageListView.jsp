<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/pandaicon.ico">
<title>PANDA:신고메세지</title>

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

   
   	<h3 style="font-weight:bold;">신고 메세지 관리</h3><br>
				<br>
				<table class="table table-hover">
					  	<thead>
						    <tr>
							      <th scope="col">No.</th>
							      <th scope="col" width="250">제목</th>
							      <th scope="col" width="80">판매자</th>
							      <th scope="col" width="120">발신날짜</th>
							      <th scope="col" width="120">확인날짜</th>
						    </tr>
						</thead>
						
						<tbody>
							
									<c:forEach items="${ list }" var="vm"> 
										<c:if test="${ empty loginSeller }">
											<c:url value="vmDetailView.do" var="vmdetail">
					 						    <c:param name="vmNo" value="${ vm.vmNo }"/>
											</c:url>
										</c:if>
										<%-- <c:if test="${ !empty loginSeller }">
											<c:url value="vmSellerDetailView.do" var="vmSellerDetail">
					 						    <c:param name="vmNo" value="${ vm.vmNo }"/>
											</c:url>
										</c:if>	 --%>						
									<tr>
										<th scope="row">
											<a href="${ vmdetail }">${vm.vmNo}</a>
										</th>
										<td>
											<a href="${ vmdetail }">${vm.vmTitle}</a>
										</td>
										<td>
											<a href="${ vmdetail }">${vm.sName}</a>
										</td>
										<td>
											<a href="${ vmdetail }">${vm.vmSendDate}</a>
										</td>
										<td>
											<a href="${ vmdetail }">${vm.vmCheckDate}</a>
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
								
									<c:if test="${ !empty sc }">
										<c:url value="messageSearch.do" var="before">
											<c:param name="currentPage" value="${ scpi.currentPage - 1 }"/>
											<c:param name="keyword" value="${ keyword }"/>
										</c:url>
										<a href="${ before }">[◀]</a>
									</c:if>
								
									<c:if test="${ empty sc }">
										<c:url value="vmessage.do" var="before">
											<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
										</c:url>
										<a href="${ before }">[◀]</a>
									</c:if>
								</c:if>					
								<!-- 번호들 -->
								<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
									<c:if test="${ p eq pi.currentPage }">
										<font color="blue" size="4">[${ p }]</font>
									</c:if>
									<c:if test="${ p ne pi.currentPage }">
									
										<c:if test="${ !empty sc }">
											<c:url value="messageSearch.do" var="page">
												<c:param name="currentPage" value="${ p }"/>
												<c:param name="keyword" value="${ keyword }"/>
											</c:url>
											<a href="${ page }">${ p }</a>
										</c:if>
										
										<c:if test="${ empty sc }">
											<c:url value="vmessage.do" var="page">
												<c:param name="currentPage" value="${ p }"/>
											</c:url>
											<a href="${ page }">${ p }</a>
										</c:if>
									</c:if>
								</c:forEach>
								<!-- [다음] -->
								<c:if test="${ pi.currentPage eq pi.maxPage }">
									[▷]
								</c:if>
								<c:if test="${ pi.currentPage ne pi.maxPage }">
								
									<c:if test="${ !empty sc }">
										<c:url value="messageSearch.do" var="next">
											<c:param name="currentPage" value="${ scpi.currentPage+1 }"/>
											<c:param name="keyword" value="${ keyword }"/>
										</c:url>
										<a href="${ next }">[▶ ]</a>
									</c:if>
									<c:if test="${ empty sc }">
										<c:url value="vmessage.do" var="next">
											<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
										</c:url>
										<a href="${ next }">[▶]</a>
									</c:if>
								</c:if>	
						
							</td>
						</tr>
					
					</table>
				</div>
   
			
			<div id="searchArea" align="center">
				<form action="messageSearch.do" method="get">
					<input type="search" name="keyword" value="${ keyword }">
					<button type="submit" class="searchButton" onclick="return validate();">검색하기</button>
				</form>
			</div>
			
			
			<br><br>
   
   
   
   </div>



<c:import url="../../common/adminFooter.jsp"/> 
<c:import url="../../common/footer.jsp"/>
   
   
   
   

</body>
</html>