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

td{
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
.cartinfo{

background-color: #edeeef;
padding:20px;
margin-top:30px;
margin-bottom:30px;
font-size:13px;
}
.clearfix{
padding: 0px;
}
.removeCart{
width:auto;
padding: 1px;
font-size:9px;
cursor: pointer;
background-color: #f7f7f7;
border: 1px solid #edeeef;
box-shadow: 0.5px 0.5px 0.5px 0.5px gray;
}
.removeCart2{
width:100px;
font-size:12px;
height:30px;
margin-top:30px;
background-color: #f7f7f7;
border: 1px solid #edeeef;
cursor: pointer;
box-shadow: 0.5px 0.5px 0.5px 0.5px gray;
}
.cartTb{
cellspacing="0" 
}
.shop{
padding-bottom: 0px !important;
padding-top:50px  !important;
}
.price2{
color:#0e8ce4;
display:inline-block; 
width:50px; 
text-align: right; 
margin-right:5px;
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
				
					<!-- 사이드 메뉴바 -->
					<div class="col-lg-1">
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
													<li>· 옵션, 가격 등 상품정보가 변경될 수 있으니 확인 후 진행하시기 바랍니다.</li>
													<li>· 장바구니에서 제외시킨 상품은 원복되지 않습니다.</li>
												</ul>
											</div>
											
											<c:if test="${empty list}">
												<div style="text-align: center; margin-top:70px;">
													<img src="resources/images/cart2.png" width="100px;">
													<br><br>장바구니가 비어 있습니다.
												</div>
											</c:if>
											
											<c:if test="${!empty list}">
											
												<div class="cart_items" >
													<ul class="cart_list" >
														<li class="cart_item clearfix" >
															<table class="cartTb">
																<tr class="tablehead">
																	<td style="display:none;">
																	</td>
																	<td style="width:100px;">
																		<input class="allCheck" type="checkbox" >
																	</td>
																	<td style="width:700px;" colspan="2">
																		상품정보
																	</td>
																
																	<td style="width:100px;">
																		수량
																	</td>
																	<td style="width:200px;">
																		판매가
																	</td>
																	<td style="width:200px;">
																		판매자
																	</td>
																	<td style="width:230px;">
																		합계
																	</td>
																</tr>
																<c:forEach items="${ list }" var="b">
																	<tr class="tablebody" >
																		<td id="test" style="display:none;">
																			${b.oNo}
																		</td>
																		<td>
																			<input name="arr" class="checkCart" type="checkbox" value="${b.oNo}">
																		</td>
																		<td style="width:200px;">
																			<c:url value="상품조회url" var="product">
																				<c:param name="pId" value="${ b.pId }"/>
																			</c:url>
																			<a href="${ product }"><img src="resources/images/best_${ b.pId }.png" width="70px;"></a>
																		</td>
																		<td style="text-align:left;width:600px;">
																			
																			[ ${b.category2} > ${b.category} ]<br>
																			<a href="${ product }">${b.pName} :: ${b.oName}</a>	
																		</td>
																		<td>
																			<input class="amount" type="number" value="${b.amount }" min="1" style="width:50px; text-align:center; margin:auto;">
																		</td>
																		<td>
																			<input type="hidden" value="${b.price}">
																			<fmt:formatNumber type="number" maxFractionDigits="3" value="${b.price }" />원
																		</td>
																		<td>
																			${b.storeName }
																		</td>
																		<td >
																			<c:set var="p" value="${b.amount *b.price }" />
																			<input type="hidden" value="${p }">
																			<span class="price2"  >
																				<fmt:formatNumber type="number" maxFractionDigits="3" value="${p }" />
																			</span><span>원</span>
																			<br>
																			<button class="removeCart" onclick="ggim(${b.pId});"style="margin-top:5px;">찜하기</button> &nbsp;
																			<button class="removeCart" onclick="return removeCart(${b.oNo});">삭제</button>
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
														<div class="order_total_amount"></div><span>&nbsp; 원</span>
													</div>
												</div>
												
												<button class="removeCart2" onclick="return removeCartLIst();">선택상품 삭제</button>
												
												<div class="cart_buttons" style="margin-top:30px;">
													<button type="button" class="button cart_button_checkout" onclick="return paymentPage();">결재하기</button>
												</div>
											
											</c:if>
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
		    	
		    	var p = parseInt($(this).parent().children().eq(0).val()); // hidden된 각 상품의 합계금액
		    	
		        sum = sum + p; 
		        
		    });
			
			$(".order_total_amount").text(addComma(sum));
			$(".order_total_amount").css("font-size","17px");

		}
		
		// 숫자형 천 단위 처리
		function addComma(num) {
		  var regexp = /\B(?=(\d{3})+(?!\d))/g;
		  return num.toString().replace(regexp, ',');
		}
	
		// 체크박스 전체  토글
		$('.allCheck').click(function(){
		    $('.checkCart').prop('checked',function(){
		        return !$(this).prop('checked');
		    });
		});
		
		// 상품 수량 비동기 수정
		$(".amount").on("input", function() {
			
			var oNo = $(this).parent().parent().children().eq(0).text();
			var amount = $(this).val();
			var price = parseInt($(this).parent().parent().children().eq(5).children().eq(0).val());
			var price2 = $(this).parent().parent().children().eq(7).children().eq(1);

			$.ajax({
				url:"updateAmount.ba",
				data:{oNo:oNo, amount:amount},
				type:"post",
				success:function(data){
					if(data == "success"){
						
						price2.text(addComma(price*amount)); // 해당 상품의 갯수*단일금액을 천 단위 콤마 형태로 출력
						
						price2.parent().children().eq(0).attr("value", price*amount); // 위 금액을 hidden에 숫자형으로 저장
						
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
		
		// 상품 찜하기
		function ggim(pId){
			$.ajax({
				url:"addGgim.gg",
				data:{pId:pId},
				type:"post",
				success:function(data){
					if(data == "success"){			
						alert("찜한 상품으로 등록됐습니다.");
					}else{
						alert("처리실패");
					}
				},
				error:function(){
					console.log("서버와의 통신 실패");
				}
			});
		}
		
		// 상품 제외(단일)
		function removeCart(oNo){
			
			if(confirm("해당 상품을 장바구니에서 삭제하시겠습니까?")){
				location.href='<%=request.getContextPath()%>/deleteBasket.ba?oNo='+oNo;
			}
			return false;
		}
		
		// 상품 제외(다중)
		function removeCartLIst(){

			var arr = new Array();
			
			$("input:checkbox[name=arr]:checked").each(function(){
				arr.push($(this).val());
			});
			
			if(arr.length == 0){
				alert("삭제할 상품을 먼저 선택해주세요.");
				return false;
			}
			
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