<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>PANDA</title>
<style>
	.product_name{
		width : 165px;
		margin-left : 20px;
	}
	a:link,a:visited{
	text-decoration:none;
	color:#000000;
	}
</style>
</head>
<body>

<div class="super_container">
	
	<c:import url="common/menubar.jsp"/>
	
	<script>
		$(function(){
			var msg = "<%=request.getAttribute("msg")%>"; 
			// "로그인후 사용가능합니다." 또는 "null"
			
			if(msg != "null"){
				alert(msg);
			}
		});
	</script>

							
	
	<!-- Banner -->

	<div class="banner">
		<div class="banner_background" style="background-image:url(resources/images/banner_background.jpg)"></div>
		<div class="container fill_height">
			<div class="row fill_height">
				<div class="banner_product_image"><img src="resources/images/banner_product.png" alt=""></div>
				<div class="col-lg-5 offset-lg-4 fill_height">
					<div class="banner_content">
						<h1 class="banner_text">Hot of PandaMall</h1>
						<div class="banner_price"><span>$530</span>$460</div>
						<div class="banner_product_name">Apple Iphone 6s</div>
						<div class="button banner_button"><a href="#">Shop Now</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Characteristics -->

	<div class="characteristics">
		<div class="container">
			<div class="row">

				<!-- Char. Item -->
				<div class="col-lg-3 col-md-6 char_col">
					
					<div class="char_item d-flex flex-row align-items-center justify-content-start">
						<div class="char_icon"><img src="resources/images/char_1.png" alt=""></div>
						<div class="char_content">
							<div class="char_title">당일 배송</div>
							<div class="char_subtitle">오후2시 전 결제</div>
						</div>
					</div>
				</div>

				<!-- Char. Item -->
				<div class="col-lg-3 col-md-6 char_col">
					
					<div class="char_item d-flex flex-row align-items-center justify-content-start">
						<div class="char_icon"><img src="resources/images/char_2.png" alt=""></div>
						<div class="char_content">
							<div class="char_title">실시간 업데이트</div>
							<div class="char_subtitle">신상품을 확인해보세요!</div>
						</div>
					</div>
				</div>

				<!-- Char. Item -->
				<div class="col-lg-3 col-md-6 char_col">
					
					<div class="char_item d-flex flex-row align-items-center justify-content-start">
						<div class="char_icon"><img src="resources/images/char_3.png" alt=""></div>
						<div class="char_content">
							<div class="char_title">무료 배송</div>
							<div class="char_subtitle">5만원 부터~</div>
						</div>
					</div>
				</div>

				<!-- Char. Item -->
				<div class="col-lg-3 col-md-6 char_col">
					
					<div class="char_item d-flex flex-row align-items-center justify-content-start">
						<div class="char_icon"><img src="resources/images/char_4.png" alt=""></div>
						<div class="char_content">
							<div class="char_title">품질 보장</div>
							<div class="char_subtitle">인증 받은 스토어</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Deals of the week -->

	<div class="deals_featured">
		<div class="container">
			<div class="row">
				<div class="col d-flex flex-lg-row flex-column align-items-center justify-content-start">
					<div class="new_arrivals_title" style="margin-left: 500px;">Hot Arrivals</div>
					<!-- Deals -->

					<div class="deals">
						<div class="deals_title" style="color:red">Live On</div>
						<div class="deals_slider_container">
							
							<!-- Deals Slider -->
							<div class="owl-carousel owl-theme deals_slider">
								
								<!-- Deals Item -->
								<div class="owl-item deals_item">
									<div class="deals_image"><img src="resources/images/deals.png" alt=""></div>
									<div class="deals_content">
										<div class="deals_info_line d-flex flex-row justify-content-start">
											<div class="deals_item_category"><a href="#">Headphones</a></div>
											<div class="deals_item_price_a ml-auto">$300</div>
										</div>
										<div class="deals_info_line d-flex flex-row justify-content-start">
											<div class="deals_item_name">Beoplay H7</div>
											<div class="deals_item_price ml-auto">$225</div>
										</div>
										<div class="available">
											<div class="available_line d-flex flex-row justify-content-start">
												<div class="available_title">Available: <span>6</span></div>
												<div class="sold_title ml-auto">Already sold: <span>28</span></div>
											</div>
											<div class="available_bar"><span style="width:17%"></span></div>
										</div>
										<div class="deals_timer d-flex flex-row align-items-center justify-content-start">
											<div class="deals_timer_title_container">
												<div class="deals_timer_title">Hurry Up</div>
												<div class="deals_timer_subtitle">Offer ends in:</div>
											</div>
											<div class="deals_timer_content ml-auto">
												<div class="deals_timer_box clearfix" data-target-time="">
													<div class="deals_timer_unit">
														<div id="deals_timer1_hr" class="deals_timer_hr"></div>
														<span>hours</span>
													</div>
													<div class="deals_timer_unit">
														<div id="deals_timer1_min" class="deals_timer_min"></div>
														<span>mins</span>
													</div>
													<div class="deals_timer_unit">
														<div id="deals_timer1_sec" class="deals_timer_sec"></div>
														<span>secs</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- Deals Item -->
								<div class="owl-item deals_item">
									<div class="deals_image"><img src="resources/images/deals.png" alt=""></div>
									<div class="deals_content">
										<div class="deals_info_line d-flex flex-row justify-content-start">
											<div class="deals_item_category"><a href="#">Headphones</a></div>
											<div class="deals_item_price_a ml-auto">$300</div>
										</div>
										<div class="deals_info_line d-flex flex-row justify-content-start">
											<div class="deals_item_name">Beoplay H7</div>
											<div class="deals_item_price ml-auto">$225</div>
										</div>
										<div class="available">
											<div class="available_line d-flex flex-row justify-content-start">
												<div class="available_title">Available: <span>6</span></div>
												<div class="sold_title ml-auto">Already sold: <span>28</span></div>
											</div>
											<div class="available_bar"><span style="width:17%"></span></div>
										</div>
										<div class="deals_timer d-flex flex-row align-items-center justify-content-start">
											<div class="deals_timer_title_container">
												<div class="deals_timer_title">Hurry Up</div>
												<div class="deals_timer_subtitle">Offer ends in:</div>
											</div>
											<div class="deals_timer_content ml-auto">
												<div class="deals_timer_box clearfix" data-target-time="">
													<div class="deals_timer_unit">
														<div id="deals_timer2_hr" class="deals_timer_hr"></div>
														<span>hours</span>
													</div>
													<div class="deals_timer_unit">
														<div id="deals_timer2_min" class="deals_timer_min"></div>
														<span>mins</span>
													</div>
													<div class="deals_timer_unit">
														<div id="deals_timer2_sec" class="deals_timer_sec"></div>
														<span>secs</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- Deals Item -->
								<div class="owl-item deals_item">
									<div class="deals_image"><img src="resources/images/deals.png" alt=""></div>
									<div class="deals_content">
										<div class="deals_info_line d-flex flex-row justify-content-start">
											<div class="deals_item_category"><a href="#">Headphones</a></div>
											<div class="deals_item_price_a ml-auto">$300</div>
										</div>
										<div class="deals_info_line d-flex flex-row justify-content-start">
											<div class="deals_item_name">Beoplay H7</div>
											<div class="deals_item_price ml-auto">$225</div>
										</div>
										<div class="available">
											<div class="available_line d-flex flex-row justify-content-start">
												<div class="available_title">Available: <span>6</span></div>
												<div class="sold_title ml-auto">Already sold: <span>28</span></div>
											</div>
											<div class="available_bar"><span style="width:17%"></span></div>
										</div>
										<div class="deals_timer d-flex flex-row align-items-center justify-content-start">
											<div class="deals_timer_title_container">
												<div class="deals_timer_title">Hurry Up</div>
												<div class="deals_timer_subtitle">Offer ends in:</div>
											</div>
											<div class="deals_timer_content ml-auto">
												<div class="deals_timer_box clearfix" data-target-time="">
													<div class="deals_timer_unit">
														<div id="deals_timer3_hr" class="deals_timer_hr"></div>
														<span>hours</span>
													</div>
													<div class="deals_timer_unit">
														<div id="deals_timer3_min" class="deals_timer_min"></div>
														<span>mins</span>
													</div>
													<div class="deals_timer_unit">
														<div id="deals_timer3_sec" class="deals_timer_sec"></div>
														<span>secs</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>

						</div>

						<div class="deals_slider_nav_container">
							<div class="deals_slider_prev deals_slider_nav"><i class="fas fa-chevron-left ml-auto"></i></div>
							<div class="deals_slider_next deals_slider_nav"><i class="fas fa-chevron-right ml-auto"></i></div>
						</div>
					</div>
					
					<!-- Featured -->
					<div class="featured">
						<div class="tabbed_container">
							<div class="tabs">
								<ul class="clearfix">
									<li class="active">Top 12</li>
								<li>식품</li>
								<li>의류</li>
								<li>가구</li>
								<li>디지털</li>
								<li>취미</li>
								<li>생활</li>
								</ul>
								<div class="tabs_line"><span></span></div>
							</div>
							
						


							<!-- Product Panel -->
							<div class="product_panel panel active">
								<div class="featured_slider slider">

									<!-- Slider Item -->
									<c:forEach items="${ HotTopList }" var="p"> 
										<div class="featured_slider_item">
											<div class="border_active"></div>
											<div class="product_item discount d-flex flex-column align-items-center justify-content-center text-center">
												<div class="product_image d-flex flex-column align-items-center justify-content-center"> 
													<img src="resources/product_uploadFiles/${p.paChangeName }" width="100px" height="100px" onclick="location.href='pDetailView.do?pId=${p.pId }';">
												</div>
												<div class="product_content">
													<div class="product_price discount">￦ ${p.pPrice } ~</span></div>
													
													<div class="product_name"><a href="pDetailView.do?pId=${p.pId }">${p.pName }</a></div>
													<div class="product_extras">
														<button class="product_cart_button">Add to Cart</button>
													</div>
												</div>
												
												<c:if test="${!empty loginUser }">
													<input class="pId" type="hidden" value="${p.pId}">
													<c:set var="doneLoop" value="false"/> 
													<c:if test="${fn:length(gglist) == 0}">
														<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
													</c:if>
													<c:forEach items="${gglist}" var="g">
														<c:if test="${not doneLoop}"> 
															<c:if test = "${g.pId eq p.pId}">
																<div class="product_fav active favPid"><i class="fas fa-heart "></i></div>
																<c:set var="doneLoop" value="true"/> 
															</c:if>
															<c:if test = "${g.pId ne p.pId}">
																<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
															</c:if>
														</c:if>
													</c:forEach>
												</c:if>
												
											</div>
										</div>
									</c:forEach>
						
								</div>
								<div class="featured_slider_dots_cover"></div>
							</div>


