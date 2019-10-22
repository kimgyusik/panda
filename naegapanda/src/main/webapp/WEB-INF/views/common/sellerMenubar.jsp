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



<!-- Header -->
	
	<header class="header">

		<!-- Top Bar -->

		<div class="top_bar">
			<div class="container">
				<div class="row">
					<div class="col d-flex flex-row">
						<div class="top_bar_content ml-auto">
							<div class="top_bar_menu">			
								<ul class="standard_dropdown top_bar_dropdown">
									<li>
										<a href="sellervmessage.do"><img src="resources/images/vmessage.png"></a>
									</li>
									<li>
										<a href="nlist.do">고객센터<i class="fas fa-chevron-down"></i></a>
										<ul>
											<li><a href="nlist.do">판다 공지</a></li>
											<li><a href="#">QnA</a></li>
											
											<%-- <c:if test="${ sessionScope.loginUser.id eq 'admin' }">
												<li><a href="#">판매관리</a></li>
												<li><a href="testView.do">신고관리</a></li>
											</c:if> --%>
											
										</ul>
									</li>
									
									<c:if test="${ empty loginSeller && empty loginUser }">
										<li>
											<a href="sProduct.do">My Page<i class="fas fa-chevron-down"></i></a>
												<ul>
													<li><a href="sProduct.do">상품관리</a></li>
													<li><a href="sPage.do">정보수정</a></li>
													<li><a href="streaming.do">방송관리</a></li>
												</ul>
										</li>
									</c:if>
									

									<!-- 판매자가 로그인 했을때 보이는 MyPage -->
									<c:if test="${ !empty loginSeller }">
									<li>
										<a href="sProduct.do">My Page<i class="fas fa-chevron-down"></i></a>
											<ul>
												<li><a href="sProduct.do">상품관리</a></li>
												<li><a href="sPage.do">정보수정</a></li>
												<li><a href="streaming.do">방송관리</a></li>
											</ul>
									</li>
									</c:if>
									
									
								</ul>
							</div>
							<div class="top_bar_user">
								<c:if test="${ empty sessionScope.loginUser && empty sessionScope.loginSeller }">
									<div class="user_icon"><img src="resources/images/user.svg" alt=""></div>
									<div><a href="join.do">회원가입</a></div>
									<div><a href="sellerLogin.do">판매자로그인</a></div>
							</c:if>
							<c:if test="${ !empty sessionScope.loginSeller }">
								<h6 align="right">
								<c:out value="${ loginSeller.sName }님 환영합니다."/> &nbsp;&nbsp;&nbsp;
								<a href="sLogout.do">로그아웃</a>
								</h6>
							</c:if>
							
							</div>
						</div>
					</div>
				</div>
			</div>		
		</div>

		<!-- Header Main -->

		<div class="header_main">
			<div class="container">
				<div class="row">

					<!-- Logo -->
					<div class="col-lg-2 col-sm-3 col-3 order-1">
						<div class="logo_container">
							<div class="logo"><img src="resources/images/pandaLogo.gif"onclick="location.href='sProduct.do';" ></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
				

<nav class="main_nav">
			<div class="container">
				<div class="row">
					<div class="col">
						
						<div class="main_nav_content d-flex flex-row">

							<!-- Categories Menu -->

							<div class="cat_menu_container" style="cursor:default">
								<div class="cat_menu_title d-flex flex-row align-items-center justify-content-start" style="cursor:default">
									<div class="cat_burger" style="cursor:default"><span></span><span></span><span></span></div>
									<div class="cat_menu_text" style="cursor:default">판매자 페이지</div>
								</div>
							</div>

							<!-- Main Nav Menu -->

							<div class="main_nav_menu ml-auto">
								<ul class="standard_dropdown main_nav_dropdown">
									<li><a href="sProduct.do">상품리스트</a></li>
									<li><a href="pInsert.do">상품등록</a></li>
									<li><a href="oderPage.do">주문목록관리</a></li>
									<li><a href="streaming.do">방송관리</a></li>
									<li><a href="sPage.do">정보수정?</a></li>
								</ul>
							</div>
					</div>
				</div>
			</div>
	</div>
</nav>			
	


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