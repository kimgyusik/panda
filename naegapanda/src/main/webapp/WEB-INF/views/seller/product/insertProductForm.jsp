<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:import url="../../common/sellerMenubar.jsp"/>
	<c:forEach items="${ cList }" var="c">
		${c.cName }
	</c:forEach>
	<h1>상품등록하는 페이지</h1>
	
	<c:import url="../../common/footer.jsp"/>

</body>
</html>