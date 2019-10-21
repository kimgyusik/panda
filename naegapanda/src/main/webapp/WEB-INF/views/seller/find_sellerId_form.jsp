<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PANDA:판매자 아이디 찾기</title>
</head>
<style>
	.outer{
		display: block;
	}
</style>
<body>

	<c:import url="../common/menubar.jsp"/>

	<form action="findsId.do" method="post">
		<div class="outer">
			<input type="text" placeholder="이름을 입력해주세요" required>
			<input type="email" id="sEmail" name="sEmail" placeholder="이메일을 입력해주세요" required>
		</div>
		<button type="submit" id="findsId">아이디찾기</button>
	</form>
	
	<form action="findsPwd.do" method="post">
			<input type="text" name="sId" required>
			<input type="email" name="sEmail">
			<button type="submit" id="findsPwd">비밀번호 찾기</button>
			
	</form>
	

	<c:import url="../common/footer.jsp"/>


	

</body>
</html>