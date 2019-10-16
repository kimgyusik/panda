<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.guide{
		display:none;
		font-size:12px;
		top:12px;
		right:10px;
	}
	.ok{color:green}
	.error{color:red}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<title>회원가입</title>
</head>
<body>

	<h1 align="center">회원가입</h1>
	
	<div class="outer" align="center">
		<form action="minsert.do" method="post">
			<table width="600" cellspacing="5">
				<tr>
					<td width="150">* 아이디</td>
					<td>
						<input type="text" name="id" id="userId" required>
						<span class="ok guide">사용 가능</span>
						<span class="error guide">사용 불가능</span>
						<input type="hidden" id="idDuplicateCheck" value="0">
					</td>
				</tr>
				<tr>
					<td>* 비밀번호</td>
					<td><input type="password" name="pwd" required></td>
				</tr>
				<tr>
					<td>* 비밀번호 확인</td>
					<td><input type="password" name="pwd2" required></td>
				</tr>
				<tr>
					<td>* 이름</td>
					<td><input type="text" name="name" required></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" name="gender" value="M"> 남 
						<input type="radio" name="gender" value="F"> 여
					</td>t
				</tr>
				<tr>
					<td>생일</td>
					<td><input type="text" min="20" max="100" name="birthdate"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="tel" name="phone"></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td>
						<input type="text" name="post" size="6" class="postcodify_postcode5">
						<button type="button" id="post_search_btn">검색</button>
					</td>
				</tr>
				<tr>
					<td>도로명 주소</td>
					<td><input type="text" name="address1" class="postcodify_address"></td>
				</tr>
				<tr>
					<td>상세 주소</td>
					<td><input type="text" name="address2" class="postcodify_extra_info"></td>
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
						<button type="submit" onclick="return validate();">가입하기</button>
						<button type="reset">취소하기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<script>
		function validate(){
			// 아이디 중복체크 여부
			if($("#idDuplicateCheck").val() == 0){ // 현재 아이디 사용 불가능
				
				alert("사용가능한 아이디를 입력해주세요!");
				$("#userId").focus();
				
				return false; // submit 기능 안되게 
			}else{ // 사용 가능
				return true;
			}
		}
		
		$(function(){
			$("#userId").on("keyup", function(){
				
				var userId = $(this).val();
				
				if(userId.length < 5){
					
					$(".guide").hide();
					$("#idDuplicateCheck").val(0);
					
					return;
				}
				
				//console.log(userId);
				$.ajax({
					url:"idCheck.do",
					data:{id:userId},
					type:"post",
					success:function(data){ // data에는 응답데이터 담김
						
						if(data == "ok"){ // 사용가능
							$(".error").hide();
							$(".ok").show();
							$("#idDuplicateCheck").val(1);
							
						}else{ // 사용불가능
							$(".ok").hide();
							$(".error").show();
							$("#idDuplicateCheck").val(0);
						}
					},
					error:function(){
						console.log("서버와의 통신 실패");
					}
				});
				
			});
		});
		
	</script>
	
</body>
</html>




