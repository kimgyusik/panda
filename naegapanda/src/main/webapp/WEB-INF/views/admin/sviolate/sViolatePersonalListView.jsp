<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/pandaicon.ico">
<title>PANDA:신고회원관리</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
a:visited { 
		color: black; 
		text-decoration: none;
	}
	
.pointer{
	cursor:pointer;
}
</style>

</head>
<body>

	<div class="super_container">

      <c:import url="../../common/menubar.jsp"/> 

      <c:import url="../../common/admin.jsp"/> 
      
   </div>


	<div class="bs-example">




		<form action="sellerDelete.do">
		<input type = "hidden" name = "sNo" value = "${ sNo }" >
		
		<c:if test="${ sStatus eq 'Y' }">
   		<h3 style="font-weight:bold;" id="deleteSeller" class="pointer"> ${sName} 님의 신고 회원 관리</h3>
		</c:if>
		<c:if test="${ sStatus eq 'N' }">
   		<h3 style="font-weight:bold;"> ${sName} 님의 신고 회원 관리</h3>
		</c:if>
   	<script>
   	$("#deleteSeller").click(function(){
   		var sNo = $(this).prev().val();
			swal({
			  title: "정말 중지 시키시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				location.href="sellerDelete.do?sNo=" +sNo;
			    swal("판매자 중지 되었습니다!", {
			      icon: "success",
			    });
			  } else {
			    swal("취소되었습니다.");
			  }
			});
   	});
   		
   		
   
   		</script>
		</form>
   		
   		<br> 
   		

				<br>

<table class="table table-hover">
					  	<thead>
						    <tr>
							      <td scope="col" width="90" align="center"><b>신고번호</b></td>
							      <td scope="col" width="200" align="center"><b>제목</b></td>
							      <td scope="col" width="200" align="center"><b>상품명</b></td>
							      <th scope="col" width="80">신고횟수</th>
							      <th scope="col" width="80">메세지</th>
						    </tr>
						</thead>
						
						<tbody>
							
									<c:forEach items="${ list }" var="sv"> 
											<c:url value="svdetailView.do" var="svdetaillist">
					 						    <c:param name="vNo" value="${ sv.vNo }"/>
											</c:url>
									<tr>
										<td align="center">
											<a href="${ svdetaillist }">${sv.vNo}</a>
										</td>
										<td align="center">
											<a href="${ svdetaillist }">${sv.vTitle}</a>
										</td>
										<td align="center">
											<a href="${ svdetaillist }">${sv.pName}</a>
										</td>
										<td align="center">
											<a href="${ svdetaillist }">${sv.pViolate}</a>
										</td>
										<td align="center">
											<a href="${ svdetaillist }">${sv.vStatus}</a>
										</td>
							  			
								    </tr>
								    
	 						    </c:forEach> 
					  </tbody>
					  
				</table>
				
				 <!-- 페이징~~ -->
				<div align="center">
					<table>
						<tr align="center" height="20">
							<td colspan="6">
								
								<!-- [이전] -->
								<c:if test="${ pi.currentPage eq 1 }">
									[◁]
								</c:if>
								<c:if test="${ pi.currentPage ne 1 }">
									<c:url value="sViolatePersonalList.do" var="before">
										<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
										<c:param name="sNo" value="${ sNo }"/>
										<c:param name="sName" value="${ sName }"/>
									</c:url>
									<a href="${ before }">[◀]</a>
								</c:if>					
								<!-- 번호들 -->
								<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
									<c:if test="${ p eq pi.currentPage }">
										<font color="blue" size="4">[${ p }]</font>
									</c:if>
									<c:if test="${ p ne pi.currentPage }">
										<c:url value="sViolatePersonalList.do" var="page">
											<c:param name="currentPage" value="${ p }"/>
											<c:param name="sNo" value="${ sNo }"/>
											<c:param name="sName" value="${ sName }"/>
										</c:url>
										<a href="${ page }">${ p }</a>
									</c:if>
								</c:forEach>
								<!-- [다음] -->
								<c:if test="${ pi.currentPage eq pi.maxPage }">
									[▷]
								</c:if>
								<c:if test="${ pi.currentPage ne pi.maxPage }">
									<c:url value="sViolatePersonalList.do" var="next">
										<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
										<c:param name="sNo" value="${ sNo }"/>
										<c:param name="sName" value="${ sName }"/>
									</c:url>
									<a href="${ next }">[▶]</a>
								</c:if>	
						
							</td>
						</tr>
					
					
					</table>
					<button type="button" class="btn btn-outline-primary" onclick="history.back(-1);">뒤로가기</button>
				</div> 
   </div>


	<c:import url="../../common/adminFooter.jsp"/> 
	<c:import url="../../common/footer.jsp"/>

</body>
</html>