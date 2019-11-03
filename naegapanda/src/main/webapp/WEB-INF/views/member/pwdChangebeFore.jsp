<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/pandaicon.ico">
<title>PANDA:마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	
	
	
	<div class="outer" align="center">
		<form action="pwdChange.do" method="post">
			<table width="600" cellspacing="5">
				<tr>
					<td width="150">비밀번호 확인</td>
					<td><input type="password" name="pwd"></td>
				</tr>
				
				
			<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
			<script>
					$(function(){
					// 검색 버튼 누르면 팝업 레이어가 열리도록 설정
					$("#post_search_btn").postcodifyPopUp();
					});
			</script>
				
		
				<tr>
					<td colspan="2" align="center">
						<button type="submit">비밀번호 확인</button> 
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>




