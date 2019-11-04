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
											
											<div class="info">
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
																			<c:param name="pId" value="${ p.pId }"/>
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
											
											<form id="payForm"action="addPayment.pa" method="post">
											
												<!-- 배송지 정보 -->
												<div class="delivery">
													<div style="float:left; width:70%;">
													
														<h4 style="margin-bottom:20px;">
															<strong class="subTitle" >배송지 정보</strong>
														</h4>
														
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
																$("#flag").val(1);
															});
															$("#r2").on("click", function(){
																$(".deliverySpot1").css("display","none");
																$(".deliverySpot2").css("display","block");
																$("#flag").val(2);
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
																<span class="btnSearch"><a href="myInfo.do" style="color:white">개인정보 수정</a></span>
															</div>
														</div>
														
														<div class="deliverySpot2">
															<input id="flag" type="hidden" name="flag" value="1"> <!-- 1:기본 2:신규 -->
															<table class="deliveryTable">
																<tr>
																	<td width="20%;" class="pen" >수령인</td>
																	<td width="80%;">
																		<input type="text" class="recipient" name="recipient" style="width:100px;" placeholder="20자 이내 입력">
																	</td>
																</tr>
																<tr>
																	<td class="pen">연락처</td>
																	<td>
																		<input id="recipientPhone" type="hidden" name="recipientPhone"> 
																		<input type="text" class="recipient phone" id="phone1" maxlength="3"> - 
																		<input type="text" class="recipient phone" id="phone2" maxlength="4"> - 
																		<input type="text" class="recipient phone" id="phone3" maxlength="4">
																	</td>
																</tr>
																<tr>
																	<td class="pen">배송지 주소</td>
																	<td>
																		<input type="text"  class="postcodify_postcode5 recipient address" value="" />&nbsp;&nbsp;
																		<button type="button" class="btnSearch" id="postcodify_search_button">검색</button><br />
																	</td>
																</tr>
																<tr>
																	<td></td>
																	<td>
																		<input type="hidden" id="deliverySpot" name="deliverySpot">
																		<input type="text" id="address1" class="postcodify_address recipient address" value=""> &nbsp;&nbsp;
																		<input type="text" id="address2" class="postcodify_details recipient address" value="" /><br />
																	</td>
																</tr>
															</table>
														
															
														</div>
														
														<br><br>
														<div>
															<span class="memo">배송 메모</span> &nbsp;&nbsp;&nbsp;
															<input type="text" id="payRequest" name="payRequest" style="width:300px;" placeholder="배송 시 요청사항을 적어주세요." >
														</div>
													</div>
													
													<div style="float:right; width:30%;">
														<div class="orderTotal" >
															<span id="totalCost" style="display:block;">결제금액</span>
															<span class="orderCost">
																<div class="order_total_amount" style="margin:0;"></div>
																<span >&nbsp; 원</span>
															</span>
														</div>
														
														<div style="margin-top:70%;">								
															<input type="checkbox" id="check">
															<span class="pen subTitle" >동의하기</span>
															<p>위 상품의 구매조건 확인 및 결제 동의	</p>					
														</div><br>
														<div>
															
														</div>
														
													</div>
												</div>
											
												<div class="checkoutArae">
													<button class="btnBack2" type="button" onclick="location.href='basketList.ba';">장바구니로</button>
													&nbsp;&nbsp;&nbsp;&nbsp;
													
													<button type="button"  id="paymentDone" class="cart_checkout" onclick="return paymentConfirm();">결제하기</button>
													
													<input type="hidden" name="flag2" value="${flag2}">
													
													<!-- 즉시결제인 경우 -->
													<c:if test="${flag2 eq 2 }">
														<c:forEach items="${ list }" var="p">
															<input type="hidden" name="oNo" value="${p.oNo}">
															<input type="hidden" name="count" value="${p.amount}">
															<input type="hidden" name="price" value="${p.price}">
														</c:forEach>
													</c:if>
												</div>
												
											</form>
											
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
			
			var IMP = window.IMP;
			IMP.init('imp34384562');	
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
			
			if(confirm("이대로 결제를 진행하시겠습니까?")){
				
				$("#recipientPhone").val($('#phone1').val()+'-'+$('#phone2').val()+'-'+$('#phone3').val()); // 전화번호
				$("#deliverySpot").val($('#address1').val()+' '+$('#address2').val()); // 주소
				
				if($("#payRequest").val() == null || $("#payRequest").val() == ""){
					$("#payRequest").val("없음");
				}
				
				requestImport(); // 아임포트api 호출
				return false;
			}
		}
		
		// 아임포트api
		function requestImport(){

			IMP.request_pay({
			    pg : 'kakaopay', // version 1.1.0부터 지원.
			    pay_method : 'vbank',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문하기 테스트',
			    amount : $(".order_total_amount").text(),
			    buyer_email : "${m.email}",
			    buyer_name : "${m.name}",
			    buyer_tel : "${m.phone}",
			    buyer_addr : "${m.address}",
			    buyer_postcode : '123-456',
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
				
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        //msg += '고유ID : ' + rsp.imp_uid;
			        //msg += '상점 거래ID : ' + rsp.merchant_uid;
			        //msg += '결제 금액 : ' + rsp.paid_amount;
			        //msg += '카드 승인번호 : ' + rsp.apply_num;
			        alert(msg);
			        $("#payForm").submit();
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        alert(msg);
			    }
			    
			});
			
		}
	</script>

	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</body>
</html>