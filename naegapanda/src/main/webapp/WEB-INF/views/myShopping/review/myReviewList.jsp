<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="resources/style/bootstrap4/bootstrap.min.css">
<link href="resources/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="resources/style/cart_styles.css">
<link rel="stylesheet" type="text/css" href="resources/style/cart_responsive.css">
<style>
.cart_section{
height: auto;
padding-top: 0;
}
.tablehead{
height:40px;
border: 1px solid black;
}
.tablebody{
height:100px;
border: 1px solid black;
}
.order_total_title{
font-size: 13px;
font-style: bold;
color:black;
}

.prodList td{
text-align: center;
border: 2px solid #edeeef;
border-left: 1px solid white;
border-right: 1px solid white;
font-size:12px;
}
.cart_title{
font-size: 20px !important;
padding:0 !important;
}
.cart_items{
margin:0 !important;

}

.clearfix{
padding: 0px;
}

.cartTb{
cellspacing="0" 
}
.shop{
padding-bottom: 0px !important;
padding-top:50px  !important;
}


.removeReview{
width:50px;
color:gray;
font-size: 15px;
cursor: pointer;
}

.updateReview{
width:60%;
padding: 1px;
font-size:11px;
cursor: pointer;
background-color:white;
border: 1px solid #edeeef;
box-shadow: 0.5px 0.5px 0.5px 0.5px gray;
}
#content{
height:100px;
border: 2px solid #edeeef;
}
#title{
height: 30px;
line-height: normal;
border: 2px solid #edeeef;
width:80%;
}
.modal-header{
background-color: #0e8ce4;
}
.modalLabel{
font-size:12px;
font-weight: bold;
}
.btn{
font-size: 13px !important;
}
.modal {
text-align: center;
}
@media screen and (min-width: 768px) { 
.modal:before {
display: inline-block;
vertical-align: middle;
content: " ";
height: 100%;
}
}
.modal-dialog {
display: inline-block;
text-align: left;
vertical-align: middle;
}

#file { display:none; } 

#titleImg{
width:auto;
height:auto;
max-width:280px;
max-height:243px;
}
</style>
</head>
<body>

	<c:import url="../../common/menubar.jsp"/>
	
	<!-- contents -->

	<div class="shop">
		<div class="container">
			<div class="row">
			
				<!-- 사이드 메뉴바 -->
				<div class="col-lg-1">
					<c:import url="../sidebar.jsp"/>
				</div>

				<div class="col-lg-10" >
				
					<!-- 리뷰 섹션 -->
					<div class="cart_section">
						<div class="container">
							<div class="row">
								<div class="col-lg-10 offset-lg-1">
									<div class="cart_container" style="width:120%;">
										<div class="cart_title">내가 작성한 리뷰</div>
									
									
										<!-- 리뷰 리스트 -->
										<div style="margin-top:50px;">
											 
										 	<table>
										 	
										 		<c:forEach items="${ list }" var="r">
										 			<c:forEach items="${ list2 }" var="p">
										 				<c:if test="${r.payId eq p.payId }">
										 				
													 		<tr id="${g.category2 }" class="prodList" height="180px;">
													 		
													 			<c:url value="상품조회url" var="product">
																	<c:param name="pId" value="${p.pId }"/>
																</c:url>	
																	
													 			<td width="300px;">
													 				<input type="hidden" class="rId" value="${r.rId}">
													 				<a href="${ product }"><img src="resources/images/single_${r.rImage}.jpg" width="70px;"></a>
													 				<br><br>
													 				<span style="display: inline-block;font-size: 13px; height:30px;">
													 					[${p.storeName }]
													 					<br><a href="${ product }">${p.pName} :: ${p.oName }</a>
													 				</span>
													 			</td>
													 			
													 			<td width="600px;" style="text-align: left; ">
													 				<span style="display: inline-block;font-size: 15px;">${r.rTitle } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
											 						<span style="color:gray;"><fmt:formatDate value="${r.rDate}" pattern="yyyy. MM. dd." /></span>
											 						<br><br>
											 						<span>&nbsp;&nbsp;${r.rContents }</span>
													 			</td>
													 			<td width="150px;" >
													 				<img src="resources/images/eye.png" width="30px;"> ${r.rCount}
													 				<br><br>
													 				<img src="resources/images/hart.png" width="20px;"> ${r.rCommend }
													 				<br><br>
													 				<button  class="updateReview"  >수정하기</button>
													 			</td>
													 			<td style="vertical-align: top; padding:10px;">
													 				<span class="removeReview" onclick="return removeReview(${r.rId});">X</span>
													 			</td>
											 				</tr>

											 			</c:if>
										 			</c:forEach>
										 		</c:forEach>
										 		
										 	</table>
						
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 리뷰 끝 -->
				</div>
			</div>
		</div>
	</div>

	<!-- 모달 -->
	
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
			
			<div class="modal-header">
				<span style="color:white; "><b>리뷰 수정</b></span>
				<button type="button" class="close" data-dismiss="modal" style="color:white;">&times;</button>
			</div>
			
			<form action="updateReview.re" method="post" encType="multipart/form-data">
				<table>
					<tr>
						<td width="300px;" style="text-align: center; padding:0;">
							<img id="titleImg" name="uploadFile">
						</td>
						<td>
							<div class="modal-body" style="padding-left:30px;">
								<input type="hidden" id="rId" name="rId">
								<label class="modalLabel">제목</label>
								<br><input type="text" class="modal-title" id="title" name="rTitle">
								<br><br><label class="modalLabel">내용</label>
								<br><textarea id="content" cols="35" name="rContents"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<input type="file" id="file" name="file" onchange="loadImg(this)"/>
							<button id="btn-upload" type="button" class="btn btn-outline-info" data-dismiss="modal" style="margin-left:20px;">사진 업로드</button></td>
						<td>
							<div class="modal-footer">
								<button type="button" class="btn btn-info" data-dismiss="modal">수정하기</button>
								<button type="button" class="btn btn-info" data-dismiss="modal">취소</button>
							</div>
						</td>
					</tr>
				</table>
			</form>
			
			</div>
		</div>
	</div>  

	<c:import url="../../common/footer.jsp"/>
	
	<script>
	
	$(function () {

		// 리뷰 수정 모달 호출
		$('.updateReview').click(function(){
			var title = $(this).parent().parent().children().eq(1).children().eq(0).text();
			var contents = $(this).parent().parent().children().eq(1).children().eq(4).text();
			var img = $(this).parent().parent().children().eq(0).find('img').attr('src');
			var rId = $(this).parent().parent().children().eq(0).children().eq(0).val();
			
			$("#title").val(title);
		    $("#content").text(contents);
		    $("#titleImg").attr('src', img);
		    $("#rId").val(rId);

			$("#myModal").modal('show');
		});
		
		// 리뷰 수정 중 이미지 업로드에 필요
		$('#btn-upload').click(function (e) {
			event.stopPropagation();
			$('#file').click();
			});
		});
	
		// 리뷰 삭제 (단일)
		function removeReview(rId){
			if(confirm("삭제한 리뷰는 복구할 수 없습니다.\n정말 삭제하시겠습니까?")){
				location.href='<%=request.getContextPath()%>/deleteReview.re?rId='+rId;
			}
			return false;
		}
		
		// 수정 모달창으로 기존 리뷰 이미지 올리기
		function loadImg(value){
			if(value.files && value.files[0]){

				var reader = new FileReader();
				reader.onload = function(e){	
					$("#titleImg").attr("src", e.target.result);
				}
				reader.readAsDataURL(value.files[0]);
			}
		}

	</script>


</body>
</html>