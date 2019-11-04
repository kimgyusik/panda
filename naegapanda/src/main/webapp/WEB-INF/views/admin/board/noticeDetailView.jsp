<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" href="resources/pandaicon.ico">
<title>PANDA:공지</title>
<meta charset="utf-8">

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
								<input type="file" name="reloadFile">
								<c:if test="${!empty n.nOriginalFileName }">
									<br>현재 업로드한 파일 :
									<a href="${ contextPath }/resources/nupload/${ n.nRenameFileName}" download="${ n.nOriginalFileName }">${ n.nOriginalFileName }</a>
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


</body>

</html>