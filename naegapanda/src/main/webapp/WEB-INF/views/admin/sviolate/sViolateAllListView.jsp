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
	.searchButton{
		color : blue;
		background : white;
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

   
   	<h3 style="font-weight:bold;">신고 회원 관리</h3><br>
				<br>

<table class="table table-hover">
					  	<thead>
						    <tr>
							      <td scope="col" width="90" align="center"><b>회원번호</b></td>
							      <td scope="col" width="100" align="center"><b>판매자</b></td>
							      <td scope="col" width="250" align="center"><b>스토어명</b></td>							 
							      <th scope="col" width="80">신고횟수</th>
							      <th scope="col" width="80">회원상태</th>
						    </tr>
						</thead>
						
						<tbody>
							
									<c:forEach items="${ list }" var="sv"> 
											<c:url value="sViolatePersonalList.do" var="sviolatelist">
					 						    <c:param name="sNo" value="${ sv.sNo }"/>
					 						    <c:param name="sName" value="${ sv.sName }"/>
					 						    <c:param name="sStatus" value="${ sv.sStatus }"/>
											</c:url>
									<tr>
										<td align="center">
											<a href="${ sviolatelist }">${sv.sNo}</a>
										</td>
										<td align="center">
											<a href="${ sviolatelist }">${sv.sName}</a>
										</td>
										<td align="center">
											<a href="${ sviolatelist }">${sv.storeName}</a>
										</td>
										<td align="center">
											<a href="${ sviolatelist }">${sv.sViolate}</a>
										</td>
										<td align="center">
											<c:if test="${ sv.sStatus eq 'Y' }">
												<a href="${ sviolatelist }">${sv.sStatus}</a>
											</c:if>
											<c:if test="${ sv.sStatus eq 'N' }">
											<form action="sellerPermission.do">
											<input type = "hidden" name = "sNo" value = "${ sv.sNo }" >
											<h6 style="font-weight:bold;" id="permissionSeller" class="pointer">${sv.sStatus}</h6>
											<script>
											   	$("#permissionSeller").click(function(){
											   		var sNo = $(this).prev().val();
														swal({
														  title: "중지 해체 시키시겠습니까?",
														  icon: "warning",
														  buttons: true,
														  dangerMode: true,
														})
														.then((willDelete) => {
														  if (willDelete) {
															location.href="sellerPermission.do?sNo=" + sNo;
														    swal("중지 해체 되었습니다!", {
														      icon: "success",
														    });
														  } else {
														    swal("취소되었습니다.");
														  }
														});
											   	});
										   	</script>
									   	</form>
											
										</c:if>
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
								
									<c:if test="${ !empty sc }">
										<c:url value="sviolateSearch.do" var="before">
											<c:param name="currentPage" value="${ pi.currentPage-1 }"/>
											<c:param name="condition" value="${ condition }"/>
											<c:param name="search" value="${ search }"/>
										</c:url>
										<a href="${ before }">[◀ ]</a>
									</c:if>
										
									<c:if test="${ empty sc }">
										<c:url value="sViolateAllList.do" var="before">
											<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
										</c:url>
										<a href="${ before }">[◀ ]</a>
									</c:if>					
								</c:if>
								<!-- 번호들 -->
								<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
									<c:if test="${ p eq pi.currentPage }">
										<font color="blue" size="4">[${ p }]</font>
									</c:if>
									<c:if test="${ p ne pi.currentPage }">
									
										<c:if test="${ !empty sc }">
											<c:url value="sviolateSearch.do" var="page">
												<c:param name="currentPage" value="${ p }"/>
												<c:param name="condition" value="${ condition }"/>
												<c:param name="search" value="${ search }"/>
											</c:url>
											<a href="${ page }">${ p }</a>
										</c:if>
									
									
									
										<c:if test="${ empty sc }">
											<c:url value="sViolateAllList.do" var="page">
												<c:param name="currentPage" value="${ p }"/>
											</c:url>
											<a href="${ page }">${ p }</a>
										</c:if>
									</c:if>
								</c:forEach>
								<!-- [다음] -->
								<c:if test="${ pi.currentPage eq pi.maxPage }">
									[▷]
								</c:if>
								<c:if test="${ pi.currentPage ne pi.maxPage }">
								
									<c:if test="${ !empty sc }">
										<c:url value="sviolateSearch.do" var="next">
											<c:param name="currentPage" value="${ pi.currentPage+1 }"/>
											<c:param name="condition" value="${ condition }"/>
											<c:param name="search" value="${ search }"/>
										</c:url>
										<a href="${ next }">[▶ ]</a>
									</c:if>
								
									<c:if test="${ empty sc }">
										<c:url value="sViolateAllList.do" var="next">
											<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
										</c:url>
										<a href="${ next }">[▶ ]</a>
									</c:if>	
									
								</c:if>	
						
							</td>
						</tr>
					
					</table>
				</div> 
				
				<c:if test="${ !empty sc.sName }">
				<c:set var="sNameSelected" value="selected"/>
			</c:if>
			<c:if test="${ !empty sc.storeName }">
				<c:set var="storeNameSelected" value="selected"/>
			</c:if>
			<c:if test="${ !empty sc.sStatus }">
				<c:set var="sStatusSelected" value="selected"/>
			</c:if>
			
			<div id="searchArea" align="center">
				<form action="sviolateSearch.do" method="get">
					<select id="searchCondition" name="condition">
						<option>-----</option>
						<option value="sName" ${sNameSelected}>판매자</option>
						<option value="storeName" ${storeNameSelected}>스토어명</option>
						<option value="sStatus" ${sStatusSelected}>회원상태</option>
					</select>
					
					<input type="search" name="keyword" value="${ keyword }">
					<button type="submit" class="searchButton" onclick="return validate();">검색하기</button>
				</form>
			</div>
			<script>
				function validate(){
					//console.log($("option:selected").val());
					
					if($("option:selected").val() == "-----"){
						alert("검색조건을 체크해주세요");
						return false;
					}
				}
			</script>
			
			<br><br>
   </div>


	<c:import url="../../common/adminFooter.jsp"/> 
	<c:import url="../../common/footer.jsp"/>

</body>
</html>