<!-- 						<script>
						
						$(function() {
							categoryId(1000);
						});
						  $(document).ready( function() {
						        $('.temp').click( function() {
						          $('#temp').scrollTop(0);
						        } );
						      } );
						
							function categoryId(category) {
								$.ajax({
									url:'test11.do',
									data:{category:category}, 
									type:"post",
									dataType:"JSON",
									success:function(data) {
										if(data != null) {
											$.each(data, function(index, value){
												var price = value.pPrice;
												
												
												var photo = value.paChangeName;
												var pId = value.pId;
												var pName = value.pName;
												var text = 
													'<div class="featured_slider_item">' +
														'<div class="border_active"></div>' + 
														'<div class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">' + 
															'<div class="product_image d-flex flex-column align-items-center justify-content-center">'+
																'<img src="resources/product_uploadFiles/'+photo+' " width="100px" height="100px" alt="" onclick="loaction.href=' + "'pDetailView.do?pId='" +pId+';">'+
															'</div>' + 
															'<div class="product_content">' + 
																'<div class="product_price discount">' + price +'</span>' +
															'</div>' + 
															'<div class="product_name">'
																+'<div><a href="pDetailView.do?pId='+pId+'">'+pName+'</a></div>'+
															'</div>' + 
															'<div class="product_extras">' + 
																'<button class="product_cart_button">Add to Cart</button>' + 
															'</div>' + 
														'</div>' + 
														'<div class="product_fav"><i class="fas fa-heart"></i></div>' + 
													'</div>';								
													
													
													$('HotTopBox').append(text);
													
												
													/* if(category==1000){
														$('#HotTopBox').append(text);
													}else if(category==1001){
														$('#Hot1Box').append(text);														
													}else if(category==1002){														
														$('#Hot2Box').append(text);														
													}else if(category==1003){
														$('#Hot3Box').append(text);																												
													}else if(category==1004){
														$('#Hot4Box').append(text);
													}else if(category==1005){
														$('#Hot5Box').append(text);
													}else if(category==1006){
														$('#Hot6Box').append(text);
													} */
												
												
											})
											
										}
									},
									error:function() {
										console.log('통신 실패');
									}
									
									
								});
							}
							
						</script> -->

