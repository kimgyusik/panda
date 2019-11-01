<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PANDA:판매자페이지</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<style>
	.form-group{
		margin: 10px;
	}
</style>
</head>
<body>

	<c:import url="../../common/sellerMenubar.jsp"/>
	<div class="shop">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<!-- Shop Sidebar -->
					<div class="shop_sidebar" style="width: 100px; margin: 0;'">
						<div class="sidebar_section">
							<div class="sidebar_title">Categories</div>
							<ul class="sidebar_categories">
								<li><a href="sProduct.do">상품리스트</a></li>
								<li><a href="pInsert.do">상품등록</a></li>
								<li><a href="oderPage.do">주문목록관리</a></li>
								<li><a href="streaming.do">방송관리</a></li>
								<li><a href="sPage.do">정보수정?</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="panel-heading"><label style="text-size:30px;">상품 등록</label></div>
				<br>
				<div class="panel-body" width="500px">
					<form action="pInsert.do" method="post" encType="multipart/form-data" >
						<div class="form-group">
							<label for="pName">상품명</label> 
							<input type="text" class="form-control" id="pName" name="pName" placeholder="상품명을 입력하세요." />
						</div>
						<div class="form-group">
							<label for="Product_Category">카테고리</label> 
							<select
								name="cId" id="cId" class="form-control">
								 <c:forEach items="${cList }" var="c">
									<option value="${c.cId }">${c.cName2 } : ${c.cName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<div>
								<label>메인 사진</label>
								<div class="productPic" id="productPicArea1">
									<img id='pImg1' width='98px' height='98px'>
								</div>
							</div>
							<label>다른 상품 사진</label> <br>
							<table>
								<tr>
									<td>
										<div class="productPic" id="productPicArea2">
											<img id='pImg2' width='98px' height='98px'>
										</div>
									</td>
									<td>
										<div class="productPic" id="productPicArea3">
											<img id='pImg3' width='98px' height='98px'>
										</div>
									</td>
								</tr>
							</table>
							<div id='fileArea'>
								<input type="file"  id='productImg1' name="uploadFile1"
									onchange="loadImg(this, 1);"> <input type="file"
								 	id='productImg2' name="uploadFile2"
									onchange="loadImg(this, 2);"> <input type="file"
									id='productImg3' name="uploadFile3"
									onchange="loadImg(this, 3);">
							</div>
							<script>
                    // 미리보기 영역을 클릭할 때 파일 첨부 창이 뜨도록
                    $(function(){
                      $("#fileArea").hide();
                      
                      $("#productPicArea1").click(function(){
                        $("#productImg1").click();
                      });
                      
                      $("#productPicArea2").click(function(){
                        $("#productImg2").click();
                      });
                      
                      $("#productPicArea3").click(function(){
                        $("#productImg3").click();
                      });
                    });
                    
                    // 파일 첨부 했을 때 미리보기하는 기능
                    // 참고 https://developer.mozilla.org/ko/docs/Web/API/FileReader
                    function loadImg(value,num) {
                      
                      if(value.files && value.files[0]){
                        // 파일을 읽어들일 FileReader 객체 생성
                        var reader = new FileReader();
                        
                        reader.onload = function(e){
                          switch(num){
                          case 1: $('#pImg1').attr("src", e.target.result); break;	 // data:URL
                          case 2: $('#pImg2').attr("src", e.target.result); break;
                          case 3: $('#pImg3').attr("src", e.target.result); break;
                          }
                        }
                        // 파일 읽어주는 메소드
                        reader.readAsDataURL(value.files[0]);
                      }
                    }
                  </script>
						</div>
						
						<div style="border:2px solid blue;">
							<div class="form-group">
								<label for="optionName1">옵션명</label>
								<input type="text" class="form-control" id="oName" name="oName" placeholder="옵션 명을 입력하세요."/>
							</div>
							<div class="form-group">
								<label for="price1">가격</label> <input type="number"
									class="form-control" id="oPrice" name="oPrice" placeholder="상품 가격을 입력하세요." />
							</div>
							<div class="form-group">
								<label for="amount1">수량</label> <input type="number"
									class="form-control" id="oAmount" name="oAmount" placeholder="상품 수량을 입력해주세요." />
							</div>
						</div>
						<br>
						<div id="optionTable">
						</div>
						<div style="margin:10px;">
							<button type="button" onclick="insertOption()">옵션추가</button>
							<button type="button" onclick="deleteOption()" >옵션삭제</button>
						</div>
						<script>
							function insertOption(){
								$("#optionTable").append('<div><div style="border:2px solid blue;"><div class="form-group"><label for="optionName1">옵션명</label><input type="text" class="form-control" id="oName" name="oName" placeholder="옵션 명을 입력하세요."/></div><div class="form-group"><label for="price1">가격</label> <input type="number"class="form-control" id="oPrice" name="oPrice" placeholder="상품 가격을 입력하세요." /></div>	<div class="form-group"><label for="amount1">수량</label> <input type="number"class="form-control" id="oAmount" name="oAmount" placeholder="상품 가격을 입력하세요." />	</div></div><br><div>');
							}
							
							function deleteOption(){
								$("#optionTable").children().last().remove();
							}
						</script>
						<div class="form-group">
							<label>상세 설명</label>
							<div>
								<textarea id="summernote" name="pContent"></textarea>
							</div>
						    <script>
						      $('#summernote').summernote({
						        tabsize: 2,
						        height: 800
						      });
						    </script>
						</div>
						<div align=right>
							<button type="submit" class="btn btn-default">상품 추가</button>
						</div>
						<div>
							<input type="hidden" value="${loginSeller.sNo }" name="sNo"/>
						</div>
					</form>
					<script>
						function postForm() {
							$('textarea[name="pContent"]').html($('.summernote').code());
						}
					</script>
				</div>

			</div>
		</div>
	</div>


	<c:import url="../../common/footer.jsp"/>

</body>
</html>