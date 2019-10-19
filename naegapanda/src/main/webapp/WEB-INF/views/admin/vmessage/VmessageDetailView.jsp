<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고메세지</title>

<style type="text/css">

	.outer{
		width:700px;
		height: 500px;
		margin-left: auto;
		margin-right: auto;
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
<c:if test="${ empty loginSeller }">
	<div class="bs-example">
</c:if>
   
   	<h3 style="font-weight:bold;">신고 메세지 관리</h3><br>
				<br>
   						<table class="table">
					  
						    <tr>
						      <th scope="col" width="100px" align="center">판매자</th>
						      <td width="70px"> ${ vm.sName } </td>
						      <td width="70px" align="right"><b>발신날짜</b></td>
						      <td width="70px">
						      	 ${ vm.vmSendDate }
						      </td>
						    </tr>
						    <tr>
						      <th scope="row">제목</th>
						      <td colspan="2"> ${ vm.vmTitle } </td>
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
						      	<div style="width:500px;height:300px;border:none;">${vm.vmContent}</div>
						      </td>
						   </tr>
						    
						    <tr>
						    	<c:if test="${ sessionScope.loginUser.id eq 'admin' }">
							    	<td colspan="4" align="center">
							    		<button type="button" class="btn btn-outline-primary" onclick="location.href='vmessage.do';">뒤로가기</button>
							    	</td>
						    	</c:if>
						    	<c:if test="${ !empty loginSeller }">
							    	<td colspan="4" align="center">
							    		<button type="button" class="btn btn-outline-primary" onclick="location.href='sellervmessage.do';">뒤로가기</button>
							    	</td>
						    	</c:if>
						    </tr>
				  	  	
					</table>
   
  
	</div>
	
	
	<br><br><br>
	<c:if test="${ empty loginSeller }">
		<c:import url="../../common/adminFooter.jsp"/> 
	</c:if>
	<c:import url="../../common/footer.jsp"/>
</body>
</html>