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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" type="text/css" href="resources/style/bootstrap4/bootstrap.min.css">
<link href="resources/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/slick-1.8.0/slick.css">
<link rel="stylesheet" type="text/css" href="resources/style/main_styles.css">
<link rel="stylesheet" type="text/css" href="resources/style/responsive.css">

</head>
<style>

	.cat_menu_container ul{
		visibility: hidden;
		opacity: 0;
	}
	
	.logo:hover{
	
	cursor: pointer;
	
	}
</style>

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
								<c:if test="${ !empty loginSeller }">
									<li>
										<a href="sellervmessage.do"><img src="resources/images/vmessage.png"></a>
										
									</li>
								</c:if>
									<li>
										<a href="nlist.do">고객센터<i class="fas fa-chevron-down"></i></a>
										<ul>
											<li><a href="nlist.do">판다 공지</a></li>
											<li><a href="qlist.do">서비스문의</a></li>
											<li><a href="sqlist.do">판매자문의</a></li>
											
											<c:if test="${ sessionScope.loginUser.id eq 'admin' }">
												<li><a href="categoryView.do">판매관리</a></li>
												<li><a href="approvalList.do">판매허가관리</a></li>
												<li><a href="violateView.do">신고관리</a></li>
												<li><a href="sViolateAllList.do">판매자신고관리</a></li>
												<li><a href="vmessage.do">신고메세지</a><li>
											</c:if>
										</ul>
									</li>
									<!-- 로그인 안했을때 보이는 MyPage -->
									<c:if test="${ empty loginUser && empty loginSeller }">
										<li>
										<a href="#" onclick="alert('로그인후 이용가능합니다');">My Page<i class="fas fa-chevron-down"></i></a>			
										</li>
									</c:if>


									<!-- 회원이 로그인 했을때 보이는 MyPage -->
									<c:if test="${ !empty loginUser }">
											<c:if test="${ sessionScope.loginUser.id ne 'admin' }">
												<li>
													<a href="#" id="page">My Page<i class="fas fa-chevron-down"></i></a>
													<ul>
														<li><a href="basketList.ba">장바구니</a></li>
														<li><a href="myInfo.do">정보수정</a></li>
													</ul>
												</li>
											</c:if>
									</c:if>
									
									
									<!-- 판매자가 로그인 했을때 보이는 MyPage -->
									<c:if test="${ !empty loginSeller }">
									<li>
										<a href="sProduct.do">My Page<i class="fas fa-chevron-down"></i></a>
											<ul>
												<li><a href="sProduct.do">상품관리</a></li>
												<li><a href="sPage.do">정보수정</a></li>
												<li><a href="#">방송관리</a></li>
											</ul>
									</li>
									</c:if>
									
									
								</ul>
							</div>
							<div class="top_bar_user">
							<c:if test="${ empty sessionScope.loginUser && empty sessionScope.loginSeller }">
							<form action="login.do" method="post">
								<div class="user_icon"><img src="resources/images/user.svg" alt=""></div>
								<div><a href="join.do">회원가입</a></div>
								<div><a href="allLogin.do">회원</a></div> /
								<div><a href="sellerLogin.do">판매자 로그인</a></div>	
							</form>
							</c:if>
							<c:if test="${ !empty sessionScope.loginUser}">
							<h6 align="right">
							<c:out value="${ loginUser.name }님 환영합니다."/> &nbsp;&nbsp;&nbsp;
							<a href="logout.do">로그아웃</a>
							</h6>
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
							<div class="logo"><img src="resources/images/pandaLogo.gif"onclick="location.href='home.do';" ></div>
						</div>
					</div>

					<!-- Search -->
					<div class="col-lg-6 col-12 order-lg-2 order-3 text-lg-left text-right">
						<div class="header_search">
							<div class="header_search_content">
								<div class="header_search_form_container">
									<form action="search.do" class="header_search_form clearfix">
										<input type="text" name="keyword" required="required" class="header_search_input" placeholder="Search for products...">
										<div class="custom_dropdown">
											<div class="custom_dropdown_list">
												<span class="custom_dropdown_placeholder clc">All Categories</span>
												<i class="fas fa-chevron-down"></i>
												<ul class="custom_list clc">
													<li><a class="clc" href="pListView.do?category=1000">All Categories</a></li>
													<li><a class="clc" href="pListView.do?category=1001">식품</a></li>
													<li><a class="clc" href="pListView.do?category=1002">의류/잡화</a></li>
													<li><a class="clc" href="pListView.do?category=1003">가구/인테리어</a></li>
													<li><a class="clc" href="pListView.do?category=1004">디지털/가전/컴퓨터 </a></li>
													<li><a class="clc" href="pListView.do?category=1005">취미/애완동물</a></li>
													<li><a class="clc" href="pListView.do?category=1006">생활/건강/뷰티</a></li>
												</ul>
											</div>
										</div>
										<button type="submit" class="header_search_button trans_300" value="Submit"><img src="resources/images/search.png" alt=""></button>
									</form>
								</div>
							</div>
						</div>
					</div>
					
					<c:if test="${!empty loginUser }">
					<input id="sessionUser" type="hidden" value="${loginUser}">
						<!-- Wishlist -->
						<div class="col-lg-4 col-9 order-lg-3 order-2 text-lg-left text-right">
							<div class="wishlist_cart d-flex flex-row align-items-center justify-content-end">
								<div class="wishlist d-flex flex-row align-items-center justify-content-end">
									<div class="wishlist_icon"><img src="resources/images/heart.png" alt=""></div>
									<div class="wishlist_content">
										<div class="wishlist_text"><a href="ggimList.gg">Wishlist</a></div>
										<div class="wishlist_count"><span>&nbsp;</span></div>
									</div>
								</div>
	
								<!-- Cart -->
								<div class="cart">
									<div class="cart_container d-flex flex-row align-items-center justify-content-end">
										<div class="cart_icon">
											<img src="resources/images/cart.png" alt="">
											<div class="cart_count"><span>&nbsp;</span></div>
										</div>
										<div class="cart_content">
											<div class="cart_text"><a href="basketList.ba">Cart</a></div>
											<div class="cart_price"><span>&nbsp;</span></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					
				</div>
			</div>
		</div>
		
		<!-- Main Navigation -->

		<nav class="main_nav">
			<div class="container">
				<div class="row">
					<div class="col">
						
						<div class="main_nav_content d-flex flex-row">

