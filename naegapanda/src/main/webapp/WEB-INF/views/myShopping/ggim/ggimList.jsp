<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="resources/style/bootstrap4/bootstrap.min.css">
<link href="resources/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="resources/style/cart_styles.css">
<link rel="stylesheet" type="text/css" href="resources/style/cart_responsive.css">
<style>
.cart_section{
height: auto;
padding-top: 0;
}
.tablehead{
height:40px;
border: 1px solid black;
}
.tablebody{
height:100px;
border: 1px solid black;
}
.order_total_title{
font-size: 13px;
font-style: bold;
color:black;
}

td{
text-align: center;
border: 2px solid #edeeef;
border-left: 1px solid white;
border-right: 1px solid white;
font-size:12px;
}
.cart_title{
font-size: 20px !important;
padding:0 !important;
}
.cart_items{
margin:0 !important;

}
.cartinfo{

background-color: #edeeef;
padding:20px;;
margin-top:30px;
margin-bottom:30px;
font-size:13px;
}
.clearfix{
padding: 0px;
}
.removeCart{
width:auto;
padding: 1px;
font-size:9px;
cursor: pointer;
background-color: #f7f7f7;
border: 1px solid #edeeef;
box-shadow: 0.5px 0.5px 0.5px 0.5px gray;
}
.removeCart2{
width:100px;
font-size:12px;
height:30px;
margin-top:30px;
background-color: #f7f7f7;
border: 1px solid #edeeef;
cursor: pointer;
box-shadow: 0.5px 0.5px 0.5px 0.5px gray;
}
.cartTb{
cellspacing="0" 
}
.shop{
padding-bottom: 0px !important;
padding-top:50px  !important;
}


ul{
list-style:none;
}
.tabmenu{ 
height:60px;
margin-top:30px;
display:block;
border-top: 2px solid #edeeef;
border-bottom: 2px solid #edeeef;
}
.tabmenu ul li{
display:  inline-block;
width:140px; 
float:left;  
text-align:center; 
background :withe;
padding: 10px;

}
.tabmenu label{
display:block;
width:100%; 
height:40px;
line-height:40px;
}
.tabmenu input{display:none;}

.tabmenu input:checked ~ label{
color: #0e8ce4;
font-style: bold;
border-bottom-color: #0e8ce4;
}


</style>
</head>
<body>

	<c:import url="../../common/menubar.jsp"/>
	
	<!-- contents -->

	<div class="shop">
		<div class="container">
			<div class="row">
			
				<div class="col-lg-1">
					<!-- 사이드 메뉴바 -->
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
														<label for="tabmenu${c}">${c}</label>
													</li>
												</c:forEach>
										
											</ul>
										</div>
										
										<!-- 찜 상품 리스트 -->
										<div style="margin-top:50px;">
											 <c:forEach items="${ list }" var="g">
										  		  <div id="${g.category2 }" class="prodList" >${g.price}</div>
										    </c:forEach>
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
		
		// 카테고리탭 액션 처리
		$(".tab").on("change", function() {
			
			var tabId = $(this).attr('id');
			
			var list = $('.prodList');
			
			if(tabId == "displayAll"){ // 전체 상품 출력
				
				$('.prodList').css("display","block");
			
			}else{ // 선택된 탭에 해당하는 상품만 출력
				
				$.each(list, function(index, item){ 
					if(tabId == "tab"+item.id){
						$('#'+item.id).css("display","block");
					}else{
						$('#'+item.id).css("display","none");
					}
				});
			}

		});
			
		// 상품 제외(단일)
		function removeCart(oNo){
			
			if(confirm("해당 상품을 장바구니에서 삭제하시겠습니까?")){
				location.href='<%=request.getContextPath()%>/deleteBasket.ba?oNo='+oNo;
			}
			return false;
		}

	</script>


</body>
</html>