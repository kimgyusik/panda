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
													<li>. 구매하신 상품 배송 및 주문처리를 위해 판매자에게 개인정보를 제공합니다.</li>
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
																		<span>${p.amount }</span>
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
														${m.name} <br>
														${m.phone} (개인소득공제용)<br>
														${m.address}<br>
														개인정보수정버튼
													</div>
													<div class="deliverySpot2">
														<input type="hidden" name="flag" value="1"> <!-- 1:기본 2:신규 -->
														수령인 <input type="text" class="recipient" name="recipient" placeholder="20자 이내 입력"> <br>
														연락처 <input type="text" class="recipient" name="recipientPhone" placeholder="ex) 010-1234-5678"> <br>
														배송지 주소<br>
														
													</div>
													
													
													<div>
														<input type="text" style="width:300px;" placeholder="배송 시 요청사항을 적어주세요." >
													</div>
												</div>
												<div style="float:right;">
													<div>
														
														결재금액<br>
														<div class="order_total_amount"></div><span>&nbsp; 원</span>
														<button type="button" onclick="return paymentConfirm();">z</button>
													</div>
												</div>
											</div>
											
											<div>
												<input type="checkbox" id="check"> 위 상품의 구매조건 확인 및 결제진행 동의
											장바구니로
											아임포트
											</div>
	
											
											

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
		
		// 총 결재금액 계산 함수
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
	
	
		
		
		// 결재하러가기
		function paymentConfirm(){
			
			if($("input:checkbox[id='check']").is(":checked"){
				alert('결제 동의에 체크해주세요.');
			}
			if(confirm("이대로 결재를 진행하시겠습니까?")){
				location.href='<%=request.getContextPath()%>/paymentPage.pa';
			}
			return false;
		}
	</script>


</body>
</html>