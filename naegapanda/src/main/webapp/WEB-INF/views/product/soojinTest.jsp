<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<style type="text/css">

	.outer{
		width:700px;
		height: 500px;
		margin-left: auto;
		margin-right: auto;
		margin-top:50px; 
	}
</style>
</head>
<body>
<c:import url="../common/menubar.jsp"/>
<div class="outer">
<table>
	<h3 style="font-weight:bold;">검색결과뜬달</h3><br>
	<c:forEach items="${ list }" var="se">
		<tr>
			<td>제품번호 : ${se.pId }</td>
			<td>제품명 : ${se.pName }</td>
			<td>내용 : ${se.pContent }</td>
			<td>판매자번호 : ${se.sNo }</td>
		</tr>
	</c:forEach>
</table>
</div>

<c:import url="../common/footer.jsp"/>
</body>
</html>