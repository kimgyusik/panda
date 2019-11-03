<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/pandaicon.ico">
<title>PANDA:회원탈퇴</title>
<style>
	.outer{
		width:1000px;
		height:800px;
		margin-left: 18%;
		margin-top:30px;
	}
	
	#hh{
		border:1px solid lightgray;
	}
	
	#pp{
		padding: 20px;
	}
	label{
		cursor: pointer;
	}
	
</style>
</head>
<body  data-spy="scroll" data-target="#navbar-example">

	<c:import url="../common/sellerMenubar.jsp"/>

	<div class="outer">
		<h3>회원탈퇴</h3>
		
		<hr>
		<div id="hh">
			<p id="pp">
				1. 회원탈퇴 전, 유의사항을 확인해 주시기 바랍니다.<br>
				- 회원탈퇴 시 회원전용 웹 서비스 이용이 불가합니다.<br>
				- 거래정보가 있는 경우, 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 계약 또는 청약철회에 관한 기록, 대금결제 및 재화 등의 공급에 관한 기록은 5년동안 보존됩니다.<br>
				- 유효기간이 경과되지 않은 미사용 쿠폰관련 정보는 유효기간 만료일까지 보관되며, 탈퇴 후에도 유효기간 내 사용하실 수 있습니다.<br>
				- 유효기간 내 사용하지 못한 미사용 쿠폰은 구매금액의 70%를 내가판다캐시로 적립해 드리나, 탈퇴시 적립 받을 수 없습니다.<br>
				- 회원탈퇴 후 내가판다 서비스에 입력하신 상품문의 및 후기, 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없어 편집 및 삭제처리가 원천적으로 불가능 합니다.<br>
				- 상품문의 및 후기, 댓글 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제하신 후 탈퇴를 신청하시기 바랍니다.<br>
				- 이미 결제가 완료된 건은 탈퇴로 취소되지 않습니다.
			</p>
		</div>
		<br>
		<input type="checkbox" id="check" required><label for="check"> 상기 내가판다 회원탈퇴 시 처리사항 안내를 확인하였음에 동의합니다.</label>
		<br><br><br>
		
		<form action="confirm.do" method="post">
			<div id="id">
				<p>보안을 위해 회원님의 이름과 계정과 비밀번호를 확인 합니다.</p>
				<label>이름 : </label><input type="text" name="sName" value="${ loginSeller.sName }" style="border:none;" readonly>
				<label>아이디 : </label><input type="text" name="sId" value="${ loginSeller.sId }" style="border:none;" readonly>
				<label>비밀번호 : </label><input type="password" name="sPwd">
				<button type="submit" style="margin-left:10px;">본인확인</button>
			</div>
		</form>
		
		
	</div>

	
	<c:import url="../common/footer.jsp"/>

</body>
</html>