<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<style>
	.form-group{
		margin: 10px;
	}
</style>

</head>
<body>

	<c:import url="../../common/sellerMenubar.jsp"/>
	<div class="shop">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<!-- Shop Sidebar -->
					<div class="shop_sidebar" style="width: 100px; margin: 0;'">
						<div class="sidebar_section">
							<div class="sidebar_title">Categories</div>
							<ul class="sidebar_categories">
								<li><a href="sProduct.do">상품리스트</a></li>
								<li><a href="pInsert.do">상품등록</a></li>
								<li><a href="oderPage.do">주문목록관리</a></li>
								<li><a href="streaming.do">방송관리</a></li>
								<li><a href="sPage.do">정보수정?</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="panel-heading"><label style="text-size:30px;">방송 설정</label></div>
				<br>
				<div class="panel-body" width="500px">
					<form action="pStreaming.do?pId=${p.pId }" method="post" encType="multipart/form-data" >
						<div class="form-group">
							<label for="stTitle">상품명</label> 
							<input type="text" class="form-control" id="stTitle" name="stTitle" placeholder="방송 제목을 입력해주세요." />
						</div>
						<div class="form-group">
							<label for="pName">상품명</label> 
							<input type="text" class="form-control" id="pName" name="pName" value="${p.pName}" readonly="readonly" />
						</div>
						<div class="form-group">
							<label for="Product_Category">카테고리</label> 
							<select
								name="cId" id="cId" class="form-control" >
								 <c:forEach items="${cList }" var="c">
								 	<c:if test="${c.cId eq p.cId}">
									<option value="${c.cId }" selected="selected" >${c.cName2 } : ${c.cName }</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<div>
								<label>메인 사진</label>
								<div class="productPic" id="productPicArea1">
									<c:forEach items="${paList}" var="pa">
										<c:if test="${pa.paFileLevel eq 1}">
									<img id='pImg1' width='98px' height='98px' src="resources/product_uploadFiles/${pa.paChangeName}">
										</c:if>
									</c:forEach>
									
								</div>
							</div>
							<label>다른 상품 사진</label> <br>
							<table>
								<tr>
									<td>
										<div class="productPic" id="productPicArea2">
										<c:forEach items="${paList}" var="pa" >
											<c:if test="${pa.paFileLevel eq 2}">
										<img id='pImg2' width='98px' height='98px' src="resources/product_uploadFiles/${pa.paChangeName}">
											</c:if>
										</c:forEach>
										<c:if test="${fn:length(paList) eq 1}">
										<img id='pImg2' width='98px' height='98px'>
										</c:if>	
										</div>
									</td>
									<td>
										<div class="productPic" id="productPicArea3">
										<c:forEach items="${paList}" var="pa">
											<c:if test="${pa.paFileLevel eq 3}">
										<img id='pImg3' width='98px' height='98px' src="resources/product_uploadFiles/${pa.paChangeName}">
											</c:if>
										</c:forEach>
										<c:if test="${fn:length(paList) eq 1 or fn:length(paList) eq 2}">
										<img id='pImg3' width='98px' height='98px'>
										</c:if>	
										</div>
									</td>
								</tr>
							</table>
						</div>
						<br>
						<div id="optionTable">
						<c:forEach items="${poList }" var="po" varStatus="vs">
						<div style="border:2px solid blue;">
							<div class="form-group">
								<label for="optionName1">옵션명</label>
								<input type="text" class="form-control" id="oName" name="oName" value="${po.oName}" readonly="readonly"/>
							</div>
							<div class="form-group">
								<label for="price1">방송 가격(초기 설정은 기존 가격입니다.)</label> <input type="number"
									class="form-control" id="oPrice" name="oPrice" value="${po.oPrice }" placeholder="상품 가격을 입력하세요." />
									<input type='hidden' name="oNo" id="oNo" value="${po.oNo }">
							</div>
						</div>
						</c:forEach>
						</div>
						
						<div align=right>
							<button type="submit" class="btn btn-default">방송 시작</button>
						</div>
						<div>
							<input type="hidden" value="${loginSeller.sNo }" name="sNo"/>
						</div>
					</form>
					
				</div>

			</div>
		</div>
	</div>


	<c:import url="../../common/footer.jsp"/>
</body>
</html>