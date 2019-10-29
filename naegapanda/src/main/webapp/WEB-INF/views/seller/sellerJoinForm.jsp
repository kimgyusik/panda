<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PANDA : 회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script src="resources/js/jquery-3.3.1.min.js"></script>
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
	<h1>1.회원정보</h1>
	<form class="joinForm" action="sinsert.do" method="post">
		<div class="form-row" >
			<div class="form-group col-md-6">
				<input type="text" class="form-control" name="sName" id="sName" placeholder="이름" required>
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" name="sId" id="sId" placeholder="ID(4~12자리의 영문 대소문자와 숫자로만 입력)" required>
				<span class="ok guide">사용 가능</span>
				<span class="error guide">사용 불가능</span>
				<input type="hidden" id="sIdDuplicateCheck" value="0">
			</div>
			<div class="form-group col-md-6">
				<input type="password" class="form-control" name="sPwd" id="sPwd" placeholder="비밀번호(4~12자리의 영문 대소문자와 숫자로만 입력)" required>
			</div>
			<div class="form-group col-md-6">
				<input type="password" class="form-control" name="sPwdConfirm" id="sPwdCheck" placeholder="비밀번호확인" required><font name="check"size="2" color="red"></font>
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" name="sNum" id="sNum" placeholder="생년월일을 입력해주세요(예 19990101)" required>
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" name="sPhone" id="sPhone" placeholder="핸드폰번호(-미포함)" required>
			</div>
			<div class="form-group col-md-6">
				<input type="Email" class="form-control" name="sEmail" id="sEmail" placeholder="Email" required>
				<br>
				<label for="email_yn"><input name="email_yn" type="checkbox" id="email_yn" value="Y" /> 이벤트/쇼핑정보 이메일 수신에 동의합니다.</label>
			</div>
			<div class="form-group col-md-6" id="ad1">
					<input type="text" name="post" id="post" class="form-control postcodify_postcode5">
					<button type="button" id="post_search_btn1" class="btn btn-light">주소찾기</button>				
					<input type="text" class="form-control postcodify_address" name="sAddress1" placeholder="도로명주소" >
					<input type="text" class="form-control postcodify_extra_info" name="sAddress2" placeholder="상세주소" >
			</div>
			<div class="form-group col-md-6" >
				<input type="text" class="form-control" name="sbNum" id="sbNum" placeholder="사업자번호" required>
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" name="stNum" id="stNum" placeholder="전자통신등록번호" required>
			</div>	
		 </div> 

		 <br><hr>

		 <h1>2.스토어정보</h1>
		 <div class="form-row" >		
			<div class="form-group col-md-6">
				<input type="text" class="form-control" name="storeName" id="storeName" placeholder="사업장명" required>
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" name="sCeoName" id="ceoName" placeholder="대표이름" required> 
			</div>
			<div class="form-group col-md-6">
				<select class="form-control" id="exampleFormControlSelect1" name="sector"id="sector">
			      <option>업태</option>
			      <option value="금속광업">금속광업</option>
			      <option value="농업">농업</option>
			      <option value="도매업">도매업</option>
			      <option value="소매업">소매업</option>
			      <option value="숙박업">숙박업</option>
			      <option value="서비스">서비스</option>
			      <option value="어업">어업</option>
			      <option value="임업">임업</option>
			      <option value="음식점업">음식점업</option>
			      <option value="정보서비스업">정보서비스업</option>
			      <option value="제조업">제조업</option>
			      <option value="출판업">출판업</option>
			    </select>
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" name="sbPhone" id="sbPhone" placeholder="사업장전화번호" required>
			</div>
			<div class="form-group col-md-6" id="ad2">
				<input type="text" class="form-control" name="sbAddress" id="sbPost" placeholder="사업장주소">
			</div>
			
			
			
		</div>
		
		

		<hr>
		<br>
		<div align="center">
			<button type="submit" class="btn btn-primary" id="joinBtn">가입하기</button>
			<button type="button" class="btn btn-primary">취소하기</button>
		</div>
	</form>
	
	<br><br><br><br>
	통신판매검색(임시)
	<form name="frm1">
<input name="wrkr_no" type="text" />
<input type="button" value="팝업" class="btn btn-primary" onclick="onopen();"/>
</form>
	
