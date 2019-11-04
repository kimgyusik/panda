<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" href="resources/pandaicon.ico">
<title>PANDA:방송</title>
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
		<c:import url="../chat/streamingTest.jsp"/>
		<div class="single_product" style="padding-top:0px;">
			
			<div class="container">
				<div class="col-lg-2 order-lg-2 order-1">
					<h3>${st.stTitle }</h3>
					
					<div class="col-lg-2 order-lg-2 order-1">
						
					</div>
					<div>
						<c:import url="../chat/chatMain.jsp"/> 
					</div>
				</div>
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
								<form action="paymentPage2.pa" method="post">
									<div class="clearfix" style="z-index: 1000;">	
										
										<!-- Product option -->
										<%-- <div>
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
													<td style="margin:10px;">${po.stPrice }</td>
													<td style="margin:10px;">${po.oAmount }</td>
													<td style="margin:10px;">
														<c:if test="${po.oAmount ne 0 }">
														<button class="opSelect" type="button">선택</button>
														</c:if>
														<c:if test="${po.oAmount eq 0 }">
														매진
														</c:if>
													</td>
												</tr>
											</c:forEach>
											</table>
										</div> --%>
										<div class="prodOptionDiv">
											<table class="prodTable">
												<tr style="height:50px;">
													<th >옵션번호</th>
													<th>옵션명</th>
													<th>옵션가격</th>
													<th>남은갯수</th>
													<th></th>
												</tr>
											<c:forEach items="${poList }" var="po">
												<tr>
													<td class="oNo" width="15%">${po.oNo }</td>
													<td class="oName">${po.oName }</td>
													<td width="20%">
														<input class="price" type="hidden" value="${po.stPrice}">
														<fmt:formatNumber type="number" maxFractionDigits="3" value="${po.stPrice}" /> 원
													</td>
													<td class="oAmount" width="15%">${po.oAmount }</td>
													<td  width="10%">
														<c:if test="${po.oAmount ne 0 }">
														<button class="choiceOption" type="button">선택</button>
														</c:if>
														<c:if test="${po.oAmount eq 0 }">
														매진
														</c:if>
													</td>
												</tr>
											</c:forEach>
											</table>
										</div>
									</div>
									<br><br>
									<div id="chooseProduct">
										
											<table id="chooseOp">
												
											</table>
									</div>
									<script>
										/* var count = 0;
										$(document).ready(function(){
											
										    $(".opSelect").click(function(){
										    	var oNo =  $(this).parent().parent().children().eq(0).text();
										    	var $tb = $("#chooseOp");
										 		var max = $(this).parent().parent().children().eq(3).text();
										 		var $tr = $("<tr>");
										 		var $oNo = $("<td>").text($(this).parent().parent().children().eq(0).text());
										 		var $oName = $("<td>").text($(this).parent().parent().children().eq(1).text());
										 		var $oPrice = $("<td>").text($(this).parent().parent().children().eq(2).text());
										 		var $amount = "<td><input name='amount' type='number' min='1' max='"+max+"' value=1></td>";
										 		var $delete = "<td><button type='button' onclick='deleteOp()'>삭제</button></td>";
										 		
										 		var oName = $(this).parent().parent().children().eq(0).text();
										 		var oPrice = $(this).parent().parent().children().eq(2).text();
										 		var $oN = "<input name='oNo' type='hidden' value='"+oName+"'>";
										 		var $oP = "<input name='price' type='hidden' value='"+oPrice+"'>";
												if(count == 0){
										    		var $tr1 = $("<tr>");
										    		$tr1.append('<th style="margin:10px;">옵션번호</th> <th style="margin:10px;">옵션명</th> <th style="margin:10px;">옵션가격</th> <th style="margin:10px;">갯수</th> <th style="margin:10px;">삭제</th>');
										    		$tb.append('선택한 상품');
										    		$tb.append($tr1);
										    	}
										 		$tr.append($tr);
										 		$tr.append($oNo);
										 		$tr.append($oName);
										 		$tr.append($oPrice);
										 		$tr.append($amount);
										 		$tr.append($delete);
										 		$tr.append($oN);
										 		$tr.append($oP);
										 		$tb.append($tr);
										 		
										 		count = count +1;
										    });
										    
										    
										});
										function deleteOp(){
									    	if(count >0){
											$(this).parents().remove();
											console.log($(this).parent());
											count = count -1;
									    	} else{
									    		$(this).parent().parent().parent().remove();
									    		count = 0;
									    	}
									    } */
										$(function(){
											
											// 옵션 추가 처리
											$('.choiceOption').click(function(){
												
												var $tb = $("#chooseOp");
												var option = $(this).parent().parent();
												
												var oNo = option.find('.oNo').text();
												
												if($("#"+oNo).length<=0){
														
											 		var $tr = $("<tr id='"+oNo+"' height='50px'>");
											 		var $oName = $("<td width='40%'>").text(option.find('.oName').text());
											 		var $oPrice = $("<td width='25%'>" +
											 							"<input class='oNo2' name='oNo' type='hidden' value='"+oNo+"'>" +
											 							"<input type='hidden' name='price' value='"+option.find('.price').val()+"'>" +
											 							"<span>" + addComma(option.find('.price').val())+"</span> 원</td>");
											 		var max = option.find('.oAmount').text();
											 		var $amount = $("<td width='20%'><input class='onlyNum' name='amount' type='number' value='1' min='1' max='"+max+"'></td>");
											 		var $delete = $("<td width='15%'><div  class='optionCancle' onclick='deleteOp(this);'>x</div></td>");
											 		
											 		$tr.append($oName);
											 		$tr.append($oPrice);
											 		$tr.append($amount);
											 		$tr.append($delete);
											 		$tb.append($tr);
										 		
												}else{
													alert('이미 선택한 옵션입니다.');
													return false;
												}
											});
											
											// 옵션 수량 변경 시 처리
											$(document).on("keyup change",".onlyNum",function(){
												
												this.value=this.value.replace(/[^1-9]/g,'');
												
												var price = $(this).parent().prev().children().eq(0).val();
												var amount = $(this).val();
												var cost = addComma(price*amount)
												
												$(this).parent().prev().children().eq(1).text(cost);
											});

										})

										// 옵셕 제외 처리
										function deleteOp(a){
											a.parentNode.parentNode.remove();
										}
									
									</script>
									
	
									<div class="button_container">
										<!-- 占쏙옙,占쏙옙袂占쏙옙占�(占쌉쏙옙) -->
										<button type="submit" class="button cart_button" >즉시구매</button> 
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