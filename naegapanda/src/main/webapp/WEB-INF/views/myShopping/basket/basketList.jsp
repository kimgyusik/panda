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
color:black;
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
font-size:13px;
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
																		<input name="arr" class="checkCart" type="checkbox" checked="checked" value="${b.pId}">
																	</td>
																	<td style="width:200px;">
																		이미지
																	</td>
																	<td style="text-align:left;width:600px;">
																		<c:url value="상품조회url" var="p">
																			<c:param name="pId" value="${ b.pId }"/>
																		</c:url>
																		<a href="${ p }">[${b.category2}] ${b.pName}</a>	
																	</td>
																	<td>
																		<input class="amount" type="number" value="${b.amount }" min="1" style="width:50px; text-align:center; margin:auto;">
																	</td>
																	<td>
																		${b.price }원
																	</td>
																	<td>
																		${b.storeName }
																	</td>
																	<td>
																		<span class="price2" style="color:#0e8ce4;font-weight:400px;" >${b.amount *b.price }</span><span>원</span>
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
											
											<button class="removeCart2" onclick="return removeCartLIst();">선택상품 삭제</button>
											
											<div class="cart_buttons">
												<button type="button" class="button cart_button_checkout" onclick="return paymentPage();">결재하기</button>
											</div>
											
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- cart끝 -->
					</div>
				</div>
			</div>
		</div>

	
		<c:import url="../../common/footer.jsp"/>
	</div>
	
	<script>
		
		$(function(){
			priceAll();
		});
		
		// 장바구니 총 결재금액 계산 함수
		function priceAll(){
			
			var sum = parseInt(0);
			
		    $(".price2").each(function(){
			    if(isNaN(parseInt($(this).text()))){
			    	return 0;
			    }
		       sum = sum+ parseInt($(this).text());
		    });

			$(".order_total_amount").text(sum + "원");
			$(".order_total_amount").css("font-size","17px");

		}
	
		// 체크박스 전체  토글
		$('.allCheck').click(function(){
		    $('.checkCart').prop('checked',function(){
		        return !$(this).prop('checked');
		    });
		});
		
		// 상품 수량 비동기 수정
		$(".amount").on("input", function() {
			
			var pId = $(this).parent().parent().children().eq(0).text();
			var amount = $(this).val();
			var price = parseInt($(this).parent().parent().children().eq(5).text());
			var price2 = $(this).parent().parent().children().eq(7).children().eq(0);

			$.ajax({
				url:"updateAmount.ba",
				data:{pId:pId, amount:amount},
				type:"post",
				success:function(data){
					if(data == "success"){
						
						price2.text(price*amount); // 해당 상품의 갯수*단일금액
						
						priceAll();
						
					}else{
						alert("처리실패");
					}
				},
				error:function(){
					console.log("서버와의 통신 실패");
				}
			});
			
		});
		
		// 상품 제외(단일)
		function removeCart(pId){
			
			if(confirm("해당 상품을 장바구니에서 삭제하시겠습니까?")){
				location.href='<%=request.getContextPath()%>/deleteBasket.ba?pId='+pId;
			}
			return false;
		}
		
		//
		function removeCartLIst(){

			var arr = new Array();
			
			$("input:checkbox[name=arr]:checked").each(function(){
				arr.push($(this).val());
			});
			
			if(confirm("해당 상품들을 장바구니에서 삭제하시겠습니까?")){
				location.href='<%=request.getContextPath()%>/deleteBasketList.ba?arr='+arr;
			}
			return false;
		}
		
		// 결재하러가기
		function paymentPage(){
			
			if(confirm("이대로 결재를 진행하시겠습니까?")){
				location.href='<%=request.getContextPath()%>/paymentPage.pa';
			}
			return false;
		}
	</script>


</body>
</html>