</div>

	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script> 
			$("#post_search_btn1").postcodifyPopUp({container: $("#ad1") });
			
			
			// 유효성 검사
			$("#joinBtn").click(function(){
				
				var hobbyCheck = false;
				var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
				var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
				var getName= RegExp(/^[가-힣]+$/);
				var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정

				
				// 아이디 공백확인
				if($("#sId").val() == ""){
					alert("아이디를 입력해주세요");
					$("#sId").focus();
					return false;
					
				}
				
				// 아이디 유효성 검사
				if(!getCheck.test($("#sId").val())){
					alert("아이디형식에 맞게 입력해주세요");
					$("#sId").val("");
					$("#sId").focus();
					return false;
				}
				
				// 비밀번호 공백 확인
				if($("#sPwd").val() == ""){
					alert("비밀번호를  입력해주세요");
					$("#sPwd").focus();
					return false;
				}
				
				if(!getCheck.test($("#sPwd").val())){
					alert("비밀번호 형식에 맞게 입력해주세요");
					$("#sPwd").val("");
					$("#sPwd").focus();
					return false;
					
				}
				
				if($("#sPwd").val() !== $("#sPwdCheck").val()){
					alert("비밀번호가 서로 일치하지 않습니다.")
					$("#sPwd").focus();
					return false;
				}
				
				// 이메일 공백확인
				if($("#sEmail").val() == ""){
					alert("이메일을 입력해주세요");
					$("#sEmail").focus();
					return false;
					
				}
				
				// 이름 공백 확인
				if($("#sName").val() == ""){
					alert("이름을 입력해주세요");
					$("#sName").focus();
					return false;
					
				}
				
				if($("#sPhone").val() == ""){
					alert("핸드폰 번호를 입력해주세요");
					$("#sPhone").focus();
					return false;
				}
				
				if($("#sbNum").val() == ""){
					alert("사업자번호를 입력해주세요");
					$("#sbNum").focuse();
					return false;
					
				}
				
				if($("#btNum").val() == ""){
					alert("통신판매번호를 입력해주세요")
					$("#btNum").focus();
					return false;
					
				}
				
				if($("#sector").val() == "업종"){
					alert("업종을 선택해주세요")
					$("#sector").focus();
					return false;
				}
				
				
				
				
			});
						

			 function validate(){
				if($("#sIdDuplicateCheck").val() == 0){	
				
					alert("사용가능한 아이디를 입력해주세요!");
					$("#sId").focus();
					
					return false;	
				}else{	
					return true;
				}
			}
			
			$(function(){
				$(".guide").hide();
				
				$("#sId").on("keyup", function(){	
					
					var sellerId = $(this).val();
					
					if(sellerId.length < 5){
						
						$(".guide").hide();
						$("#sIdDuplicateCheck").val(0);
						
						return;
					} 
					
					
					
					$.ajax({
						url:"sIdCheck.do",
						data:{sId:sellerId},
						type:"post",
						success:function(data){
							
							if(data == "ok"){	
								$(".error").hide();
								$(".ok").show();
								$("#sIdDuplicateCheck").val(1);
							}else{	
								$(".ok").hide();
								$(".error").show();
								$("#sIdDuplicateCheck").val(0);
								alert("이미 존재하는 아이디 입니다.");
								$("#sId").focus;
								$("#sId").val("");
								$(".error").hide();
								
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
				$('#sPwd').keyup(function() {
					$('font[name=check]').text('');
				});
				console.log("${ loginSeller}");
				$('#sPwdCheck').keyup(function() {
					if ($('#sPwd').val() != $('#sPwdCheck').val()) {
						$('font[name=check]').text('');
						$('font[name=check]').html("암호틀림");
					} else {
						$('font[name=check]').text('');
						$('font[name=check]').html("암호맞음");
					}
				});
			});
			
			// 사업자번호부분
			$('#sbNum').focusout(function() {
				
				var sbNum = $('#sbNum').val();
	                  
			$.ajax({
		         url:"storeName.do",
		         data: {S_BNUM:sbNum},
		         dataType:"json",
		         success:function(data){
		               $('#storeName').val(data.storeName);
		               $('#ceoName').val(data.sCeoName);
		               $('#sbPhone').val(data.sbPhone);
		               $('#sbPost').val(data.sbAddress);
		         },
		         error:function(){
		            console.log("ajax 통신 실패");
		         }
		      });
			});
			
			
			// 통신판매
			function onopen()
			{
			var url =
			"http://www.ftc.go.kr/bizCommPop.do?wrkr_no="+frm1.wrkr_no.value;
			window.open(url, "bizCommPop", "width=750, height=700;");
			}
			
	</script>

<br><br><br><br><br><br>

<c:import url="../common/footer.jsp"/>
	
</body>
</html>