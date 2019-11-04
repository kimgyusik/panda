<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" href="resources/pandaicon.ico">
<title>PANDA:고객센터</title>
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

						<h2>PANDA 공지사항</h2>
						<br><br>

						<form encType="multipart/form-data" method="post" action="ninsert.do">

							<div class="mb-3">

								<label for="title">제목</label> 
								<input type="text" class="form-control" name="nTitle" id="title"
									placeholder="제목을 입력해 주세요">

							</div>


							<div class="mb-3">

								<label for="content">내용</label>

								<textarea class="form-control" rows="8" name="nContent"
									id="content" placeholder="내용을 입력해 주세요" style="resize:none;"></textarea>

							</div>



							<div class="mb-3">

								<label for="file">첨부파일</label> 
								<input type="file" name="uploadFile">

							</div>

	
						<div align="center">

							<button type="submit" class="btn btn-sm btn-primary" id="btnSave">저장</button>
							&nbsp; &nbsp;
							<button type="button" class="btn btn-sm btn-primary" onclick="location.href='nlist.do'">목록</button>

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