<!-- Product Panel -->
							<div class="product_panel panel">
								<div class="featured_slider slider">

									<!-- Slider Item -->
									<c:forEach items="${ Hot1List }" var="p"> 
										<div class="featured_slider_item">
											<div class="border_active"></div>
											<div class="product_item discount d-flex flex-column align-items-center justify-content-center text-center">
												<div class="product_image d-flex flex-column align-items-center justify-content-center"> 
													<img src="resources/product_uploadFiles/${p.paChangeName }" width="100px" height="100px" onclick="location.href='pDetailView.do?pId=${p.pId }';">
												</div>
												<div class="product_content">
													<div class="product_price discount">￦ ${p.pPrice } ~</span></div>
													
													<div class="product_name"><a href="pDetailView.do?pId=${p.pId }">${p.pName }</a></div>
													<div class="product_extras">
														<button class="product_cart_button">Add to Cart</button>
													</div>
												</div>
												<div class="product_fav"><i class="fas fa-heart"></i></div>
												
											</div>
										</div>
									</c:forEach>
						
								</div>
								<div class="featured_slider_dots_cover"></div>
							</div>
							
							<!-- Product Panel -->
							<div class="product_panel panel">
								<div class="featured_slider slider">

									<!-- Slider Item -->
									<c:forEach items="${ Hot2List }" var="p"> 
										<div class="featured_slider_item">
											<div class="border_active"></div>
											<div class="product_item discount d-flex flex-column align-items-center justify-content-center text-center">
												<div class="product_image d-flex flex-column align-items-center justify-content-center"> 
													<img src="resources/product_uploadFiles/${p.paChangeName }" width="100px" height="100px" onclick="location.href='pDetailView.do?pId=${p.pId }';">
												</div>
												<div class="product_content">
													<div class="product_price discount">￦ ${p.pPrice } ~</span></div>
													
													<div class="product_name"><a href="pDetailView.do?pId=${p.pId }">${p.pName }</a></div>
													<div class="product_extras">
														<button class="product_cart_button">Add to Cart</button>
													</div>
												</div>
												<div class="product_fav"><i class="fas fa-heart"></i></div>
												
											</div>
										</div>
									</c:forEach>
						
								</div>
								<div class="featured_slider_dots_cover"></div>
							</div><!-- Product Panel -->
							<div class="product_panel panel">
								<div class="featured_slider slider">

									<!-- Slider Item -->
									<c:forEach items="${ Hot3List }" var="p"> 
										<div class="featured_slider_item">
											<div class="border_active"></div>
											<div class="product_item discount d-flex flex-column align-items-center justify-content-center text-center">
												<div class="product_image d-flex flex-column align-items-center justify-content-center"> 
													<img src="resources/product_uploadFiles/${p.paChangeName }" width="100px" height="100px" onclick="location.href='pDetailView.do?pId=${p.pId }';">
												</div>
												<div class="product_content">
													<div class="product_price discount">￦ ${p.pPrice } ~</span></div>
													
													<div class="product_name"><a href="pDetailView.do?pId=${p.pId }">${p.pName }</a></div>
													<div class="product_extras">
														<button class="product_cart_button">Add to Cart</button>
													</div>
												</div>
												<div class="product_fav"><i class="fas fa-heart"></i></div>
												
											</div>
										</div>
									</c:forEach>
						
								</div>
								<div class="featured_slider_dots_cover"></div>
							</div><!-- Product Panel -->
							<div class="product_panel panel">
								<div class="featured_slider slider">

									<!-- Slider Item -->
									<c:forEach items="${ Hot4List }" var="p"> 
										<div class="featured_slider_item">
											<div class="border_active"></div>
											<div class="product_item discount d-flex flex-column align-items-center justify-content-center text-center">
												<div class="product_image d-flex flex-column align-items-center justify-content-center"> 
													<img src="resources/product_uploadFiles/${p.paChangeName }" width="100px" height="100px" onclick="location.href='pDetailView.do?pId=${p.pId }';">
												</div>
												<div class="product_content">
													<div class="product_price discount">￦ ${p.pPrice } ~</span></div>
													
													<div class="product_name"><a href="pDetailView.do?pId=${p.pId }">${p.pName }</a></div>
													<div class="product_extras">
														<button class="product_cart_button">Add to Cart</button>
													</div>
												</div>
												<div class="product_fav"><i class="fas fa-heart"></i></div>
												
											</div>
										</div>
									</c:forEach>
						
								</div>
								<div class="featured_slider_dots_cover"></div>
							</div><!-- Product Panel -->
							<div class="product_panel panel">
								<div class="featured_slider slider">

									<!-- Slider Item -->
									<c:forEach items="${ Hot5List }" var="p"> 
										<div class="featured_slider_item">
											<div class="border_active"></div>
											<div class="product_item discount d-flex flex-column align-items-center justify-content-center text-center">
												<div class="product_image d-flex flex-column align-items-center justify-content-center"> 
													<img src="resources/product_uploadFiles/${p.paChangeName }" width="100px" height="100px" onclick="location.href='pDetailView.do?pId=${p.pId }';">
												</div>
												<div class="product_content">
													<div class="product_price discount">￦ ${p.pPrice } ~</span></div>
													
													<div class="product_name"><a href="pDetailView.do?pId=${p.pId }">${p.pName }</a></div>
													<div class="product_extras">
														<button class="product_cart_button">Add to Cart</button>
													</div>
												</div>
												<div class="product_fav"><i class="fas fa-heart"></i></div>
												
											</div>
										</div>
									</c:forEach>
						
								</div>
								<div class="featured_slider_dots_cover"></div>
							</div><!-- Product Panel -->
							<div class="product_panel panel">
								<div class="featured_slider slider">

									<!-- Slider Item -->
									<c:forEach items="${ Hot6List }" var="p"> 
										<div class="featured_slider_item">
											<div class="border_active"></div>
											<div class="product_item discount d-flex flex-column align-items-center justify-content-center text-center">
												<div class="product_image d-flex flex-column align-items-center justify-content-center"> 
													<img src="resources/product_uploadFiles/${p.paChangeName }" width="100px" height="100px" onclick="location.href='pDetailView.do?pId=${p.pId }';">
												</div>
												<div class="product_content">
													<div class="product_price discount">￦ ${p.pPrice } ~</span></div>
													
													<div class="product_name"><a href="pDetailView.do?pId=${p.pId }">${p.pName }</a></div>
													<div class="product_extras">
														<button class="product_cart_button">Add to Cart</button>
													</div>
												</div>
												<div class="product_fav"><i class="fas fa-heart"></i></div>
												
											</div>
										</div>
									</c:forEach>
						
								</div>
								<div class="featured_slider_dots_cover"></div>
							</div>







						</div>
					</div>

				</div>
			</div>
		</div>
	</div>



	<!-- Banner -->

	<div class="banner_2">
		<div class="banner_2_background" style="background-image:url(resources/images/banner_2_background.jpg)"></div>
		<div class="banner_2_container">
			<div class="banner_2_dots"></div>
			<!-- Banner 2 Slider -->

			<div class="owl-carousel owl-theme banner_2_slider">

				<!-- Banner 2 Slider Item -->
				<div class="owl-item">
					<div class="banner_2_item">
						<div class="container fill_height">
							<div class="row fill_height">
								<div class="col-lg-4 col-md-6 fill_height">
									<div class="banner_2_content">
										<div class="banner_2_category">Laptops</div>
										<div class="banner_2_title">MacBook Air</div>
										<div class="banner_2_text"><h4>다시 한 번 가볍게 앞서다.<br> Retina 디스플레이 찬란한 등장.<br> Touch ID 당신의 지문이 비밀번호.</h4></div>
										<div class="rating_r rating_r_4 banner_2_rating"><i></i><i></i><i></i><i></i><i></i></div>
										<div class="button banner_2_button"><a href="#">쇼핑하기 ▷</a></div>
									</div>
									
								</div>
								<div class="col-lg-8 col-md-6 fill_height">
									<div class="banner_2_image_container">
										<div class="banner_2_image"><img src="resources/images/banner_2_product.png" alt=""></div>
									</div>
								</div>
							</div>
						</div>			
					</div>
				</div>

				<!-- Banner 2 Slider Item -->
				<div class="owl-item">
					<div class="banner_2_item">
						<div class="container fill_height">
							<div class="row fill_height">
								<div class="col-lg-4 col-md-6 fill_height">
									<div class="banner_2_content">
										<div class="banner_2_category">뺴뺴로</div>
										<div class="banner_2_title">Happy Sweet day!</div>
										<div class="banner_2_text">11월 11일 빼빼로 데이 <br> 뺴빼로 할인 최대 31%</div>
										<div class="rating_r rating_r_4 banner_2_rating"><i></i><i></i><i></i><i></i><i></i></div>
										<div class="button banner_2_button"><a href="#">쇼핑하기 ▷</a></div>
									</div>
									
								</div>
								<div class="col-lg-8 col-md-6 fill_height">
									<div class="banner_2_image_container">
										<div class="banner_2_image"><img src="resources/images/pepelo.png" alt=""></div>
									</div>
								</div>
							</div>
						</div>			
					</div>
				</div>

				<!-- Banner 2 Slider Item -->
				<div class="owl-item">
					<div class="banner_2_item">
						<div class="container fill_height">
							<div class="row fill_height">
								<div class="col-lg-4 col-md-6 fill_height">
									<div class="banner_2_content">
										<div class="banner_2_category">output</div>
										<div class="banner_2_title">MacBook Air 13</div>
										<div class="banner_2_text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum laoreet.</div>
										<div class="rating_r rating_r_4 banner_2_rating"><i></i><i></i><i></i><i></i><i></i></div>
										<div class="button banner_2_button"><a href="#">Explore</a></div>
									</div>
									
								</div>
								<div class="col-lg-8 col-md-6 fill_height">
									<div class="banner_2_image_container">
										<div class="banner_2_image"><img src="resources/images/banner_2_product.png" alt=""></div>
									</div>
								</div>
							</div>
						</div>			
					</div>
				</div>

			</div>
		</div>
	</div>













