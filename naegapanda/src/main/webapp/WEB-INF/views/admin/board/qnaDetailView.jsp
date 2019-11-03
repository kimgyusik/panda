<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>PANDA 공지</title>
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

						<h2>PANDA 회원서비스문의</h2>
						<br><br>

						<form method="post" action="qupdateView.do" >

							<input type="hidden" name="uqId" value="${ q.uqId }" >
							
							<div class="mb-3">

								<label for="title">카테고리</label> 
								<input type="text" class="form-control" name="uqCategory" id="category" value="${q.uqCategory }" style="width:75px; font-size:10px;" readonly>
								
								<!-- String qCategory = document.getElementBy('cat').options[document.getElementById('cat').selectedIndex].text; -->

							</div>
							
							<div class="mb-3">

								<label for="title">제목</label> 
								<input type="text" class="form-control" name="uqTitle" id="title"
									value="${ q.uqTitle }" readonly>

							</div>


							<div class="mb-3">

								<label for="content">내용</label>

								<textarea class="form-control" rows="8" name="uqContent"
									id="content"  style="resize:none;" readonly>${ q.uqContent }</textarea>

							</div>
							
							<c:if test="${ a ne null }">
								<div class="mb-3">

								<label for="content">답변</label>

								<textarea class="form-control" rows="8" name="aContent"
									id="content"  style="resize:none;" readonly>${ a.aContent }</textarea>

								</div>
							</c:if>



							
						<c:choose>
						<c:when test="${ loginUser.name eq q.mName  }">
						
						<div>
						
							<button type="button"  class="btn" onclick="location.href='qlist.do';">목록</button>
							&nbsp; &nbsp;
							<button type="submit" class="btn" id="btnSave">수정하기</button>
							&nbsp; &nbsp;
							<button type="button" class="btn" id="delete" onclick="location.href='qdelete.do?uqId=${ q.uqId }';">삭제하기</button>

						</div>
						</c:when>
						<c:when test="${ loginUser.name ne q.mName && loginUser.name ne '관리자' }">
							<button type="button"  class="btn" onclick="location.href='qlist.do';">목록</button>
						</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${ loginUser.name eq '관리자' && a ne null }">
							<div>
						
								<button type="button"  class="btn" onclick="location.href='qlist.do';">목록</button>
								&nbsp; &nbsp;
								<button type="button" class="btn" id="delete" onclick="location.href='adelete.do?uqId=${ a.qId}';">답변삭제</button>
							
							</div>
							</c:when>
							<c:when test="${ loginUser.name eq '관리자' && a eq null }">
								<div>
						
								<button type="button"  class="btn" onclick="location.href='qlist.do';">목록</button>
								&nbsp; &nbsp;
								<button type="button" class="btn" onclick="location.href='ainsertView.do?uqId=${ q.uqId }';">답변달기</button>
								&nbsp; &nbsp;
								<button type="button" class="btn" id="delete" onclick="location.href='qdelete.do?uqId=${ q.uqId}';">삭제하기</button>
							
								</div>
							</c:when>
						</c:choose>


						</form>
						
						
						
					</div>




	<c:import url="../../common/adminFooter.jsp"/> 
	<c:import url="../../common/footer.jsp"/>
	

</body>

</html>