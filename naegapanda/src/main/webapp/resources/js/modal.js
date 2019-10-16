var action = '';
var url = '';
var type = '';
var vNo = 0;

$(document).ready(function(){
	
	// 새 글 쓰기 버튼 클릭
	$("#createBtn").click(function(){
		action="create";
		type='POST'
		$("#modal-title").text("새 글 작성");
		$("#myModal").modal();
	});
	
	// 수정하기 버튼 클릭
	$("button[name='modify']").click(function(){
		action='modify';
		type='PUT';
		vNo=this.value;
		
		//content 담기
		var row = $(this).parent().parent().parent();
		var tr = row.children();
		
	});
	
});