<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------- -->
							<!-- Categories Menu -->

							<div class="cat_menu_container">
								<div class="cat_menu_title d-flex flex-row align-items-center justify-content-start">
									<div class="cat_burger"><span></span><span></span><span></span></div>
									<div class="cat_menu_text"><a href="pListView.do?category=1000" style="color:white">categories</a></div>
								</div>

								<ul class="cat_menu">
									<li class="hassubs">
										<a href="pListView.do?category=1001">식품 <i class="fas fa-chevron-right ml-auto"></i></a>
										<ul>
											<li><a href="pListView.do?category=1">농산물<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=2">해산물<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=3">축산물<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=4">냉동/가공식품<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=5">장/양념/조미료<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=6">김치/반창<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=7">면<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=8">생수/차/음료<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=9">제과/초콜릿<i class="fas fa-chevron-right"></i></a></li>
										</ul>
									</li>
									
									<li class="hassubs">
										<a href="pListView.do?category=1002">의류/잡화 <i class="fas fa-chevron-right ml-auto"></i></a>
										<ul>
											<li><a href="pListView.do?category=10">여성 의류<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=11">여성 신발<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=12">남성 의류<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=13">남성 신발<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=14">유아 의류<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=15">유아 신발<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=16">가방<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=17">지갑/벨트/시계<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=18">쥬얼리<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=19">패션 잡화<i class="fas fa-chevron-right"></i></a></li>
										</ul>
									</li>
									
									<li class="hassubs">
										<a href="pListView.do?category=1003">가구/인테리어 <i class="fas fa-chevron-right ml-auto"></i></a>
										<ul>
											<li><a href="pListView.do?category=20">가구<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=21">수납/정리/침구<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=22">카페트/쿠션/거실화<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=23">커튼/블라인드<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=24">욕실 용품<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=25">조명/스탠드<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=26">홈데코<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=27">원예/가드님<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=28">셀프 인테리어<i class="fas fa-chevron-right"></i></a></li>
										</ul>
									</li>
									
									<li class="hassubs">
										<a href="pListView.do?category=1004">디지털/가전/컴퓨터 <i class="fas fa-chevron-right ml-auto"></i></a>
										<ul>
											<li><a href="pListView.do?category=29">TV<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=30">계절 가전<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=31">노트북<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=32">스마트 기기<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=33">냉장고<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=34">카메라/주변기기<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=35">세탁기/건조기<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=36">데스크탑/PC부품<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=37">음향가전<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=38">프린터/복합기<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=39">주방 가전<i class="fas fa-chevron-right"></i></a></li>
										</ul>
									</li>
									
									<li class="hassubs">
										<a href="pListView.do?category=1005">취미/반려동물 <i class="fas fa-chevron-right ml-auto"></i></a>
										<ul>
											<li><a href="pListView.do?category=40">스포츠<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=41">수집<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=42">도서<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=43">완구<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=44">예술<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=45">공연 티켓<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=46">애완 식품<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=47">애완 용품<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=48">애완 건강 관리<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=49">게임<i class="fas fa-chevron-right"></i></a></li>
										</ul>
									</li>
									
									<li class="hassubs">
										<a href="pListView.do?category=1006">생활/건강/뷰티<i class="fas fa-chevron-right ml-auto"></i></a>
										<ul>
											<li><a href="pListView.do?category=50">스킨 케어<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=51">메이크업<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=52">헤어/바디<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=53">비타민/영양제<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=54">다이어트<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=55">헬스/요가<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=56">세탁/청소<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=57">수납/정리<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="pListView.do?category=58">생활 잡화<i class="fas fa-chevron-right"></i></a></li>
										</ul>
									</li>
								</ul>
							</div>
