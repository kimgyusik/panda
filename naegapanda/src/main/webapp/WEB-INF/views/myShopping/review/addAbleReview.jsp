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
<link rel="stylesheet" type="text/css" href="resources/style/myShoppingCustom.css">
<style>

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
				
					<!-- 작성 가능 리뷰 섹션 -->
					<div class="cart_section">
						<div class="container">
							<div class="row">
								<div class="col-lg-10 offset-lg-1">
									<div class="cart_container" style="width:120%;">
										<div class="cart_title">작성 가능한 리뷰</div>
										
										<div class="cartinfo">
											<ul>
												<li>· 배송완료된 구매에 대해서만 리뷰 작성이 가능합니다.</li>
												<li>· 작성하신 리뷰는 [내가 작성한 리뷰]메뉴에서 확인하실 수 있습니다</li>
												<li>· 상품과 무관한 사진/동영상을 첨부한 리뷰는 통보없이 삭제 및 제재 대상이 될 수 있습니다.</li>
											</ul>
										</div>
									
									
										<!-- 작성 가능 리뷰 리스트 -->
										<div style="margin-top:50px;">
											 
										 	<table>
										 		<c:if test="${!empty list}">
											 		<c:forEach items="${ list }" var="r">	
											 				
														 		<tr class="prodList" height="180px;">
														 		
														 			<c:url value="상품조회url" var="product">
																		<c:param name="pId" value="${r.pId }"/>
																	</c:url>	
																		
														 			<td width="300px;">
														 				<a href="${ product }"><img src="resources/images/${r.paChangeName}" style="max-height:180px; width:auto; max-width:200px;"></a>
														 			</td>
														 			
														 			<td width="1000px;" style="text-align: left;">
														 				<span style="color:gray;">구매일자: &nbsp; <fmt:formatDate value="${r.payDate}" pattern="yyyy. MM. dd" /></span><br><br>
														 				
														 				<span style="display: inline-block;font-size: 15px; height:30px;"><a  href="${ product }">${r.pName} :: ${r.oName }</a></span><br>
														 			
														 				<span style="color:gray;">${r.storeName }</span>
														 			</td>
														 			
														 			
														 			<td width="250px;" >
														 				<button  class="updateReview"  >리뷰 작성하기</button>
														 			</td>
														 		
												 				</tr>
	
											 		</c:forEach>
										 		</c:if>
										 		
										 		<c:if test="${empty list}">
									 				<div style="text-align: center;">
									 					<br>
									 					<img src="resources/images/pandaImage.jpg" width="100px;">
									 					<br>현재 작성 가능한 리뷰가 없습니다.
									 				</div>
									 			</c:if>
										 		
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
				<span style="color:white; "><b>리뷰 등록</b></span>
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
								<br><input type="text" class="modal-title" id="title" name="rTitle" >
								<br><br><label class="modalLabel">내용</label>
								<br><textarea id="content" cols="35" name="rContents"></textarea>
								<br><label id="contentLabel" ></label>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<input type="file" id="file" name="file" onchange="loadImg(this)"/>
							<button id="btn-upload" type="button" class="btn btn-outline-info" data-dismiss="modal" style="margin-left:20px;"><b>사진 업로드</b></button></td>
						<td>
							<div class="modal-footer">
								<button type="button" class="btn btn-info" data-dismiss="modal"><b>수정하기</b></button>
								<button type="button" class="btn btn-info" data-dismiss="modal"><b>취소</b></button>
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
			    $('#contentLabel').html(contents.length+"/500");
	
				$("#myModal").modal('show');
			});
			
			// 리뷰 수정 중 이미지 업로드에 필요
			$('#btn-upload').click(function (e) {
				event.stopPropagation();
				$('#file').click();
				});
			
			// 글자 수 제한
		    $('#content').on('keyup', function() {
		        if($(this).val().length > 500) {
		            $(this).val($(this).val().substring(0, 500));
		        }
				$('#contentLabel').html($(this).val().length+"/500");
		    });
	
			
		});

	</script>


</body>
</html>