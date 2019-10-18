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
		width:900px;
		height: 1250px;
		margin-left: 300px;
		margin-top:50px; 
	}
	
	td{
	 border:none;
	}
	
</style>
</head>
<body>

	<div class="super_container">
	
	   <c:import url="../../common/menubar.jsp"/> 
	
	   <c:import url="../../common/admin.jsp"/> 
	   
	</div>
	
	<div class="bs-example">
			<%-- <c:forEach items="${ list }" var="v"> --%>
					<table class="table">
					  
						    <tr>
						      <th scope="col" width="100px" align="center">신고 상품</th>
						      <td width="500px">
						       <h4>${ v.pId }</h4>
						      </td>
						      <th width="70px">판매자</th>
						      <td> <!-- 판매자 -->
						      	 ${ v.sName }
						      </td>
						    </tr>
						    <tr>
						      <th scope="row">제목</th>
						      <td colspan="3">
						      	<h4>${ v.vTitle }</h4>
						      </td>
						    </tr>
						    <tr>
						      <th scope="row" height="300px">내용</th>
						      <td colspan="3">
						      	<div style="width:700px;height:300px;border:none;">${v.vContent}</div>
						      </td>
						    </tr>
						    <tr>
						      <th scope="row">첨부 파일</th>
						      <td colspan="3">
							      <div class="file" style="width:100px;height:100px;border:1px solid blue;"></div>
							     <%--  <% for(int i=0; i<fileList.size(); i++){%>
										<td colspan="2" class="photo">
												<div class="file" style="width:100px;height:100px;">
													<img width="100" height="100" src="src/main/webapp/resources/images/<%=fileList.get(i).getvFile()%>">
												</div>
										</td>
					
								<% } %> --%>
						      </td>
						    </tr>
						    
						    <tr>
						    	<td colspan="3" align="center">
						    		<button type="submit" class="btn btn-outline-primary" onclick="vmessageInsertView.do;">판매글 정지</button>
						    		<button type="button" class="btn btn-outline-primary" onclick="violateView.do;">취소</button>
						    	</td>
						    </tr>
				  	  	
					</table>
				<%-- </c:forEach> --%>
	</div>



<c:import url="../../common/adminFooter.jsp"/> 
<c:import url="../../common/footer.jsp"/>
</body>
</html>