<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/pandaicon.ico">
<title>PANDA:아이디/비밀번호 찾기</title>
<style>
	label{
		color:blue;
	}
</style>
</head>
<body>

		<p>회원님의 아이디는 <label>${sId}</label> 입니다</p>
		
		<button onclick="location.href='findSeller.do';">비밀번호 찾기</button>
	
	
</body>
</html>