<aaaaa>

	<!-- Hot New Arrivals -->

	<div class="new_arrivals">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="tabbed_container">
						<div class="tabs clearfix tabs-right">
							<div class="new_arrivals_title">New Arrivals</div>
							<ul class="clearfix">
								<li class="active">Top 12</li>
								<li>식품</li>
								<li>의류</li>
								<li>가구</li>
								<li>디지털</li>
								<li>취미</li>
								<li>생활</li>
							</ul>
							<div class="tabs_line"><span></span></div>
						</div>
						<div class="row">
							<div class="col-lg-9" style="z-index:1;">

								<!-- Product Panel -->
								<div class="product_panel panel active">
									<div class="arrivals_slider slider">
										<!-- Slider Item -->
										<c:forEach items="${ NewTopList }" var="p">
											<div class="arrivals_slider_item">
												<div class="border_active"></div>
												<div class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
													<div class="product_image d-flex flex-column align-items-center justify-content-center"><img src="resources/product_uploadFiles/${p.paChangeName }" width="100px" height="100px" alt="" onclick="location.href='pDetailView.do?pId=${ p.pId }';"></div>
													<div class="product_content">
														<div class="product_price">￦ ${ p.pPrice } ~</div>
														
														<div class="product_name"><a href="pDetailView.do?pId=${ p.pId }">${ p.pName }</a></div>
														<div class="product_extras">
															
															<button class="product_cart_button" onclick="location.href='addBasket.ba?pId=${p.pId}';">Add to Cart</button>
														</div>
													</div>
													<div class="product_fav"><i class="fas fa-heart"></i></div>
													<ul class="product_marks">
														<li class="product_mark product_discount">-25%</li>
														<li class="product_mark product_new">new</li>
													</ul>
												</div>
											</div>
										</c:forEach>

									</div>
									<div class="arrivals_slider_dots_cover"></div>
								</div>





