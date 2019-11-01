<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PANDA:판매자페이지</title>
<script src="resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>

	<c:import url="../../common/sellerMenubar.jsp"/>
	
		<div class="shop">
			<div class="container">
				<div class="row">
					<div class="col-lg-3">
					<!-- Shop Sidebar -->
					<div class="shop_sidebar" style="width:100px;margin:0;'">
						<div class="sidebar_section">
							<div class="sidebar_title">Categories</div>
							<ul class="sidebar_categories">
								<li><a href="sProduct.do">상품리스트</a></li>
								<li><a href="pInsertView.do">상품등록</a></li>
								<li><a href="oderPage.do">주문목록관리</a></li>
								<li><a href="streaming.do">방송관리</a></li>
								<li><a href="sPage.do">정보수정?</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="shop_content">
					<form action="delStatus.do" >
							<table style="width:1000px">
								<tr style="background-color:#0e8ce4; color:white; height:50px" align=center>
									<th>사진</th>
									<th>이름</th>
									<th>옵션</th>
									<th>주문자</th>
									<th>주문갯수</th>
									<th>가격</th>
									<th>주문날짜</th>
									<th>배송지</th>
									<th>배송상태</th>
								</tr>
								<c:if test="${ empty oList }">
									<tr><td>주문된 상품이 없습니다.</td></tr>
								</c:if>
								
								<c:if test="${!empty oList}">
									<c:forEach items="${ oList }" var="o">
									<tr align=center>
										
										<td><img src="resources/product_uploadFiles/${o.paChangeName}" style="width:100px; height:100px;"></td> 
										<td style="width:200px">${ o.pName }</td>
										<td>${ o.oName }</td>
										<td>${ o.recipient }</td>
										<td>${ o.count }</td>
										<td>${ o.price*o.count }</td>
										<td><fmt:formatDate var="resultRegDt" value="${o.payDate}" pattern="yyyy-MM-dd"/>${resultRegDt}</td>
										<td style="width:200px">${ o.deliverySpot }</td>
										<td><select>
											<option>${ o.deliveryStatus }</option>
											<option>배송중</option>
										</select></td>
										
									</tr>
									</c:forEach>
								</c:if>
								
								<tr align="center" height="20">
								<td colspan="9">
									<!-- 이전 -->
									<c:if test="${pi.currentPage eq 1}">
										[이전]
									</c:if>
									<c:if test="${pi.currentPage ne 1}">
										<c:url value="sProduct.do" var="before">
											<c:param name="currentPage" value="${pi.currentPage -1 }"/>
										</c:url>
										<a href="${before }">이전</a>
									</c:if>
									
									<!-- 페이지 -->
									<c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">
										<c:if test="${pi.currentPage eq p }">
											<font color="red" size="4">[${p }]</font>
										</c:if>
										<c:if test="${pi.currentPage ne p }">
											<font color="black" size="4">
												<c:url value="sProduct.do" var="page">
													<c:param name="currentPage" value="${p }"/>
												</c:url>
												<a href="${page }">${p }</a>
											</font>
										</c:if>
									</c:forEach>
									
									<!-- 다음 -->
									<c:if test="${pi.currentPage eq pi.maxPage}">
										[다음]
									</c:if>
									<c:if test="${pi.currentPage ne pi.maxPage}">
										<c:url value="sProduct.do" var="next">
											<c:param name="currentPage" value="${pi.currentPage +1 }"/>
										</c:url>
										<a href="${next }">다음</a>
									</c:if>
								
								</td>
							</tr>
							</table>
							<button type="submit">배송상태수정</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	
	</script>
	
	<c:import url="../../common/footer.jsp"/>

</body>
</html>