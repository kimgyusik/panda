
$(document).ready(function()
{

	
	// 찜 토글 처리
	$(".favPid").off().on("click", function(){
		
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

// 메인메뉴 장바구니 비동기 처리
function getCart(){
	$.ajax({
		url:"currentBasket.ba",
		dataType:"json",
		success:function(data){
			if(data[0] == 0){
				$('.cart_count').children().first().text(data[0]);
				$('.cart_price').children().first().text("장바구니가 비었어요.");
			}else{
				$('.cart_count').children().first().text(data[0]);
				$('.cart_price').children().first().text(data[1]+"원");
			}
		},
		error:function(){
			console.log("ajax 통신 실패");
		}
	});
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