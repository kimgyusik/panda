<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" href="resources/pandaicon.ico">
<title>PANDA:고객센터</title>
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
			<h3 style="font-weight:bold;">PANDA 판매자문의</h3><br>
				<thead align="center">
					<tr>
						<th>No.</th>
						<th width="100"></th>
						<th width="300">제목</th>
						<th width="100">작성자</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
					<tbody>
								
						<c:forEach items="${ sqlist }" var="q">
									
										<tr>
											<td align="center">${ q.sqId }</td>
											<td style="font-size:11px;" align="center">[${ q.sqCategory }]</td>
											<td align="center">
												<c:if test="${ loginSeller.sName ne q.sName && loginUser.name ne '관리자'}">
														${ q.sqTitle }
												</c:if>
												<c:if test="${ loginSeller.sName eq q.sName || loginUser.name eq '관리자' }">
														<c:url value="sqdetail.do" var="sqdetail">
															<c:param name="sqId" value="${ q.sqId }"/>
														</c:url>
														<a href="${ sqdetail }">${ q.sqTitle }</a>
												</c:if>
											</td>
											<td align="center">
												${ q.sName }
											</td>
											<td align="center">${ q.sqModifyDate }</td>
											<td align="center">${ q.sqCount }</td>
											
										</tr>
									
										<c:forEach items="${ salist }" var="a">
											<c:if test="${ q.sqId eq a.qId }">
											<tr align="center" style="color:red;">
												<td></td>
												<td></td>
												<td>&nbsp;&nbsp;&nbsp;&nbsp;re: ${ a.saTitle }</td>
												<td>${ a.saWriter }</td>
												<td></td>
												<td></td>
											<tr>	
											</c:if>
										</c:forEach>
										
									</c:forEach>
									
					</tbody>					
				</table>
			</div>
		</div>

		<div align="center">
					
										<!-- [이전] -->	
										<c:if test="${ pi.currentPage eq 1 }">
											[이전] 
										</c:if>
										<c:if test="${ pi.currentPage ne 1 }">
											<c:url value="sqlist.do" var="before">
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
												<c:url value="sqlist.do" var="page">
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
											<c:url value="sqlist.do" var="next">
												<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
											</c:url>
											<a class="atag" href="${ next }" > [다음]</a>
										</c:if>
									</div>
		
		<div class="col-lg-11" align="right">
			<c:if test="${ !empty sessionScope.loginSeller}">
				<c:if test="${ sessionScope.loginUser.name ne '관리자' }">
				<button onclick="location.href='sqinsertView.do';" class="btn">글쓰기</button>
				</c:if>
			</c:if>
		</div>
	


<c:import url="../../common/adminFooter.jsp"/> 
<c:import url="../../common/footer.jsp"/>


</body>

</html>