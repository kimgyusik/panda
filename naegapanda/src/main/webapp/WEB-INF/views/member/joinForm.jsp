<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Hi+Melody&display=swap" rel="stylesheet">
<title>내가판다 회원가입</title>
</head>
<style>
	.outer{
		margin-top:20px;
	}
	
	
	#st {
	/* 	width: 100px;
		height: 100px; */
		background-color:#00ccff;
		
	}
	
 	#st2{
	/* 	width: 100px;
		height: 100px; */
	 	/* opacity:0.5;  */
		background-image: url("resources/reserP.gif");
		border-radius: 10px;
	} 
	
	#ft{
	font-family: 'Hi Melody', cursive;
	color:#FFFFFF;
	}


</style>
<body>
<c:import url="../common/menubar.jsp"/> 
<div class="outer" align="center">
	<div class="jumbotron" style="width:100%; height:700px; display: inline-block;" align="center" id="st">
		<div id="st2" style="width:800px; height:600x; display: inline-block;">
		  <h4 class="display-4" id="ft">안녕하세요!</h4>
			  <p>쉽고 간편한 내가판다 쇼핑이에요! 우리 함께해요!</p>
		  <hr class="my-4">
		  <br><br><br><br><br><br><br><br>  
		  	  
		 
	  <br><br><br><br><br><br><br><br><br><br>
	   <p>구매자는 일반회원으로 판매자는 판매회원 '버튼'을 '클릭'해주세요.</p>
		 	<button class="btn btn-primary btn-lg" onclick="location.href='mJoin.do';">일반회원</button>
		 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn btn-primary btn-lg" onclick="location.href='sJoin.do';">판매회원</button>
		</div>
	</div>
	
	
</div>
<c:import url="../common/footer.jsp"/>
</body>
</html>