<!-- Product Panel -->
								<div class="product_panel panel">
									<div class="arrivals_slider slider">
										<!-- Slider Item -->
										<c:forEach items="${ New1List }" var="p">
											<div class="arrivals_slider_item">
												<div class="border_active"></div>
												<div class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
													<div class="product_image d-flex flex-column align-items-center justify-content-center"><img src="resources/product_uploadFiles/${p.paChangeName }" width="100px" height="100px" alt="" onclick="location.href='pDetailView.do?pId=${ p.pId }';"></div>
													<div class="product_content">
														<div class="product_price">￦ ${ p.pPrice } ~</div>
														
														<div class="product_name"><a href="pDetailView.do?pId=${ p.pId }">${ p.pName }</a></div>
														<div class="product_extras">
															
															<button class="product_cart_button" onclick="location.href='addBasket.ba?pId=${p.pId}';">Add to Cart</button>
														</div>
													</div>
												
													<c:if test="${!empty loginUser }">
														<input class="pId" type="hidden" value="${p.pId}">
														<c:set var="doneLoop" value="false"/> 
														<c:if test="${fn:length(gglist) == 0}">
															<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
														</c:if>
														<c:forEach items="${gglist}" var="g">
															<c:if test="${not doneLoop}"> 
																<c:if test = "${g.pId eq p.pId}">
																	<div class="product_fav active favPid"><i class="fas fa-heart "></i></div>
																	<c:set var="doneLoop" value="true"/> 
																</c:if>
																<c:if test = "${g.pId ne p.pId}">
																	<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
																</c:if>
															</c:if>
														</c:forEach>
													</c:if>
													
													<ul class="product_marks">
														<li class="product_mark product_discount">-25%</li>
														<li class="product_mark product_new">new</li>
													</ul>
												</div>
											</div>
										</c:forEach>
										
										

									</div>
									<div class="arrivals_slider_dots_cover"></div>
								</div>












