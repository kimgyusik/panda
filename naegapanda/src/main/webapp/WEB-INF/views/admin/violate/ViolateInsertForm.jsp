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
	
	.readonly:focus{
		outline:none !important;
	}
	
</style>

</head>
<body>

	<c:import url="../../common/menubar.jsp"/>
	
	
	<div class="outer">
	
		<h1 align="center">판매자 신고하기</h1>
		<br>
	<form action="vinsert.do" method="post" encType="multipart/form-data">
		<table class="table">
		  	<tbody>
			    <tr>
			      <th scope="col" width="100px" align="center">신고 상품</th>
			      <td width="500px">
			      	<input type="text" class="form-control" name="pId"  value="히히히"  style="border:none;" <%--"${ pId }" --%> >
			      </td>
			      <td width="200px">
			      	<input type="text" class="form-control readonly"name="sNo"  value="히히히" <%--"${ sNo }" --%> readonly style="border:none;background:white">
			      </td>
			    </tr>
			    <tr>
			      <th scope="row">제목</th>
			      <td colspan="2">
			      	<input type="text" class="form-control" name="vTitle" placeholder="제목" style="border:none;">
			      </td>
			    </tr>
			    <tr>
			      <th scope="row" height="300px">내용</th>
			      <td colspan="2">
			      	summerNote
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
			    		<button type="submit" class="btn btn-primary">신고하기</button>
			    		<button type="button" class="btn btn-outline-primary" onclick="locatioin.href='home.do';">취소</button>
			    	</td>
			    </tr>
	  	  	</tbody>
		</table>
	</form>
	</div>
	

	<c:import url="../../common/footer.jsp"/>

</body>
</html>