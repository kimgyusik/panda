<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
									
											<c:url value="vmdetailView.do" var="vmdetail">
					 						    <c:param name="vmNo" value="${ vm.vmNo }"/>
											</c:url>
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
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   </div>



<c:import url="../../common/adminFooter.jsp"/> 
<c:import url="../../common/footer.jsp"/>
   
   
   
   

</body>
</html>