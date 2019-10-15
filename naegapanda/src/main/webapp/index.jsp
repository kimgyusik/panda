<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>mybatis</h1>
	영속성 프레임워크 <br>
	동적쿼리 지원<br>
	자바 어노테이션 지원<br>
	
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
	
	<jsp:forward page="WEB-INF/views/home.jsp" />
	
</body>
</html>