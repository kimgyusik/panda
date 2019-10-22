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
<title></title>
<link rel="stylesheet" type="text/css" href="resources/style/bootstrap4/bootstrap.min.css">
<link href="resources/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="resources/style/shop_styles.css">
<link rel="stylesheet" type="text/css" href="resources/style/shop_responsive.css">

<style>

.sidebar_subtitle, .sidebar_title{
font-size: 19px;
}
.sidebar_categories, .brand{
font-size: 16px;
}
.shop_sidebar{
height: 450px;
border: 0px solid red;

}
.sidebar_section{
padding-left: 0;
}
.brand{
color:black;
}
.active a{
color:#0e8ce4;
}


</style>
</head>
<body>

	<div class="shop_sidebar" style="width:200px;">
		
		<div class="sidebar_section">
			<div class="sidebar_subtitle brands_subtitle">My쇼핑</div>
			<ul class="brands_list">
				<li class="brand"><a href="ggimList.gg">♡찜한 상품♡</a></li>
				<li class="brand"><a href="basketList.ba">장바구니</a></li>
				<li class="brand"><a href="d">구매 내역</a></li>
			</ul>
		</div>
	
		<div class="sidebar_section">
			<div class="sidebar_subtitle brands_subtitle">구매 리뷰</div>
			<ul class="brands_list">
				<li class="brand"><a href="c">작성 가능한 리뷰</a></li>
				<li class="brand"><a href="d">내가 작성한 리뷰</a></li>
			</ul>
		</div>
		
		<div class="sidebar_section">
			<div class="sidebar_subtitle brands_subtitle">궁금해요</div>
			<ul class="brands_list">
				<li class="brand"><a href="b">상품 문의</a></li>
				<li class="brand"><a href="a">관리자 Q&A</a></li>
			</ul>
		</div>
	</div>
	
	<script>
	
		// 선택된 메뉴 활성화 처리
		$(function(){
			
			var jspPath = $(location).attr('pathname');
			
			 $('.brand a').each(function(){
		         if(this.pathname == jspPath){
		        	 $(this).parent().addClass('active');
		         }
	         });
			
			
		});
			
	
			
			
		
	</script>

</body>
</html>