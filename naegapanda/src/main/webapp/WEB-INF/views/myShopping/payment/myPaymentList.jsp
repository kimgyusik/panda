<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/pandaicon.ico">
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

	<div class="shop">
		<div class="container">
			<div class="row">
			
				<!-- 사이드 메뉴바 -->
				<div class="col-lg-1">
					<c:import url="../sidebar.jsp"/>
				</div>

				<div class="col-lg-10" >
				
					<!-- 구매 내역 섹션 -->
					<div class="cart_section">
						<div class="container">
							<div class="row">
								<div class="col-lg-10 offset-lg-1">
									<div class="cart_container" style="width:120%;">
										<div class="cart_title subTitle">구매 내역</div>
										
										<div class="info">
											<ul>
												<li>· 제품 수령 후 배송완료 처리를 해주시길 바랍니다.</li>
												<li>· 구매하신 제품에 이상이 있는 경우 판매자에게 문의해주세요.</li>
											</ul>
										</div>
									
									
										<!-- 구매 내역 리스트 -->
										<div style="margin-top:50px;">
											 
										 	<table>
										 		<c:if test="${!empty list}">
											 		<c:forEach items="${ list }" var="p">	
											 				
												 		<tr class="contentsList" height="180px;">
												 		
												 			<c:url value="pDetailView.do" var="product">
																<c:param name="pId" value="${p.pId }"/>
															</c:url>	
																
												 			<td width="300px;">
												 				<a href="${ product }">
												 					<img class="payImg" src="resources/product_uploadFiles/${p.paChangeName}">
												 				</a>
												 			</td>
												 			
												 			<td width="1000px;" style="text-align: left;">
												 				<span style="color:gray;">구매일자: &nbsp; <fmt:formatDate value="${p.payDate}" pattern="yyyy. MM. dd" /></span><br><br>
												 				[&nbsp;&nbsp;${p.cName2}&nbsp;&nbsp;>&nbsp;&nbsp;${p.cName}&nbsp;&nbsp;]<br>
												 				<span style="display: inline-block;font-size: 14px; height:20px;">
												 					<a  href="${ product }"><b>${p.pName} &nbsp;&nbsp;::&nbsp;&nbsp; ${p.oName }</b></a> &nbsp;&nbsp;x ${p.count}개
												 				</span><br><br>
												 				<span class="deliveryStatus">
												 					${p.recipient} &nbsp;&nbsp;l&nbsp;&nbsp; ${p.recipientPhone}<br>
												 					${p.deliverySpot}
												 				</span>
												 				<div class="deliveryStatus">
													 				<c:if test="${p.deliveryStatus eq '배송전'}">
														 				<span>배송전</span>
														 			</c:if>
														 			<c:if test="${p.deliveryStatus eq '배송중'}">
															 			<span>배송중</span>
														 			</c:if>
														 			<c:if test="${p.deliveryStatus eq '배송완료'}">
														 				<span>배송완료</span>
														 			</c:if>
													 			</div>
													 			
												 			</td>
												 			
												 			
												 			<td width="250px;" >
												 				<div style="line-height: 10px;">
													 				${p.storeName}<br><br>
													 				${p.sBphone}<br><br>
													 				<input type="hidden" value="${p.pId}">
													 				<button class="makeInquiry">문의하기</button>
													 				<c:if test="${p.deliveryStatus eq '배송중'}">
													 					<input type="hidden" value="${p.payId}">
														 				<button class="deliveryDone" style="margin-top:5px;">배송 완료하기</button>
														 			</c:if>
												 				</div>
												 				
												 			</td>
												 		
										 				</tr>
	
											 		</c:forEach>
										 		</c:if>
										 		
										 		<c:if test="${empty list}">
									 				<div style="text-align: center;">
									 					<br>
									 					<img src="resources/images/pandaImage.jpg" width="100px;">
									 					<br>구매 이력이 없습니다.
									 				</div>
									 			</c:if>
										 		
										 	</table>
						
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 구매 내역 끝 -->
				</div>
			</div>
		</div>
	</div>


	<c:import url="../../common/footer.jsp"/>
	
	
	<!-- 모달 -->
	
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-sm" style="width:300px;">
			<div class="modal-content">
			
			<div class="modal-header">
				<span style="color:white; "><b>문의 등록</b></span>
				<button type="button" class="close" data-dismiss="modal" style="color:white;">&times;</button>
			</div>
			
		
				<table id="inqModal">
					<tr>
						<td>
							<div class="modal-body" style="padding-left:30px; padding-right:30px;">
								<input type="hidden" id="pId" name="pId"><br>
								<label class="modalLabel">제목</label>
								<br><input type="text" class="modal-title" id="title" name="iTitle" ><br><br>
								<label class="modalLabel">내용</label><br>
								<textarea id="content" cols="15" rows="4" name="iContents"></textarea><br>
								<label id="contentLabel" >0/500</label>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="modal-footer">
								<div style="flex: auto; margin-left:-20px;">
									<input type="checkbox" id="openYn" name="openYn" checked="checked">
									<label id="openYnLabel" for="openYn">공개 여부</label>
								</div>
								<button type="button" class="btn btnInq submitInq" data-dismiss="modal"><b>작성완료</b></button>
								<button type="button" class="btn btnInq" data-dismiss="modal"><b>취소</b></button>
							</div>
						</td>
					</tr>
				</table>
	
			
			</div>
		</div>
	</div> 
	
	
	
	<script>
	
		$(function () {
			
			// 문의 작성 모달창 호출
			$('.makeInquiry').click(function(){
				var pId = $(this).prev().val();
				$("#pId").val(pId);
				$("#myModal").modal('show');
			});
			
			// 문의내용 글자 수 제한
			 $('#content').on('keyup', function() {
		        if($(this).val().length > 500) {
		            $(this).val($(this).val().substring(0, 500));
		        }
				$('#contentLabel').html($(this).val().length+"/500");
		    });
			 
			// 모달 종료 시 input-area 초기화
			$("#myModal").on('hide.bs.modal', function(e){
				$('#title').val('');
				$('#content').val('');
				$('#openYn').prop('checked', true);
				e.stopImmediatePropagation();
			});
			
			// 모달창 제출
			$('.submitInq').click(function (e) {
				
				var pId = $(this).parents('table').find('#pId').val();
				var iTitle = $(this).parents('table').find('#title').val(); // 김규식
				var iContents =$(this).parents('table').find('#content').val();
				var openYn = $(this).parents('table').find('#openYn').is(":checked");

				$.ajax({
					url:"addInquiry2.in",
					data:{pId:pId, iTitle:iTitle, iContents:iContents, openYn:openYn},
					type:"post",
					success:function(data){
						if(data == "success"){
							alert('문의를 등록했습니다.\n등록하신 문의는 [상품 문의] 메뉴에서 확인하실 수 있습니다.');
						}else{
							alert("처리실패");
						}
					},
					error:function(){
						console.log("서버와의 통신 실패");
					}
				});
			});
			
			// 문의 작성 모달창 호출
			$('.deliveryDone').click(function(){
				
				if(!confirm("배송완료 후에는 상태를 변경할 수 없습니다.\n배송완료를 하시겠습니까?")){
					return false;
				}
				
				var deliveryDone = $(this);
				var payId = $(this).prev().val();
				
				$.ajax({
					url:"fixPayment.pa",
					data:{payId:payId},
					type:"post",
					success:function(data){
						if(data == "success"){
							deliveryDone.parents('.contentsList').find('.deliveryStatus').children().first().text("배송완료");
							deliveryDone.remove();
						}else{
							alert("처리실패");
						}
					},
					error:function(){
						console.log("서버와의 통신 실패");
					}
				});
			});
	
			
		});
		
	


	</script>

</body>
</html>