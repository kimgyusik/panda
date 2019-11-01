<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="OneTech shop project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="resources/style/bootstrap4/bootstrap.min.css">
<link href="resources/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="resources/style/product_styles.css">
<link rel="stylesheet" type="text/css" href="resources/style/product_responsive.css">
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<div class="super_container"> 
	<!-- Single Product -->
		
		<div class="single_product" style="padding-top:0px;">
			
			<div class="container">
				<div class="row">
					<!-- Images -->
					<div class="col-lg-2 order-lg-1 order-2">
						<ul class="image_list">
							<c:forEach items="${paList }" var="pa">
							<li data-image="resources/product_uploadFiles/${ pa.paChangeName }"><img src="resources/product_uploadFiles/${ pa.paChangeName }" alt=""></li>
							</c:forEach>
						</ul>
					</div>
	
					<!-- Selected Image -->
					<div class="col-lg-5 order-lg-2 order-1">
						<div class="image_selected"><img src="resources/product_uploadFiles/${ paList[0].paChangeName }" alt=""></div>
					</div>
	
					<!-- Description -->
					<div class="col-lg-5 order-3">
						<div class="product_description">
							<div class="product_category">${p.cId }</div>
							<div class="product_name">${ p.pName }
									<c:if test="${ !empty loginUser }">  
								<form action="violateinsert.do">
									<input type="hidden" name="pId" value="${ p.pId }">
									<button type="submit" class="button cart_button">신고하기</button>
								</form>
									</c:if>	
							</div>
							<div class="rating_r rating_r_4 product_rating"></div>
							<div class="order_info d-flex flex-row">
								<form action="#">
									<div class="clearfix" style="z-index: 1000;">	
										<!-- Product Quantity -->
										<!-- <div class="product_quantity clearfix">
											<span>Quantity: </span>
											<input id="quantity_input" type="text" pattern="[0-9]*" value="1">
											<div class="quantity_buttons">
												<div id="quantity_inc_button" class="quantity_inc quantity_control"><i class="fas fa-chevron-up"></i></div>
												<div id="quantity_dec_button" class="quantity_dec quantity_control"><i class="fas fa-chevron-down"></i></div>
											</div> 
										</div> -->
	
										<!-- Product option -->
										<div>
											<table style="text-align:center;border:solid 2px blue">
												<tr>
													<th style="margin:10px;">옵션번호</th>
													<th style="margin:10px;">옵션명</th>
													<th style="margin:10px;">옵션가격</th>
													<th style="margin:10px;">남은갯수</th>
													<th style="margin:10px;">선택</th>
												</tr>
											<c:forEach items="${poList }" var="po">
												<tr>
													<td style="margin:10px;">${po.oNo }</td>
													<td style="margin:10px;">${po.oName }</td>
													<td style="margin:10px;">${po.oPrice }</td>
													<td style="margin:10px;">${po.oAmount }</td>
													<td style="margin:10px;"><button type="button" onclick="addOp()">선택</button></td>
												</tr>
											</c:forEach>
											</table>
										</div>
									</div>
									
									<div id="chooseProduct">
										<table id="chooseOp">
										
										</table>
									</div>
									<script>
									 	function addOp(){
									 		console.log(this.val());
									 		var $tb = $("#chooseOp");
									 		var max = $(this).parent().parent().children().eq(3).val();
									 		var $tr = $("<tr>");
									 		var $oNo = $("<td>").text($(this).parent().parent().children().eq(0).val());
									 		var $oName = $("<td>").text($(this).parent().parent().children().eq(1).val());
									 		var $oPrice = $("<td>").text($(this).parent().parent().children().eq(2).val());
									 		var $amount = "<input type='number' min='1' max='"+max+"'>";
									 		var $delete = "<button type='button' onclick='deleteOp();'>삭제</button>";
									 		
									 		$tr.append($tr);
									 		$tr.append($oNo);
									 		$tr.append($oName);
									 		$tr.append($oPrice);
									 		$tr.append($amount);
									 		$tr.append($delete);
									 		$tb.append($tr);
									 	}
									
									</script>
									
	
									<div class="button_container">
										<!-- 占쏙옙,占쏙옙袂占쏙옙占�(占쌉쏙옙) -->
										<button type="button" class="button cart_button" onclick="addCart(${sessionScope.loginUser.mNo});">장바구니로</button>
										<button type="button" class="button cart_button" onclick="addGgim(${sessionScope.loginUser.mNo});">찜하기</button> 
										<!-- 占쏙옙,占쏙옙袂占쏙옙占�(占쌉쏙옙) -->
										<div class="product_fav"><i class="fas fa-heart"></i></div>
									</div>
									
								</form>
							</div>
						</div>
						<br>
								
					</div>
					
				</div>
			</div>
		</div>
		<div >
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="col-lg-5">
							<h3>상세내용</h3>
							<div id="detail_contents">
								${p.pContent }
							</div>
						</div>
						<br>
						<div class="col-lg-5">
							<br>
							<br>
							<br>
							<h3>리뷰 ${ reList.size() }개</h3>
							<div id="review">
							
								<!-- 占쏙옙占쏙옙 占쏙옙占쏙옙트(占쌉쏙옙) -->
								<c:if test="${!empty reList}">
								 	<table>
								 		<c:forEach items="${ reList }" var="re">
									 		<tr class="reviewTop" >
									 			<td width="50px;"></td>
									 			<td width="630px;" style="text-align: left;">
									 				<span class="reviewTitle">${re.rTitle }</span>
									 				<span class="reviewGray">&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${re.rDate}" pattern="yyyy. MM. dd. HH:mm" /></span>
									 			</td>
									 			<td class="reviewWriter">
									 				<span >&nbsp;&nbsp;작성자: ${re.mId }</span>
									 			</td>
									 			<td width="200px;" style="text-align: center;">
									 				<img class="reviewImg" src="resources/images/${re.rImage}" >
									 			</td>
									 			<td width="100px;" >
									 				<img src="resources/images/hart.png" width="20px;"> 
									 				<span style="font-size:13px;">${re.rCommend }</span>
									 			</td>
							 				</tr>
							 				<tr class="reviewDetail">
							 					<td>
							 						<input id="replyId${re.rId}" type="hidden" value="${re.rId}">
							 						<input type="hidden" value="${sessionScope.loginUser.mNo}">
							 					</td>
							 					<td width="630px;">
							 						<div style="padding-top:10px;">
							 							<span class="reviewContents">&nbsp;&nbsp;${re.rContents }</span>
							 						</div>
							 						<div >
							 							<br>댓글  <span class="replyCount">댓글개수(<span id="rCount${re.rId}"></span>)</span> <br>
										 				<span style="color:gray;"><fmt:formatDate value="${i.iaDate}" pattern="yyyy. MM. dd. HH:mm" /></span>
										 				<table id="replyTable${re.rId}" style="margin-left:30px;">
										 					
							 							</table>
							 						</div>
							 					</td>
							 					<td colspan="3" style="text-align: center;">
							 						<img class="reviewImg2" src="resources/images/${re.rImage}" >
							 					</td>
							 				</tr>
								 		</c:forEach>
								 	</table>
							 	</c:if>
							 	<c:if test="${empty reList}">
				 					<div style="text-align: left;">
					 					<br><img src="resources/images/pandaImage.jpg" width="100px;">
					 					<br>
					 				</div>
				 				</c:if>
								<!-- 占쏙옙占쏙옙 占쏙옙占쏙옙트(占쌉쏙옙) --> 
								
							</div>
						</div>
						<br>
						<div class="col-lg-5">
							<br>
							<br>
							<br>
							<h3>문의하기</h3>
							<div id="inquiry">
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
					
	
		<!-- Recently Viewed -->
	
		<div class="viewed">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="viewed_title_container">
							<h3 class="viewed_title">Recently Viewed</h3>
							<div class="viewed_nav_container">
								<div class="viewed_nav viewed_prev"><i class="fas fa-chevron-left"></i></div>
								<div class="viewed_nav viewed_next"><i class="fas fa-chevron-right"></i></div>
							</div>
						</div>
	
						<div class="viewed_slider_container">
							
							<!-- Recently Viewed Slider -->
	
							<div class="owl-carousel owl-theme viewed_slider">
								
								<!-- Recently Viewed Item -->
								<div class="owl-item">
									<div class="viewed_item discount d-flex flex-column align-items-center justify-content-center text-center">
										<div class="viewed_image"><img src="resources/images/view_1.jpg" alt=""></div>
										<div class="viewed_content text-center">
											<div class="viewed_price">$225<span>$300</span></div>
											<div class="viewed_name"><a href="#">Beoplay H7</a></div>
										</div>
										<ul class="item_marks">
											<li class="item_mark item_discount">-25%</li>
											<li class="item_mark item_new">new</li>
										</ul>
									</div>
								</div>
	
								<!-- Recently Viewed Item -->
								<div class="owl-item">
									<div class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
										<div class="viewed_image"><img src="resources/images/view_2.jpg" alt=""></div>
										<div class="viewed_content text-center">
											<div class="viewed_price">$379</div>
											<div class="viewed_name"><a href="#">LUNA Smartphone</a></div>
										</div>
										<ul class="item_marks">
											<li class="item_mark item_discount">-25%</li>
											<li class="item_mark item_new">new</li>
										</ul>
									</div>
								</div>
	
								<!-- Recently Viewed Item -->
								<div class="owl-item">
									<div class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
										<div class="viewed_image"><img src="resources/images/view_3.jpg" alt=""></div>
										<div class="viewed_content text-center">
											<div class="viewed_price">$225</div>
											<div class="viewed_name"><a href="#">Samsung J730F...</a></div>
										</div>
										<ul class="item_marks">
											<li class="item_mark item_discount">-25%</li>
											<li class="item_mark item_new">new</li>
										</ul>
									</div>
								</div>
	
								<!-- Recently Viewed Item -->
								<div class="owl-item">
									<div class="viewed_item is_new d-flex flex-column align-items-center justify-content-center text-center">
										<div class="viewed_image"><img src="resources/images/view_4.jpg" alt=""></div>
										<div class="viewed_content text-center">
											<div class="viewed_price">$379</div>
											<div class="viewed_name"><a href="#">Huawei MediaPad...</a></div>
										</div>
										<ul class="item_marks">
											<li class="item_mark item_discount">-25%</li>
											<li class="item_mark item_new">new</li>
										</ul>
									</div>
								</div>
	
								<!-- Recently Viewed Item -->
								<div class="owl-item">
									<div class="viewed_item discount d-flex flex-column align-items-center justify-content-center text-center">
										<div class="viewed_image"><img src="resources/images/view_5.jpg" alt=""></div>
										<div class="viewed_content text-center">
											<div class="viewed_price">$225<span>$300</span></div>
											<div class="viewed_name"><a href="#">Sony PS4 Slim</a></div>
										</div>
										<ul class="item_marks">
											<li class="item_mark item_discount">-25%</li>
											<li class="item_mark item_new">new</li>
										</ul>
									</div>
								</div>
	
								<!-- Recently Viewed Item -->
								<div class="owl-item">
									<div class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
										<div class="viewed_image"><img src="resources/images/view_6.jpg" alt=""></div>
										<div class="viewed_content text-center">
											<div class="viewed_price">$375</div>
											<div class="viewed_name"><a href="#">Speedlink...</a></div>
										</div>
										<ul class="item_marks">
											<li class="item_mark item_discount">-25%</li>
											<li class="item_mark item_new">new</li>
										</ul>
									</div>
								</div>
							</div>
	
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<!-- Brands -->
	
		<div class="brands">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="brands_slider_container">
							
							<!-- Brands Slider -->
	
							<div class="owl-carousel owl-theme brands_slider">
								
								<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="resources/images/brands_1.jpg" alt=""></div></div>
								<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="resources/images/brands_2.jpg" alt=""></div></div>
								<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="resources/images/brands_3.jpg" alt=""></div></div>
								<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="resources/images/brands_4.jpg" alt=""></div></div>
								<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="resources/images/brands_5.jpg" alt=""></div></div>
								<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="resources/images/brands_6.jpg" alt=""></div></div>
								<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="resources/images/brands_7.jpg" alt=""></div></div>
								<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="resources/images/brands_8.jpg" alt=""></div></div>
	
							</div>
							
							<!-- Brands Slider Navigation -->
							<div class="brands_nav brands_prev"><i class="fas fa-chevron-left"></i></div>
							<div class="brands_nav brands_next"><i class="fas fa-chevron-right"></i></div>
	
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
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
	<script src="resources/js/product_custom.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="resources/plugins/jquery-ui/jquery-ui.min.js"></script>
</body>
</html>