<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/pandaicon.ico">
<title>PANDA:비밀번호찾기</title>
</head>
<style>
	.outer{
		display: block;
	}
	
	#idForm{
		display:inline-block;
		width:250px;
		height:300px;
		border:1px solid lightgray;
		margin-top:50px;
	}
	
	#pwdForm{
		display:inline-block;
		width:250px;
		height:300px;
		border:1px solid lightgray;
	}
	#h{
		margin-top:30px;
	}
	
	
	
</style>
<body>
<%-- <c:import url="../common/sellerMenubar.jsp"/> --%>


	
<div class="outer" align="center">
	<div id="h"><h2>아이디/비밀번호 찾기</h2></div>
	
<!-- 	<div id="idForm">
		<form action="findsId.do" method="post">
			<div class="outer">
				<h3>아이디 찾기</h3>
				<input type="text" placeholder="이름을 입력해주세요" required>
				<input type="email" id="sEmail" name="sEmail" placeholder="이메일을 입력해주세요" required>
			</div>
			<button type="submit" id="findsId">아이디찾기</button>
		</form>
	</div> -->
	
	<div id="pwdForm">
		<form action="find_Pwd.do" method="post">
			<h3>비밀번호 찾기</h3>
			<input type="text" name="id" placeholder="아이디를 입력해주세요" required>
			<input type="email" name="email" placeholder="비밀번호를 입력해주세요" required>
			<button type="submit" id="findsPwd">비밀번호 찾기</button>		
		</form>	
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>




	<c:import url="../common/footer.jsp"/>


	

</body>
</html>