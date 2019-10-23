<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#name{
		color:blue;
	}
</style>
</head>
<body>

	<c:import url="../common/sellerMenubar.jsp"/>
	
	<h2>회원정보확인</h2>
	<h5><label id="name">${ loginSeller.sName }</label>님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.</h5>
	<form action="sPage.do" method="post">
		<label>아이디 : </label><input type="text" value="${ loginSeller.sId }" name="sId" style="border:none">
		<label>비밀번호 : </label><input type="password" name="sPwd">
		
		<button type="submit">확인</button>
		<button type="button">취소</button>
	</form>
	
	<c:import url="../common/footer.jsp"/>

</body>
</html>