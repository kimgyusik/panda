<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" href="resources/pandaicon.ico">
<title>PANDA:고객센터</title>
<meta charset="utf-8">

</head>
<style>
	.cat{
		margin-bottom:150px;
		/* margin-left:3px; */
		display:inline-block;
	}
	.bs-example{
    }

    h5 {
    	font-weight:bold !important;
    	margin-top:20px !important;
    }
</style>
<body>

	<div class="super_container">
	
		<c:import url="../../common/menubar.jsp"/> 
	
		<c:import url="../../common/admin.jsp"/> 
		
	</div>
		
		
			<div class="row" style="align:center;">
				<div class="col-lg-4 cat">
					<c:url value="pmlist.do" var="pmListView">
						<c:param name="cName2" value="의류/잡화" />
					</c:url>
					<a href="${ pmListView }">
						<i class="fas fa-female fa-7x"></i>
					</a>
					<h5>의류/잡화</h5>
				</div>
				<div class="col-lg-4 cat"  >
					<c:url value="pmlist.do" var="pmListView">
						<c:param name="cName2" value="식품" />
					</c:url>
					<a href="${ pmListView }" class="icon">
						<i class="fa fa-utensils fa-7x"></i>
					</a>
					<h5>식품</h5>
				</div>
				<div class="col-lg-4 cat">
					<c:url value="pmlist.do" var="pmListView">
						<c:param name="cName2" value="가구/인테리어" />
					</c:url>
					<a href="${ pmListView }" class="icon">
						<i class="fa fa-bed fa-7x"></i>
					</a>
					<h5>가구/인테리어</h5>
				</div>
				<div class="col-lg-4 cat" >
					<c:url value="pmlist.do" var="pmListView">
						<c:param name="cName2" value="디지털/가전/컴퓨터" />
					</c:url>
					<a href="${ pmListView }" class="icon">
						<i class="fa fa-tv fa-7x" ></i>
					</a>
					<h5>디지털/가전/컴퓨터</h5>
				</div>
				<div class="col-lg-4 cat">
					<c:url value="pmlist.do" var="pmListView">
						<c:param name="cName2" value="취미/반려동물" />
					</c:url>
					<a href="${ pmListView }" class="icon">
						<i class="fa fa-camera fa-7x" ></i>
					</a>
					<h5>취미/반려동물</h5>
				</div>
				<div class="col-lg-4 cat">
					<c:url value="pmlist.do" var="pmListView">
						<c:param name="cName2" value="생활/건강/뷰티" />
					</c:url>
					<a href="${ pmListView }" class="icon">
						<i class="fa fa-futbol fa-7x"></i>
					</a>
					<h5>생활/건강/뷰티</h5>
				</div>
			</div>
		
	
<c:import url="../../common/adminFooter.jsp"/> 
<c:import url="../../common/footer.jsp"/>



</body>

</html>