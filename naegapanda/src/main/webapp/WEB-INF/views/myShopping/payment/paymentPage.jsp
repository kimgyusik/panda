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

	<div class="super_container">

	<c:import url="../../common/menubar.jsp"/>

		<div class="shop">
			<div class="container">
				<div class="row">
				
	
					<div class="col-lg-10" >
					
						<!--결제 세션 -->
	
						<div class="cart_section">
							<div class="container">
								<div class="row">
									<div class="col-lg-10 ">
										<div class="cart_container" style="width:150%;">
										
											<div class="cart_title subTitle"><b>주문/결제</b></div>
											
											<div class="cartinfo">
												<ul>
													<li>. 주의사항</li>
													<li>· 장바구니에서 제외시킨 상품은 원복되지 않습니다.</li>
												</ul>
											</div>
											
											<!-- 결재상품 리스트 -->
											<div class="pay_items" >
												<ul class="cart_list" >
													<li class="cart_item clearfix" >
														<table class="cartTb">
															<tr class="tablehead">
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
															<c:forEach items="${ list }" var="p">
																<tr class="tablebody">
																	<td style="width:200px;">
																		<c:url value="pDetailView.do" var="product">
																			<c:param name="pId" value="${ p	.pId }"/>
																		</c:url>
																		<a href="${ product }"><img class="basketImg" src="resources/product_uploadFiles/${p.paChangeName}" ></a>
																	</td>
																	<td style="text-align:left; width:600px; ">
																		<a href="${ product }" style="font-size:13px;"><b>${p.pName}</b> <br>${p.oName}</a>	
																	</td>
																	<td>
																		<span><input type="number" value="${p.amount }"></span>
																	</td>
																	<td>
																		<input type="hidden" value="${p.price}">
																		<span><fmt:formatNumber type="number" maxFractionDigits="3" value="${p.price }" />원</span>
																	</td>
																	<td>
																		${p.storeName }
																	</td>
																	<td >
																		<c:set var="cost" value="${p.amount * p.price }" />
																		<input type="hidden" value="${cost}">
																		<span class="price2"  >
																			<fmt:formatNumber type="number" maxFractionDigits="3" value="${cost}" />
																		</span><span>원</span>
																	</td>
																</tr>
															</c:forEach>
														
														</table>
														
													</li>
												</ul>
											</div>
											
											<div class="delivery">
												<div style="float:left;">
													<h4 style="margin-bottom:20px;">
														<strong class="subTitle" >배송지 정보</strong>
													</h4>
													<div>
														<strong class="subTitle">배송지 선택</strong>
														<div class="checks">
															<input id="r1" type="radio" name="rr" checked="checked" >
															<label class="deliveryLabel" for="r1">기본배송지</label>
															<input id="r2" type="radio" name="rr">
															<label class="deliveryLabel" for="r2">신규배송지</label>
														</div>
													</div>
													<div class="deliverySpot1">
														${m.name} (집)<br>
														${m.phone}<br>
														${m.address}<br>
														
													</div>
													<div>
														<input type="text" style="width:300px;" placeholder="배송 시 요청사항을 적어주세요." >
													</div>
												</div>
												<div style="float:right;">
													<div class="order_total_content text-md-right">
														<div class="order_total_title">결재 금액:</div>
														<div class="order_total_amount"></div><span>&nbsp; 원</span>
													</div>
												</div>
											</div>
											

											장바구니로
											

										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 결재끝 -->
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
				$.ajax({
					url:"deleteBasket.ba",
					data:{oNo:oNo},
					type:"post",
					success:function(data){
						
						if(data == "success"){
							$('#'+oNo).parent().children().eq(7).children().eq(0).attr('value', 0);
							$('#'+oNo).parent().css('display','none');
							priceAll();
						}else{
							alert("처리실패");
						}
					},
					error:function(){
						console.log("서버와의 통신 실패");
					}
				});
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