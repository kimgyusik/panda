<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<style type="text/css">

	.outer{
		width:700px;
		height: 500px;
		margin-left: auto;
		margin-right: auto;
		margin-top:50px; 
	}
</style>
</head>
<body>
<c:import url="../common/menubar.jsp"/>
<div class="outer">
<table>
	<h3 style="font-weight:bold;">검색결과뜬달</h3><br>
	<c:forEach items="${ list }" var="se">
		<tr>
			<td>제품번호 : ${se.pId }</td>
			<td>제품명 : ${se.pName }</td>
			<td>내용 : ${se.pContent }</td>
			<td>판매자번호 : ${se.sNo }</td>
		</tr>
	</c:forEach>
</table>
</div>

<c:import url="../common/footer.jsp"/>



<!-- 						<script>
						
						$(function() {
							categoryId(1000);
						});
						  $(document).ready( function() {
						        $('.temp').click( function() {
						          $('#temp').scrollTop(0);
						        } );
						      } );
						
							function categoryId(category) {
								$.ajax({
									url:'test11.do',
									data:{category:category}, 
									type:"post",
									dataType:"JSON",
									success:function(data) {
										if(data != null) {
											$.each(data, function(index, value){
												var price = value.pPrice;
												
												
												var photo = value.paChangeName;
												var pId = value.pId;
												var pName = value.pName;
												var text = 
													'<div class="featured_slider_item">' +
														'<div class="border_active"></div>' + 
														'<div class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">' + 
															'<div class="product_image d-flex flex-column align-items-center justify-content-center">'+
																'<img src="resources/product_uploadFiles/'+photo+' " width="100px" height="100px" alt="" onclick="loaction.href=' + "'pDetailView.do?pId='" +pId+';">'+
															'</div>' + 
															'<div class="product_content">' + 
																'<div class="product_price discount">' + price +'</span>' +
															'</div>' + 
															'<div class="product_name">'
																+'<div><a href="pDetailView.do?pId='+pId+'">'+pName+'</a></div>'+
															'</div>' + 
															'<div class="product_extras">' + 
																'<button class="product_cart_button">Add to Cart</button>' + 
															'</div>' + 
														'</div>' + 
														'<div class="product_fav"><i class="fas fa-heart"></i></div>' + 
													'</div>';								
													
													
													$('HotTopBox').append(text);
													
												
													/* if(category==1000){
														$('#HotTopBox').append(text);
													}else if(category==1001){
														$('#Hot1Box').append(text);														
													}else if(category==1002){														
														$('#Hot2Box').append(text);														
													}else if(category==1003){
														$('#Hot3Box').append(text);																												
													}else if(category==1004){
														$('#Hot4Box').append(text);
													}else if(category==1005){
														$('#Hot5Box').append(text);
													}else if(category==1006){
														$('#Hot6Box').append(text);
													} */
												
												
											})
											
										}
									},
									error:function() {
										console.log('통신 실패');
									}
									
									
								});
							}
							
						</script> -->






</body>
</html>