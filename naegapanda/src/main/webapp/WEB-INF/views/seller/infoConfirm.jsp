<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PANDA:회원정보확인</title>
<style>
	#name{
		color:blue;
		margin-left:377px;
		
	}
	.outer{
		height:400px;
	}
	#input{
		border:1px solid lightgray;
		height:200px;		
	}
	#inputId{
		margin-top: 70px;
	}
	
</style>
</head>
<body>

	<c:import url="../common/sellerMenubar.jsp"/>
	
	<h2 style="margin-top:50px; margin-left:375px">회원정보확인</h2>
	<br><br>
	<h5><label id="name" >${ loginSeller.sName }</label>님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.</h5>
	<div class="outer" align="center">
		<form action="sPage.do" method="post">
			<div class="form-group col-md-6" id="input">
				<h4><label id="inputId">아  이  디 : </label>&nbsp;&nbsp;<input type="text" value="${ loginSeller.sId }" name="sId" style="border:none" readonly></h4>
				<h4><label style="display:inline-block;">비밀번호 : </label>&nbsp;&nbsp;<input style="display:inline-block; width:200px" type="password" name="sPwd" class="form-control"></h4>
			</div>
			<button type="submit" class="btn btn-primary">확인</button>
			<button type="button" class="btn btn-primary" onclick="location.href='sProduct.do';">취소</button>
		</form>
	</div>
	<c:import url="../common/footer.jsp"/>

</body>
</html>