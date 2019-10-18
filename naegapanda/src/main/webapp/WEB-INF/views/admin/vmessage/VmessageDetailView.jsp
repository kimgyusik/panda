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
		height: 500px;
		margin-left: 300px;
		margin-top:50px; 
	}
</style>
</head>
<body>

<c:if test="${ empty loginSeller }">
	<div class="super_container">
</c:if>
      <c:import url="../../common/menubar.jsp"/> 
<c:if test="${ empty loginSeller }">   
      <c:import url="../../common/admin.jsp"/> 
      
   </div>
</c:if>
<c:if test="${ !empty loginSeller }">
   <div class="outer">
</c:if>
<c:if test="${ !empty loginSeller }">
	<div class="bs-example">
</c:if>
   
   
   <table class="table">
					  
						    <tr>
						      <th scope="col" width="100px" align="center">판매자</th>
						      <td width="450px">
						       <h4>${ vm.sName }</h4>
						      </td>
						      <th width="70px">발신날짜</th>
						      <td width="100px">
						      	 ${ vm.vmSendDate }
						      </td>
						    </tr>
						    <tr>
						      <th scope="row">제목</th>
						      <td colspan="2">
						      	<h4>${ vm.vmTitle }</h4>
						      </td>
						      <td>
						      <c:if test="${ sessionScope.loginUser.id eq 'admin' }">
							      <c:if test="${ empty vm.vmCheckDate }">
							      	&nbsp;
							      </c:if>
							      <c:if test="${ !empty vm.vmCheckDate }">
							      	확인함
							      </c:if>
							  </c:if>
							  <c:if test="${ sessionScope.loginUser.id ne 'admin' }">
							  	&nbsp;
							  </c:if>
						      </td>
						    </tr>
						    <tr>
						      <th scope="row" height="300px">내용</th>
						      <td colspan="3">
						      	<div style="width:700px;height:300px;border:none;">${vm.vmContent}</div>
						      </td>
						   </tr>
						    
						    <tr>
						    	<td colspan="3" align="center">
						    		<button type="button" class="btn btn-outline-primary" onclick="vmessage.do;">뒤로</button>
						    	</td>
						    </tr>
				  	  	
					</table>
   
   
   
   
   
   
	</div>
	
	<c:import url="../../common/adminFooter.jsp"/> 
	<c:import url="../../common/footer.jsp"/>
</body>
</html>