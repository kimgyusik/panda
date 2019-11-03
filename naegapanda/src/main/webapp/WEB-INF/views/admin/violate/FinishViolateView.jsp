<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/pandaicon.ico">
<title>PANDA:신고관리</title>

<style>
	.outer{
		width:900px;
		height: 1250px;
		margin-left: 300px;
		margin-top:50px; 
	}

</style>
</head>
<body>

	<c:import url="../../common/menubar.jsp"/>

<div class="outer"> 
	<img src="resources/images/violate.JPG">

	<div align="center">
		<button type="button" class="btn btn-outline-primary" onclick="location.href='pDetailView.do?pId=${pId}';">상품으로 되돌아가기</button>
	</div>
</div>
	<c:import url="../../common/footer.jsp"/>
</body>
</html>