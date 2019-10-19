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
   
   
   <h1 align="center">신고 메세지 작성</h1>
		<br>
	<form action="vmInsert.do" method="post" encType="multipart/form-data">
		<table class="table">
		  	<tbody>
			    <tr>
			      <th scope="col" width="100px" align="center">판매자</th>
			      <td width="200px">
			     	<h4>${ sNo }</h4>
			      	<input type="hidden" name="sNo" value="${ sNo }">
			      </td>
			      <td width="200px">
			      	<input type="text" class="form-control readonly"name="sNo"  value="111" <%--"${ sNo }" --%> readonly style="border:none;background:white">
			      </td>
			    </tr>
			    <tr>
			      <th scope="row">제목</th>
			      <td colspan="2">
			      	<input type="text" class="form-control" name="vmTitle" style="border:none;"  required>
			      </td>
			    </tr>
			    <tr>
			      <th scope="row" height="300px">내용</th>
			      <td colspan="2">
			      <textArea name="vmContent" style="width:700px;height:300px;border:none;"></textArea>
			      	<!-- <div id="summernote" style="height:300px">
			      		<textarea style="width:700px;height:300px;border:none;" required></textarea>
			      	</div>	 -->		      
			      </td>
			    </tr>
			    <tr>
			      <th scope="row">첨부 파일</th>
			      <td colspan="2">
				      <input type="file" name="vfile">
			      </td>
			    </tr>
			    
			    <tr>
			    	<td colspan="3" align="center">
			    		<button type="submit" class="btn btn-outline-primary" onclick="locatioin.href='vmIsert.do';">보내기</button>
			    		<button type="button" class="btn btn-outline-primary" onclick="locatioin.href='violateView';">취소</button>
			    	</td>
			    </tr>
	  	  	</tbody>
		</table>
	</form>
   
   
   
   
   
   
   
   </div>

<c:import url="../../common/adminFooter.jsp"/> 
<c:import url="../../common/footer.jsp"/>
</body>
</html>