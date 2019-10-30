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
				
	
					<div class="col-lg-11" >
					
						<!--결제 세션 -->
	
						<div class="cart_section">
							<div class="container">
								<div class="row">
									<div class="col-lg-11 " >
										<div class="cart_container" style="width:100%;">
										
											<div class="cart_title subTitle"><b>주문/결제</b></div>
											
											<div class="cartinfo">
												<ul>
													<li>· 구매하신 상품 배송 및 주문처리를 위해 판매자에게 개인정보를 제공합니다.</li>
													<li>· 개인정보를 확인하시고 필요 시 수정 후 진행하시기 바랍니다.</li>
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
																		<span><fmt:formatNumber type="number" maxFractionDigits="3" value="${p.price }" /> 원</span>
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
											
											<!-- 배송지 정보 -->
											<div class="delivery">
												<div style="float:left; width:70%;">
												
													<h4 style="margin-bottom:20px;">
														<strong class="subTitle" >배송지 정보</strong>
													</h4><br>
													
													<div>
														<strong class="subTitle pen" style="margin-right:40px;">배송지 선택</strong>
														<div class="checks" style="display: inline-block;">
															<input id="r1" type="radio" name="rr" checked="checked" >
															<label class="deliveryLabel" for="r1">기본배송지</label> &nbsp;&nbsp;
															<input id="r2" type="radio" name="rr">
															<label class="deliveryLabel" for="r2">신규배송지</label>
														</div>
													</div><br>
													
													<script>
													$(function(){
														$("#r1").on("click", function(){
															$(".deliverySpot1").css("display","");
															$(".deliverySpot2").css("display","none");
														});
														$("#r2").on("click", function(){
															$(".deliverySpot1").css("display","none");
															$(".deliverySpot2").css("display","block");
														});
													});	
													
													</script>
													
													<div class="deliverySpot1">
														<div style="width:70%; float:left;">
															<p>성함 :: ${m.name}</p> 
															<p>연락처 :: ${m.phone} (개인소득공제용)</p>
															<p>배송지 주소 :: ${m.address}</p> 
														</div >
														<div style="width:30%;">
															<span class="btnSearch"><a href="myInfo.do" style="color:#2e263c;">개인정보 수정</a></span>
														</div>
													</div>
													
													<div class="deliverySpot2">
														<input type="hidden" name="flag" value="1"> <!-- 1:기본 2:신규 -->
														<table class="deliveryTable">
															<tr>
																<td width="20%;" class="pen">수령인</td>
																<td width="80%;">
																	<input type="text" class="recipient" name="recipient" style="width:100px;" placeholder="20자 이내 입력">
																</td>
															</tr>
															<tr>
																<td class="pen">연락처</td>
																<td>
																	<input type="text" class="recipient phone" id="phone1" maxlength="3"> - 
																	<input type="text" class="recipient phone" id="phone2" maxlength="4"> - 
																	<input type="text" class="recipient phone" id="phone3" maxlength="4">
																</td>
															</tr>
															<tr>
																<td class="pen">배송지 주소</td>
																<td>
																	<input type="text"  class="postcodify_postcode5 recipient address" value="" />&nbsp;&nbsp;
																	<button class="btnSearch" id="postcodify_search_button">검색</button><br />
																</td>
															</tr>
															<tr>
																<td></td>
																<td>
																	<input type="text" id="address1" class="postcodify_address recipient address" value=""> &nbsp;&nbsp;
																	<input type="text" id="address2" class="postcodify_details recipient address" value="" /><br />
																</td>
															</tr>
														</table>
													
														
													</div>
													
													<br><br>
													<div>
														<span class="memo">배송 메모</span> &nbsp;&nbsp;&nbsp;
														<input type="text" style="width:300px;" placeholder="배송 시 요청사항을 적어주세요." >
													</div>
												</div>
												
												<div style="float:right; width:30%; ">
													<div class="orderTotal" >
														
														<span style="display:block;">결재금액</span>
														<div class="order_total_amount" style="margin:0;"></div>
														<span >&nbsp; 원</span>
														
													</div>
													<br>
													<div>
														<button type="button" onclick="return paymentConfirm();">결재해보리기</button>
													</div>
												</div>
											</div>
											
											<div>
											
												<input type="checkbox" id="check">
												<span class="pen subTitle" >동의하기</span><br>
												위 상품의 구매조건 확인 및 결제진행 동의
											
								
											</div>
											<span class="btnBack">장바구니로</span>
		
											
											

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
			
			$("#postcodify_search_button").postcodifyPopUp();
		});
		
		// 총 결재금액 계산 함수
		function priceAll(){
			
			var sum = parseInt(0);
			
		    $(".price2").each(function(){
		    	
		    	var p = parseInt($(this).parent().children().eq(0).val()); // hidden된 각 상품의 합계금액
		    	
		        sum = sum + p; 
		        
		    });
			
			$(".order_total_amount").text(addComma(sum));
			$(".order_total_amount").css("font-size","30px");

		}
		
		// 숫자형 천 단위 처리
		function addComma(num) {
		  var regexp = /\B(?=(\d{3})+(?!\d))/g;
		  return num.toString().replace(regexp, ',');
		}
	
	
		
		
		// 결재 확인
		function paymentConfirm(){
			
	
			if(!$("input:checkbox[id='check']").is(":checked")){
				alert('결제 동의에 체크해주세요.');
				return false
			}
			
			if(confirm("이대로 결재를 진행하시겠습니까?")){
				location.href='<%=request.getContextPath()%>/paymentPage.pa';
			}
			return false;
		}
	</script>

	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
</body>
</html>