<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<div class="super_container">
	
	<!-- Home -->

	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="resources/images/shop_background.jpg"></div>
		<div class="home_overlay"></div>
		<div class="home_content d-flex flex-column align-items-center justify-content-center">
			<h2 class="home_title">
				<c:if test="${category eq 1000}">ALL PRODUCTS</c:if>
				<c:if test="${category eq 1001}">식품</c:if>
				<c:if test="${category eq 1002}">의류/잡화</c:if>
				<c:if test="${category eq 1003}">가구/인테리어</c:if>
				<c:if test="${category eq 1004}">디지털/가전/컴퓨터</c:if>
				<c:if test="${category eq 1005}">취미/애완동물</c:if>
				<c:if test="${category eq 1006}">생활/건강/뷰티</c:if>
				<c:choose>
		         	<c:when test = "${category<=9}">
		            	식품
		         	</c:when>
		         	<c:when test = "${category<=19}">
		           		의류/잡화
		         	</c:when>
		         	<c:when test = "${category<=28}">
		           		가구/인테리어
		         	</c:when>
		         	<c:when test = "${category<=39}">
		           		디지털/가전/컴퓨터
		         	</c:when>
		         	<c:when test = "${category<=49}">
		           		취미/애완동물
		         	</c:when>
		         	<c:when test = "${category<=58}">
		           		생활/건강/뷰티
		         	</c:when>
		      	</c:choose>
			</h2>
		</div>
	</div>

	<!-- Shop -->

	<div class="shop">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">

					<!-- Shop Sidebar -->
					<div class="shop_sidebar">
						<div class="sidebar_section">
							<div class="sidebar_title">Categories</div>
							<ul class="sidebar_categories">
								<li><a href="pListView.do?category=1000">All Categories</a></li>
								<li><a href="pListView.do?category=1001">식품</a></li>
								<li><a href="pListView.do?category=1002">의류/잡화</a></li>
								<li><a href="pListView.do?category=1003">가구/인테리어</a></li>
								<li><a href="pListView.do?category=1004">디지털/가전/컴퓨터</a></li>
								<li><a href="pListView.do?category=1005">취미/애완동물</a></li>
								<li><a href="pListView.do?category=1006">생활/건강/뷰티</a></li>
							</ul>
						</div>
						
					</div>

				</div>

				<div class="col-lg-9">
					
					<!-- Shop Content -->

					<div class="shop_content">
						<div class="shop_bar clearfix">
							<div class="shop_product_count"><span>${ pi.listCount }</span> products found</div>
							<div class="shop_sorting">
								<span>Sort by:</span>
								<ul>
									<li>
										<span class="sorting_text">highest rated<i class="fas fa-chevron-down"></span></i>
										<ul>
											<li class="shop_sorting_button" data-isotope-option='{ "sortBy": "original-order" }'>highest rated</li>
											<li class="shop_sorting_button" data-isotope-option='{ "sortBy": "name" }'>name</li>
											<li class="shop_sorting_button"data-isotope-option='{ "sortBy": "price" }'>price</li>
										</ul>
									</li>
								</ul>
							</div>
						</div>

						<div class="product_grid">
							<div class="product_grid_border"></div>

							<!-- Product Item -->
							<c:forEach items="${ pList }" var="p" varStatus="status">
							<div class="product_item" style="width:220px; height:230px; padding:10px;">
								<c:if test="${status.count mod 4 != 0 }">
									<div class="product_border"></div>
								</c:if>
								
								<div class="product_image d-flex flex-column align-items-center justify-content-center" style="width:115px;">
									<img src="resources/product_uploadFiles/${p.paChangeName }" style="border-radius: 4px;" width="115" height="115" alt="">
								</div>
								<div class="product_content">
									<input type="hidden" value="${p.pId }" class="pId">
									<div class="product_price">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${ p.pPrice }" /> ~</div>
									<div class="product_name" style="height:42px;"><div>${p.pName }</div></div>
								</div>
								<c:if test="${!empty loginUser }">
									<input class="pId" type="hidden" value="${p.pId}">
									<c:set var="doneLoop" value="false"/> 
									<c:if test="${fn:length(gglist) == 0}">
										<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
									</c:if>
									<c:forEach items="${gglist}" var="g">
										<c:if test="${not doneLoop}"> 
											<c:if test = "${g.pId eq p.pId}">
												<div class="product_fav active favPid"><i class="fas fa-heart "></i></div>
												<c:set var="doneLoop" value="true"/> 
											</c:if>
											<c:if test = "${g.pId ne p.pId}">
												<div class="product_fav favPid"><i class="fas fa-heart "></i></div>
											</c:if>
										</c:if>
									</c:forEach>
								</c:if>
								<ul class="product_marks">
									<li class="product_mark product_discount">-25%</li>
									<li class="product_mark product_new">new</li>
								</ul>
								<!-- <ul class="product_marks">
									<li class="product_mark product_discount">-25%</li>
									<li class="product_mark product_new">new</li>
								</ul> -->
							</div>
							</c:forEach>
							<script>
								$(function(){
									
								});
								
								$(".product_item").click(function(){
									var pId = $(this).children().eq(2).children().eq(0).val();
									location.href="pDetailView.do?pId="+pId;	
								});
							</script>
						</div>
						<br>
						<table align="center" style="margin-left:auto; margin-right:auto;">
							<tr align="center" height="20">
								<td colspan="6">
									<c:if test="${pi.currentPage eq 1}">
										[처음으로]
									</c:if>
									<c:if test="${pi.currentPage ne 1}">
										<c:url value="pListView.do" var="first">
											<c:param name="currentPage" value="1"/>
											<c:param name="category" value="${category }"/>
										</c:url>
										<a href="${first }">[처음으로]</a>&nbsp;
									</c:if>
									<!-- 이전 -->
									<c:if test="${pi.currentPage eq 1}">
										[이전]
									</c:if>
									<c:if test="${pi.currentPage ne 1}">
										<c:url value="pListView.do" var="before">
											<c:param name="currentPage" value="${pi.currentPage -1 }"/>
											<c:param name="category" value="${category }"/>
										</c:url>
										<a href="${before }">[이전]</a>&nbsp;
									</c:if>
									
									<!-- 페이지 -->
									<c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">
										<c:if test="${pi.currentPage eq p }">
											<font color="red" size="4">[${p }]</font>
										</c:if>
											<font color="black" size="4">
												<c:url value="pListView.do" var="page">
													<c:param name="currentPage" value="${p }"/>
													<c:param name="category" value="${category }"/>
												</c:url>
												<a href="${page }">${p }</a>
											</font>
										</c:if>
									</c:forEach>
									
									<!-- 다음 -->
									<c:if test="${pi.currentPage eq pi.maxPage}">
										[다음]
									</c:if>
									<c:if test="${pi.currentPage ne pi.maxPage}">
										<c:url value="pListView.do" var="next">
											<c:param name="currentPage" value="${pi.currentPage +1 }"/>
											<c:param name="category" value="${category }"/>
										</c:url>
										<a href="${next }">[다음]&nbsp;</a>
									</c:if>
									<c:if test="${pi.currentPage eq pi.maxPage}">
										[끝으로]
									</c:if>
									<c:if test="${pi.currentPage ne pi.maxPage}">
									<c:url value="pListView.do" var="last">
										<c:param name="currentPage" value="${pi.maxPage }"/>
										<c:param name="category" value="${category }"/>
									</c:url>
									<a href="${last }">[끝으로]&nbsp;</a>
									</c:if>
								</td>
							</tr>
						</table>

					</div>

				</div>
			</div>
		</div>
	</div>

	<c:import url="../common/footer.jsp"/>


	
</div>

<script>
	$(function(){
		
		// 찜 토글 처리
		$(".favPid").off().on("click", function(e){
			e.stopImmediatePropagation();
			var flag = 0;
			if($(this).hasClass("active") == true) {
				flag = 1; // class 변경 처리가 더 빠르므로, 이 분기가 찜 추가하는 케이스임
			}else{
				flag = 0; // 찜 삭제
			}
			var pId = $(this).parent().find('.pId').val();

			$.ajax({
				url:"changeGgim.gg",
				data:{pId:pId, flag:flag},
				type:"post",
				success:function(data){
					getGgim();
				},
				error:function(){
					console.log("서버와의 통신 실패");
				}
			});
		});
	});
	
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