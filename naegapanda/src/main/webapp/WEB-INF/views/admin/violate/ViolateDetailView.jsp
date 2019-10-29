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
									<c:if test="${ !empty v.vOriginalFileName }">
										<a  href="${ contextPath }/resources/vupload/${ v.vRenameFileName }" data-target="#myModal" data-toggle="modal">${v.vRenameFileName }</a>
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
						    		<form action="vmessageInsertView.do">
						    	 	<input type="hidden" name="vNo" value="${ v.vNo }">
						    	 	<input type="hidden" name="sName" value="${ v.sName }">
						    	 	<input type="hidden" name="sNo" value="${ v.sNo }">
						    		<button type="submit" class="btn btn-outline-primary">판매자에게</button>
						    		<button type="button" class="btn btn-outline-primary" onclick="history.back(-1);">뒤로가기</button>
						    		</form>
						    	</td>
						    </tr>
				  	  	
					</table>
				<%-- </c:forEach> --%>
	</div>
	
	<div class="col-lg-3 col-md-4 col-xs-6 thumb"  style="width:750px; height:550px;">
        <%-- <img id="image-modal" class="img-responsive img-rounded" src="${ contextPath }/resources/vmupload/${ vm.vmRenameFileName }" data-target="#myModal" data-toggle="modal" alt=""> --%>
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content" style="width:730px; height:700px;">
                    <div class="modal-header">
                        ${ v.vTitle } <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <img class="img-responsive" src="${ contextPath }/resources/vupload/${ v.vRenameFileName }" alt="" width="700px" height="500px">
                    		<br><br>
                    		<div style="align:center"><a href="${ contextPath }/resources/vupload/${ v.vRenameFileName }" download>${ v.vRenameFileName }</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<script>
	$(document).ready(function () {
	    $('#myModal').on('show.bs.modal', function (e) {
	        var img = $(e.relatedTarget).attr('src'); // get image
	        $('#showimg').attr('src' , img); //load image in modal
	    });
	});
	
	$(document).ready(function () {
	    $('#myModal').on('show.bs.modal', function (e) {
	        var img = $(e.relatedTarget).attr('href'); // get image with <a> tag
	        $('#showimg').attr('src' , img); //load image in modal
	    });
	});
	</script>


<c:import url="../../common/adminFooter.jsp"/> 
<c:import url="../../common/footer.jsp"/>
</body>
</html>