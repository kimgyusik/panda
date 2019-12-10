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
	.outer{
		width:300px;
		border: 1px solid lightgray;
	}
</style>
</head>
<body>
	
	<c:import url="../common/menubar.jsp"/>
		<div align="center">
			<div class="outer" align="center">
				<h3 style="margin-top:20px;">ID찾기</h3>
				<p style="margin-top:30px;">회원님의 아이디는 <label>${sId}</label> 입니다</p>
				
				<button style="margin-bottom: 50px" onclick="location.href='findSeller.do';" class="btn btn-primary">비밀번호 찾기</button>
			</div>
		</div>
	<c:import url="../common/footer.jsp"/>
	
</body>
</html>