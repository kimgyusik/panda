<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	.test{
	height:480px !important;
	}
	.temp{
	height:300px important;
	}
	.target{
	display: block !important;
	text-overflow: ellipsis !important;
	}
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


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
						<div class="deals_title" style="color:red">On Air</div>
						<div class="deals_slider_container">
							
							<!-- Deals Slider -->
							<div class="owl-carousel owl-theme deals_slider test">
								
								<!-- Deals Item -->
								<c:forEach items="${ LiveList }" var="p"> 
								<c:if test="${ !empty LiveList }">
									<div class="owl-item deals_item">
										<div class="deals_image"><img src="resources/product_uploadFiles/${p.paChangeName }" onclick="location.href='pDetailView.do?pId=${p.pId }';"></div>
										<div class="deals_content">
											<div class="deals_info_line d-flex flex-row justify-content-start">
												<div class="deals_item_category">${ p.cName2 }</div>
												<div class="deals_item_price_a ml-auto"><s>￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.pPrice }" /> ~</s></div>
											</div>
											<div class="deals_info_line d-flex flex-row justify-content-start temp">
												<div class="deals_item_name target temp"><a href="pDetailView.do?pId=${p.pId }">${p.pName }</a></div>
											</div>
											<div class="deals_info_line d-flex flex-row justify-content-start">
												<div class="deals_item_price ml-auto"> ￦ ????? </div>
											</div>
										</div>
									</div>
								</c:if>
								</c:forEach>
								<c:forEach items="${ LiveList }" var="p"> 
								<c:if test="${ empty LiveList }">
									<div class="owl-item deals_item">
									<div class="deals_image"><img src="resources/images/pandalive.jpeg" alt=""></div>
									<div class="deals_content">
											<div class="deals_info_line d-flex flex-row justify-content-start">
												<div class="deals_item_category">진행 중인 방송이 없습니다 잠시만 기다려주세요</div>
											</div>
											<div class="deals_info_line d-flex flex-row justify-content-start">
												<div class="deals_item_price ml-auto">  </div>
											</div>
										</div>
									</div>
								</c:if>
								</c:forEach>

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
									<li class="active">Top 16</li>
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
													<div class="product_price discount">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.pPrice }" /> ~</div>
													
													<div class="product_name"><a href="pDetailView.do?pId=${p.pId }">${p.pName }</a></div>
													<c:if test="${!empty loginUser }">
														<div class="product_extras">
															<button class="product_cart_button" onclick="addCart(${p.pId });">Add to Cart</button>
														</div>
													</c:if>
												</div>
												
												<c:if test="${!empty loginUser }">
													<input class="pId" type="hidden" value="${p.pId}">
													<c:set var="doneLoop" value="false"/> 
													<c:if test="${fn:length(gglist) == 0}">
														<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
													</c:if>
													<c:forEach items="${gglist}" var="g" varStatus="status">
														<c:if test="${not doneLoop}"> 
															<c:if test = "${g.pId eq p.pId}">
																<div class="product_fav active favPid"><i class="fas fa-heart "></i></div>
																<c:set var="doneLoop" value="true"/> 
															</c:if>
															<c:if test = "${g.pId ne p.pId && status.last}">
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
													<div class="product_price discount">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.pPrice }" /> ~</div>
													
													<div class="product_name"><a href="pDetailView.do?pId=${p.pId }">${p.pName }</a></div>
													<c:if test="${!empty loginUser }">
														<div class="product_extras">
															<button class="product_cart_button" onclick="addCart(${p.pId });">Add to Cart</button>
														</div>
													</c:if>
												</div>
												
												<c:if test="${!empty loginUser }">
													<input class="pId" type="hidden" value="${p.pId}">
													<c:set var="doneLoop" value="false"/> 
													<c:if test="${fn:length(gglist) == 0}">
														<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
													</c:if>
													<c:forEach items="${gglist}" var="g" varStatus="status">
														<c:if test="${not doneLoop}"> 
															<c:if test = "${g.pId eq p.pId}">
																<div class="product_fav active favPid"><i class="fas fa-heart "></i></div>
																<c:set var="doneLoop" value="true"/> 
															</c:if>
															<c:if test = "${g.pId ne p.pId && status.last}">
																<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
															</c:if>
														</c:if>
													</c:forEach>
												</c:if>

											</div>
										</div>
										
									</c:forEach>
									
									<script src="resources/js/home_custom.js"></script>
						
								</div>
								<div class="featured_slider_dots_cover"></div>
							</div>
							
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
													<div class="product_price discount">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.pPrice }" /> ~</div>
													
													<div class="product_name"><a href="pDetailView.do?pId=${p.pId }">${p.pName }</a></div>
													<c:if test="${!empty loginUser }">
														<div class="product_extras">
															<button class="product_cart_button" onclick="addCart(${p.pId });">Add to Cart</button>
														</div>
													</c:if>
												</div>
												
												<c:if test="${!empty loginUser }">
													<input class="pId" type="hidden" value="${p.pId}">
													<c:set var="doneLoop" value="false"/> 
													<c:if test="${fn:length(gglist) == 0}">
														<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
													</c:if>
													<c:forEach items="${gglist}" var="g" varStatus="status">
														<c:if test="${not doneLoop}"> 
															<c:if test = "${g.pId eq p.pId}">
																<div class="product_fav active favPid"><i class="fas fa-heart "></i></div>
																<c:set var="doneLoop" value="true"/> 
															</c:if>
															<c:if test = "${g.pId ne p.pId && status.last}">
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
							
							<!-- Product Panel -->
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
													<div class="product_price discount">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.pPrice }" /> ~</div>
													
													<div class="product_name"><a href="pDetailView.do?pId=${p.pId }">${p.pName }</a></div>
													<c:if test="${!empty loginUser }">
														<div class="product_extras">
															<button class="product_cart_button" onclick="addCart(${p.pId });">Add to Cart</button>
														</div>
													</c:if>
												</div>
												
												<c:if test="${!empty loginUser }">
													<input class="pId" type="hidden" value="${p.pId}">
													<c:set var="doneLoop" value="false"/> 
													<c:if test="${fn:length(gglist) == 0}">
														<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
													</c:if>
													<c:forEach items="${gglist}" var="g" varStatus="status">
														<c:if test="${not doneLoop}"> 
															<c:if test = "${g.pId eq p.pId}">
																<div class="product_fav active favPid"><i class="fas fa-heart "></i></div>
																<c:set var="doneLoop" value="true"/> 
															</c:if>
															<c:if test = "${g.pId ne p.pId && status.last}">
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
							
							<!-- Product Panel -->
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
													<div class="product_price discount">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.pPrice }" /> ~</div>
													
													<div class="product_name"><a href="pDetailView.do?pId=${p.pId }">${p.pName }</a></div>
													<c:if test="${!empty loginUser }">
														<div class="product_extras">
															<button class="product_cart_button" onclick="addCart(${p.pId });">Add to Cart</button>
														</div>
													</c:if>
												</div>
												
												<c:if test="${!empty loginUser }">
													<input class="pId" type="hidden" value="${p.pId}">
													<c:set var="doneLoop" value="false"/> 
													<c:if test="${fn:length(gglist) == 0}">
														<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
													</c:if>
													<c:forEach items="${gglist}" var="g" varStatus="status">
														<c:if test="${not doneLoop}"> 
															<c:if test = "${g.pId eq p.pId}">
																<div class="product_fav active favPid"><i class="fas fa-heart "></i></div>
																<c:set var="doneLoop" value="true"/> 
															</c:if>
															<c:if test = "${g.pId ne p.pId && status.last}">
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
							
							<!-- Product Panel -->
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
													<div class="product_price discount">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.pPrice }" /> ~</div>
													
													<div class="product_name"><a href="pDetailView.do?pId=${p.pId }">${p.pName }</a></div>
													<c:if test="${!empty loginUser }">
														<div class="product_extras">
															<button class="product_cart_button" onclick="addCart(${p.pId });">Add to Cart</button>
														</div>
													</c:if>
												</div>
												
												<c:if test="${!empty loginUser }">
													<input class="pId" type="hidden" value="${p.pId}">
													<c:set var="doneLoop" value="false"/> 
													<c:if test="${fn:length(gglist) == 0}">
														<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
													</c:if>
													<c:forEach items="${gglist}" var="g" varStatus="status">
														<c:if test="${not doneLoop}"> 
															<c:if test = "${g.pId eq p.pId}">
																<div class="product_fav active favPid"><i class="fas fa-heart "></i></div>
																<c:set var="doneLoop" value="true"/> 
															</c:if>
															<c:if test = "${g.pId ne p.pId && status.last}">
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
							
							<!-- Product Panel -->
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
													<div class="product_price discount">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.pPrice }" /> ~</div>
													
													<div class="product_name"><a href="pDetailView.do?pId=${p.pId }">${p.pName }</a></div>
													<c:if test="${!empty loginUser }">
														<div class="product_extras">
															<button class="product_cart_button" onclick="addCart(${p.pId });">Add to Cart</button>
														</div>
													</c:if>
												</div>
												
												<c:if test="${!empty loginUser }">
													<input class="pId" type="hidden" value="${p.pId}">
													<c:set var="doneLoop" value="false"/> 
													<c:if test="${fn:length(gglist) == 0}">
														<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
													</c:if>
													<c:forEach items="${gglist}" var="g" varStatus="status">
														<c:if test="${not doneLoop}"> 
															<c:if test = "${g.pId eq p.pId}">
																<div class="product_fav active favPid"><i class="fas fa-heart "></i></div>
																<c:set var="doneLoop" value="true"/> 
															</c:if>
															<c:if test = "${g.pId ne p.pId && status.last}">
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
										<div class="button banner_2_button"><a href="search.do?keyword=노트북" >쇼핑하기 ▷</a></div>
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
										<div class="button banner_2_button"><a href="search.do?keyword=빼빼로" >쇼핑하기 ▷</a></div>
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
										<div class="banner_2_category">반려동물 용품</div>
										<div class="banner_2_title">소중한 나의 반려동물</div>
										<div class="banner_2_text">야옹아 멍멍해봐!! <br> 프리미엄 반려동물 용품 쇼핑</div>
										<div class="rating_r rating_r_4 banner_2_rating"><i></i><i></i><i></i><i></i><i></i></div>
										<div class="button banner_2_button"><a href="pListView.do?category=1005">쇼핑하기 ▷</a></div>
									</div>
									
								</div>
								<div class="col-lg-8 col-md-6 fill_height">
									<div class="banner_2_image_container">
										<div class="banner_2_image"><img src="resources/images/cattoy.png" alt=""></div>
									</div>
								</div>
							</div>
						</div>			
					</div>
				</div>

			</div>
		</div>
	</div>















	<!-- Hot New Arrivals -->

	<div class="new_arrivals">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="tabbed_container">
						<div class="tabs clearfix tabs-right">
							<div class="new_arrivals_title">New Arrivals</div>
							<ul class="clearfix">
								<li class="active">Top 20</li>
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

								<div class="product_panel panel active">
									<div class="arrivals_slider slider">
										<!-- Slider Item -->
										<c:forEach items="${ NewTopList }" var="p">
											<div class="arrivals_slider_item">
												<div class="border_active"></div>
												<div class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
													<div class="product_image d-flex flex-column align-items-center justify-content-center"><img src="resources/product_uploadFiles/${p.paChangeName }" width="100px" height="100px" alt="" onclick="location.href='pDetailView.do?pId=${ p.pId }';"></div>
													<div class="product_content">
														<div class="product_price">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.pPrice }" /> ~</div>
														
														<div class="product_name"><a href="pDetailView.do?pId=${ p.pId }">${ p.pName }</a></div>
														<c:if test="${!empty loginUser }">
														<div class="product_extras">
															<button class="product_cart_button" onclick="addCart(${p.pId });">Add to Cart</button>
														</div>
													</c:if>
													</div>
													
													<c:if test="${!empty loginUser }">
														<input class="pId" type="hidden" value="${p.pId}">
														<c:set var="doneLoop" value="false"/> 
														<c:if test="${fn:length(gglist) == 0}">
															<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
														</c:if>
														<c:forEach items="${gglist}" var="g" varStatus="status">
															<c:if test="${not doneLoop}"> 
																<c:if test = "${g.pId eq p.pId}">
																	<div class="product_fav active favPid"><i class="fas fa-heart "></i></div>
																	<c:set var="doneLoop" value="true"/> 
																</c:if>
																<c:if test = "${g.pId ne p.pId && status.last}">
																	<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
																</c:if>
															</c:if>
														</c:forEach>
													</c:if>
													
												</div>
											</div>
										</c:forEach>

									</div>
									<div class="arrivals_slider_dots_cover"></div>
								</div>

								<div class="product_panel panel">
									<div class="arrivals_slider slider">
										<!-- Slider Item -->
										<c:forEach items="${ New1List }" var="p">
											<div class="arrivals_slider_item">
												<div class="border_active"></div>
												<div class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
													<div class="product_image d-flex flex-column align-items-center justify-content-center"><img src="resources/product_uploadFiles/${p.paChangeName }" width="100px" height="100px" alt="" onclick="location.href='pDetailView.do?pId=${ p.pId }';"></div>
													<div class="product_content">
														<div class="product_price">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.pPrice }" /> ~</div>
														
														<div class="product_name"><a href="pDetailView.do?pId=${ p.pId }">${ p.pName }</a></div>
														<c:if test="${!empty loginUser }">
															<div class="product_extras">
																<button class="product_cart_button" onclick="addCart(${p.pId });">Add to Cart</button>
															</div>
														</c:if>
													</div>
												
													<c:if test="${!empty loginUser }">
														<input class="pId" type="hidden" value="${p.pId}">
														<c:set var="doneLoop" value="false"/> 
														<c:if test="${fn:length(gglist) == 0}">
															<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
														</c:if>
														<c:forEach items="${gglist}" var="g" varStatus="status">
															<c:if test="${not doneLoop}"> 
																<c:if test = "${g.pId eq p.pId}">
																	<div class="product_fav active favPid"><i class="fas fa-heart "></i></div>
																	<c:set var="doneLoop" value="true"/> 
																</c:if>
																<c:if test = "${g.pId ne p.pId && status.last}">
																	<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
																</c:if>
															</c:if>
														</c:forEach>
													</c:if>
												
												</div>
											</div>
										</c:forEach>
										
										<script src="resources/js/home_custom.js"></script>

									</div>
									<div class="arrivals_slider_dots_cover"></div>
								</div>

								<div class="product_panel panel">
									<div class="arrivals_slider slider">
										<!-- Slider Item -->
										<c:forEach items="${ New2List }" var="p">
											<div class="arrivals_slider_item">
												<div class="border_active"></div>
												<div class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
													<div class="product_image d-flex flex-column align-items-center justify-content-center"><img src="resources/product_uploadFiles/${p.paChangeName }" width="100px" height="100px" alt="" onclick="location.href='pDetailView.do?pId=${ p.pId }';"></div>
													<div class="product_content">
														<div class="product_price">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.pPrice }" /> ~</div>
														
														<div class="product_name"><a href="pDetailView.do?pId=${ p.pId }">${ p.pName }</a></div>
														<c:if test="${!empty loginUser }">
															<div class="product_extras">
																<button class="product_cart_button" onclick="addCart(${p.pId });">Add to Cart</button>
															</div>
														</c:if>
													</div>
													
													<c:if test="${!empty loginUser }">
														<input class="pId" type="hidden" value="${p.pId}">
														<c:set var="doneLoop" value="false"/> 
														<c:if test="${fn:length(gglist) == 0}">
															<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
														</c:if>
														<c:forEach items="${gglist}" var="g" varStatus="status">
															<c:if test="${not doneLoop}"> 
																<c:if test = "${g.pId eq p.pId}">
																	<div class="product_fav active favPid"><i class="fas fa-heart "></i></div>
																	<c:set var="doneLoop" value="true"/> 
																</c:if>
																<c:if test = "${g.pId ne p.pId && status.last}">
																	<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
																</c:if>
															</c:if>
														</c:forEach>
													</c:if>
												
												</div>
											</div>
										</c:forEach>

									</div>
									<div class="arrivals_slider_dots_cover"></div>
								</div>
								
								<div class="product_panel panel">
									<div class="arrivals_slider slider">
										<!-- Slider Item -->
										<c:forEach items="${ New3List }" var="p">
											<div class="arrivals_slider_item">
												<div class="border_active"></div>
												<div class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
													<div class="product_image d-flex flex-column align-items-center justify-content-center"><img src="resources/product_uploadFiles/${p.paChangeName }" width="100px" height="100px" alt="" onclick="location.href='pDetailView.do?pId=${ p.pId }';"></div>
													<div class="product_content">
														<div class="product_price">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.pPrice }" /> ~</div>
														
														<div class="product_name"><a href="pDetailView.do?pId=${ p.pId }">${ p.pName }</a></div>
														<c:if test="${!empty loginUser }">
															<div class="product_extras">
																<button class="product_cart_button" onclick="addCart(${p.pId });">Add to Cart</button>
															</div>
														</c:if>
													</div>
													
													<c:if test="${!empty loginUser }">
														<input class="pId" type="hidden" value="${p.pId}">
														<c:set var="doneLoop" value="false"/> 
														<c:if test="${fn:length(gglist) == 0}">
															<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
														</c:if>
														<c:forEach items="${gglist}" var="g" varStatus="status">
															<c:if test="${not doneLoop}"> 
																<c:if test = "${g.pId eq p.pId}">
																	<div class="product_fav active favPid"><i class="fas fa-heart "></i></div>
																	<c:set var="doneLoop" value="true"/> 
																</c:if>
																<c:if test = "${g.pId ne p.pId && status.last}">
																	<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
																</c:if>
															</c:if>
														</c:forEach>
													</c:if>
												
												</div>
											</div>
										</c:forEach>

									</div>
									<div class="arrivals_slider_dots_cover"></div>
								</div>								

								<div class="product_panel panel">
									<div class="arrivals_slider slider">
										<!-- Slider Item -->
										<c:forEach items="${ New4List }" var="p">
											<div class="arrivals_slider_item">
												<div class="border_active"></div>
												<div class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
													<div class="product_image d-flex flex-column align-items-center justify-content-center"><img src="resources/product_uploadFiles/${p.paChangeName }" width="100px" height="100px" alt="" onclick="location.href='pDetailView.do?pId=${ p.pId }';"></div>
													<div class="product_content">
														<div class="product_price">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.pPrice }" /> ~</div>
														
														<div class="product_name"><a href="pDetailView.do?pId=${ p.pId }">${ p.pName }</a></div>
														<c:if test="${!empty loginUser }">
															<div class="product_extras">
																<button class="product_cart_button" onclick="addCart(${p.pId });">Add to Cart</button>
															</div>
														</c:if>
													</div>
													
													<c:if test="${!empty loginUser }">
														<input class="pId" type="hidden" value="${p.pId}">
														<c:set var="doneLoop" value="false"/> 
														<c:if test="${fn:length(gglist) == 0}">
															<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
														</c:if>
														<c:forEach items="${gglist}" var="g" varStatus="status">
															<c:if test="${not doneLoop}"> 
																<c:if test = "${g.pId eq p.pId}">
																	<div class="product_fav active favPid"><i class="fas fa-heart "></i></div>
																	<c:set var="doneLoop" value="true"/> 
																</c:if>
																<c:if test = "${g.pId ne p.pId && status.last}">
																	<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
																</c:if>
															</c:if>
														</c:forEach>
													</c:if>
												
												</div>
											</div>
										</c:forEach>

									</div>
									<div class="arrivals_slider_dots_cover"></div>
								</div>


								<div class="product_panel panel">
									<div class="arrivals_slider slider">
										<!-- Slider Item -->
										<c:forEach items="${ New5List }" var="p">
											<div class="arrivals_slider_item">
												<div class="border_active"></div>
												<div class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
													<div class="product_image d-flex flex-column align-items-center justify-content-center"><img src="resources/product_uploadFiles/${p.paChangeName }" width="100px" height="100px" alt="" onclick="location.href='pDetailView.do?pId=${ p.pId }';"></div>
													<div class="product_content">
														<div class="product_price">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.pPrice }" /> ~</div>
														
														<div class="product_name"><a href="pDetailView.do?pId=${ p.pId }">${ p.pName }</a></div>
														<c:if test="${!empty loginUser }">
															<div class="product_extras">
																<button class="product_cart_button" onclick="addCart(${p.pId });">Add to Cart</button>
															</div>
														</c:if>
													</div>
													<c:if test="${!empty loginUser }">
														<input class="pId" type="hidden" value="${p.pId}">
														<c:set var="doneLoop" value="false"/> 
														<c:if test="${fn:length(gglist) == 0}">
															<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
														</c:if>
														<c:forEach items="${gglist}" var="g" varStatus="status">
															<c:if test="${not doneLoop}"> 
																<c:if test = "${g.pId eq p.pId}">
																	<div class="product_fav active favPid"><i class="fas fa-heart "></i></div>
																	<c:set var="doneLoop" value="true"/> 
																</c:if>
																<c:if test = "${g.pId ne p.pId && status.last}">
																	<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
																</c:if>
															</c:if>
														</c:forEach>
													</c:if>
												</div>
											</div>
										</c:forEach>

									</div>
									<div class="arrivals_slider_dots_cover"></div>
								</div>

								<div class="product_panel panel">
									<div class="arrivals_slider slider">
										<!-- Slider Item -->
										<c:forEach items="${ New6List }" var="p">
											<div class="arrivals_slider_item">
												<div class="border_active"></div>
												<div class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
													<div class="product_image d-flex flex-column align-items-center justify-content-center"><img src="resources/product_uploadFiles/${p.paChangeName }" width="100px" height="100px" alt="" onclick="location.href='pDetailView.do?pId=${ p.pId }';"></div>
													<div class="product_content">
														<div class="product_price">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.pPrice }" /> ~</div>
														
														<div class="product_name"><a href="pDetailView.do?pId=${ p.pId }">${ p.pName }</a></div>
														<c:if test="${!empty loginUser }">
															<div class="product_extras">
																<button class="product_cart_button" onclick="addCart(${p.pId });">Add to Cart</button>
															</div>
														</c:if>
													</div>
													<c:if test="${!empty loginUser }">
														<input class="pId" type="hidden" value="${p.pId}">
														<c:set var="doneLoop" value="false"/> 
														<c:if test="${fn:length(gglist) == 0}">
															<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
														</c:if>
														<c:forEach items="${gglist}" var="g" varStatus="status">
															<c:if test="${not doneLoop}"> 
																<c:if test = "${g.pId eq p.pId}">
																	<div class="product_fav active favPid"><i class="fas fa-heart "></i></div>
																	<c:set var="doneLoop" value="true"/> 
																</c:if>
																<c:if test = "${g.pId ne p.pId && status.last}">
																	<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
																</c:if>
															</c:if>
														</c:forEach>
													</c:if>
													
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
											<div class="arrivals_single_category">${ p.cName2 }</div>
											<div class="arrivals_single_name_container clearfix">
												<div class="arrivals_single_name"><a href="pDetailView.do?pId=${ p.pId }">${ p.pName }</a></div>
												<div class="arrivals_single_price text-right">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.pPrice }" /> ~</div>
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
							<div class="trends_prev trends_nav"><i class="fas fa-chevron-left fa-10x ml-auto"></i></div>
							<div class="trends_next trends_nav"><i class="fas fa-chevron-right fa-10x ml-auto"></i></div>
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
										<div class="trends_image d-flex flex-column align-items-center justify-content-center">
											<img src="resources/product_uploadFiles/${r.paChangeName }" class="imgHover"width="150px" height="180px" alt="" onclick="location.href='pDetailView.do?pId=${ r.pId }';">
										</div>
										<div class="trends_content">
											<div class="trends_category"><a href="#">${ r.cName2 }</a></div>
											<div class="trends_info clearfix">
												<div class="trends_price" >￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${r.pPrice }" /> ~ </div>
												<div class="trends_name" ><a href="pDetailView.do?pId=${ r.pId }">${ r.pName }</a></div>
											</div>
										</div>
										<ul class="trends_marks">
											<li class="trends_mark trends_discount">Tip!</li>
											<li class="trends_mark trends_new">Hot</li>
										</ul>
										
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
							<div class="popular_categories_prev popular_categories_nav"><i class="fas fa-chevron-left fa-10x ml-auto"></i></div>
							<div class="popular_categories_next popular_categories_nav"><i class="fas fa-chevron-right fa-10x ml-auto"></i></div>
						</div>
						
					</div>
				</div>
				
				<!-- Popular Categories Slider -->

				<div class="col-lg-9">
					<div class="popular_categories_slider_container">
						<div class="owl-carousel owl-theme popular_categories_slider">

							<!-- Popular Categories Item -->
							<div class="owl-item imgHover">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image"><i class="fa fa-utensils fa-5x " onclick="location.href='pListView.do?category=1001';"></i></div>
									<div class="popular_category_text">food</div>
								</div>
							</div>

							<!-- Popular Categories Item -->
							<div class="owl-item imgHover">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image"><i class="fas fa-female fa-5x" onclick="location.href='pListView.do?category=1002';"></i></div>
									<div class="popular_category_text">Clothing & Accessories</div>
								</div>
							</div>

							<!-- Popular Categories Item -->
							<div class="owl-item imgHover">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image"><i class="fas fa-bed fa-5x" onclick="location.href='pListView.do?category=1003';"></i></div>
									<div class="popular_category_text">Furniture & Interior</div>
								</div>
							</div>

							<!-- Popular Categories Item -->
							<div class="owl-item imgHover">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image"><i class="fas fa-tv fa-5x" onclick="location.href='pListView.do?category=1004';"></i></div>
									<div class="popular_category_text">Digital & Computers</div>
								</div>
							</div>

							<!-- Popular Categories Item -->
							<div class="owl-item imgHover">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image"><i class="fas fa-camera fa-5x" onclick="location.href='pListView.do?category=1005';"></i></div>
									<div class="popular_category_text">Hobbies & Pets</div>
								</div>
							</div>
							
							<!-- Popular Categories Item -->
							<div class="owl-item imgHover">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image"><i class="fa fa-futbol fa-5x" onclick="location.href='pListView.do?category=1006';"></i> </div>
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


</body>
</html>