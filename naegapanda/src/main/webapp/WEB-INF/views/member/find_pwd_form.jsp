<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PANDA:판매자 아이디 찾기</title>
</head>
<style>
	.outer{
		display: block;
	}
	
	#idForm{
		display:inline-block;
		width:250px;
		height:300px;
		border:1px solid lightgray;
		margin-top:50px;
	}
	
	#pwdForm{
		display:inline-block;
		width:250px;
		height:300px;
		border:1px solid lightgray;
	}
	#h{
		margin-top:30px;
	}
	
	
	body {
  background: #2ecc71;
  font-size: 62.5%;
}

.container {
  padding: 2em;
}

/* GENERAL BUTTON STYLING */
button,
button::after {
  -webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
  -o-transition: all 0.3s;
	transition: all 0.3s;
}

button {
  background: none;
  border: 3px solid #0100FF;
  border-radius: 5px;
  color: #0100FF;
  display: block;
  font-size: 4em;
  font-weight: bold;
  margin: 1em auto;
  padding: 2em 6em;
  position: relative;
  text-transform: uppercase;
}

button::before,
button::after {
  background: #FFE400;
  content: '';
  position: absolute;
  z-index: -1;
}

button:hover {
  color: #2ecc71;
}


/* BUTTON 2 */
.btn-2::after {
  height: 100%;
  left: 0;
  top: 0;
  width: 0;
}

.btn-2:hover:after {
  width: 100%;
}


#pwdForm{
  width:550px;
　　height:150px;
　/* 　background-color:#999; */
　　border: 15px solid #333; 
　　padding:15px;
　　box-sizing: content-box;
　　}
}
</style>
<body>
<c:import url="../common/sellerMenubar.jsp"/>


<br><br><br>
<div class="outer" align="center">
	<div id="h"><h2>아이디/비밀번호 찾기</h2></div>
	
<!-- 	<div id="idForm">
		<form action="findsId.do" method="post">
			<div class="outer">
				<h3>아이디 찾기</h3>
				<input type="text" placeholder="이름을 입력해주세요" required>
				<input type="email" id="sEmail" name="sEmail" placeholder="이메일을 입력해주세요" required>
			</div>
			<button type="submit" id="findsId">아이디찾기</button>
		</form>
	</div> -->
	
	<div id="pwdForm" class="container">
		<form action="find_Pwd.do" method="post">
			<h3>비밀번호 찾기</h3>
			<input type="text" name="id" placeholder="아이디를 입력해주세요" required>&nbsp;&nbsp;&nbsp;&nbsp;	
			<input type="email" name="email" placeholder="이메일를 입력해주세요" required>
			<br><br>
			<h6>*가입하신 EMail로 임시 비밀번호가 발송됩니다.</h6>
			<h6>받으신 임시 EMail로 로그인 해주세요*</h6>
			<br>
			
					<button type="submit" id="findsPwd" class="btn-2" style="float:left">비밀번호 찾기</button>&nbsp;&nbsp;	
					<button type="button" class="btn-2" onclick="location.href='home.do';" style="float:right">&nbsp;처음으로</button>
		</form>	
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>



	<c:import url="../common/footer.jsp"/>


	

</body>
</html>