<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	
	
	<h1 align="center">${ loginUser.name }님의 정보 보기</h1>
	
	<div class="outer" align="center">
		<form action="mupdate.do" method="post">
			<table width="600" cellspacing="5">
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
					<td><input type="number" min="20" max="100" name="birthdate" value="${ loginUser.birthdate }"></td>
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
						<button type="submit">수정하기</button> 
						<c:url var="mdelete" value="mdelete.do">
							<c:param name="id" value="${ loginUser.id }"/>
						</c:url>
					
						<button type="button" onclick="location.href='${mdelete}';">탈퇴하기</button> 
						<button type="reset">취소하기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>




