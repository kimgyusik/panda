<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/style/myPage.css">
<link rel="icon" href="resources/pandaicon.ico">
<title>PANDA:마이페이지</title>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 눈 효과 -->
<script src="https://tistory3.daumcdn.net/tistory/941717/skin/images/jquery.min.js" type="text/javascript"></script> 
<script src="https://tistory3.daumcdn.net/tistory/941717/skin/images/snowfall.jquery.js" type="text/javascript"></script>
<script>
	$(function(){
		if(${msg ne null}){
			alert('${msg}');
		};
		
		if($("#pwForm").submit(function(){
			if($("#pw").val() !== $("#pw2").val()){
				alert("비밀번호가 다릅니다.");
				$("#pw").val("").focus();
				$("#pw2").val("");
				return false;
			}else if ($("#pw").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#pw").val("").focus();
				return false;
			}else if($.trim($("#pw").val()) !== $("#pw").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
		}));
	})
</script>

<style>


font-family: 'Do Hyeon', sans-serif;
	h1{
	font-family: 'Do Hyeon', sans-serif;
	}

	.outer{
		font-family: 'Do Hyeon', sans-serif;
	}

	table{
	font-size: 1.1em;
	margin-left:auto;
	margin-right:auto;
	margin:auto;
	}
	a{
	font-size : larger;
	}
	 p{
	        text-align: center;
	    }
	    
	    
	    		    body {
		    background: rgb(14, 140, 228);
		}
		
		form {
		    width: 320px;
		    padding: 60px 25px 80px;
		    margin: 50px auto;
		    background: rgb(14, 140, 228);
		    display: flex;
		    flex-direction: column;
		}
		
		/* 라디오버튼 영역 */   
	.switch-contents {
	  padding: 1em;
	  text-align: center;
	}
	input[name="layout"] {
	  display: none;
	}
	label {
	  display: inline-block;
	  margin: 0 1em;
	  font-size: 1.2rem;
	  font-family: 'Open Sans', sans-serif;
	  font-weight: 300;
	  cursor: pointer;
	}
	label:hover {
	  border-bottom: 2px solid #000;
	}
	input[name="layout"]:checked + label {
	  border-bottom: 2px solid #3498db;
	  cursor: default;
	}
	ul {
	  margin: 0;
	  padding: 1em 0 0;
	  list-style: none;
	  text-align: left;
	}
	ul li {
	  min-height: 200px;
	  background: #3498db;
	}
	
	/* #loginTable{
	font-size: inherit ;
	} */
	
		#visual-btn {
		z-index: 50;
		color: #fff;
		font-size: 10px;
		border: 2px solid #fff;
		padding: 12px 24px;
		border-radius: 5px;
		cursor: pointer;
		background-color: rgba(0, 0, 0, 0);
	}
	
	#visual-btn:hover {
		color: #ff6868;
		font-size: 20px;
		border: 2px solid #ff6868;
		padding: 12px 24px;
		border-radius: 5px;
		cursor: pointer;
	}









	#loginBtn{
		z-index: 50;
		color: #fff;
		font-size: 40px;
		border: 2px solid #fff;
		padding: 12px 24px;
		border-radius: 5px;
		cursor: pointer;
		background-color: rgba(0, 0, 0, 0);
	}
	
	#loginBtn:hover {
		color: #ff6868;
		font-size: 50px;
		border: 2px solid #ff6868;
		padding: 12px 24px;
		border-radius: 5px;
		cursor: pointer;
	}

	
	
	
</style>

</head>
<body>
	
<div class="tuna"></div>


	<h1 style="font-family:'Do Hyeon', sans-serif, sans-serif, sans-serif'", align="center">${ loginUser.name }님의 정보 보기</h1>
	
	<div class="outer" align="center">
		<form action="mupdate.do" method="post">
			<table width="400" cellspacing="5">
				<tr>
					<td width="150">* 아이디</td>
					<td><input type="text" name="id" value="${ loginUser.id }" readonly></td>
				</tr>
				<tr>
					<td>* 이름</td>
					<td><input type="text" name="name" value="${ loginUser.name }" readonly></td>
				</tr>
				<tr>
					<td>성별</td>
					<c:choose>
						<c:when test="${ loginUser.gender eq 'M' }">
							<td>
								<input type="radio" name="gender" value="M" checked> 남 
								<input type="radio" name="gender" value="F"> 여
							</td>
						</c:when>
						<c:when test="${ loginUser.gender eq 'F' }">
							<td>
								<input type="radio" name="gender" value="M"> 남 
								<input type="radio" name="gender" value="F" checked> 여
							</td>
						</c:when>
						<c:otherwise>
							<td>
								<input type="radio" name="gender" value="M"> 남 
								<input type="radio" name="gender" value="F"> 여
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="date" max="9999-12-31" name="birthDate" value="${ loginUser.birthDate }"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" value="${ loginUser.email }"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="tel" name="phone" value="${ loginUser.phone }"></td>
				</tr>
				<c:if test="${ empty loginUser.address }">
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
				</c:if>
				<c:if test="${ !empty loginUser.address }">
					<c:forTokens items="${ loginUser.address }" delims="," var="addr" varStatus="status">
						<c:if test="${ status.index eq 0 }">
							<tr>
								<td>우편번호</td>
								<td>
									<input type="text" name="post" size="6" value="${ addr }" class="postcodify_postcode5">
									<button type="button" id="post_search_btn">검색</button>
								</td>
							</tr>
						</c:if>
						<c:if test="${ status.index eq 1 }">
							<tr>
								<td>도로명 주소</td>
								<td><input type="text" name="address1" value="${ addr }"  class="postcodify_address"></td>
							</tr>
						</c:if>
						<c:if test="${ status.index eq 2 }">
							<tr>
								<td>상세 주소</td>
								<td><input type="text" name="address2" value="${ addr }"  class="postcodify_extra_info"></td>
							</tr>
						</c:if>
					</c:forTokens>
				</c:if>
				
				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<script>
					$(function(){
						// 검색 버튼 누르면 팝업 레이어가 열리도록 설정
						$("#post_search_btn").postcodifyPopUp();
					});
				</script>
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit" id="visual-btn" >수정하기</button> 
						<c:url var="mdelete" value="mdelete.do">
							<c:param name="id" value="${ loginUser.id }"/>
						</c:url>
						<button type="button" id="visual-btn" onclick="location.href='change.do';">비밀번호 변경</button>
						<button type="button" id="visual-btn" onclick="location.href='${mdelete}';">탈퇴하기</button> 
						<br><br>
						<button type="reset" id="visual-btn">취소하기</button>
						<button type="button" id="visual-btn" onclick="location.href='home.do';">처음으로</button>
					</td>
				</tr>
				

			</table>
			
		</form>
 	<script>
     	$(document).ready(function(){
    		$(document).snowfall({deviceorientation : true, round : true, minSize: 1, maxSize:8,  flakeCount : 250});
    	});   	
    	
    </script>
    </div>
    
</body>
</html>









