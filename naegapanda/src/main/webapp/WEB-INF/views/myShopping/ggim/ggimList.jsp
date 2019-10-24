<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="resources/style/bootstrap4/bootstrap.min.css">
<link href="resources/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="resources/style/cart_styles.css">
<link rel="stylesheet" type="text/css" href="resources/style/cart_responsive.css">
<link rel="stylesheet" type="text/css" href="resources/style/myShoppingCustom.css">
<style>
</style>
</head>
<body>

	<c:import url="../../common/menubar.jsp"/>
	
	<!-- contents -->

	<div class="shop">
		<div class="container">
			<div class="row">
			
				<!-- 사이드 메뉴바 -->
				<div class="col-lg-1">
					<c:import url="../sidebar.jsp"/>
				</div>

				<div class="col-lg-10" >
				
					<!-- 찜 -->
					<div class="cart_section">
						<div class="container">
							<div class="row">
								<div class="col-lg-10 offset-lg-1">
									<div class="cart_container" style="width:120%;">
										<div class="cart_title">찜한 상품</div>
										
										<!-- 카테고리 탭 -->
										<div class="tabmenu" >
											<ul>
											
												<li id="displayAll" class="tab">
													<input type="radio" checked name="tabmenu" id="tabmenu">
													<label for="tabmenu">전체</label>
											    </li>
												    	  
												<c:forEach items="${ category }" var="c">
													<li id="tab${c}" class="tab">
														<input type="radio"  name="tabmenu" id="tabmenu${c}">
														<label class="categoryMenu" for="tabmenu${c}">${c}</label>
													</li>
												</c:forEach>
										
											</ul>
										</div>
										
										<!-- 찜 상품 리스트 -->
										<div style="margin-top:50px;">
											 
										 	<table>
										 		<c:forEach items="${ list }" var="g">
											 		<tr id="${g.category2 }" class="prodList" height="200px;">
											 			<c:url value="상품조회url" var="product">
															<c:param name="pId" value="${g.pId }"/>
														</c:url>		
											 			<td width="400px;">
											 				<a href="${ product }"><img src="resources/images/${g.paChangeName }" style="max-height:180px; width:auto; max-width:330px;" ></a>
											 			</td>
											 			<td width="600px;" style="text-align: left;">
											 				<span style="color:gray;"><fmt:formatDate value="${g.addDate}" pattern="yyyy. MM. dd" /></span><br><br>
											 				[ ${g.category2} > ${g.category} ] <br>
											 				<span style="display: inline-block;font-size: 15px; height:30px;"><a  href="${ product }">${g.pName}</a></span><br>
											 				<p style="color:black;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${g.price}" />원</p>
											 				<span style="color:gray;">${g.storeName }</span>
											 			</td>
											 			<td style="vertical-align: top; padding:10px;"><span class="cancle" onclick="return cancle(${g.pId});">X</span></td>
											 		</tr>
										 		</c:forEach>
										 	</table>
						
										  	<div id="${g.category2 }" class="prodList" >${g.price}</div>
										    
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- ggim끝 -->
				</div>
			</div>
		</div>
	</div>


	<c:import url="../../common/footer.jsp"/>
	
	
	<script>
	
		$(function(){
			var result = $(".price");
			$(".price").html(result);	
		});
		
		// 카테고리탭 액션 처리
		$(".tab").on("change", function() {
			
			var tabId = $(this).attr('id');
			
			var list = $('.prodList');
			
			if(tabId == "displayAll"){ // 전체 상품 출력
				
				$('.prodList').css("display","");
			
			}else{ // 선택된 탭에 해당하는 상품만 출력
				
				$.each(list, function(index, item){ 
					if(tabId == "tab"+item.id){
						$('#'+item.id).css("display","");
					}else{
						$('#'+item.id).css("display","none");
					}
				});
			}

		});

		// 찜 취소
		function cancle(pId){

			if(confirm("해당 상품을 찜 목록에서 삭제하시겠습니까?")){
				location.href='<%=request.getContextPath()%>/deleteGgim.gg?pId='+pId;
			}
			
			return false;
		}

	</script>


</body>
</html>