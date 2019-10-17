<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>고객센터</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="OneTech shop project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="resources/style/bootstrap4/bootstrap.min.css">
<link
	href="resources/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
	href="resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css"
	href="resources/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="resources/style/shop_styles.css">
<link rel="stylesheet" type="text/css"
	href="resources/style/shop_responsive.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>



<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<style type="text/css">
.bs-example {
	margin: 20px;
}

.btn {
	background: #0e8ce4;
	border: #0e8ce4;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	color: white;
}
</style>
</head>

<body>

	<div class="super_container">

		<c:import url="../../common/menubar.jsp" />


		<!-- Home -->

		<div class="home">
			<div class="home_background parallax-window" data-parallax="scroll"
				data-image-src="resources/images/shop_background.jpg"></div>
			<div class="home_overlay"></div>
			<div
				class="home_content d-flex flex-column align-items-center justify-content-center">
				<h2 class="home_title" style="font-weight: bold;">고객센터</h2>
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
									<li><a href="#">Computers & Laptops</a></li>
									<li><a href="#">Cameras & Photos</a></li>
									<li><a href="#">Hardware</a></li>
									<li><a href="#">Smartphones & Tablets</a></li>
									<li><a href="#">TV & Audio</a></li>
									<li><a href="#">Gadgets</a></li>
									<li><a href="#">Car Electronics</a></li>
									<li><a href="#">Video Games & Consoles</a></li>
									<li><a href="#">Accessories</a></li>
								</ul>
							</div>

						</div>

					</div>

					<div class="col-lg-7">

						<h2>PANDA 공지사항</h2>
						&nbsp;
						&nbsp;

						<form encType="multipart/form-data" method="post" action="ninsert.do">

							<div class="mb-3">

								<label for="title">제목</label> <input type="text"
									class="form-control" name="title" id="title"
									placeholder="제목을 입력해 주세요">

							</div>


							<div class="mb-3">

								<label for="content">내용</label>

								<textarea class="form-control" rows="8" name="content"
									id="content" placeholder="내용을 입력해 주세요" style="resize:none;"></textarea>

							</div>



							<div class="mb-3">

								<label for="file">첨부파일</label> <input type="file"
									name="upladFile">

							</div>

	
						<div align="center">

							<button type="submit" class="btn btn-sm btn-primary" id="btnSave">저장</button>
							&nbsp; &nbsp;
							<button type="button" class="btn btn-sm btn-primary" onclick="location.href='nlist.do'">목록</button>

						</div>


						</form>


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

								<div class="owl-item">
									<div
										class="brands_item d-flex flex-column justify-content-center">
										<img src="resources/images/brands_1.jpg" alt="">
									</div>
								</div>
								<div class="owl-item">
									<div
										class="brands_item d-flex flex-column justify-content-center">
										<img src="resources/images/brands_2.jpg" alt="">
									</div>
								</div>
								<div class="owl-item">
									<div
										class="brands_item d-flex flex-column justify-content-center">
										<img src="resources/images/brands_3.jpg" alt="">
									</div>
								</div>
								<div class="owl-item">
									<div
										class="brands_item d-flex flex-column justify-content-center">
										<img src="resources/images/brands_4.jpg" alt="">
									</div>
								</div>
								<div class="owl-item">
									<div
										class="brands_item d-flex flex-column justify-content-center">
										<img src="resources/images/brands_5.jpg" alt="">
									</div>
								</div>
								<div class="owl-item">
									<div
										class="brands_item d-flex flex-column justify-content-center">
										<img src="resources/images/brands_6.jpg" alt="">
									</div>
								</div>
								<div class="owl-item">
									<div
										class="brands_item d-flex flex-column justify-content-center">
										<img src="resources/images/brands_7.jpg" alt="">
									</div>
								</div>
								<div class="owl-item">
									<div
										class="brands_item d-flex flex-column justify-content-center">
										<img src="resources/images/brands_8.jpg" alt="">
									</div>
								</div>

							</div>

							<!-- Brands Slider Navigation -->
							<div class="brands_nav brands_prev">
								<i class="fas fa-chevron-left"></i>
							</div>
							<div class="brands_nav brands_next">
								<i class="fas fa-chevron-right"></i>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>



	</div>


	<c:import url="../../common/footer.jsp" />

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