<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------- -->

							<!-- Main Nav Menu -->

							<div class="main_nav_menu ml-auto">
							
							
							
							
							
							
							
							
								<!-- <ul class="standard_dropdown main_nav_dropdown">
									<li class="hassubs">
										<a href="#">식품<i class="fas fa-chevron-down"></i></a>
										<ul>
											<li><a href="#">농산물<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">해산물<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">축산물<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">냉동/가공식품<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">장/양념/조미료<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">김치/반창<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">면<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">생수/차/음료<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">제과/초콜릿<i class="fas fa-chevron-right"></i></a></li>
										</ul>
									</li>
									<li class="hassubs">
										<a href="#">의류<i class="fas fa-chevron-down"></i></a>
										<ul>
											<li><a href="#">여성 의류<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">여성 신발<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">남성 의류<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">남성 신발<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">유아 의류<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">유아 신발<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">가방<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">지갑/벨트/시계<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">쥬얼리<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">패션 잡화<i class="fas fa-chevron-right"></i></a></li>
										</ul>
									</li>
									<li class="hassubs">
										<a href="#">가구<i class="fas fa-chevron-down"></i></a>
										<ul>
											<li><a href="#">가구<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">수납/정리/침구<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">카페트/쿠션/거실화<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">커튼/블라인드<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">욕실 용품<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">조명/스탠드<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">홈데코<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">원예/가드님<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">셀프 인테리어<i class="fas fa-chevron-right"></i></a></li>
										</ul>
									</li>
									<li class="hassubs">
										<a href="#">디지털<i class="fas fa-chevron-down"></i></a>
										<ul>
											<li><a href="#">TV<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">계절 가전<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">노트북<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">스마트 기기<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">냉장고<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">카메라/주변기기<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">세탁기/건조기<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">데스크탑/PC부품<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">음향가전<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">프린터/복합기<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">주방 가전<i class="fas fa-chevron-right"></i></a></li>
										</ul>
									</li>
									<li class="hassubs">
										<a href="#">취미/반려동물<i class="fas fa-chevron-down"></i></a>
										<ul>
											<li><a href="#">스포츠<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">수집<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">도서<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">완구<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">예술<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">공연 티켓<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">애완 식품<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">애완 용품<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">애완 건강 관리<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">게임<i class="fas fa-chevron-right"></i></a></li>
										</ul>
									</li>
									<li class="hassubs">
										<a href="#">생활<i class="fas fa-chevron-down"></i></a>
										<ul>
											<li><a href="#">스킨 케어<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">메이크업<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">헤어/바디<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">비타민/영양제<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">다이어트<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">헬스/요가<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">세탁/청소<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">수납/정리<i class="fas fa-chevron-right"></i></a></li>
											<li><a href="#">생활 잡화<i class="fas fa-chevron-right"></i></a></li>
										</ul>
									</li>
									<li><a href="chatMain.do">SoojinChat<i class="fas fa-chevron-down"></i></a></li>
									<li><a href="vinsertView.do">Soojin<i class="fas fa-chevron-down"></i></a></li>
								</ul> -->
							</div>
							
							<!-- Menu Trigger -->

							<div class="menu_trigger_container ml-auto">
								<div class="menu_trigger d-flex flex-row align-items-center justify-content-end">
									<div class="menu_burger">
										<div class="menu_trigger_text">menu</div>
										<div class="cat_burger menu_burger_inner"><span></span><span></span><span></span></div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</nav>
		<!-- Menu -->

		<div class="page_menu">
			<div class="container">
				<div class="row">
					<div class="col">
						
						<div class="page_menu_content">
							
							<div class="page_menu_search">
								<form action="#">
									<input type="search" required="required" class="page_menu_search_input" placeholder="Search for products...">
								</form>
							</div>
							<ul class="page_menu_nav">
								<li class="page_menu_item has-children">
									<a href="#">Language<i class="fa fa-angle-down"></i></a>
									<ul class="page_menu_selection">
										<li><a href="#">English<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Italian<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Spanish<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Japanese<i class="fa fa-angle-down"></i></a></li>
									</ul>
								</li>
								<li class="page_menu_item has-children">
									<a href="#">Currency<i class="fa fa-angle-down"></i></a>
									<ul class="page_menu_selection">
										<li><a href="#">US Dollar<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">EUR Euro<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">GBP British Pound<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">JPY Japanese Yen<i class="fa fa-angle-down"></i></a></li>
									</ul>
								</li>
								<li class="page_menu_item">
									<a href="#">Home<i class="fa fa-angle-down"></i></a>
								</li>
								<li class="page_menu_item has-children">
									<a href="#">Super Deals<i class="fa fa-angle-down"></i></a>
									<ul class="page_menu_selection">
										<li><a href="#">Super Deals<i class="fa fa-angle-down"></i></a></li>
										<li class="page_menu_item has-children">
											<a href="#">Menu Item<i class="fa fa-angle-down"></i></a>
											<ul class="page_menu_selection">
												<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
												<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
												<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
												<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
											</ul>
										</li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
									</ul>
								</li>
								<li class="page_menu_item has-children">
									<a href="#">Featured Brands<i class="fa fa-angle-down"></i></a>
									<ul class="page_menu_selection">
										<li><a href="#">Featured Brands<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
									</ul>
								</li>
								<li class="page_menu_item has-children">
									<a href="#">Trending Styles<i class="fa fa-angle-down"></i></a>
									<ul class="page_menu_selection">
										<li><a href="#">Trending Styles<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
									</ul>
								</li>
								<li class="page_menu_item"><a href="blog.html">blog<i class="fa fa-angle-down"></i></a></li>
								<li class="page_menu_item"><a href="contact.html">contact<i class="fa fa-angle-down"></i></a></li>
							</ul>
							
							<div class="menu_contact">
								<div class="menu_contact_item"><div class="menu_contact_icon"><img src="resources/images/phone_white.png" alt=""></div>+38 068 005 3570</div>
								<div class="menu_contact_item"><div class="menu_contact_icon"><img src="resources/images/mail_white.png" alt=""></div><a href="mailto:fastsales@gmail.com">fastsales@gmail.com</a></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
</header>

<script>
	$(function(){
		
		if($("#sessionUser").val() != null){
			// 메인메뉴 장바구니 비동기 처리
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
			
			// 메인메뉴 찜하기 비동기 처리
			$.ajax({
				url:"currentGgim.gg",
				dataType:"json",
				success:function(data){
						$('.wishlist_count').children().first().text(data);
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}
		
	});

</script>

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