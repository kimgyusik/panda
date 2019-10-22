<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
								<li><a href="pInsert.do">상품등록</a></li>
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
							<c:if test="${ empty list }" >
							<tr><td>등록된 상품이 없습니다.</td ></tr>
							</c:if>
							
							<c:if test="${ !empty list }">
							<tr>
								<th>상품번호</th>
								<th>상품명</th>
								<th>옵션명</th>
								<th>가격</th>
								<th>재고</th>
								<th>판매개수</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
							<c:forEach begin="1" end="${ list.size -1 }" items="${list }" var="p">
								<td>${ p.pId }</td>
								<td>${ p.pName }</td>
								<td>${ p.poName }</td>
								<td>${ p.price }</td>
								<td>${ p.amount }</td>
								<td>${ p.purchase }</td>
								<td><button>수정</button></td>
								<td><button>삭제</button></td>
							</c:forEach>
							</c:if>
						</table>
						
						<div>
							<button onclick="location.href='pInsert.do'">상품추가</button>
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