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
	
	.btnstop{
		background:red;
		color:white;
		border:red;
		width:80px;
		height:38px;
		border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
        border-top-right-radius: 5px;
        border-bottom-right-radius:5px;
	}
</style>
</head>

<body>

	<div class="super_container">
	
		<c:import url="../../common/menubar.jsp"/> 
	
		<c:import url="../../common/admin.jsp"/> 
		
	</div>
	
	
	<div class="bs-example">
		<form>
		<input type="hidden" name="pId" value="${pId}">
		<table class="table table-hover" align="center" cellspacing="0" >
			<h3 style="font-weight:bold;">'${ pmVlist.get(0).pName }' 제품 신고리스트</h3><br>
			
				<thead align="center">
					<tr>
						<th width="100">신고번호</th>
						<th width="100">신고회원</th>
						<th width="300">신고제목</th>
						<th width="100">신고일자</th>
					</tr>	
				</thead>
					<tbody>
								
						<c:forEach items="${ pmVlist }" var="pmv">
										
										<tr>
											<td align="center">${ pmv.vNo }</td>
											<td align="center">${ pmv.mName }</td>
											<td align="center">
												<c:url value="pmvdetailView.do" var="pmvdetailView">
													<c:param name="vNo" value="${ pmv.vNo }" />
												</c:url>
													<a href="${ pmvdetailView }">${ pmv.vTitle }</a>	
											</td>
											<td align="center">
												${ pmv.vDate }
											</td>
											
										</tr>
							
									
									</c:forEach>
					</tbody>					
				</table>
				<div class="col-lg-12" align="center">
										<!-- [이전] -->	
										<c:if test="${ pi.currentPage eq 1 }">
											[이전] 
										</c:if>
										<c:if test="${ pi.currentPage ne 1 }">
											<c:url value="pmViolateList.do" var="before">
												<c:param name="currentPage" value="${ pi.currentPage -1 }"/>
												<c:param name="pId" value="${ pId }" />
											</c:url>
											<a class="atag" href="${ before }">[이전] </a> 
										</c:if>		
										
										<!-- 번호  -->
										<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
											<c:if test="${ p eq pi.currentPage }">
												<font  size="4">[${ p }]</font>
											</c:if>
											<c:if test="${ p ne pi.currentPage }">
												<c:url value="pmViolateList.do" var="page">
													<c:param name="currentPage" value="${ p }"/>
													<c:param name="pId" value="${ pId }" />
												</c:url>
												<a href="${ page }">${ p }</a>
											</c:if>
										</c:forEach>
										
										<!-- [다음] -->
										<c:if test="${ pi.currentPage eq pi.maxPage }">
											 [다음]
										</c:if>
										<c:if test="${ pi.currentPage ne pi.maxPage }">
											<c:url value="pmViolateList.do" var="next">
												<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
												<c:param name="pId" value="${ pId }" />
											</c:url>
											<a class="atag" href="${ next }" > [다음]</a>
										</c:if>
								</div>
							
								<div class="col-lg-12" align="right">
									<c:choose>
										<c:when test="${ pmVlist.get(0).pStatus eq 'Y' }">
											상품이 판매중입니다.<br>
											<button onclick="location.href='pmstop.do?pId=${pId}&sNo=${pmVlist.get(0).sNo}&vNo=${pmVlist.get(0).vNo}';" class="btnstop">판매정지</button>
										</c:when>
										<c:when test="${ pmVlist.get(0).pStatus eq 'N' }">
											상품이 판매정지 상태입니다.<br>
											<button onclick="location.href='pmrestart.do?pId=${pId}&sNo=${pmVlist.get(0).sNo}&vNo=${pmVlist.get(0).vNo}';" class="btn">판매재개</button>
										</c:when>
									</c:choose>
									<button type="button" class="btn" onclick="location.href='categoryView.do';" class="btn">목록으로</button>
									
								</div>
						</form>		
			</div>
			
		
		

		
		
		
	
<c:import url="../../common/adminFooter.jsp"/> 
<c:import url="../../common/footer.jsp"/>

</body>

</html>