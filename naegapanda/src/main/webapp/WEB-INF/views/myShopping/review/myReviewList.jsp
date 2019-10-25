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
										 				
													 		<tr class="contentsList" height="180px;">
													 		
													 			<c:url value="상품조회url" var="product">
																	<c:param name="pId" value="${p.pId }"/>
																</c:url>	
																	
													 			<td width="300px;">
													 				<input type="hidden" class="rId" value="${r.rId}">
													 				<a href="${ product }"><img class="ableReviewImg" src="resources/images/${r.rImage}" ></a>
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
													 				<img src="resources/images/eye.png" width="30px;"  > 
													 				<span style="padding-right:3px;" data-toggle="tooltip" data-placement="right" title="분이 리뷰를 읽었어요">${r.rCount}</span>
													 				<br><br>
													 				<img src="resources/images/hart.png" width="20px;"> 
													 				<span style="padding-right:3px;" data-toggle="tooltip" data-placement="right" title="분이 좋아요를 눌렀어요!">${r.rCommend }</span>
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
							<img id="titleImg" >
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
							<input type="file" name="uploadFile" id="file" onchange="loadImg(this)"/>
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
			
			// 모달 종료 시 input-area 초기화
			$("#myModal").on('hide.bs.modal', function(e){
				$("#file").val("");
				e.stopImmediatePropagation();
			});
	
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
	
		    $('[data-toggle="tooltip"]').tooltip()
			
		});
	
		// 리뷰 삭제 (단일)
		function removeReview(rId){
			if(confirm("삭제한 리뷰는 복구할 수 없습니다.\n정말 삭제하시겠습니까?")){
				location.href='<%=request.getContextPath()%>/deleteReview.re?rId='+rId;
			}
			return false;
		}
		
		// 모달창 이미지 출력
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