<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PANDA : 회원가입</title>
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
	
</style>
</head>
<body>

<c:import url="../common/menubar.jsp"/>

<div style="margin-left:290px"><img src="resources/images/joinba.jpg"></div>
		
<div class="outer">
	<hr>
	<h1>1.회원정보</h1>
	<form class="joinForm" >
		<div class="form-row" >
			<div class="form-group col-md-6">
				<input type="text" class="form-control" id="inputName" placeholder="이름" required>
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" id="inputID" placeholder="ID" required>
			</div>
			<div class="form-group col-md-6">
				<input type="password" class="form-control" id="inputPassword1" placeholder="비밀번호" required>
			</div>
			<div class="form-group col-md-6">
				<input type="password" class="form-control" id="inputPassword2" placeholder="비밀번호확인" required>
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" id="inputAddress" placeholder="생년월일(예 19990101)" required>
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" id="inputPhone" placeholder="핸드폰번호(-포함 입력)" required>
			</div>
			<div class="form-group col-md-6">
				<input type="Email" class="form-control" id="inputEmail" placeholder="Email" required>
				<br>
				<label for="email_yn"><input name="email_yn" type="checkbox" id="email_yn" /> 이벤트/쇼핑정보 이메일 수신에 동의합니다.</label>
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" id="inputAddress1" placeholder="주소입력" required>
				<input type="text" class="form-control" id="inputAddress2" placeholder="상세주소입력" required>
			</div>
		 </div>

		 <br><hr>

		 <h1>2.스토어정보</h1>
		 <div class="form-row" >	
			<div class="form-group col-md-6" >
				<input type="text" class="form-control" id="inputsbNum" placeholder="사업자번호" required>
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" id="inputStNum" placeholder="전자통신등록번호" required>
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" id="inputStoreName" placeholder="상점명" required>
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" id="inputCeoName" placeholder="대표이름" required> 
			</div>
			<div class="form-group col-md-6">
				<select class="form-control" id="exampleFormControlSelect1">
			      <option selected>업종</option>
			      <option value="">2</option>
			      <option>3</option>
			      <option>4</option>
			      <option>5</option>
			    </select>
				<select class="form-control" id="exampleFormControlSelect2">
			      <option selected>업태</option>
			      <option>2</option>
			      <option>3</option>
			      <option>4</option>
			      <option>5</option>
			    </select>
				<!-- <input type="text" class="form-control" id="inputState" placeholder="업태" required> 
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" id="inputSector" placeholder="업종" required>-->
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" id="inputSbAddress" placeholder="사업장주소" required>
			</div>
			<div class="form-group col-md-6">
				<input type="text" class="form-control" id="inputSbPhone" placeholder="사업장전화번호" required>
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


<c:import url="../common/footer.jsp"/>
	
</body>
</html>