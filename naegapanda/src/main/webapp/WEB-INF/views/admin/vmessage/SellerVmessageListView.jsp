<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width:800px;
		height: 500px;
		margin-left: auto;
		margin-right: auto;
		margin-top:50px; 
	}
	


	a:visited { 
		color: black; 
		text-decoration: none;
	}


</style>
</head>
<body>


      <c:import url="../../common/menubar.jsp"/> 


   <div class="outer">


	<div class="bs-example">

   
   	<h3 style="font-weight:bold;">신고 메세지 관리</h3><br>
				<br>
				<table class="table table-hover">
					  	<thead>
						    <tr>
							      <th scope="col" width="80">No.</th>
							      <td scope="col" width="300" align="left"><b>제목</b></td>
							      <th scope="col" width="80">판매자</th>
							      <th scope="col" width="120">발신날짜</th>
							      <th scope="col" width="120">확인날짜</th>
						    </tr>
						</thead>
						
						<tbody>
							
								<c:forEach items="${ list }" var="vm"> 
									
											<c:url value="vmSellerDetailView.do" var="vmsellerdetail">
					 						    <c:param name="vmNo" value="${ vm.vmNo }"/>
											</c:url>
									<tr>
										<th scope="row">
											<a href="${ vmsellerdetail }">${vm.vmNo}</a>
										</th>
										<td>
											<a href="${ vmsellerdetail }">${vm.vmTitle}</a>
										</td>
										<td>
											<a href="${ vmsellerdetail }">${vm.sName}</a>
										</td>
										<td>
											<a href="${ vmsellerdetail }">${vm.vmSendDate}</a>
										</td>
										<td>
											<a href="${ vmsellerdetail }">${vm.vmCheckDate}</a>
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
									<c:url value="sellervmessage.do" var="before">
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
										<c:url value="sellervmessage.do" var="page">
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
									<c:url value="sellervmessage.do" var="next">
										<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
									</c:url>
									<a href="${ next }">[▶]</a>
								</c:if>	
						
							</td>
						</tr>
					
					</table>
				</div>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   </div>




<c:import url="../../common/footer.jsp"/>
   
   
   
   

</body>
</html>