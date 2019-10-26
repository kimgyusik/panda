<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="OneTech shop project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="resources/style/bootstrap4/bootstrap.min.css">
<link href="resources/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="resources/style/product_styles.css">
<link rel="stylesheet" type="text/css" href="resources/style/product_responsive.css">
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<div class="super_container"> 
	<!-- Single Product -->

		<div class="single_product">
			<div class="container">
				<div class="row">
	
					<!-- Images -->
					<div class="col-lg-2 order-lg-1 order-2">
						<ul class="image_list">
							<c:forEach items="${paList }" var="pa">
							<li data-image="resources/product_uploadFiles/${ pa.paChangeName }"><img src="resources/product_uploadFiles/${ pa.paChangeName }" alt=""></li>
							</c:forEach>
						</ul>
					</div>
	
					<!-- Selected Image -->
					<div class="col-lg-5 order-lg-2 order-1">
						<div class="image_selected"><img src="resources/product_uploadFiles/${ paList[0].paChangeName }" alt=""></div>
					</div>
	
					<!-- Description -->
					<div class="col-lg-5 order-3">
						<div class="product_description">
							<div class="product_category">${p.cId }</div>
							<div class="product_name">${p.pName }</div>
							<div class="rating_r rating_r_4 product_rating"></div>
							<div class="order_info d-flex flex-row">
								<form action="#">
									<div class="clearfix" style="z-index: 1000;">	
										<!-- Product Quantity -->
										<div class="product_quantity clearfix">
											<span>Quantity: </span>
											<input id="quantity_input" type="text" pattern="[0-9]*" value="1">
											<div class="quantity_buttons">
												<div id="quantity_inc_button" class="quantity_inc quantity_control"><i class="fas fa-chevron-up"></i></div>
												<div id="quantity_dec_button" class="quantity_dec quantity_control"><i class="fas fa-chevron-down"></i></div>
											</div>
										</div>
	
										<!-- Product option -->
										<div>
											<table>
												<tr>
													<th>�ɼǹ�ȣ</th>
													<th>�ɼǸ�</th>
													<th>�ɼǰ���</th>
													<th>��������</th>
													<th>����</th>
												</tr>
											<c:forEach items="${poList }" var="po">
												<tr>
													<td>${po.oNo }</td>
													<td>${po.oName }</td>
													<td>${po.oPrice }</td>
													<td>${po.oAmount }</td>
													<td><button type="button">����</button></td>
												</tr>
											</c:forEach>
											</table>
										</div>
									</div>
									
									<div id="chooseProduct">
									
									</div>
	
									<div class="button_container">
										<button type="button" class="button cart_button">Add to Cart</button>
										<button type="button" class="button cart_button">���ϱ�</button>
										<div class="product_fav"><i class="fas fa-heart"></i></div>
									</div>
									
								</form>
							</div>
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
		<div >
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="col-lg-5">
							<h3>�󼼺���</h3>
							<div id="detail_contents">
								${p.pContent }
							</div>
						</div>
						<br>
						<div class="col-lg-5">
							<br>
							<br>
							<br>
							<h3>��ǰ �ı�</h3>
							<div id="review">
								
							</div>
						</div>
						<br>
						<div class="col-lg-5">
							<br>
							<br>
							<br>
							<h3>��ǰ ����</h3>
							<div id="inquiry">
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
					
	
		<!-- Recently Viewed -->
	
		<div class="viewed">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="viewed_title_container">
							<h3 class="viewed_title">Recently Viewed</h3>
							<div class="viewed_nav_container">
								<div class="viewed_nav viewed_prev"><i class="fas fa-chevron-left"></i></div>
								<div class="viewed_nav viewed_next"><i class="fas fa-chevron-right"></i></div>
							</div>
						</div>
	
						<div class="viewed_slider_container">
							
							<!-- Recently Viewed Slider -->
	
							<div class="owl-carousel owl-theme viewed_slider">
								
								<!-- Recently Viewed Item -->
								<div class="owl-item">
									<div class="viewed_item discount d-flex flex-column align-items-center justify-content-center text-center">
										<div class="viewed_image"><img src="resources/images/view_1.jpg" alt=""></div>
										<div class="viewed_content text-center">
											<div class="viewed_price">$225<span>$300</span></div>
											<div class="viewed_name"><a href="#">Beoplay H7</a></div>
										</div>
										<ul class="item_marks">
											<li class="item_mark item_discount">-25%</li>
											<li class="item_mark item_new">new</li>
										</ul>
									</div>
								</div>
	
								<!-- Recently Viewed Item -->
								<div class="owl-item">
									<div class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
										<div class="viewed_image"><img src="resources/images/view_2.jpg" alt=""></div>
										<div class="viewed_content text-center">
											<div class="viewed_price">$379</div>
											<div class="viewed_name"><a href="#">LUNA Smartphone</a></div>
										</div>
										<ul class="item_marks">
											<li class="item_mark item_discount">-25%</li>
											<li class="item_mark item_new">new</li>
										</ul>
									</div>
								</div>
	
								<!-- Recently Viewed Item -->
								<div class="owl-item">
									<div class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
										<div class="viewed_image"><img src="resources/images/view_3.jpg" alt=""></div>
										<div class="viewed_content text-center">
											<div class="viewed_price">$225</div>
											<div class="viewed_name"><a href="#">Samsung J730F...</a></div>
										</div>
										<ul class="item_marks">
											<li class="item_mark item_discount">-25%</li>
											<li class="item_mark item_new">new</li>
										</ul>
									</div>
								</div>
	
								<!-- Recently Viewed Item -->
								<div class="owl-item">
									<div class="viewed_item is_new d-flex flex-column align-items-center justify-content-center text-center">
										<div class="viewed_image"><img src="resources/images/view_4.jpg" alt=""></div>
										<div class="viewed_content text-center">
											<div class="viewed_price">$379</div>
											<div class="viewed_name"><a href="#">Huawei MediaPad...</a></div>
										</div>
										<ul class="item_marks">
											<li class="item_mark item_discount">-25%</li>
											<li class="item_mark item_new">new</li>
										</ul>
									</div>
								</div>
	
								<!-- Recently Viewed Item -->
								<div class="owl-item">
									<div class="viewed_item discount d-flex flex-column align-items-center justify-content-center text-center">
										<div class="viewed_image"><img src="resources/images/view_5.jpg" alt=""></div>
										<div class="viewed_content text-center">
											<div class="viewed_price">$225<span>$300</span></div>
											<div class="viewed_name"><a href="#">Sony PS4 Slim</a></div>
										</div>
										<ul class="item_marks">
											<li class="item_mark item_discount">-25%</li>
											<li class="item_mark item_new">new</li>
										</ul>
									</div>
								</div>
	
								<!-- Recently Viewed Item -->
								<div class="owl-item">
									<div class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
										<div class="viewed_image"><img src="resources/images/view_6.jpg" alt=""></div>
										<div class="viewed_content text-center">
											<div class="viewed_price">$375</div>
											<div class="viewed_name"><a href="#">Speedlink...</a></div>
										</div>
										<ul class="item_marks">
											<li class="item_mark item_discount">-25%</li>
											<li class="item_mark item_new">new</li>
										</ul>
									</div>
								</div>
							</div>
	
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<!-- Brands -->
	
		<div class="brands">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="brands_slider_container">
							
							<!-- Brands Slider -->
	
							<div class="owl-carousel owl-theme brands_slider">
								
								<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="resources/images/brands_1.jpg" alt=""></div></div>
								<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="resources/images/brands_2.jpg" alt=""></div></div>
								<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="resources/images/brands_3.jpg" alt=""></div></div>
								<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="resources/images/brands_4.jpg" alt=""></div></div>
								<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="resources/images/brands_5.jpg" alt=""></div></div>
								<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="resources/images/brands_6.jpg" alt=""></div></div>
								<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="resources/images/brands_7.jpg" alt=""></div></div>
								<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="resources/images/brands_8.jpg" alt=""></div></div>
	
							</div>
							
							<!-- Brands Slider Navigation -->
							<div class="brands_nav brands_prev"><i class="fas fa-chevron-left"></i></div>
							<div class="brands_nav brands_next"><i class="fas fa-chevron-right"></i></div>
	
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/style/bootstrap4/popper.js"></script>
	<script src="resources/style/bootstrap4/bootstrap.min.js"></script>
	<script src="resources/plugins/greensock/TweenMax.min.js"></script>
	<script src="resources/plugins/greensock/TimelineMax.min.js"></script>
	<script src="resources/plugins/scrollmagic/ScrollMagic.min.js"></script>
	<script src="resources/plugins/greensock/animation.gsap.min.js"></script>
	<script src="resources/plugins/greensock/ScrollToPlugin.min.js"></script>
	<script src="resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
	<script src="resources/plugins/easing/easing.js"></script>
	<script src="resources/js/product_custom.js"></script>
</body>
</html>