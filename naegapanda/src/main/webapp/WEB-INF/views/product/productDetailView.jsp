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
									<input type="hidden" id="pId" name="pId" value="${ p.pId }">
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
										<button type="button" class="button cart_button" onclick="addCart(${loginUser.mNo});">장바구니로</button>
										<button type="button" class="button cart_button" onclick="addGgim(${loginUser.mNo}) ;">찜하기</button> 
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
							<h3>상세내용</h3><br>
							<div id="detail_contents">
								${p.pContent }
							</div>
						</div>
						
						<div class="col-lg-5">
							<br>
							<br>
							<br>
							<h3>리뷰 ${ reList.size() }건</h3><br>
							<div id="review">
								<input type="hidden" id="loginUser" value="${loginUser}">
			
								<c:if test="${!empty reList}">
								 	<table style="width:100%">
								 		<c:forEach items="${ reList }" var="re">
									 		<tr class="reviewTop" >
									 			<td width="5%"></td>
									 			<td width="40%;" style="text-align: left;">
									 				<span class="reviewTitle">${re.rTitle }</span>
									 				<span class="reviewGray">&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${re.rDate}" pattern="yyyy. MM. dd. HH:mm" /></span>
									 			</td>
									 			<td width="25%" class="reviewWriter">
									 				<span >&nbsp;&nbsp;작성자: ${re.mId }</span>
									 			</td>
									 			<td width="15%;" style="text-align: center;">
									 				<img class="reviewImg" src="resources/images/${re.rImage}" >
									 			</td>
									 			<td  width="10%" >
									 				<input type="hidden" class="rId" value="${re.rId }">
										 				<c:if test="${fn:length(rcList) == 0}">
										 					<span class="reviewHart" >♡</span>
										 				</c:if>
										 				<c:if test="${fn:length(rcList) != 0}">
											 				<c:set var="doneLoop" value="false"/> 
											 				<c:forEach items="${rcList }" var="rc" varStatus="status">
											 					<c:if test="${not doneLoop}"> 
												 					<c:if test="${re.rId eq rc.rId}">
																		<span class="reviewHart" >♥</span>
																		<c:set var="doneLoop" value="true"/> 
													 				</c:if>
													 				<c:if test="${status.last && re.rId ne rc.rId }">
																		<span class="reviewHart" >♡</span>
													 				</c:if>
												 				</c:if>
											 				</c:forEach>
										 				</c:if>
										 				<span class="reviewGood">${re.rCommend }</span>
									 				
									 			</td>
							 				</tr>
							 				<tr class="reviewDetail">
							 					<td>
							 						<input id="replyId${re.rId}" type="hidden" value="${re.rId}">
							 						<input type="hidden" value="${sessionScope.loginUser.mNo}">
							 					</td>
							 					<td  style="vertical-align: top;">
							 						<div style="padding-top:15px; ">
							 							<span class="reviewContents">&nbsp;&nbsp;${re.rContents }</span>
							 						</div>
							 						<div >
							 							<br> <b>┗</b> &nbsp;&nbsp;<span class="replyCount">댓글(<span id="rCount${re.rId}"></span>)</span> &nbsp;&nbsp;&nbsp;&nbsp;
							 							<c:if test="${loginUser == null }">
							 								<input type="text" class="inputReply" placeholder="일반회원만 이용 가능합니다" disabled="disabled">
							 							</c:if>
							 							<c:if test="${loginUser != null }">
							 								<input type="text" class="inputReply" >
							 								<span class="add reviewGray">추가</span>
							 							</c:if>
							 							<br>
										 				<table id="replyTable${re.rId}" style="margin-top: 10px;margin-bottom:15px;">
										 					
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
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;등록된 리뷰가 없습니다.
					 				</div>
				 				</c:if>

								<!-- 리뷰끝 --> 
								
							</div>
						</div>

						<div class="col-lg-5">
							<br>
							<br>
							<h3>상품 문의 </h3>
							<div id="inquiry">
								<br>
								<c:if test="${empty inqList}">
				 					<div style="text-align: left;">
					 					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;등록된 문의가 없습니다.
					 				</div>
					 				<br>
				 				</c:if>
								<c:if test="${loginUser != null }">
									<input type="hidden" value="${p.pId}">
	 								<div id="addInq">
	 									상품 문의 작성하기
	 								</div>
	 							</c:if>
	 							<c:if test="${loginUser == null }">
	 								<div id="addInqDisable">
	 									상품 문의 작성하기
	 								</div>
	 							</c:if>
	 							<br>

								<c:if test="${!empty inqList}">
								 	<table  style="width:100%; ">
								 		<thead>
								 			<tr>
								 				<td width="10%;">답변상태</td>
								 				<td width="65%;">제목</td>
								 				<td width="10%;">작성자</td>
								 				<td width="15%;">작성일</td>
								 			</tr>
								 		</thead>
								 		<tbody>
									 		<c:forEach items="${ inqList }" var="i">
										 		<tr class="inquiryTr1">
										 			<td>
										 				<input type="hidden" class="sNo" value="${loginSeller.sNo}">
										 				<input type="hidden" class="mNo" value="${loginUser.mNo}">
										 				<c:if test="${i.iState eq 'N' }">
										 					<span class="answerYn">미답변</span>
										 				</c:if>
										 				<c:if test="${i.iState eq 'Y' }">
										 					<span class="answerYn">답변완료</span>
										 				</c:if>
										 				
										 			</td>
										 			<td style="text-align: left;">
										 				<input type="hidden" class="openYn" value="${i.openYn}">
										 				<input type="hidden" class="imNo" value="${i.mNo}">
										 				<input type="hidden" class="isNo" value="${i.sNo}">
										 				<input type="hidden" class="iState" value="${i.iState}">
											 			
											 			<c:if test="${loginSeller == null || p.sNo ne loginSeller.sNo }">
											 				<c:if test="${i.openYn eq 'Y'}">
									 							<span>${i.iTitle }</span>
									 						</c:if>
									 						<c:if test="${i.openYn eq 'N'}">
									 							<c:if test="${loginUser ne null && i.mNo eq loginUser.mNo}">
										 							<span>${i.iTitle }</span>
										 						</c:if>
										 						<c:if test="${loginUser eq null || i.mNo ne loginUser.mNo}">
										 							<span >비밀글입니다.</span> &nbsp;
										 							<img src="resources/images/lock.ico" width="16px;" style="margin-bottom:3px;">
										 						</c:if>
									 						</c:if>
								 						</c:if>
								 						<c:if test="${loginSeller != null && p.sNo eq loginSeller.sNo }">
								 							<span>${i.iTitle }</span>
								 						</c:if>
										 			</td>
										 			<td>
										 				<span>${i.mId}</span>
										 			</td>
										 			<td>
										 				<span ><fmt:formatDate value="${i.iDate}" pattern="yyyy. MM. dd. hh:mm" /></span>
										 			</td>
								 				</tr>
								 				<tr class="inquiryTr2">
								 					<td></td>
								 					<td style="text-align: left;">
								 						${i.iContents}
								 					</td>
								 					<td></td>
								 					<td></td>
								 				</tr>
								 				<tr class="inquiryTr3">
								 					<td></td>
								 					<td style="text-align: left;">
								 						<div>
								 							<input type="hidden" id="iId" value="${i.iId}">
								 							<b>┗</b> &nbsp;&nbsp;<span class="answerBox">답변</span>&nbsp;&nbsp;&nbsp;&nbsp;
								 							
								 							<c:if test="${i.iAnswer != null}">
								 								<span class="iAnswer">${i.iAnswer }</span>
								 							</c:if>
								 							<c:if test="${loginSeller != null && p.sNo eq loginSeller.sNo }">
								 								<c:if test="${i.iAnswer == null}">
								 									<input type="text" class="addAnswer" >
								 									<span id="a${i.iId}" class="addInq" onclick="addInq(this.id);">등록</span>
								 								</c:if>
								 								<c:if test="${i.iAnswer != null}">
								 									<span id="d${i.iId}" class="deleteInq" onclick="deleteInq(this.id);">삭제</span>
								 								</c:if>
								 							</c:if>

								 						</div>
								 					</td>
								 					<td>판매자</td>
								 					<td><fmt:formatDate value="${i.iaDate}" pattern="yyyy. MM. dd. hh:mm" /></td>
								 				</tr>
									 		</c:forEach>																				
								 		</tbody>
								 	</table>
							 	</c:if>

		
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	
	<c:import url="../common/footer.jsp"/>
	
	
	<!-- 모달 -->
	
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-sm" style="width:300px;">
			<div class="modal-content">
			
			<div class="modal-header">
				<span style="color:white; "><b>문의 등록</b></span>
				<button type="button" class="close" data-dismiss="modal" style="color:white;">&times;</button>
			</div>
			
			<form action="addInquiry.in" method="post" >
				<table id="inqModal">
					<tr>
						<td>
							<div class="modal-body" style="padding-left:30px; padding-right:30px;">
								<input type="hidden" id="pIdInq" name="pId"><br>
								<label class="modalLabel">제목</label>
								<br><input type="text" class="modal-title" id="title" name="iTitle" ><br><br>
								<label class="modalLabel">내용</label><br>
								<textarea id="content" cols="15" rows="4" name="iContents"></textarea><br>
								<label id="contentLabel" >0/500</label>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="modal-footer">
								<div style="flex: auto; margin-left:20px;">
									<input type="checkbox" id="openYn" name="openYn" checked="checked">
									<label id="openYnLabel" for="openYn">공개 여부</label>
								</div>
								<button id="submit" type="submit" class="btn btnInq" data-dismiss="modal"><b>작성완료</b></button>
								<button type="button" class="btn btnInq" data-dismiss="modal"><b>취소</b></button>
							</div>
						</td>
					</tr>
				</table>
			</form>
			
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