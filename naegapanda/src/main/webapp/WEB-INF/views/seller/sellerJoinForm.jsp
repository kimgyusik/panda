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
				<input type="text" class="form-control" name="sName" placeholder="이름" required>
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" name="sId" id="sellerId" placeholder="ID" required>
				<span class="ok guide">사용 가능</span>
				<span class="error guide">사용 불가능</span>
				<input type="hidden" id="sIdDuplicateCheck" value="0">
			</div>
			<div class="form-group col-md-6">
				<input type="password" class="form-control" name="sPwd" placeholder="비밀번호" required>
			</div>
			<div class="form-group col-md-6">
				<input type="password" class="form-control" name="sPwd2" placeholder="비밀번호확인" required>
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" name="sNum" placeholder="생년월일과 뒤에한자리(예 199901011)" required>
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" name="sPhone" placeholder="핸드폰번호(-미포함)" required>
			</div>
			<div class="form-group col-md-6">
				<input type="Email" class="form-control" name="sEmail" placeholder="Email" required>
				<br>
				<label for="email_yn"><input name="email_yn" type="checkbox" id="email_yn" value="Y" /> 이벤트/쇼핑정보 이메일 수신에 동의합니다.</label>
			</div>
			<div class="form-group col-md-6" id="ad1">
					<input type="text" name="post" class="form-control postcodify_postcode5">
					<button type="button" id="post_search_btn1" class="btn btn-light">주소찾기</button>				
					<input type="text" class="form-control postcodify_address" name="sAddress1" placeholder="도로명주소" >
					<input type="text" class="form-control postcodify_extra_info" name="sAddress2" placeholder="상세주소" >
			</div>
			<div class="form-group col-md-6" >
				<input type="text" class="form-control" name="sbNum" placeholder="사업자번호" required>
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" name="stNum" placeholder="전자통신등록번호" required>
			</div>	
		 </div> 

		 <br><hr>

		 <h1>2.스토어정보</h1>
		 <div class="form-row" >		
			<div class="form-group col-md-6">
				<input type="text" class="form-control" name="storeName" placeholder="상점명" required>
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" name="sCeoName" placeholder="대표이름" required> 
			</div>
			<div class="form-group col-md-6">
				<select class="form-control" id="exampleFormControlSelect1" name="state">
			      <option>업종</option>
			      <option value="2">2</option>
			      <option value="3">3</option>
			      <option value="4">4</option>
			      <option value="5">5</option>
			    </select>
				<select class="form-control" id="exampleFormControlSelect2" name="sector">
			      <option>업태</option>
			      <option value="2">2</option>
			      <option value="3">3</option>
			      <option value="4">4</option>
			      <option value="5">5</option>
			    </select>
			</div>
			<div class="form-group col-md-6" id="ad2">
				<input type="text" name="sbPost" class="form-control postcodify_postcode5">
				<button type="button" id="post_search_btn2" class="btn btn-light">주소찾기</button>				
				<input type="text" class="form-control postcodify_address" name="sbAddress1" placeholder="도로명주소 (사업장)">
				<input type="text" class="form-control postcodify_extra_info" name="sbAddress2" placeholder="상세주소 (사업장)">
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" name="sbPhone" placeholder="전화번호 (사업장)" required>
			</div>
		</div>

		<hr>
		<br>
		<div align="center">
			<button type="submit" class="btn btn-primary">가입하기</button>
			<button type="button" class="btn btn-primary">취소하기</button>
		</div>
	</form>
	
</div>

	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script> 
			$("#post_search_btn1").postcodifyPopUp({container: $("#ad1") });
			
			$("#post_search_btn2").postcodifyPopUp({container: $("#ad2") }); 			
			
			
			
			function validate(){
				if($("#sIdDuplicateCheck").val() == 0){	
				
					alert("사용가능한 아이디를 입력해주세요!");
					$("#sellerId").focus();
					
					return false;	
				}else{	
					return true;
				}
			}
			
			$(function(){
				$(".guide").hide();
				
				$("#sellerId").on("keyup", function(){	
					
					var sellerId = $(this).val();
					
					if(sellerId.length < 5){
						
						$(".guide").hide();
						$("#sIdDuplicateCheck").val(0);
						
						return;
					}
				
					//console.log(userId);
					$.ajax({
						url:"sIdCheck.do",
						data:{sId:sellerId},
						type:"post",
						success:function(data){	// 매개변수 변수명 아무거나 지어도 됨 => 응답데이터가 매개변수에 담김
							
							if(data == "ok"){	// 사용 가능
								$(".error").hide();
								$(".ok").show();
								$("#sIdDuplicateCheck").val(1);
							}else{	// 사용 불가능
								$(".ok").hide();
								$(".error").show();
								$("#sIdDuplicateCheck").val(0);
							}
						},
						error:function(){
							console.log("서버와의 통신 실패");
						}
					});
					
				});
			});
			
			
			
			
	</script>

<br><br><br><br><br><br>

<c:import url="../common/footer.jsp"/>
	
</body>
</html>