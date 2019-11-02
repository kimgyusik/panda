<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
									<div class="cart_container" style="width:115%;">
										<div class="cart_title subTitle">찜한 상품</div>
										
										<c:if test="${!empty list}">
										
											<!-- 카테고리 탭 -->
											<div class="tabmenu" >
												<ul>
													<li id="displayAll" class="tab">
														<input type="radio" checked name="tabmenu" id="tabmenu">
														<label class="categoryMenu" for="tabmenu">전체</label>
												    </li> 	  
													<c:forEach items="${ category }" var="c" varStatus="status">
														<c:if test="${ status.count eq 5}">
															<li id="displayAll" class="tab"></li>
														</c:if>
														<li id="tab${fn:substring(c,0,1)}" class="tab">
															<input type="radio"  name="tabmenu" id="tabmenu${c}">
															<label class="categoryMenu" for="tabmenu${c}">${c}</label>
														</li>
														
													</c:forEach>
													
												</ul>
											</div>
											
											<!-- 찜 상품 리스트 -->
											<div style="margin-top:50px;">
												 
											 	<table >
											 		<c:forEach items="${ list }" var="g">
											 			<input type="hidden" id="${g.pId }">
											 			<tr id="${fn:substring(g.category2,0,1)}" class="contentsList" height="200px;">
												 			<c:url value="pDetailView.do" var="product">
																<c:param name="pId" value="${g.pId }"/>
															</c:url>		
												 			<td class="ggimTd1">
												 				<a href="${ product }"><img class="ggimImg" src="resources/product_uploadFiles/${g.paChangeName }" ></a>
												 			</td>
												 			<td class="ggimTd2" >
												 				<span style="color:gray;"><fmt:formatDate value="${g.addDate}" pattern="yyyy. MM. dd" /></span><br><br>
												 				[&nbsp;&nbsp;${g.category2}&nbsp;&nbsp;>&nbsp;&nbsp;${g.category}&nbsp;&nbsp;] <br>
												 				<span style="display: inline-block;font-size: 15px; height:30px;"><a  href="${ product }"><b>${g.pName}</b></a></span><br>
												 				<p style="color:black;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${g.price}" />원 ~</p>
												 				<span style="color:gray;">${g.storeName }</span>
												 			</td>
												 			<td width="250px;" >
												 				<button  class="addCart" onclick="addCart(${g.pId})" >Add to Cart</button>
												 			</td>
												 			<td style="vertical-align: top; padding:10px;">
												 				<span class="cancle" onclick="cancle(${g.pId});">X</span>
												 			</td>
												 		</tr>
											 		</c:forEach>
											 	</table>
							
											</div>
										</c:if>
										<c:if test="${empty list}">
											<div style="text-align: center;">
							 					<br><br><br><br><br>
							 					<img src="resources/images/pandaImage.jpg" width="100px;">
							 					<br>현재 찜한 상품이 없습니다.
							 				</div>
										</c:if>

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
			
			categoryMenuChange();
		});
		
		// 카테고리탭 액션 처리
		$(".tab").on("change", function() {
			
			var tabId = $(this).attr('id');
			
			var list = $('.contentsList');
			
			if(tabId == "displayAll"){ // 전체 상품 출력
				
				$('.contentsList').css("display","");
			
			}else{ // 선택된 탭에 해당하는 상품만 출력
				
				$.each(list, function(index, item){ 

					if(tabId == "tab"+item.id){
						
						$('#'+ item.id).css("display","");
						
					}else{
						$('#'+ item.id).css("display","none");
					}
				});
			}

		});
		
		//장바구니 추가
		function addCart(pId){
			$.ajax({
				url:"addBasket.ba",
				data:{pId:pId, amount:1},
				dataType:"json",
				success:function(data){
					alert(data);
					getCart()
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}

		// 찜 취소
		function cancle(pId){
			location.href='<%=request.getContextPath()%>/deleteGgim.gg?pId='+pId;
		}

		// 카테고리 갯수에 따른 탭의 높이 조정
		function categoryMenuChange(){
			if($(".categoryMenu").length > 5){
				$(".tabmenu").css("height","130px");
			}else{
				$(".tabmenu").css("height","60px");
			}
		}
		
		// 메인메뉴 찜하기 비동기 처리
		function getGgim(){
			$.ajax({
				url:"currentGgim.gg",
				dataType:"json",
				success:function(data){
						$('.wishlist_count').children().first().text(data);
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}

	</script>


</body>
</html>