<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/pandaicon.ico">
<title>PANDA:내정보</title>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<style>
	.outer{
		width:700px;
	}
	input{
		width:300px !important;
	}
	label{
		margin-top:20px
	}
</style>

</head>
<body>
	
	<c:import url="../common/sellerMenubar.jsp"/>
	
		<h2 style="margin-top:30px; margin-left:190px" >${ loginSeller.sName }님의 정보 수정</h2>
		
			<div class="outer" style="margin-left:500px; margin-top:30px">
				<form action="sUpdate.do" method="post">
					
						
							<label>아이디:</label><input type="text" value="${ loginSeller.sId }" name="sId" readonly style="border:none"> <br>
						
						
							<label>이름:</label><input type="text" value="${ loginSeller.sName }" name="sName" readonly style="border:none"> <br>
						
						
							<label style="display:inline-block;">비밀번호 :</label> <input type="password" class="form-control" name="sPwd" id="sPwd" value="${ loginSeller.sPwd }" style="display:inline-block;"> <br>
						
							<label style="display:inline-block;">비밀번호 확인:</label> <input type="password" class="form-control" name="sPwdConfirm" id="sPwdCheck" value="${ loginSeller.sPwd }" style="display:inline-block;"> <font name="check"size="2" color="red"></font> <br>
						
							
								<label>이메일:</label><input type="text" value="${ loginSeller.sEmail }" readonly style="border:none"> <br>
							
								<label style="display:inline-block;">전화번호:</label>
								<input type="tel" class="form-control" value="${loginSeller.sPhone }" name="sPhone" style="display:inline-block;"> <br>
							
							<c:if test="${ empty loginSeller.sAddress }">
								
									<label style="display:inline-block;">우편번호</label>
									
										<input type="text" name="post" size="6" class="postcodify_postcode5 form-control" style="display:inline-block;">
										<button type="button" class="btn btn-primary" id="post_search_btn" style="display:inline-block;">검색</button> <br>
									
							<label style="display:inline-block;">도로명주소</label>
							<input type="text" class="form-control" name="sAddress1" class="postcodify_address form-control" style="display:inline-block;"> <br>
						
							<label>상세주소</label>
							<input type="text" class="form-control" name="sAddress2" class="postcodify_extra_info form-control" style="display:inline-block;"> <br>
						
					</c:if>
					<c:if test="${ !empty loginSeller.sAddress }">
						<c:forTokens items="${ loginSeller.sAddress }" delims="," var="addr" varStatus="status">		
						
							<c:if test="${ status.index eq 0 }">
								
									<label style="display:inline-block;">우편번호</label>
									
										<div class="ad1">
										<input type="text" name="post" size="6" value="${ addr }" class="postcodify_postcode5 form-control" style="display:inline-block;">
										<button type="button" id="post_search_btn1" style="display:inline-block;">검색</button> <br>
										</div>
									
							</c:if>
							<c:if test="${ status.index eq 1 }">
								
									<label style="display:inline-block;">도로명 주소</label>
									<div class="ad1"><input type="text" name="sAddress1" value="${ addr }" class="postcodify_address form-control" style="display:inline-block;"></div> <br>
								
							</c:if>
							<c:if test="${ status.index eq 2 }">
								
									<label style="display:inline-block;">상세주소</label>
									<div class="ad1"><input type="text" name="sAddress2" value="${ addr }"  class="postcodify_extra_info form-control" style="display:inline-block;"></div> <br>
								
							</c:if>
							
						</c:forTokens>
					</c:if>
					<hr>
					<label>사업자번호 : </label>${ loginSeller.sbNum } <br>
				 
					<label>통신판매번호 : </label>${ loginSeller.stNum } <br>
				<label style="display:inline-block;">상점명 : </label>&nbsp;<input type="text" class="form-control" value="${ loginSeller.storeName }" name="storeName" style="display:inline-block;"> <br>
				
					<label style="display:inline-block;">CEO명 : </label>&nbsp;<input type="text" class="form-control" value="${ loginSeller.sCeoName }" name="sCeoName" style="display:inline-block;"> <br>
					<label>업종 :</label>&nbsp;${ loginSeller.sector } <br>
					<label style="display:inline-block;">사업장전화번호 : </label>
					<input type="tel" value="${ loginSeller.sbPhone }" class="form-control" name="sbPhone" style="display:inline-block;"> <br>
				
				<c:if test="${ empty loginSeller.sbAddress }">
					
							<label style="display:inline-block;">우편번호</label>
							
								<input type="text" name="post" size="6" class="postcodify_postcode5">
								<button type="button" id="post_search_btn1">검색</button> <br>
							
							<label>도로명 주소</label>
							<input type="text" name="sAddress2" class="postcodify_address">상세주소
							<input type="text" name="sAddress2" class="postcodify_extra_info">  <br>
						
					</c:if>
					<c:if test="${ !empty loginSeller.sbAddress }">
						
							<label style="display:inline-block;">사업장 주소 </label>
								
									<div class="ad2">
									<input type="text" class="form-control" name="sbAddress" value="${ loginSeller.sbAddress }" style="display:inline-block; width:600px !important">  <br>
									</div>
								
						</c:if>
			
			<div style="margin-top:40px; align:center">
			<button type="submit" class="btn btn-primary" >수정하기</button><label style="margin-left:10px;">탈퇴를 원하시면</label><a href="sDelete.do">회원탈퇴</a><label>를 눌러주세요.</label>
			</div>
		</form>
		
		
		
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
				$('font[name=check]').html("비밀번호가 다릅니다.");
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