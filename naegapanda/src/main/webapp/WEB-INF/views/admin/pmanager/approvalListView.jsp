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
    .test{
    	color:red;	
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
			<h4 style="font-weight:bold;">판매 허가 관리</h4><br>
				<thead align="center">
					<tr>
						<th>No.</th>
						<th width="100">Cat.</th>
						<th width="100">Cat2.</th>
						<th width="300">상품명</th>
						<th width="100">판매자</th>
						<th>상태</th>
					</tr>
				</thead>
					<tbody>
								
						<c:forEach items="${ aplist }" var="ap">
									
										<tr>
											<td align="center">${ ap.pId }</td>
											<td style="font-size:11px;" align="center">[${ ap.cName2 }]</td>
											<td style="font-size:11px;" align="center">[${ ap.cName }]</td>
											<td align="center">
													<c:url value="pDetailView.do" var="pDetailView">
														<c:param name="pId" value="${ ap.pId }"/>
													</c:url>
													<a href="${ pDetailView }">${ ap.pName }</a>
												
											</td>
											<td align="center">
												${ ap.sName }
											</td>
											<td align="center">
												<input type="hidden" name="pId" value="${ ap.pId }">
												<a href="javascript:void(0);" id="approval">${ ap.pOk }</a>
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
											<c:url value="aplist.do" var="before">
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
												<c:url value="aplist.do" var="page">
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
											<c:url value="aplist.do" var="next">
												<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
											</c:url>
											<a class="atag" href="${ next }" > [다음]</a>
										</c:if>
								</div>
										
			</div>
		
		
			
			
		
	
<c:import url="../../common/adminFooter.jsp"/> 
<c:import url="../../common/footer.jsp"/>

<script>

	$("#approval").click(function(){
		var pId = $(this).prev().val();
		console.log(pId);
			swal({
				  title: "판매 허가 하시겠습니까?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
					location.href="approval.do?pId=" + pId;
				    swal("승인 완료!", {
				      icon: "success",
				    });
				  } else {
				    swal("취소되었습니다.");
				  }
				});
		
	});
</script>

</body>

</html>