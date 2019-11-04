<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/pandaicon.ico">
<title>PANDA:신고관리</title>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">



<style>
	.outer{
		width:800px;
		height: 1250px;
		margin-left: 300px;
		margin-top:50px; 
	}
	
	.readonly:focus{
		outline:none !important;
	}
	
</style>


<script
   src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<script type="text/javascript">
$(function(){
    $("#popbutton").click(function(){
        $('div.modal').modal({remote : 'layer.html'});
    });
});

</script>

</head>


<body>

<c:import url="../../common/menubar.jsp"/>
	
	
	<div class="outer">
	
		<h3 style="font-weight:bold;">신고 메세지 작성</h3><br>
		<br>
	<form action="vinsert.do" method="post" encType="multipart/form-data">
		<table class="table" style="width:800px;">
		  	<tbody>
			    <tr>
			      	<th scope="col" width="80px" align="center">신고 상품</th>
			      	<td width="100px"> <h4>${ v.pName }</h4> </td>
			      	<td scope="col" width="30px" align="right"><b>판매자</b></td>
			      	<td width="50px"> <h4>${ v.sName }</h4></td>
			      	
			    </tr>
			    <tr>
			      <th scope="row">제목</th>
			      <td colspan="3" width="100px">
			      	<input type="text" class="form-control" name="vTitle" style="border:none;"  required>
			      </td>
			    </tr>
			    <tr>
			      <th scope="row" height="300px">내용</th>
			      <td colspan="3">
			      			<div >
								<textarea style="width:650px;height:300px;border:none;" required id="summernote" name="vContent"></textarea>
							</div>
						    <script>
						      $('#summernote').summernote({
						        height: 300
						      });
						    </script>
<!-- 			      
			      	<div id="summernote" style="height:300px">
			      		<textarea name="vContent" style="width:650px;height:300px;border:none;" required></textarea>
			      	</div>		
			      	 -->	      
			      </td>
			    </tr>
			    <tr>
			      <th scope="row">첨부 파일</th>
			      <td colspan="3">
				      <input type="file" name="uploadFile">
			      </td>
			    </tr>
			    
			    <tr>
			    	<td colspan="4" align="center">
			    		<input type="hidden" name="vNo" value="${ v.vNo }">
				    	<input type="hidden" name="sNo" value="${ v.sNo }"> 
			    		<input type="hidden" name="sName" value="${ v.sName }">
			    		<input type="hidden" name="mNo" value="${ mNo }">
				    	<input type="hidden" name="pId" value="${ v.pId }"> 
				    	<input type="hidden" name="pName" value="${ v.pName }"> 
			    		<button type="submit" class="btn btn-outline-primary" onclick="locatioin.href='violateFinish.do';">신고하기</button>
			    		<button type="button" class="btn btn-outline-primary" onclick="locatioin.href='home.do';">취소</button>
			    	</td>
			    </tr>
	  	  	</tbody>
		</table>
	</form>
	<script>
						function postForm() {
							$('textarea[name="vContent"]').html($('.summernote').code());
						}
					</script>
	</div>
	
	
	
	<!-- <a data-toggle="modal" href="vdetailView.do" data-target="#modal-testNew" role="button" data-backdrop="static">
 <span class="btn btn-xs btn-success">테스트 등록</span>
</a>
 
 
<div id="modal-testNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="테스트정보 등록" aria-describedby="테스트 모달">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        </div>
    </div>
</div>
 -->
	
	
	 <script>
	/* 	$(document).ready(function() {
		     $('#summernote').summernote({
		             height: 300,                 // set editor height
		             minHeight: null,             // set minimum height of editor
		             maxHeight: null,             // set maximum height of editor
		             focus: true                  // set focus to editable area after initializing summernote
		     });
		}); */
		
		
		$(function(){
		    $("#popbutton").click(function(){
		        $('div.modal').modal({remote : 'layer.html'});
		    })
		})

	</script>
	
	
	
<%-- 	<c:import url="../../common/footer.jsp"/> --%>

</body>
</html>