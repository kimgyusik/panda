<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고관리</title>

<style type="text/css">
   
	
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
			
			
				<h3 style="font-weight:bold;">신고 게시글</h3><br>
				<br>
					<table class="table">
					  
						    <tr>
						      <th scope="col" width="100px" align="center">신고 상품</th>
						      <td width="400px">
						       <h4>${ v.pName }</h4>
						      </td>
						      <th width="70px">판매자</th>
						      <c:url value="vmessageInsertView.do" var="vmInsert">
					 						<c:param name="vNo" value="${ v.vNo }"/>
									</c:url>
						      <td> <!-- 판매자 -->
									<a href="${ vmInsert }">${ v.sName }</a>
						      </td>
						    </tr>
						    <tr>
						      <th scope="row">제목</th>
						      <td colspan="3">
						      	<h4>${ v.vTitle }</h4>
						      </td>
						    </tr>
						    <tr>
						      <th>첨부파일</th>
								<td colspan="3">
									<c:if test="${ !empty vm.vmOriginalFileName }">
										<a href="${ contextPath }/resources/vmupload/${ vm.vmRenameFileName }">${vm.vmOriginalFileName }</a>
									</c:if>
								</td>
						    </tr>
						    <tr>
						      <th scope="row" height="300px">내용</th>
						      <td colspan="3">
						      	<div style="width:500px;height:300px;border:none;">${v.vContent}</div>
						      </td>
						    </tr>
						    
						    <tr>
						    	<td colspan="3" align="center">
						    		<!-- <button type="submit" class="btn btn-outline-primary" onclick="location.href='vmessageInsertView.do';">판매자에게</button> -->
						    		<button type="button" class="btn btn-outline-primary" onclick="location.href='violateView.do';">뒤로가기</button>
						    	</td>
						    </tr>
				  	  	
					</table>
				<%-- </c:forEach> --%>
	</div>



<c:import url="../../common/adminFooter.jsp"/> 
<c:import url="../../common/footer.jsp"/>
</body>
</html>