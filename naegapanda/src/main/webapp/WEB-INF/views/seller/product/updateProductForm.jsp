<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
								<li><a href="sProduct.do">��ǰ����Ʈ</a></li>
								<li><a href="pInsert.do">��ǰ���</a></li>
								<li><a href="oderPage.do">�ֹ���ϰ���</a></li>
								<li><a href="streaming.do">��۰���</a></li>
								<li><a href="sPage.do">��������?</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="panel-heading"><label style="text-size:30px;">��ǰ ����</label></div>
				<br>
				<div class="panel-body" width="500px">
					<form action="pUpdate.do?pId=${p.pId }" method="post" encType="multipart/form-data" >
						<div class="form-group">
							<label for="pName">��ǰ��</label> 
							<input type="text" class="form-control" id="pName" name="pName" value="${p.pName}" placeholder="��ǰ���� �Է��ϼ���." />
						</div>
						<div class="form-group">
							<label for="Product_Category">ī�װ�</label> 
							<select
								name="cId" id="cId" class="form-control" >
								 <c:forEach items="${cList }" var="c">
								 	<c:if test="${c.cId eq p.cId}">
									<option value="${c.cId }" selected="selected">${c.cName2 } : ${c.cName }</option>
									</c:if>
									<c:if test="${c.cId ne p.cId}">
									<option value="${c.cId }">${c.cName2 } : ${c.cName }</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<div>
								<label>���� ����</label>
								<div class="productPic" id="productPicArea1">
									<c:forEach items="${paList}" var="pa">
										<c:if test="${pa.paFileLevel eq 1}">
									<img id='pImg1' width='98px' height='98px' src="resources/product_uploadFiles/${pa.paChangeName}">
										</c:if>
									</c:forEach>
									
								</div>
							</div>
							<label>�ٸ� ��ǰ ����</label> <br>
							<table>
								<tr>
									<td>
										<div class="productPic" id="productPicArea2">
										<c:forEach items="${paList}" var="pa" >
											<c:if test="${pa.paFileLevel eq 2}">
										<img id='pImg2' width='98px' height='98px' src="resources/product_uploadFiles/${pa.paChangeName}">
											</c:if>
										</c:forEach>
										<c:if test="${fn:length(paList) eq 1}">
										<img id='pImg2' width='98px' height='98px'>
										</c:if>	
										</div>
									</td>
									<td>
										<div class="productPic" id="productPicArea3">
										<c:forEach items="${paList}" var="pa">
											<c:if test="${pa.paFileLevel eq 3}">
										<img id='pImg3' width='98px' height='98px' src="resources/product_uploadFiles/${pa.paChangeName}">
											</c:if>
										</c:forEach>
										<c:if test="${fn:length(paList) eq 1 or fn:length(paList) eq 2}">
										<img id='pImg3' width='98px' height='98px'>
										</c:if>	
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
                    // �̸����� ������ Ŭ���� �� ���� ÷�� â�� �ߵ���
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
                    
                    // ���� ÷�� ���� �� �̸������ϴ� ���
                    // ���� https://developer.mozilla.org/ko/docs/Web/API/FileReader
                    function loadImg(value,num) {
                      
                      if(value.files && value.files[0]){
                        // ������ �о���� FileReader ��ü ����
                        var reader = new FileReader();
                        
                        reader.onload = function(e){
                          switch(num){
                          case 1: $('#pImg1').attr("src", e.target.result); break;	 // data:URL
                          case 2: $('#pImg2').attr("src", e.target.result); break;
                          case 3: $('#pImg3').attr("src", e.target.result); break;
                          }
                        }
                        // ���� �о��ִ� �޼ҵ�
                        reader.readAsDataURL(value.files[0]);
                      }
                    }
                  </script>
						</div>
						
						<div style="border:2px solid blue;">
							<div class="form-group">
								<label for="optionName1">�ɼǸ�</label>
								<input type="text" class="form-control" id="oName" name="oName" value="${poList[0].oName}" placeholder="�ɼ� ���� �Է��ϼ���."/>
							</div>
							<div class="form-group">
								<label for="price1">����</label> <input type="number"
									class="form-control" id="oPrice" name="oPrice" value="${poList[0].oPrice }" placeholder="��ǰ ������ �Է��ϼ���." />
							</div>
							<div class="form-group">
								<label for="amount1">����</label> <input type="number"
									class="form-control" id="oAmount" name="oAmount" value="${poList[0].oAmount }" placeholder="��ǰ ������ �Է��ϼ���." />
							</div>
						</div>
						
						<br>
						<div id="optionTable">
						<c:forEach items="${poList }" var="po" varStatus="vs">
						<c:if test="${vs.index ne 0 }">
						<div style="border:2px solid blue;">
							<div class="form-group">
								<label for="optionName1">�ɼǸ�</label>
								<input type="text" class="form-control" id="oName" name="oName" value="${po.oName}" placeholder="�ɼ� ���� �Է��ϼ���."/>
							</div>
							<div class="form-group">
								<label for="price1">����</label> <input type="number"
									class="form-control" id="oPrice" name="oPrice" value="${po.oPrice }" placeholder="��ǰ ������ �Է��ϼ���." />
							</div>
							<div class="form-group">
								<label for="amount1">����</label> <input type="number"
									class="form-control" id="oAmount" name="oAmount" value="${po.oAmount }" placeholder="��ǰ ������ �Է��ϼ���." />
							</div>
						</div>
						</c:if>
						</c:forEach>
						</div>
						<div style="margin:10px;">
							<button type="button" onclick="insertOption()">�ɼ��߰�</button>
							<button type="button" onclick="deleteOption()" >�ɼǻ���</button>
						</div>
						<script>
							function insertOption(){
								$("#optionTable").append('<div><div style="border:2px solid blue;"><div class="form-group"><label for="optionName1">�ɼǸ�</label><input type="text" class="form-control" id="oName" name="oName" placeholder="�ɼ� ���� �Է��ϼ���."/></div><div class="form-group"><label for="price1">����</label> <input type="number"class="form-control" id="oPrice" name="oPrice" placeholder="��ǰ ������ �Է��ϼ���." /></div>	<div class="form-group"><label for="amount1">����</label> <input type="number"class="form-control" id="oAmount" name="oAmount" placeholder="��ǰ ������ �Է��ϼ���." />	</div></div><br><div>');
							}
							
							function deleteOption(){
								$("#optionTable").children().last().remove();
							}
						</script>
						<div class="form-group">
							<label>�� ����</label>
							<div>
								<textarea id="summernote" name="pContent">${p.pContent}</textarea>
							</div>
						    <script>
						      $('#summernote').summernote({
						        height: 800
						      });
						    </script>
						</div>
						<div align=right>
							<button type="submit" class="btn btn-default">��ǰ ����</button>
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