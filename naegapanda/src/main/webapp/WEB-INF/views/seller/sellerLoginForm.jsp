<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="sLogin.do" method="post">
		<div id="outer">
			<input type="text" placeholder="아이디" name="sId" required>
			<input type="password" placeholder="비밀번호" name="sPwd" required>
		</div>
		
		<button type="submit">로그인</button>
	</form>
	

</body>
</html>