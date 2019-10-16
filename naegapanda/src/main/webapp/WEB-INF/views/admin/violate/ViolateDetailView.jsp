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

<c:import url="../../common/menubar.jsp"/>

	<div class="outer"> 

			<c:forEach items="${ list }" var="v">
					<table class="table">
					  
						    <tr>
						      <th scope="col" width="100px" align="center">신고 상품</th>
						      <td width="500px">
						      	<input  type="text" name="pId"  value="히히히"  style="border:none;" <%-- value="${ v.vNo }" --%> readonly>
						      </td>
						      <td width="200px">
						      	<input type="text" name="sNo"  value="히히히"  style="border:none;" <%-- value="${ v.sNo }" --%> readonly>
						      </td>
						    </tr>
						    <tr>
						      <th scope="row">제목</th>
						      <td colspan="2">
						      	<input type="text" name="vTitle" placeholder="제목" style="border:none;" <%-- value="${ v.vTitle }" --%> readonly>
						      </td>
						    </tr>
						    <tr>
						      <th scope="row" height="300px">내용</th>
						      <td colspan="2">
						      	<textarea style="width:700px;height:300px;border:none;"  <%-- value="${ v.vConten }" --%> ></textarea>
						      	
						      </td>
						    </tr>
						    <tr>
						      <th scope="row">첨부 파일</th>
						      <td colspan="2">
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
						    		<button type="submit" class="btn btn-outline-primary">판매글 정지</button>
						    		<button type="button" class="btn btn-outline-primary" onclick=";">취소</button>
						    	</td>
						    </tr>
				  	  	
					</table>
				</c:forEach>
			</div>




<c:import url="../../common/footer.jsp"/>
</body>
</html>