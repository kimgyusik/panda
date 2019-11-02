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
	
	<div class="shop">
		<div class="container">
			<div class="row">
			
				<!-- 사이드 메뉴바 -->
				<div class="col-lg-1">
					<c:import url="../sidebar.jsp"/>
				</div>

				<div class="col-lg-10" >
				
					<!-- 문의 섹션 -->
					<div class="cart_section">
						<div class="container">
							<div class="row">
								<div class="col-lg-10 offset-lg-1">
									<div class="cart_container" style="width:120%;">
										<div class="cart_title subTitle">상품 문의<span style="margin-left:20px; color:gray; font-size:13px;">최근 3개월동안의 내역이 제공 됩니다.</span></div>
										
										

										<!-- 상품 문의 리스트 -->
										<div style="margin-top:50px;">
											 
										 	<table>
										 	
										 		<c:if test="${!empty list}">
											 		<c:forEach items="${ list }" var="i">

												 		<tr class="contentsList" height="130px;">
												 		
												 			<c:url value="pDetailView.do" var="product">
																<c:param name="pId" value="${i.pId }"/>
															</c:url>	
																
												 			<td width="270px;" rowspan="2">
												 				<input type="hidden" class="iId" value="${i.iId}">
												 				<a href="${ product }"><img class="inquiryImg" src="resources/product_uploadFiles/${i.paChangeName}" ></a>
												 				<span style="display: block;font-size: 13px; margin-top:10px;">
												 					<a href="${ product }"><b>${i.pName}</b></a>
												 				</span>
												 			</td>
												 			
												 			<td width="600px;" style="text-align: left; ">
												 				<span style="display: inline-block;font-size: 15px;">${i.iTitle } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
										 						<span style="color:gray;"><fmt:formatDate value="${i.iDate}" pattern="yyyy. MM. dd. HH:mm" /></span>
										 						<br><br>
										 						<span>&nbsp;&nbsp;${i.iContents }</span>
												 			</td>
										
												 			<td style="vertical-align: top; padding:10px;">
												 				<span class="cancle" >X</span>
												 			</td>
										 				</tr>
										 				
										 				<tr height="60px;" >
										 					<td style="text-align: left;">
										 						<c:if test="${i.iState eq 'Y'}">
										 							┕  <span class="answer">답변완료</span> ${i.iAnswer} &nbsp;&nbsp;&nbsp;&nbsp; 
										 							<span style="color:gray;"><fmt:formatDate value="${i.iaDate}" pattern="yyyy. MM. dd. HH:mm" /></span>
										 						</c:if>
										 						<c:if test="${i.iState eq 'N'}">
										 							┕  <span class="answer">미답변</span>
										 						</c:if>
										 					</td>
										 					<td></td>
										 				</tr>
											
											 		</c:forEach>
										 		</c:if>
										 		
										 		<c:if test="${empty list}">
									 				<div style="text-align: center;">
									 					<br><br><br>
									 					<img src="resources/images/pandaImage.jpg" width="100px;">
									 					<br>상품 문의 내역이 없습니다.
									 				</div>
									 			</c:if>
										 		
										 	</table>
						
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 문의 끝 -->
				</div>
			</div>
		</div>
	</div>


	<c:import url="../../common/footer.jsp"/>
	
	<script>

		$(function(){
			// 문의 삭제
			$(".cancle").on("click", function(){
				
				if(!confirm("삭제한 문의는 복구할 수 없습니다.\n정말 삭제하시겠습니까?")){
					return false;
				}
				
				var iId =$(this).parent().parent().find('.iId').val();
				var tr = $(this).parent().parent();
				
				$.ajax({
					url:"deleteInquiry.in",
					data:{iId:iId},
					type:"post",
					success:function(data){
						if(data == "success"){
							var $tableBody = tr.parent();
							tr.next().remove();
							tr.remove();

							if(tr.parent().find('.contentsList').length == 0){
								$tableBody.append(
										"<div style='text-align: center; left:200%'><br><br><br>"
					 					+ "<img src='resources/images/pandaImage.jpg' width='100px;'>"
					 					+ "<br>상품 문의 내역이 없습니다."
										);
							}
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