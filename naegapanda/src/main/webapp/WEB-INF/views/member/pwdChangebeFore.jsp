<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
.form-control{
	margin: 10px; padding: 20px
}

#ss{
	
	margin-right:auto;
	
}
</style>
</head>
<meta charset="UTF-8">
<link rel="icon" href="resources/pandaicon.ico">
<title>PANDA:마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript"> 
$(function(){ $("#alert-success").hide(); 
$("#alert-danger").hide(); 
$("input").keyup(function(){ var pwd1=$("#pwd1").val(); 
var pwd2=$("#pwd2").val(); 
if(pwd1 != "" || pwd2 != ""){ if(pwd1 == pwd2){ $("#alert-success").show();
$("#alert-danger").hide();
$("#submit").removeAttr("disabled"); }else{ $("#alert-success").hide();
$("#alert-danger").show();
$("#submit").attr("disabled", "disabled"); } } }); });
</script>

<body>
	<c:import url="../common/menubar.jsp"/> 
	<br><br>
	<br><br><br><br>
	<div class="outer" align="center">
		<form action="pwdChange.do" method="post">
			<table width="600" cellspacing="5">
				<tr>
					<td width="150">이전 비밀번호</td>
					<td><input type="password" name="pwd3" class="form-control" required />
				</tr>
				<!-- <tr>
				<td width="150">이전 비밀번호</td>
					<td><input type="password" name="reuserPwd" id="pwd2" class="form-control" required />

				</tr>
				<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
				<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
 -->
		
		
				<!-- <tr>
					<td colspan="2" align="center">
						<button type="submit">비밀번호 확인</button> 
					</td>
				</tr> -->
			</table>
		</form>
		
		<br>	<br><br>
		
		<div class="outer" align="center">
		<form action="pwdChange2.do" method="post">
			<table width="600" cellspacing="5">
				<tr>
					<td width="150">새로운 비밀번호</td>
					<td><input type="password" name="pwd" id="pwd1" class="form-control" required ></td>
				</tr>
				
				<tr>
					<td width="150">비밀번호 확인</td>
					<td><input type="password" name="reuserPwd" id="pwd2" class="form-control" required /></td>
				</tr>
			
				
		
				<tr>
					<td colspan="2" align="right">
						<button type="submit" id="ss" class="btn btn-primary btn-lg" style="float:center">비밀번호 확인</button> 
					</td>
				</tr>
				<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
				<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
			</table>
		</form>
	</div>
	<br><br><br>
	<c:import url="../common/footer.jsp"/>
</body>
</html>


