<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="OneTech shop project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PANDA</title>
<link rel="stylesheet" type="text/css" href="resources/style/bootstrap4/bootstrap.min.css">
<link href="resources/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/slick-1.8.0/slick.css">
<link rel="stylesheet" type="text/css" href="resources/style/main_styles.css">
<link rel="stylesheet" type="text/css" href="resources/style/responsive.css">
</head>
<body>

<!-- Footer -->

	<footer class="footer">
		<div class="container">
			<div class="row">

				<div class="col-lg-3 footer_col">
					<div class="footer_column footer_contact">
						<div class="logo_container">
							<div class="logo"><a href="home.do">PANDA</a></div>
						</div>
						<div class="footer_title">Got Question? Call Us 24/7</div>
						<div class="footer_phone">010 2114 5520</div>
						<div class="footer_contact_text">
							<p>서울특별시 강남구 테헤란로14길 6</p>
							<p>남도빌딩 3F I강의실</p>
							<p>책임자 : 최영근</p>
						</div>
						
					</div>
				</div>

				<div class="col-lg-2 offset-lg-2">
					<div class="footer_column">
						<div class="footer_title">Find it Fast</div>
						<ul class="footer_list">
							<li><a href="#">농산물</a></li>
							<li><a href="#">냉동/가공식품</a></li>
							<li><a href="#">여성 의류</a></li>
							<li><a href="#">남성 의류</a></li>
							<li><a href="#">가구</a></li>
							<li><a href="#">셀프 인테리어</a></li>
					</div>
				</div>

				<div class="col-lg-2">
					<div class="footer_column">
						<ul class="footer_list footer_list_2">
							<li><a href="#">계절 가전</a></li>
							<li><a href="#">주방 가전</a></li>
							<li><a href="#">공연 티켓</a></li>
							<li><a href="#">애완 용품</a></li>
							<li><a href="#">메이크업</a></li>
							<li><a href="#">다이어트</a></li>
						</ul>
					</div>
				</div>

				<div class="col-lg-2">
					<div class="footer_column">
						<div class="footer_title">Customer Care</div>
						<ul class="footer_list">
							<li><a href="nlist.do">판다 공지</a></li>
							<li><a href="qlist.do">서비스 문의</a></li>
							<li><a href="sqlist.do">판매자 문의</a></li>
							<c:if test="${!empty loginUser }">
								<li><a href="ggimList.gg">찜 목록</a></li>
								<li><a href="basketList.ba">장바구니</a></li>
							</c:if>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</footer>

	<!-- Copyright -->

	<div class="copyright">
		<div class="container">
			<div class="row">
				<div class="col">
					
					<div class="copyright_container d-flex flex-sm-row flex-column align-items-center justify-content-start">
						<div class="copyright_content"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Made by 이거사조 in 2019
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

<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/style/bootstrap4/popper.js"></script>
<script src="resources/style/bootstrap4/bootstrap.min.js"></script>
<script src="resources/plugins/greensock/TweenMax.min.js"></script>
<script src="resources/plugins/greensock/TimelineMax.min.js"></script>
<script src="resources/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="resources/plugins/greensock/animation.gsap.min.js"></script>
<script src="resources/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="resources/plugins/slick-1.8.0/slick.js"></script>
<script src="resources/plugins/easing/easing.js"></script>
<script src="resources/js/custom.js"></script>

</body>
</html>