<!-- Product Panel -->
								<div class="product_panel panel">
									<div class="arrivals_slider slider">
										<!-- Slider Item -->
										<c:forEach items="${ New2List }" var="p">
											<div class="arrivals_slider_item">
												<div class="border_active"></div>
												<div class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
													<div class="product_image d-flex flex-column align-items-center justify-content-center"><img src="resources/product_uploadFiles/${p.paChangeName }" width="100px" height="100px" alt="" onclick="location.href='pDetailView.do?pId=${ p.pId }';"></div>
													<div class="product_content">
														<div class="product_price">￦ ${ p.pPrice } ~</div>
														
														<div class="product_name"><a href="pDetailView.do?pId=${ p.pId }">${ p.pName }</a></div>
														<div class="product_extras">
															
															<button class="product_cart_button" onclick="location.href='addBasket.ba?pId=${p.pId}';">Add to Cart</button>
														</div>
													</div>
													<div class="product_fav"><i class="fas fa-heart"></i></div>
													<ul class="product_marks">
														<li class="product_mark product_discount">-25%</li>
														<li class="product_mark product_new">new</li>
													</ul>
												</div>
											</div>
										</c:forEach>

									</div>
									<div class="arrivals_slider_dots_cover"></div>
								</div>
								
<!-- Product Panel -->
								<div class="product_panel panel">
									<div class="arrivals_slider slider">
										<!-- Slider Item -->
										<c:forEach items="${ New3List }" var="p">
											<div class="arrivals_slider_item">
												<div class="border_active"></div>
												<div class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
													<div class="product_image d-flex flex-column align-items-center justify-content-center"><img src="resources/product_uploadFiles/${p.paChangeName }" width="100px" height="100px" alt="" onclick="location.href='pDetailView.do?pId=${ p.pId }';"></div>
													<div class="product_content">
														<div class="product_price">￦ ${ p.pPrice } ~</div>
														
														<div class="product_name"><a href="pDetailView.do?pId=${ p.pId }">${ p.pName }</a></div>
														<div class="product_extras">
															
															<button class="product_cart_button" onclick="location.href='addBasket.ba?pId=${p.pId}';">Add to Cart</button>
														</div>
													</div>
													<div class="product_fav"><i class="fas fa-heart"></i></div>
													<ul class="product_marks">
														<li class="product_mark product_discount">-25%</li>
														<li class="product_mark product_new">new</li>
													</ul>
												</div>
											</div>
										</c:forEach>

									</div>
									<div class="arrivals_slider_dots_cover"></div>
								</div>								


<!-- Product Panel -->
								<div class="product_panel panel">
									<div class="arrivals_slider slider">
										<!-- Slider Item -->
										<c:forEach items="${ New4List }" var="p">
											<div class="arrivals_slider_item">
												<div class="border_active"></div>
												<div class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
													<div class="product_image d-flex flex-column align-items-center justify-content-center"><img src="resources/product_uploadFiles/${p.paChangeName }" width="100px" height="100px" alt="" onclick="location.href='pDetailView.do?pId=${ p.pId }';"></div>
													<div class="product_content">
														<div class="product_price">￦ ${ p.pPrice } ~</div>
														
														<div class="product_name"><a href="pDetailView.do?pId=${ p.pId }">${ p.pName }</a></div>
														<div class="product_extras">
															
															<button class="product_cart_button" onclick="location.href='addBasket.ba?pId=${p.pId}';">Add to Cart</button>
														</div>
													</div>
													<div class="product_fav"><i class="fas fa-heart"></i></div>
													<ul class="product_marks">
														<li class="product_mark product_discount">-25%</li>
														<li class="product_mark product_new">new</li>
													</ul>
												</div>
											</div>
										</c:forEach>

									</div>
									<div class="arrivals_slider_dots_cover"></div>
								</div>


