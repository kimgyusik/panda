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
							      <th scope="col" width="80">날짜</th>
							      <th scope="col">처리여부</th>
						    </tr>
						</thead>
						
						<tbody>
							<c:forEach items="${ list }" var="v"> 
								
								<tr>
									<th scope="row">${v.vNo}</th>
									<td>${v.vTitle}</td>
									<td>${v.sNo}</td>
									<td>${v.mNo}</td>
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

			<!-- </div> -->
	</div>

	
	<c:import url="../../common/adminFooter.jsp"/> 
	<c:import url="../../common/footer.jsp"/>
	
</body>
</html>