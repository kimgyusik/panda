<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	label{
		color:blue;
	}
</style>
</head>
<body>

	<c:import url="../common/menubar.jsp"/>
		<p>회원님의 아이디는 <label>${sId}</label> 입니다</p>
		
		<a href="findSeller.do">비밀번호 찾기</a>
	
	<c:import url="../common/footer.jsp"/>
	
</body>
</html>