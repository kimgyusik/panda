<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel=" shortcut icon" href="panda.ico">d
<link rel="icon" href="panda.ico">
<title></title>
</head>
<body>
	
	n a e g a p a n d a

	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
	<c:redirect url="home.do"/>
	<%-- <jsp:forward page="WEB-INF/views/home.jsp" /> --%>

</body>
</html>