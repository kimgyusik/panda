<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" href="resources/pandaicon.ico">
<title>PANDA:고객센터</title>
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

	<c:import url="../../common/menubar.jsp"/> 

	<c:import url="../../common/admin.jsp"/> 
	
	</div>


					<div class="col-lg-7">

						<h2>PANDA 회원서비스문의</h2>
						<br><br>

						<form encType="multipart/form-data" method="post" action="qinsert.do">
						
							<input type="hidden" >
							<input type="hidden" name="mNo" value="${ loginUser.mNo }">

							<div class="a">

								<label for="title">카테고리</label> 
								<select id="cat" name="uqCategory">
									<option value="회원가입">회원가입</option>
									<option value="회원정보">회원정보</option>
									<option value="고객센터">고객센터</option>
									<option value="상품/이벤트">상품/이벤트</option>
									<option value="기타" selected>기타</option>
								</select>	
								
								<!-- String qCategory = document.getElementBy('cat').options[document.getElementById('cat').selectedIndex].text; -->

							</div>

							<div class="mb-3">

								<label for="title">제목</label> 
								<input type="text" class="form-control" name="uqTitle" id="title"
									placeholder="제목을 입력해 주세요">

							</div>


							<div class="mb-3">

								<label for="content">내용</label>

								<textarea class="form-control" rows="8" name="uqContent"
									id="content" placeholder="내용을 입력해 주세요" style="resize:none;"></textarea>

							</div>



	
						<div align="center">

							<button type="submit" class="btn btn-sm btn-primary" id="btnSave">저장</button>
							&nbsp; &nbsp;
							<button type="button" class="btn btn-sm btn-primary" onclick="location.href='qlist.do'">목록</button>

						</div>


						</form>


					</div>

				</div>
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