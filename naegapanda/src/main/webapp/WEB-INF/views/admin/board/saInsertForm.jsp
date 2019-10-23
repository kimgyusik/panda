<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>PANDA 공지</title>
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
	background:#0e8ce4;
    border:#0e8ce4;
    margin:5px;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    border-top-right-radius: 5px;
    border-bottom-right-radius:5px;
    color:white;
	float:right;
}

#ans{
	margin-left: 295px;
}

</style>
</head>

<body>

	<div class="super_container">

	<c:import url="../../common/menubar.jsp"/> 

	<c:import url="../../common/admin.jsp"/> 
	
	</div>


		

					<div class="col-lg-7">

						<h2>PANDA 판매자문의 답변</h2>
						<br><br>

						<div>

							<%-- <input type="hidden" name="uqId" value="${ q.uqId }" > --%>
							
							<div class="mb-3">

								<label for="title">카테고리</label> 
								<input type="text" class="form-control" name="sqCategory" id="category" value="${q.sqCategory }" style="width:75px; font-size:10px;" readonly>
								
								<!-- String qCategory = document.getElementBy('cat').options[document.getElementById('cat').selectedIndex].text; -->

							</div>
							
							<div class="mb-3">

								<label for="title">제목</label> 
								<input type="text" class="form-control" name="sqTitle" id="title"
									value="${ q.sqTitle }" readonly>

							</div>


							<div class="mb-3">

								<label for="content">내용</label>

								<textarea class="form-control" rows="8" name="sqContent"
									id="content"  style="resize:none;" readonly>${ q.sqContent }</textarea>

							</div>





						</div>
						
						
						
					</div>
					
					<div class="col-lg-7" id="ans">
					
					<form method="post" action="sainsert.do" >

							<input type="hidden" name="qId" value="${ q.sqId }" >
							<input type="hidden" name="saTitle" value="${ q.sqTitle }" />
							<input type="hidden" name="saWriter" value="${ loginSeller.name }" />


							<div class="mb-3">

								<label for="content">답변</label>

								<textarea class="form-control" rows="8" name="saContent"
									id="content"  style="resize:none;"></textarea>

							</div>



					
						
						<c:if test="${ loginUser.name eq '관리자' }">
							<div>
						
							<button type="button"  class="btn" onclick="location.href='sqlist.do';">목록</button>
							&nbsp; &nbsp;
							<button type="submit" class="btn" onclick="location.href='sainsert.do';">답변달기</button>
							

						</div>
						</c:if>
						
					


						</form>

					</div>











	


	<c:import url="../../common/adminFooter.jsp"/> 
	<c:import url="../../common/footer.jsp"/>
	
	<!-- <script>
		$("#delete").on("click", function(){
			if(confirm("정말 삭제하시겠습니까?") == true){
				document.onclc;
			}else{
				return;
			}
		});
	</script> -->
	



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