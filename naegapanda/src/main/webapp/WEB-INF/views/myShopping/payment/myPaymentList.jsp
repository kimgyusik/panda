<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
font-size: 17px;
font-style: bold;
}
td{
text-align: center;
border: 1px solid gray;
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
.cartinfo{
border: 1px solid #edeeef;
background-color: #f7f7f7;
padding:20px;;
margin-top:30px;
margin-bottom:30px;
font-size:15px;
}
.clearfix{
padding: 20px;
}
.removeCart{
width:30px;
font-size:9px;
cursor: pointer;
background-color: #f7f7f7;
border: 1px solid #edeeef;
}
.removeCart2{
width:100px;
font-size:12px;
height:30px;
margin-top:30px;
background-color: #f7f7f7;
border: 1px solid #edeeef;
cursor: pointer;
}
.cartTb{
cellspacing="0" 
}
</style>
</head>
<body>

	<div class="super_container">

		<c:import url="../../common/menubar.jsp"/>
	
	<!-- Shop -->

		<div class="shop">
			<div class="container">
				<div class="row">
					<div class="col-lg-1">
	
						<!-- Shop Sidebar -->
						<c:import url="../sidebar.jsp"/>
	
					</div>
	
					<div class="col-lg-10" >
					
						<!-- Cart -->
	
						<div class="cart_section">
							<div class="container">
								<div class="row">
									<div class="col-lg-10 offset-lg-1">
										<div class="cart_container" style="width:120%;">
											<div class="cart_title">장바구니</div>
											<div class="cartinfo">
											<ul>
												<li>· 가격, 옵션등 상품정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
												<li>· 오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니, 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
											</ul>
											</div>
											<div class="cart_items" >
												<ul class="cart_list" >
													<li class="cart_item clearfix" >
														<table class="cartTb">
															<tr class="tablehead">
																<td style="display:none;">
																</td>
																<td style="width:100px;">
																	<input class="allCheck" type="checkbox" checked="checked">
																</td>
																<td style="width:800px;" colspan="2">
																	상품정보
																</td>
															
																<td style="width:100px;">
																	수량
																</td>
																<td style="width:200px;">
																	개당 금액
																</td>
																<td style="width:200px;">
																	판매자
																</td>
																<td style="width:200px;">
																	주문 금액
																</td>
															</tr>
															<c:forEach items="${ list }" var="b">
															<tr class="tablebody" >
																<td id="test" style="display:none;">
																	${b.pId}
																</td>
																<td>
																	<input class="checkCart" type="checkbox" checked="checked">
																</td>
																<td style="width:200px;">
																	이미지
																</td>
																<td style="text-align:left;width:600px;">
																	${b.category2}<br>
																	${b.pName}
																</td>
																<td>
																	<input type="number" value="${b.amount }" min="1" style="width:50px; text-align:center;">
																</td>
																<td>
																	${b.price }원
																</td>
																<td>
																	${b.storeName }
																</td>
																<td>
																	<span style="color:#0e8ce4;font-weight:400px;">22222원</span>
																	<br><button class="removeCart" value="상품번호" onclick="return removeCart(1);">삭제</button>
																</td>
															</tr>
															</c:forEach>
														
														</table>
														
													</li>
												</ul>
											</div>
											
											<!-- Order Total -->
											<div class="order_total">
												<div class="order_total_content text-md-right">
													<div class="order_total_title">결재 금액:</div>
													<div class="order_total_amount">원</div>
												</div>
											</div>
											
											<button class="removeCart2" onclick="return removeCart();">선택상품 삭제</button>
											deleteBasketList.ba
											<div class="cart_buttons">
												<button type="button" class="button cart_button_checkout" >결재하기paymentPage.pa</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					
	
					</div>
				</div>
			</div>
		</div>

	
		<c:import url="../../common/footer.jsp"/>
	</div>
	
	<script>
		// 전체 체크박스 토글
		$('.allCheck').click(function(){
		    $('.checkCart').prop('checked',function(){
		        return !$(this).prop('checked');
		    });
		});
		
		// 상품 수량 비동기 수정
		
		// 상품 제외(단일)
		function removeCart(pId){
			
			if(confirm("해당 상품을 장바구니에서 삭제하시겠습니까?")){
				location.href='<%=request.getContextPath()%>/deleteBasket.ba?pId='+pId;
				
			}
			return false;
		}
	</script>


</body>
</html>