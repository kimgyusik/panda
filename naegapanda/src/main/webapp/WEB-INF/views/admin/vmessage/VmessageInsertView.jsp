<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 메세지 작성</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">




<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>


</head>
<body>
<script>
$(document).ready(function() {
	  $('#summernote').summernote({
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>
<div class="super_container">
   
      <c:import url="../../common/menubar.jsp"/> 
      <c:import url="../../common/admin.jsp"/> 
      
   </div>
   
   <div class="bs-example">
   
   
		<h3 style="font-weight:bold;">신고 메세지 작성</h3><br>
		<br>
	<form action="vmInsert.do" method="post" encType="multipart/form-data">
		<table class="table">
		  	<tbody>
		  		
			    <tr>
			      <th scope="col" width="100px" align="center">신고 품목</th>
			      <td  width="200px"> <h4>${ v.pName }</h4> </td>
			      <td width="100px"> <h4>${ v.sName }</h4> </td>
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
			      <!-- <textArea name="vmContent" style="width:500px;height:300px;border:none;"></textArea> -->
			      	 
			      		<textarea name="vmContent" style="width:500px;height:300px;border:none;" required></textarea>
			      
			      </td>
			    </tr>
			    <tr>
			      <th scope="row">첨부 파일</th>
			      <td colspan="2">
				      <input type="file" name="uploadFile">
			      </td>
			    </tr>
			    
			    <tr>
			    	<td colspan="3" align="center">
			    		<input type="hidden" name="vNo" value="${ v.vNo }">
				    	<input type="hidden" name="sNo" value="${ v.sNo }"> 
				    	<input type="hidden" name="pId" value="${ v.pId }"> 
			    		<button type="submit" class="btn btn-outline-primary" onclick="location.href='vmInsert.do';">보내기</button>
			    		<button type="button" class="btn btn-outline-primary" onclick="location.href='violateView.do';">취소</button>
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