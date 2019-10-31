<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<style>
	.outer{
		width:1000px;
		border:1px solid black;
	}
</style>
</head>
<body>
	
	<c:import url="../common/sellerMenubar.jsp"/>
	
		<h3 >판매자 ${ loginSeller.sName }님의 정보 수정</h3>
		
			<div class="outer" align="center">
				<form action="sUpdate.do" method="post">
					<table>
						<tr>
							<td><label>아이디:</label><input type="text" value="${ loginSeller.sId }" name="sId" readonly style="border:none"></td>
						</tr>
						<tr>
							<td><label>이름:</label><input type="text" value="${ loginSeller.sName }" name="sName" readonly style="border:none"></td>
						</tr>
						<tr>
							<td><label style="float: left;">비밀번호 :</label> <input type="password" class="form-control" name="sPwd" id="sPwd" value="${ loginSeller.sPwd }" ></td>
						</tr>
						<tr>
							<td><label>비밀번호 확인:</label> <input type="password" class="form-control" name="sPwdConfirm" id="sPwdCheck" value="${ loginSeller.sPwd }"> <font name="check"size="2" color="red"></font></td>
						</tr>
						<tr>
							<td>
								<label>이메일:</label><input type="text" value="${ loginSeller.sEmail }" readonly style="border:none">
							</td>
						</tr>
						<tr>
							<td>
								<label>전화번호:</label>
								<input type="tel" class="form-control" value="${loginSeller.sPhone }" name="sPhone">
							</td>
						</tr>
						<tr>
							<c:if test="${ empty loginSeller.sAddress }">
								<tr>
									<td>우편번호</td>
									<td>
										<input type="text" name="post" size="6" class="postcodify_postcode5 form-control">
										<button type="button" id="post_search_btn">검색</button>
									</td>
								</tr>
							<tr>
							<td>도로명 주소</td>
							<td><input type="text" class="form-control" name="sAddress1" class="postcodify_address form-control"></td>
						</tr>
						<tr>
							<td>상세주소</td>
							<td><input type="text" class="form-control" name="sAddress2" class="postcodify_extra_info form-control"></td>
						</tr>
					</c:if>
					<c:if test="${ !empty loginSeller.sAddress }">
						<c:forTokens items="${ loginSeller.sAddress }" delims="," var="addr" varStatus="status">		
						
							<c:if test="${ status.index eq 0 }">
								<tr>
									<td>우편번호</td>
									<td>
										<div class="ad1">
										<input type="text" name="post" size="6" value="${ addr }" class="postcodify_postcode5 form-control">
										<button type="button" id="post_search_btn1">검색</button>
										</div>
									</td>
								</tr>
							</c:if>
							<c:if test="${ status.index eq 1 }">
								<tr>
									<td>도로명 주소</td>
									<td><div class="ad1"><input type="text" name="sAddress1" value="${ addr }" class="postcodify_address form-control"></div></td>
								</tr>
							</c:if>
							<c:if test="${ status.index eq 2 }">
								<tr>
									<td>상세주소</td>
									<td><div class="ad1"><input type="text" name="sAddress2" value="${ addr }"  class="postcodify_extra_info form-control"></div></td>
								</tr>
							</c:if>
							
						</c:forTokens>
					</c:if>
				</tr>
				<tr>
					<td><label>상점명:</label><input type="text" class="form-control" value="${ loginSeller.storeName }" name="storeName"></td>
				</tr>
				<tr>
					<td><label>CEO명:</label><input type="text" class="form-control" value="${ loginSeller.sCeoName }" name="sCeoName"></td>
				</tr>
				<tr>
					<td><label>사업장전화번호:</label>
					<input type="tel" value="${ loginSeller.sbPhone }" class="form-control" name="sbPhone"></td>
				</tr>
				<c:if test="${ empty loginSeller.sbAddress }">
						<tr>
							<td>우편번호</td>
							<td>
								<input type="text" name="post" size="6" class="postcodify_postcode5">
								<button type="button" id="post_search_btn1">검색</button>
							</td>
						</tr>
						<tr>
							<td>도로명 주소</td>
							<td><input type="text" name="sAddress2" class="postcodify_address"></td>
						</tr>
						<tr>
							<td>상세주소</td>
							<td><input type="text" name="sAddress2" class="postcodify_extra_info"></td>
						</tr>
					</c:if>
					<c:if test="${ !empty loginSeller.sbAddress }">
						<tr>
							<td>사업장 주소 </td>
								<td>
									<div class="ad2">
									<input type="text" class="form-control" name="sbAddress" value="${ loginSeller.sbAddress }">
									</div>
								</td>
							</tr>
						</c:if>
			</table>
			<br>
			<button type="submit">수정하기</button>
		</form>
		
		<label>탈퇴를 원하시면</label><a href="sDelete.do">회원탈퇴</a><label>를 눌러주세요.</label>
		
			</div>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script>
	$(function() {
		$('#sPwd').keyup(function() {
			$('font[name=check]').text('');
		});
		console.log("${ loginSeller}");
		$('#sPwdCheck').keyup(function() {
			if ($('#sPwd').val() != $('#sPwdCheck').val()) {
				$('font[name=check]').text('');
				$('font[name=check]').html("비밀번호가 틀립니다.");
			} else {
				$('font[name=check]').text('');
				$('font[name=check]').html("비밀번호가 일치합니다.");
			}
		});
	});
	
	
	$("#post_search_btn1").postcodifyPopUp({container: $(".ad1") });
	
	$("#post_search_btn2").postcodifyPopUp({container: $(".ad2") });
</script>






	<c:import url="../common/footer.jsp"/>
	
</body>
</html>