<!-- Product Panel -->
								<div class="product_panel panel">
									<div class="arrivals_slider slider">
										<!-- Slider Item -->
										<c:forEach items="${ New5List }" var="p">
											<div class="arrivals_slider_item">
												<div class="border_active"></div>
												<div class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
													<div class="product_image d-flex flex-column align-items-center justify-content-center"><img src="resources/product_uploadFiles/${p.paChangeName }" width="100px" height="100px" alt="" onclick="location.href='pDetailView.do?pId=${ p.pId }';"></div>
													<div class="product_content">
														<div class="product_price">￦ ${ p.pPrice } ~</div>
														
														<div class="product_name"><a href="pDetailView.do?pId=${ p.pId }">${ p.pName }</a></div>
														<div class="product_extras">
															
															<button class="product_cart_button" onclick="location.href='addBasket.ba?pId=${p.pId}';">Add to Cart</button>
														</div>
													</div>
													<div class="product_fav"><i class="fas fa-heart"></i></div>
													<ul class="product_marks">
														<li class="product_mark product_discount">-25%</li>
														<li class="product_mark product_new">new</li>
													</ul>
												</div>
											</div>
										</c:forEach>

									</div>
									<div class="arrivals_slider_dots_cover"></div>
								</div>


<!-- Product Panel -->
								<div class="product_panel panel">
									<div class="arrivals_slider slider">
										<!-- Slider Item -->
										<c:forEach items="${ New6List }" var="p">
											<div class="arrivals_slider_item">
												<div class="border_active"></div>
												<div class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
													<div class="product_image d-flex flex-column align-items-center justify-content-center"><img src="resources/product_uploadFiles/${p.paChangeName }" width="100px" height="100px" alt="" onclick="location.href='pDetailView.do?pId=${ p.pId }';"></div>
													<div class="product_content">
														<div class="product_price">￦ ${ p.pPrice } ~</div>
														
														<div class="product_name"><a href="pDetailView.do?pId=${ p.pId }">${ p.pName }</a></div>
														<div class="product_extras">
															
															<button class="product_cart_button" onclick="location.href='addBasket.ba?pId=${p.pId}';">Add to Cart</button>
														</div>
													</div>
													<div class="product_fav"><i class="fas fa-heart"></i></div>
													<ul class="product_marks">
														<li class="product_mark product_discount">-25%</li>
														<li class="product_mark product_new">new</li>
													</ul>
												</div>
											</div>
										</c:forEach>

									</div>
									<div class="arrivals_slider_dots_cover"></div>
								</div>




						</div>
						<c:forEach items="${ Newest }" var="p">
							<div class="col-lg-3">
								<div class="arrivals_single clearfix">
									<div class="d-flex flex-column align-items-center justify-content-center">
										<div class="arrivals_single_image"><img src="resources/product_uploadFiles/${p.paChangeName }" width="200px" height="200px" alt="" onclick="location.href='pDetailView.do?pId=${ p.pId }';"></div>
										<div class="arrivals_single_content">
											<div class="arrivals_single_category">${ p.cName2 }</a></div>
											<div class="arrivals_single_name_container clearfix">
												<div class="arrivals_single_name"><a href="pDetailView.do?pId=${ p.pId }">${ p.pName }</a></div>
												<div class="arrivals_single_price text-right">￦ ${ p.pPrice } ~</div>
											</div>
											<form action="#"><button class="arrivals_single_button" onclick="location.href='addBasket.ba?pId=${p.pId}';">Add to Cart</button></form>
										</div>
								
											<div class="arrivals_single_fav product_fav active"><i class="fas fa-heart"></i></div>
											<ul class="arrivals_single_marks product_marks">
												<li class="arrivals_single_mark product_mark product_new">new</li>
											</ul>
									
									</div>
								</div>
							</div>
						</c:forEach>





						</div>
								
					</div>
				</div>
			</div>
		</div>		
	</div>



