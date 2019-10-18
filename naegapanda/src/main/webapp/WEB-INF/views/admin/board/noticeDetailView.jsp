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

</style>
</head>

<body>

	<div class="super_container">

	<c:import url="../../common/menubar.jsp"/> 

	<c:import url="../../common/admin.jsp"/> 
	
	</div>


		

					<div class="col-lg-7">

						<h2>PANDA 공지사항</h2>
						<br><br>

						<form encType="multipart/form-data" method="post" action="nupdate.do" >

							<input type="hidden" name="nId" value="${ n.nId }" >
							
							<div class="mb-3">

								<label for="title">제목</label> 
								<input type="text" class="form-control" name="nTitle" id="title"
									value="${ n.nTitle }">

							</div>


							<div class="mb-3">

								<label for="content">내용</label>

								<textarea class="form-control" rows="8" name="nContent"
									id="content"  style="resize:none;">${ n.nContent }</textarea>

							</div>



							<div class="mb-3">

								<label for="file" class="fUpload">첨부파일</label> 
								<c:if test="${!empty n.nOriginalFileName }">
									<a href="${ contextPath }/resources/nupload/${ n.nRenameFileName}" download="${ n.nOriginalFileName }">${ n.nOriginalFileName }</a>
									<button type="button" id="delfile">X</button>
									<!-- 새 첨부파일 <input type="file" name="uploadFile"> -->
								</c:if>
								<c:if test="${ empty n.nOriginalFileName }">
									<input type="file" name="uploadFile">
								</c:if>

							</div>

						<div>
						
							<button type="button"  class="btn" onclick="location.href='nlist.do';">목록</button>
							&nbsp; &nbsp;
							<button type="submit" class="btn" id="btnSave">수정하기</button>
							&nbsp; &nbsp;
							<button type="button" class="btn" onclick="location.href='ndelete.do?nId=${ n.nId }';">삭제하기</button>

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


	<c:import url="../../common/adminFooter.jsp"/> 
	<c:import url="../../common/footer.jsp"/>
<!-- 	
	<script>
		
			$("#delfile").on("click", function(){
				
				var nId = ${ n.nId };
				
				$.ajax({
					url:"nfiledel.do",
					data:{nId:nId},
					type:"get",
					success:function(data){
						if(data == ""){
							
						}else{
							alert("파일 삭제 실패!");
						}
					},
					error:function(){
						console.log("서버와의 통신 실패");
					}
				});
				
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