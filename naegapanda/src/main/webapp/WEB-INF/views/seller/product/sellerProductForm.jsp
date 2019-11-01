<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PANDA:판매자페이지</title>
</head>
<style>
	#menu{
		margin-left:20px;
		margin-top:20px;
	}
	.logo{
	cursor: pointer;
	}
	.bs-example{
    	margin: 20px;
    }
    .btn{
    	background:#0e8ce4;
    	border:#0e8ce4;
    	border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
        border-top-right-radius: 5px;
        border-bottom-right-radius:5px;
        color:white;

    }
    td{
    	align:center;
    }
</style>
<body>

<c:import url="../../common/sellerMenubar.jsp"/>

<div class="super_container">
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
						<table>
							<tr>
								<th>상품사진</th>
								<th>상품번호</th>
								<th>상품명</th>
								<th>옵션명</th>
								<th>가격</th>
								<th>재고</th>
								<th>판매개수</th>
								<th>방송하기<th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
							<c:if test="${empty list}" >
							<tr><td>등록된 상품이 없습니다.</td ></tr>
							</c:if>
							
							<c:if test="${!empty list}">
								<c:forEach items="${list }" var="p">
								<tr>
									<td><img src="resources/product_uploadFiles/${p.paChangeName}" style="width:100px; height:100px;"></td>    	
									<td>${ p.pId }</td>
									<td>aa</td>
									<td>${ p.oName }</td>
									<td>${ p.oPrice }</td>
									<td>${ p.oAmount }</td>
									<td>${ p.oPurchase }</td>
									<td><button onclick="location.href='pStreamingView.do?pId=${p.pId}'">방송하기</button></td>
									<td><button onclick="location.href='pUpdateView.do?pId=${p.pId}'">수정</button></td>
									<td><button onclick="location.href='pDelete.do?oNo=${p.oNo}&pId=${p.pId }'">삭제</button></td>
								</tr>
								</c:forEach>
							</c:if>
							
							<tr align="center" height="20">
							<td colspan="6">
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
						
						<div>
							<button onclick="location.href='pInsertView.do'">상품추가</button>
						</div>
						
						
					
					</div>
				
				
				</div>
			</div>
			
		</div>
		
		
	</div>
	
</div>









<c:import url="../../common/footer.jsp"/>

</body>
</html>