<!-- HotBestSeller -->

	<!-- Trends -->

	<div class="trends">
		<div class="trends_background" style="background-image:url(resources/images/trends_background.jpg)"></div>
		<div class="trends_overlay"></div>
		<div class="container">
			<div class="row">

				<!-- Trends Content -->
				<div class="col-lg-3">
					<div class="trends_container">
						<h2 class="trends_title">How About This?</h2>
						<div class="trends_text"><p>PANDA hope you like it. <br>  Have a nice shopping!:) </p></div>
						<div class="trends_slider_nav">
							<div class="trends_prev trends_nav"><i class="fas fa-angle-left ml-auto"></i></div>
							<div class="trends_next trends_nav"><i class="fas fa-angle-right ml-auto"></i></div>
						</div>
					</div>
				</div>

				<!-- Trends Slider -->
				<div class="col-lg-9">
					<div class="trends_slider_container">

						<!-- Trends Slider -->

						<div class="owl-carousel owl-theme trends_slider">

							<!-- Trends Slider Item -->
							<c:forEach items="${ random }" var="r">
								<div class="owl-item">
									<div class="trends_item discount">
										<div class="trends_image d-flex flex-column align-items-center justify-content-center"><img src="resources/product_uploadFiles/${r.paChangeName }" width="150px" height="180px" alt="" onclick="location.href='pDetailView.do?pId=${ r.pId }';"></div>
										<div class="trends_content">
											<div class="trends_category"><a href="#">${ r.cName2 }</a></div>
											<div class="trends_info clearfix">
												<div class="trends_name" style="margin-bottom:10px"><a href="pDetailView.do?pId=${ r.pId }">${ r.pName }</a></div>
												<div class="trends_price" style="margin-top:10px">￦ ${r.pPrice } ~ </div>
											</div>
										</div>
										<ul class="trends_marks">
											<li class="trends_mark trends_discount">Tip!</li>
											<li class="trends_mark trends_new">Hot</li>
										</ul>
										<div class="trends_fav"><i class="fas fa-heart"></i></div>
									</div>
								</div>
							</c:forEach>

							

						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


	<!-- Popular Categories -->

	<div class="popular_categories">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="popular_categories_content">
						<div class="popular_categories_title">Popular Categories</div>
						<div class="popular_categories_slider_nav">
							<div class="popular_categories_prev popular_categories_nav"><i class="fas fa-angle-left ml-auto"></i></div>
							<div class="popular_categories_next popular_categories_nav"><i class="fas fa-angle-right ml-auto"></i></div>
						</div>
						<div class="popular_categories_link"><a href="#">full catalog</a></div>
					</div>
				</div>
				
				<!-- Popular Categories Slider -->

				<div class="col-lg-9">
					<div class="popular_categories_slider_container">
						<div class="owl-carousel owl-theme popular_categories_slider">

							<!-- Popular Categories Item -->
							<div class="owl-item">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image"><img src="resources/images/popular_1.png" alt="" onclick="location.href='pListView.do?category=1001';"></div>
									<div class="popular_category_text">food</div>
								</div>
							</div>

							<!-- Popular Categories Item -->
							<div class="owl-item">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image"><img src="resources/images/popular_2.png" onclick="location.href='pListView.do?category=1002';"  alt=""></div>
									<div class="popular_category_text">Clothing & Accessories</div>
								</div>
							</div>

							<!-- Popular Categories Item -->
							<div class="owl-item">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image"><img src="resources/images/popular_3.png" onclick="location.href='pListView.do?category=1003';" alt=""></div>
									<div class="popular_category_text">Furniture & Interior</div>
								</div>
							</div>

							<!-- Popular Categories Item -->
							<div class="owl-item">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image"><img src="resources/images/popular_4.png" onclick="location.href='pListView.do?category=1004';" alt=""></div>
									<div class="popular_category_text">Digital & Home Appliances & Computers</div>
								</div>
							</div>

							<!-- Popular Categories Item -->
							<div class="owl-item">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image"><img src="resources/images/popular_5.png" onclick="location.href='pListView.do?category=1005';" alt=""></div>
									<div class="popular_category_text">Hobbies & Pets</div>
								</div>
							</div>
							
							<!-- Popular Categories Item -->
							<div class="owl-item">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image"><img src="resources/images/popular_5.png" onclick="location.href='pListView.do?category=1006';" alt=""></div>
									<div class="popular_category_text">Life & Health & Beauty</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	



	<!-- Newsletter -->

	<div class="newsletter">
		<div class="container">
			<div class="row">
				<div class="col">
					
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="common/footer.jsp"/>
<script>
	$(function(){
		
		// 찜 토글 처리
		$(".favPid").off().on("click", function(){
			
			var flag = 0;
			if($(this).hasClass("active") == true) {
				flag = 1; // class 변경 처리가 더 빠르므로, 이 분기가 찜 추가하는 케이스임
			}else{
				flag = 0; // 찜 삭제
			}
			var pId = $(this).parent().find('.pId').val();

			$.ajax({
				url:"changeGgim.gg",
				data:{pId:pId, flag:flag},
				type:"post",
				success:function(data){
					getGgim();
				},
				error:function(){
					console.log("서버와의 통신 실패");
				}
			});
		});
	});
	
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
	
	// 메인메뉴 찜하기 비동기 처리
	function getGgim(){
		$.ajax({
			url:"currentGgim.gg",
			dataType:"json",
			success:function(data){
					$('.wishlist_count').children().first().text(data);
					$('#'+ item.id).css("display","none");

			},
			error:function(){
				console.log("ajax 통신 실패");
			}
		});
	}
</script>


</body>
</html>