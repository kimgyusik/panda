<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.outer{
		margin-top:10px;
	}
</style>
<body>

<c:import url="../common/menubar.jsp"/> 
<div class="outer" align="center">
	<div class="jumbotron" style="width:450px;" align="center">
	  <h1 class="display-4">내가판다의 회원가입 환영^^</h1>
	  <p class="lead">가입하쇼</p>
	  <hr class="my-4">
	  <p>일반회원과 판매회원 구분 해놨다.</p>
	 	<button class="btn btn-primary btn-lg" onclick="location.href='mJoin.do';" >일반회원</button>
		<button class="btn btn-primary btn-lg" onclick="location.href='sJoin.do';">판매회원</button>
	</div>
</div>
<c:import url="../common/footer.jsp"/>
</body>
</html>