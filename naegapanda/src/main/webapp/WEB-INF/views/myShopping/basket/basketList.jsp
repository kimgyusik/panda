<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/pandaicon.ico">
<title>PANDA:장바구니</title>
<link rel="stylesheet" type="text/css"
	href="resources/style/bootstrap4/bootstrap.min.css">
<link
	href="resources/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="resources/style/cart_styles.css">
<link rel="stylesheet" type="text/css"
	href="resources/style/cart_responsive.css">
<link rel="stylesheet" type="text/css"
	href="resources/style/myShoppingCustom.css">
<style>
</style>
</head>
<body>

	<div class="super_container">

		<c:import url="../../common/menubar.jsp" />

		<div class="shop">
			<div class="container">
				<div class="row">

					<!-- 사이드 메뉴바 -->
					<div class="col-lg-1">
						<c:import url="../sidebar.jsp" />
					</div>

					<div class="col-lg-10">

						<!-- Cart -->

						<div class="cart_section">
							<div class="container">
								<div class="row">
									<div class="col-lg-10 offset-lg-1">
										<div class="cart_container" style="width: 120%;">

											<div class="cart_title subTitle">장바구니</div>

											<div class="info">
												<ul>
													<li>· 옵션, 가격 등 상품정보가 변경될 수 있으니 확인 후 진행하시기 바랍니다.</li>
													<li>· 판매 취소 및 종료 된 상품은 회원님의 장바구니에서 자동으로 삭제됩니다.</li>
													<li>· 장바구니에서 제외시킨 상품은 원복되지 않습니다.</li>
												</ul>
											</div>

											<c:if test="${empty list}">
												<div style="text-align: center; margin-top: 70px;">
													<img src="resources/images/cart2.png" width="100px;">
													<br> <br>장바구니가 비어 있습니다.
												</div>
											</c:if>

											<c:if test="${!empty list}">

												<div class="cart_items">
													<ul class="cart_list">
														<li class="cart_item clearfix">
															<table class="cartTb">
																<tr class="tablehead">
																	<td style="display: none;"></td>
																	<td style="width: 70px;"><input class="allCheck"
																		type="checkbox"></td>
																	<td style="width: 700px;" colspan="2">상품정보</td>

																	<td style="width: 100px;">수량</td>
																	<td style="width: 200px;">판매가</td>
																	<td style="width: 200px;">판매자</td>
																	<td style="width: 230px;">합계</td>
																</tr>
																<c:forEach items="${ list }" var="b">
																	<tr class="tablebody">
																		<td id="${b.oNo}" class="test" style="display: none;">
																			${b.oNo}</td>
																		<td><input name="arr" class="checkCart"
																			type="checkbox" value="${b.oNo}"></td>
																		<td style="width: 200px;"><c:url
																				value="pDetailView.do" var="product">
																				<c:param name="pId" value="${ b.pId }" />
																			</c:url> <a href="${ product }"><img class="basketImg"
																				src="resources/product_uploadFiles/${b.paChangeName}"></a>
																		</td>
																		<td style="text-align: left; width: 600px;">[
																			${b.category2} > ${b.category} ]<br> <a
																			href="${ product }" style="font-size: 13px;"><b>${b.pName}</b>
																				<br>${b.oName}</a>
																		</td>
																		<td><input class="amount" type="number"
																			value="${b.amount }" min="1"
																			onKeyup="this.value=this.value.replace(/[^1-9]/g,'');">
																		</td>
																		<td><input type="hidden" value="${b.price}">
																			<fmt:formatNumber type="number" maxFractionDigits="3"
																				value="${b.price }" />원</td>
																		<td>${b.storeName }</td>
																		<td><c:set var="p" value="${b.amount *b.price }" />
																			<input type="hidden" value="${p }"> <span
																			class="price2"> <fmt:formatNumber
																					type="number" maxFractionDigits="3" value="${p }" />
																		</span><span>원</span> <br>
																			<button class="btnCart"
																				onclick="return ggim(${b.pId});"
																				style="margin-top: 5px;">찜하기</button> &nbsp;
																			<button class="btnCart"
																				onclick="return removeCart(${b.oNo});">삭제</button></td>
																	</tr>
																</c:forEach>

															</table>

														</li>
													</ul>
												</div>

												<!-- Order Total -->
												<div class="order_total">
													<div class="order_total_content text-md-right">
														<div class="order_total_title">결제 금액:</div>
														<div class="order_total_amount"></div>
														<span>&nbsp; 원</span>
													</div>
												</div>

												<button class="btnCart2" onclick="return removeCartLIst();">선택상품
													삭제</button>

												<div class="cart_buttons" style="margin-top: 30px;">
													<button type="button" class="cart_checkout"
														onclick="return paymentPage();">주문하기</button>
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


		<c:import url="../../common/footer.jsp" />
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
						getCart()
						
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
				dataType:"json",
				success:function(data){
					alert(data);
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
							getCart()
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
			
			if($('.order_total_amount').text() == "0"){
				alert('먼저 상품을 추가해주세요.');
				return false;
			}
			
			if(confirm("결제 페이지로 이동하시겠습니까?")){
				location.href='<%=request.getContextPath()%>/paymentPage.pa';
			}
			return false;
		}
		
		// 메인메뉴 장바구니 비동기 처리
		function getCart(){
			$.ajax({
				url:"currentBasket.ba",
				dataType:"json",
				success:function(data){
					if(data[0] == 0){
						$('.cart_count').children().first().text(data[0]);
						$('.cart_price').children().first().text("장바구니가 비었어요.");
					}else{
						$('.cart_count').children().first().text(data[0]);
						$('.cart_price').children().first().text(data[1]+"원");
					}
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}
	</script>


</body>
</html>