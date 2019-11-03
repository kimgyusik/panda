<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
<title>고객센터</title>
<meta charset="utf-8">

<style type="text/css">
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
   
	.atag { text-decoration:none ; color:black; }
</style>
</head>

<body>

	<div class="super_container">
	
		<c:import url="../../common/menubar.jsp"/> 
	
		<c:import url="../../common/admin.jsp"/> 
		
	</div>
	
	
	<div class="bs-example">
		<table class="table table-hover" align="center" cellspacing="0" >
			<h3 style="font-weight:bold;">PANDA 공지</h3><br>
				<thead align="center">
					<tr>
						<th>No.</th>
						<th width="300">제목</th>
						<th width="180">날짜</th>
						<th>조회수</th>
						<th>첨부파일</th>
					</tr>
				</thead>
					<tbody>
								
						<c:forEach items="${ list }" var="n">
									
										<tr>
											<td align="center">${ n.nId }</td>
											<td align="center">
												<c:if test="${ empty loginUser }">
													${ n.nTitle }
												</c:if>
												<c:if test="${ !empty loginUser }">
													<c:url value="ndetail.do" var="ndetail">
														<c:param name="nId" value="${ n.nId }"/>
													</c:url>
													<a href="${ ndetail }">${ n.nTitle }</a>
												</c:if>
											</td>
											<td align="center">${ n.nCreateDate }</td>
											<td align="center">${ n.nCount }</td>
											<td align="center">
												<c:if test="${ !empty n.nOriginalFileName }">
													<span style="color:#0e8ce4"><i class="far fa-file"></i></span>
												</c:if>
												<c:if test="${ empty n.nOriginalFileName }">
													&nbsp;
												</c:if>
											</td>
										</tr>
									</c:forEach>
									
					</tbody>					
				</table>
				
				<div align="center">
					
										<!-- [이전] -->	
										<c:if test="${ pi.currentPage eq 1 }">
											[이전] 
										</c:if>
										<c:if test="${ pi.currentPage ne 1 }">
											<c:url value="nlist.do" var="before">
												<c:param name="currentPage" value="${ pi.currentPage -1 }"/>
											</c:url>
											<a class="atag" href="${ before }">[이전] </a> 
										</c:if>		
										
										<!-- 번호  -->
										<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
											<c:if test="${ p eq pi.currentPage }">
												<font  size="4">[${ p }]</font>
											</c:if>
											<c:if test="${ p ne pi.currentPage }">
												<c:url value="nlist.do" var="page">
													<c:param name="currentPage" value="${ p }"/>
												</c:url>
												<a href="${ page }">${ p }</a>
											</c:if>
										</c:forEach>
										
										<!-- [다음] -->
										<c:if test="${ pi.currentPage eq pi.maxPage }">
											 [다음]
										</c:if>
										<c:if test="${ pi.currentPage ne pi.maxPage }">
											<c:url value="nlist.do" var="next">
												<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
											</c:url>
											<a class="atag" href="${ next }" > [다음]</a>
										</c:if>
									</div>
					<br>
					<div class="col-lg-12" align="right">
						<c:if test="${ sessionScope.loginUser.name eq '관리자' }">
						<button onclick="location.href='ninsertView.do';" class="btn">글쓰기</button>
						</c:if>
					</div>
			</div>
		

		
		



<c:import url="../../common/adminFooter.jsp"/> 
<c:import url="../../common/footer.jsp"/>

</body>

</html>