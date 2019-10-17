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
				<h1 align="center">게시글 목록</h1>
			
				<table class="table table-hover">
					  	<thead>
						    <tr>
							      <th scope="col">번호</th>
							      <th scope="col"width="300">제목</th>
							      <th scope="col">판매자</th>
							      <th scope="col">날짜</th>
							      <th scope="col">신고자</th>
							      <th scope="col">처리여부</th>
						    </tr>
						</thead>
						
						<tbody>
							<tr>
							      <th scope="row">1</th>
							      <td>Mark</td>
							      <td>Otto</td>
							      <td>@mdo</td>
						    </tr>
						    <tr>
							      <th scope="row">2</th>
							      <td>Jacob</td>
							      <td>Thornton</td>
							      <td>@fat</td>
						    </tr>
						    <tr>
							      <th scope="row">3</th>
							      <td colspan="2">Larry the Bird</td>
							      <td>@twitter</td>
						    </tr>
					  </tbody>
				</table>
			<!-- </div> -->
	</div>

	
	<c:import url="../../common/adminFooter.jsp"/> 
	<c:import url="../../common/footer.jsp"/>
	
</body>
</html>