<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="OneTech shop project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="resources/style/bootstrap4/bootstrap.min.css">
<link href="resources/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="resources/style/shop_styles.css">
<link rel="stylesheet" type="text/css" href="resources/style/shop_responsive.css">
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<div class="super_container">
	
	<!-- Home -->

	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="resources/images/shop_background.jpg"></div>
		<div class="home_overlay"></div>
		<div class="home_content d-flex flex-column align-items-center justify-content-center">
			<h2 class="home_title">
				<c:if test="${category eq 1000}">ALL PRODUCTS</c:if>
				<c:if test="${category eq 1001}">식품</c:if>
				<c:if test="${category eq 1002}">의류/잡화</c:if>
				<c:if test="${category eq 1003}">가구/인테리어</c:if>
				<c:if test="${category eq 1004}">디지털/가전/컴퓨터</c:if>
				<c:if test="${category eq 1005}">취미/애완동물</c:if>
				<c:if test="${category eq 1006}">생활/건강/뷰티</c:if>
				<c:choose>
		         	<c:when test = "${category<=9}">
		            	식품
		         	</c:when>
		         	<c:when test = "${category<=19}">
		           		의류/잡화
		         	</c:when>
		         	<c:when test = "${category<=28}">
		           		가구/인테리어
		         	</c:when>
		         	<c:when test = "${category<=39}">
		           		디지털/가전/컴퓨터
		         	</c:when>
		         	<c:when test = "${category<=49}">
		           		취미/애완동물
		         	</c:when>
		         	<c:when test = "${category<=58}">
		           		생활/건강/뷰티
		         	</c:when>
		      	</c:choose>
			</h2>
		</div>
	</div>

	<!-- Shop -->

	<div class="shop">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">

					<!-- Shop Sidebar -->
					<div class="shop_sidebar">
						<div class="sidebar_section">
							<div class="sidebar_title">Categories</div>
							<ul class="sidebar_categories">
								<li><a href="pListView.do?category=1000">All Categories</a></li>
								<li><a href="pListView.do?category=1001">식품</a></li>
								<li><a href="pListView.do?category=1002">의류/잡화</a></li>
								<li><a href="pListView.do?category=1003">가구/인테리어</a></li>
								<li><a href="pListView.do?category=1004">디지털/가전/컴퓨터</a></li>
								<li><a href="pListView.do?category=1005">취미/애완동물</a></li>
								<li><a href="pListView.do?category=1006">생활/건강/뷰티</a></li>
							</ul>
						</div>
						
					</div>

				</div>

				<div class="col-lg-9">
					
					<!-- Shop Content -->

					<div class="shop_content">
						<div class="shop_bar clearfix">
							<div class="shop_product_count"><span>${pi.listCount }</span> products found</div>
							<div class="shop_sorting">
								<span>Sort by:</span>
								<ul>
									<li>
										<span class="sorting_text">highest rated<i class="fas fa-chevron-down"></span></i>
										<ul>
											<li class="shop_sorting_button" data-isotope-option='{ "sortBy": "original-order" }'>highest rated</li>
											<li class="shop_sorting_button" data-isotope-option='{ "sortBy": "name" }'>name</li>
											<li class="shop_sorting_button"data-isotope-option='{ "sortBy": "price" }'>price</li>
										</ul>
									</li>
								</ul>
							</div>
						</div>

						<div class="product_grid">
							<div class="product_grid_border"></div>

							<!-- Product Item -->
							<c:forEach items="${pList }" var="p">
							<div class="product_item" style="width:220px; padding:10px;">
								<div class="product_border"></div>
								<div class="product_image d-flex flex-column align-items-center justify-content-center" style="width:115px;"><img src="resources/product_uploadFiles/${p.paChangeName }" width="115" height="115" alt=""></div>
								<div class="product_content">
									<input type="hidden" value="${p.pId }" class="pId">
									<div class="product_price">${p.pPrice }</div>
									<div class="product_name" height="30px"><div>${p.pName }</div></div>
								</div>
								<div class="product_fav"><i class="fas fa-heart"></i></div>
								<ul class="product_marks">
									<li class="product_mark product_discount">-25%</li>
									<li class="product_mark product_new">new</li>
								</ul>
								<!-- <ul class="product_marks">
									<li class="product_mark product_discount">-25%</li>
									<li class="product_mark product_new">new</li>
								</ul> -->
							</div>
							</c:forEach>
							<script>
								$(function(){
									
								});
								
								$(".product_item").click(function(){
									var pId = $(this).children().eq(2).children().eq(0).val();
									location.href="pDetailView.do?pId="+pId;	
								});
							</script>
						</div>
						<br>
						<table align="center" style="margin-left:auto; margin-right:auto;">
							<tr align="center" height="20">
								<td colspan="6">
									<c:url value="pListView.do" var="first">
										<c:param name="currentPage" value="1"/>
										<c:param name="category" value="${category }"/>
									</c:url>
									<a href="${first }">[처음으로]</a>&nbsp;
									<!-- 이전 -->
									<c:if test="${pi.currentPage eq 1}">
										[이전]
									</c:if>
									<c:if test="${pi.currentPage ne 1}">
										<c:url value="pListView.do" var="before">
											<c:param name="currentPage" value="${pi.currentPage -1 }"/>
											<c:param name="category" value="${category }"/>
										</c:url>
										<a href="${before }">[이전]</a>&nbsp;
									</c:if>
									
									<!-- 페이지 -->
									<c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">
										<c:if test="${pi.currentPage eq p }">
											<font color="red" size="4">[${p }]</font>
										</c:if>
										<c:if test="${pi.currentPage ne p }">
											<font color="black" size="4">
												<c:url value="pListView.do" var="page">
													<c:param name="currentPage" value="${p }"/>
													<c:param name="category" value="${category }"/>
												</c:url>
												<a href="${page }">${p }</a>
											</font>
										</c:if>
									</c:forEach>
									
									<!-- 다음 -->
									<c:if test="${pi.currentPage eq pi.maxPage}">
										[다음]
									</c:if>
									<c:if test="${pi.currentPage ne pi.maxPage}">
										<c:url value="pListView.do" var="next">
											<c:param name="currentPage" value="${pi.currentPage +1 }"/>
											<c:param name="category" value="${category }"/>
										</c:url>
										<a href="${next }">[다음]&nbsp;</a>
									</c:if>
									<c:url value="pListView.do" var="last">
										<c:param name="currentPage" value="${pi.maxPage }"/>
										<c:param name="category" value="${category }"/>
									</c:url>
									<a href="${last }">[끝으로]&nbsp;</a>
								</td>
							</tr>
						</table>

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


	<!-- Copyright -->

	<div class="copyright">
		<div class="container">
			<div class="row">
				<div class="col">
					
					<div class="copyright_container d-flex flex-sm-row flex-column align-items-center justify-content-start">
						<div class="copyright_content"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
</div>
						<div class="logos ml-sm-auto">
							<ul class="logos_list">
								<li><a href="#"><img src="resources/images/logos_1.png" alt=""></a></li>
								<li><a href="#"><img src="resources/images/logos_2.png" alt=""></a></li>
								<li><a href="#"><img src="resources/images/logos_3.png" alt=""></a></li>
								<li><a href="#"><img src="resources/images/logos_4.png" alt=""></a></li>
							</ul>
						</div>
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
<script src="resources/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="resources/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="resources/js/shop_custom.js"></script>

</body>
</html>