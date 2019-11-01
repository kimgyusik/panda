<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PANDA:아이디/비밀번호 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="resources/js/jquery-3.3.1.min.js"></script>
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
	
	
	
</style>
<body>
	<c:import url="../common/sellerMenubar.jsp"/>
	
		<div class="outer" align="center">
			<div id="h"><h2>아이디/비밀번호 찾기</h2></div>
			
			<div id="idForm">
				<form action="findsId.do" method="post">
					<div class="outer">
						<h3>아이디 찾기</h3>
						<input type="text" id="sName" name="sName" placeholder="이름을 입력해주세요" required>
						<input type="email" id="sEmail" name="sEmail" placeholder="이메일을 입력해주세요" required>
					</div>
					<button type="submit" id="findsId">아이디찾기</button>
					
					<span id="sIdLists"></span>
				</form>
			</div>
			
			<div id="pwdForm">
				<form action="findsPwd.do" method="post">
					<h3>비밀번호 찾기</h3>
					<input type="text" name="sId" id="sId" placeholder="아이디를 입력해주세요" required>
					<input type="email" name="sEmail" id="ssEmail" placeholder="이메일을 입력해주세요" required>
					<button type="submit" id="findsPwd">비밀번호 찾기</button>		
				</form>	
			</div>
			<br><br><br><br><br><br><br><br><br><br><br><br><br>
		</div>
		
		<script>
		
		$("#findsId").click(function(){
			
			if($("#sName").val() == ""){
				alert("이름을입력해주세요");
				$("#sName").focus();
				return false;
			}
			
			if($("#sEmail").val() == ""){
				alert("이메일을 입력해주세요");
				$("#sEmail").focus();
				return false;
			}

		});
		
		$("#findsPwd").click(function(){
			
			if($("#sId").val() == ""){
				alert("아이디를 입력해주세요");
				$("#sId").focus();
				return false;
			}
			
			if($("#ssEmail").val() == ""){
				alert("이메일을 입력해주세요");
				$("#ssEmail").focus();
				return false;
			}
			
			alert("임시비밀번호를 이메일로 보내드렸습니다.")
			
		});
			
		</script>

	<c:import url="../common/footer.jsp"/>

</body>
</html>