<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
<title>고객센터</title>
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style>
	.cat{
		margin-bottom:150px;
		/* margin-left:3px; */
		display:inline-block;
	}
	.bs-example{
    }

    h5 {
    	font-weight:bold !important;
    	margin-top:20px !important;
    }
</style>
<body>

	<div class="super_container">
	
		<c:import url="../../common/menubar.jsp"/> 
	
		<c:import url="../../common/admin.jsp"/> 
		
	</div>
		
		
			<div class="row" style="align:center;">
				<div class="col-lg-4 cat">
					<c:url value="pmlist.do" var="pmListView">
						<c:param name="cName2" value="의류/잡화" />
					</c:url>
					<a href="${ pmListView }">
						<i class="fas fa-female fa-7x"></i>
					</a>
					<h5>의류/잡화</h5>
				</div>
				<div class="col-lg-4 cat"  >
					<c:url value="pmlist.do" var="pmListView">
						<c:param name="cName2" value="식품" />
					</c:url>
					<a href="${ pmListView }" class="icon">
						<i class="fa fa-utensils fa-7x"></i>
					</a>
					<h5>식품</h5>
				</div>
				<div class="col-lg-4 cat">
					<c:url value="pmlist.do" var="pmListView">
						<c:param name="cName2" value="가구/인테리어" />
					</c:url>
					<a href="${ pmListView }" class="icon">
						<i class="fa fa-bed fa-7x"></i>
					</a>
					<h5>가구/인테리어</h5>
				</div>
				<div class="col-lg-4 cat" >
					<c:url value="pmlist.do" var="pmListView">
						<c:param name="cName2" value="디지털/가전/컴퓨터" />
					</c:url>
					<a href="${ pmListView }" class="icon">
						<i class="fa fa-tv fa-7x" ></i>
					</a>
					<h5>디지털/가전/컴퓨터</h5>
				</div>
				<div class="col-lg-4 cat">
					<c:url value="pmlist.do" var="pmListView">
						<c:param name="cName2" value="취미/반려동물" />
					</c:url>
					<a href="${ pmListView }" class="icon">
						<i class="fa fa-camera fa-7x" ></i>
					</a>
					<h5>취미/반려동물</h5>
				</div>
				<div class="col-lg-4 cat">
					<c:url value="pmlist.do" var="pmListView">
						<c:param name="cName2" value="생활/건강/뷰티" />
					</c:url>
					<a href="${ pmListView }" class="icon">
						<i class="fa fa-futbol fa-7x"></i>
					</a>
					<h5>생활/건강/뷰티</h5>
				</div>
			</div>
		
		
	




<c:import url="../../common/adminFooter.jsp"/> 
<c:import url="../../common/footer.jsp"/>

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