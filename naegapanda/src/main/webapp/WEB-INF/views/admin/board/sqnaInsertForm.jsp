<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>고객센터</title>
<meta charset="utf-8">

<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous"> -->

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

						<h2>PANDA 판매자문의</h2>
						<br><br>

						<form method="post" action="sqinsert.do">
						
							<input type="hidden" name="sNo" value="${ loginSeller.sNo }">

							<div class="mb-3">

								<label for="category">카테고리</label> 
								<select id="cat" name="sqCategory">
									<option value="회원정보">회원정보</option>
									<option value="입점문의">입점문의</option>
									<option value="제휴문의">제휴문의</option>
									<option value="상품관련">상품관련</option>
									<option value="프로모션">프로모션</option>
									<option value="기타" selected>기타</option>
								</select>
								
								
							</div>

							<div class="mb-3">

								<label for="title">제목</label> 
								<input type="text" class="form-control" name="sqTitle" id="title"
									placeholder="제목을 입력해 주세요" required>

							</div>


							<div class="mb-3">

								<label for="content">내용</label>

								<textarea class="form-control" rows="8" name="sqContent"
									id="content" placeholder="내용을 입력해 주세요" style="resize:none;" required></textarea>

							</div>



	
						<div align="center">

							<button type="submit" class="btn btn-sm btn-primary" id="btnSave">저장</button>
							&nbsp; &nbsp;
							<button type="button" class="btn btn-sm btn-primary" onclick="location.href='sqlist.do'">목록</button>

						</div>


						</form>


					</div>

				</div>
			</div>

		</div>




	<c:import url="../../common/adminFooter.jsp"/> 
	<c:import url="../../common/footer.jsp"/>


</body>

</html>