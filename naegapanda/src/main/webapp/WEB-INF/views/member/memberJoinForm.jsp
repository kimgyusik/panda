<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script src="resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<link rel="icon" href="resources/pandaicon.ico">
<title>PANDA:회원가입</title>
<style>
	.form-row{
		display: inline-block !important;
		margin-left: 290px !important;
		width:600px !important;
	}
	.outer{
		width:900px;
		height: 1250px;
		margin-left: 300px;
		margin-top:5px; 
	}
	.form-control{
		width:400px !important; 
	}
	#exampleFormControlSelect1 , #exampleFormControlSelect2{
		width:130px !important;
		color:black !important;
		display: inline-block;
	}
	.postcodify_postcode5{
		width:120px !important;
		display:inline !important;
	}
	
	#post_search_btn{
		margin-left:10px;
		width:100px !important;
		display:inline !important;
	}
</style>
</head>

<body>

<c:import url="../common/menubar.jsp"/>

<div style="margin-left:290px"><img src="resources/images/joinba.jpg"></div>
		
<div class="outer">
	<hr>
	<form class="joinForm" action="minsert.do" method="post">
		<div class="form-row" >
			<div class="form-group col-md-6">
				<input type="text" class="form-control" name="id" id="userId" placeholder="ID" required>
				<span class="ok guide">사용 가능</span>
				<span class="error guide">사용 불가능</span>
				<input type="hidden" id="idDuplicateCheck" value="0">
			</div>
			<div class="form-group col-md-6">
				<input type="password" class="form-control" name="Pwd" id="Pwd" placeholder="비밀번호" required>
			</div>
			<div class="form-group col-md-6">
				<input type="password" class="form-control" name="PwdConfirm" id="PwdCheck" placeholder="비밀번호확인" required><font name="check"size="2" color="red"></font>
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" name="name" placeholder="이름" required>
			</div>
			<div class="form-group col-md-6">
					성별
						<input type="radio" name="gender" value="M"> 남 
						<input type="radio" name="gender" value="F"> 여
			</div>
			<div class="form-group col-md-6">
				<input type="date" class="form-control" name="birthDate" min="1919-01-01" max="2019-11-05" placeholder="생년월일과 뒤에한자리(예 199901011)" required>
			</div>
			<div class="form-group col-md-6">
				<input type="Email" class="form-control" name="email" placeholder="Email" required>
				<br>
				<label for="email_yn"><input name="email_yn" type="checkbox" id="email_yn" value="Y" /> 이벤트/쇼핑정보 이메일 수신에 동의합니다.</label>
			</div>
			<div class="form-group col-md-6">
				<input type="tel" class="form-control" name="phone" placeholder="핸드폰번호(-미포함)" required>
			</div>
			<div class="form-group col-md-6" id="ad1">
					<input type="text" name="post" id="post" class="form-control postcodify_postcode5">
					<button type="button" id="post_search_btn1" class="btn btn-light">주소찾기</button>				
					<input type="text" class="form-control postcodify_address" name="address1" placeholder="도로명주소" >
					<input type="text" class="form-control postcodify_extra_info" name="address2" placeholder="상세주소" >
			</div>

		 <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<script>
					$(function(){
						// 검색 버튼 누르면 팝업 레이어가 열리도록 설정
						$("#post_search_btn1").postcodifyPopUp();
					});
				</script>
		
		

		<div align="center">
			<button type="submit" class="btn btn-primary" onclick="return validate();">가입하기</button>
			<button type="reset" class="btn btn-primary">취소하기</button>
			<button type="reset" class="btn btn-primary" onclick="location.href='home.do';">처음으로</button>
		</div>
	</form>
	

	
</div>

	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script> 
			$("#post_search_btn").postcodifyPopUp({container: $("#ad1") });
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
		$(".guide").hide();
		
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
	
	
			
			// 비번체크
			$(function() {
				$('#Pwd').keyup(function() {
					$('font[name=check]').text('');
				});
				console.log("${ loginSeller}");
				$('#PwdCheck').keyup(function() {
					if ($('#Pwd').val() != $('#PwdCheck').val()) {
						$('font[name=check]').text('');
						$('font[name=check]').html("암호틀림");
					} else {
						$('font[name=check]').text('');
						$('font[name=check]').html("암호맞음");
					}
				});
			});
			
	</script>
		<c:import url="../common/footer.jsp"/>
</body>
</html>