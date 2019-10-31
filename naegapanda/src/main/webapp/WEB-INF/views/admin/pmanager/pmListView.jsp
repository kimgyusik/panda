<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
<title>고객센터</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="OneTech shop project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="resources/style/bootstrap4/bootstrap.min.css">
<link href="resources/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="resources/style/shop_styles.css">
<link rel="stylesheet" type="text/css" href="resources/style/shop_responsive.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
			<h4 style="font-weight:bold;">판매품 관리</h4><br>
				<thead align="center">
					<tr>
						<th>No.</th>
						<th width="100">Cat.</th>
						<th width="100">Cat2.</th>
						<th width="300">상품명</th>
						<th width="100">판매자</th>
						<th>신고횟수</th>
						<th>상태</th>
					</tr>
				</thead>
					<tbody>
								
						<c:forEach items="${ pmlist }" var="pm">
									
										<tr>
											<td align="center">${ pm.pId }</td>
											<td style="font-size:11px;" align="center">[${ pm.cName2 }]</td>
											<td style="font-size:11px;" align="center">[${ pm.cName }]</td>
											<td align="center">
													<c:url value="pDetailView.do" var="pDetailView">
														<c:param name="pId" value="${ pm.pId }"/>
													</c:url>
													<a href="${ pDetailView }">${ pm.pName }</a>
												
											</td>
											<td align="center">
												${ pm.sName }
											</td>
											<td align="center">
												<c:url value="pmViolateList.do" var="pmViolateList">
														<c:param name="pId" value="${ pm.pId }" />
														<input type="hidden" name="sName" value="${ pm.sName }">
														
												</c:url>
												<c:if test="${ pm.pViolate == 0 }">
													0
												</c:if>
												<c:if test="${ pm.pViolate > 0 }">
													<a href="${ pmViolateList }">${ pm.pViolate }</a>
												</c:if>	
											</td>
											
											<td>
												<c:if test="${ pm.pStatus eq 'Y' }">
													<h5 style="color:red; font-weight:bold">판매중</h5>
												</c:if>
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
											<c:url value="pmlist.do" var="before">
												<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
											</c:url>
											<a class="atag" href="${ before }">[이전] </a> 
										</c:if>		
										
										<!-- 번호  -->
										<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
											<c:if test="${ p eq pi.currentPage }">
												<font  size="4">[${ p }]</font>
											</c:if>
											<c:if test="${ p ne pi.currentPage }">
												<c:url value="pmlist.do" var="page">
													<c:param name="currentPage" value="${ p }"/>
													<c:param name="cName2" value="${ pmlist.get(0).cName2 }" />
												</c:url>
												<a href="${ page }">${ p }</a>
											</c:if>
										</c:forEach>
										
										<!-- [다음] -->
										<c:if test="${ pi.currentPage eq pi.maxPage }">
											 [다음]
										</c:if>
										<c:if test="${ pi.currentPage ne pi.maxPage }">
											<c:url value="pmlist.do" var="next">
												<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
											</c:url>
											<a class="atag" href="${ next }" > [다음]</a>
										</c:if>
								</div>
										
			</div>
		
		<div class="col-lg-3"></div>
		<div class="bs-example">
		<table class="table table-hover" align="center" cellspacing="0" >
			<h4 style="font-weight:bold;">판매정지</h4><br>
				<thead align="center">
					<tr>
						<th>No.</th>
						<th width="100">Cat.</th>
						<th width="100">Cat2.</th>
						<th width="300">상품명</th>
						<th width="100">판매자</th>
						<th>신고횟수</th>
						<th>상태</th>
					</tr>
				</thead>
					<tbody>
								
						<c:forEach items="${ pmxlist }" var="pmx">
									
										<tr>
											<td align="center">${ pmx.pId }</td>
											<td style="font-size:11px;" align="center">[${ pmx.cName2 }]</td>
											<td style="font-size:11px;" align="center">[${ pmx.cName }]</td>
											<td align="center">
													<c:url value="pDetailView.do" var="pDetailView">
														<c:param name="pId" value="${ pmx.pId }"/>
													</c:url>
													<a href="${ pDetailView }">${ pmx.pName }</a>
												
											</td>
											<td align="center">
												${ pmx.sName }
											</td>
											<td align="center">
												<c:url value="pmViolateList.do" var="pmViolateList">
														<c:param name="pId" value="${ pmx.pId }"/>
												</c:url>
												<a href="${ pmViolateList }">${ pmx.pViolate }</a>
											</td>
											
											<td>
												<c:if test="${ pmx.pStatus eq 'N' }">
													<h5 style="color:blue; font-weight:bold">판매정지</h5>
												</c:if>
											</td>
										</tr>
							
									</c:forEach>
									
					</tbody>					
				</table>
				<div class="col-lg-12" align="center">
					
										<!-- [이전] -->	
										<c:if test="${ pi2.currentPage eq 1 }">
											[이전] 
										</c:if>
										<c:if test="${ pi2.currentPage ne 1 }">
											<c:url value="pmlist.do" var="before">
												<c:param name="currentPage2" value="${ pi2.currentPage -1 }"/>
											</c:url>
											<a class="atag" href="${ before }">[이전] </a> 
										</c:if>		
										
										<!-- 번호  -->
										<c:forEach begin="${ pi2.startPage }" end="${ pi2.endPage }" var="p">
											<c:if test="${ p eq pi2.currentPage }">
												<font  size="4">[${ p }]</font>
											</c:if>
											<c:if test="${ p ne pi2.currentPage }">
												<c:url value="pmlist.do" var="page">
													<c:param name="currentPage2" value="${ p }"/>
													<c:param name="cName2" value="${ pmlist.get(0).cName2 }" />
												</c:url>
												<a href="${ page }">${ p }</a>
											</c:if>
										</c:forEach>
										
										<!-- [다음] -->
										<c:if test="${ pi2.currentPage eq pi2.maxPage }">
											 [다음]
										</c:if>
										<c:if test="${ pi2.currentPage ne pi2.maxPage }">
											<c:url value="pmlist.do" var="next">
												<c:param name="currentPage2" value="${ pi2.currentPage + 1 }"/>
											</c:url>
											<a class="atag" href="${ next }" > [다음]</a>
										</c:if>
								</div>
		
			</div>
			
			
		
	
<c:import url="../../common/adminFooter.jsp"/> 
<c:import url="../../common/footer.jsp"/>

<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/style/bootstrap4/popper.js"></script>
<script src="resources/style/bootstrap4/bootstrap.min.js"></script>
<script src="resources/plugins/greensock/TweenMax.min.js"></script>
<script src="resources/plugins/greensock/TimelineMax.min.js"></script>
<script src="resources/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="resources/plugins/greensock/animation.gsap.min.js"></script>
<script src="resources/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="resources/plugins/easing/easing.js"></script>
<script src="resources/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="resources/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="resources/js/shop_custom.js"></script>


</body>

</html>