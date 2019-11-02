/* JS Document */

/******************************

[Table of Contents]

1. Vars and Inits
2. Set Header
3. Init Custom Dropdown
4. Init Page Menu
5. Init Recently Viewed Slider
6. Init Brands Slider
7. Init Quantity
8. Init Color
9. Init Favorites
10. Init Image


******************************/

$(document).ready(function()
{
	"use strict";

	/* 

	1. Vars and Inits

	*/

	var menuActive = false;
	var header = $('.header');

	setHeader();

	initCustomDropdown();
	initPageMenu();
	initViewedSlider();
	initBrandsSlider();
	initQuantity();
	initColor();
	initFavs();
	initImage();

	$(window).on('resize', function()
	{
		setHeader();
	});

	/* 

	2. Set Header

	*/

	function setHeader()
	{
		//To pin main nav to the top of the page when it's reached
		//uncomment the following

		// var controller = new ScrollMagic.Controller(
		// {
		// 	globalSceneOptions:
		// 	{
		// 		triggerHook: 'onLeave'
		// 	}
		// });

		// var pin = new ScrollMagic.Scene(
		// {
		// 	triggerElement: '.main_nav'
		// })
		// .setPin('.main_nav').addTo(controller);

		if(window.innerWidth > 991 && menuActive)
		{
			closeMenu();
		}
	}

	/* 

	3. Init Custom Dropdown

	*/

	function initCustomDropdown()
	{
		if($('.custom_dropdown_placeholder').length && $('.custom_list').length)
		{
			var placeholder = $('.custom_dropdown_placeholder');
			var list = $('.custom_list');
		}

		placeholder.on('click', function (ev)
		{
			if(list.hasClass('active'))
			{
				list.removeClass('active');
			}
			else
			{
				list.addClass('active');
			}

			$(document).one('click', function closeForm(e)
			{
				if($(e.target).hasClass('clc'))
				{
					$(document).one('click', closeForm);
				}
				else
				{
					list.removeClass('active');
				}
			});

		});

		$('.custom_list a').on('click', function (ev)
		{
			ev.preventDefault();
			var index = $(this).parent().index();

			placeholder.text( $(this).text() ).css('opacity', '1');

			if(list.hasClass('active'))
			{
				list.removeClass('active');
			}
			else
			{
				list.addClass('active');
			}
		});


		$('select').on('change', function (e)
		{
			placeholder.text(this.value);

			$(this).animate({width: placeholder.width() + 'px' });
		});
	}

	/* 

	4. Init Page Menu

	*/

	function initPageMenu()
	{
		if($('.page_menu').length && $('.page_menu_content').length)
		{
			var menu = $('.page_menu');
			var menuContent = $('.page_menu_content');
			var menuTrigger = $('.menu_trigger');

			//Open / close page menu
			menuTrigger.on('click', function()
			{
				if(!menuActive)
				{
					openMenu();
				}
				else
				{
					closeMenu();
				}
			});

			//Handle page menu
			if($('.page_menu_item').length)
			{
				var items = $('.page_menu_item');
				items.each(function()
				{
					var item = $(this);
					if(item.hasClass("has-children"))
					{
						item.on('click', function(evt)
						{
							evt.preventDefault();
							evt.stopPropagation();
							var subItem = item.find('> ul');
						    if(subItem.hasClass('active'))
						    {
						    	subItem.toggleClass('active');
								TweenMax.to(subItem, 0.3, {height:0});
						    }
						    else
						    {
						    	subItem.toggleClass('active');
						    	TweenMax.set(subItem, {height:"auto"});
								TweenMax.from(subItem, 0.3, {height:0});
						    }
						});
					}
				});
			}
		}
	}

	function openMenu()
	{
		var menu = $('.page_menu');
		var menuContent = $('.page_menu_content');
		TweenMax.set(menuContent, {height:"auto"});
		TweenMax.from(menuContent, 0.3, {height:0});
		menuActive = true;
	}

	function closeMenu()
	{
		var menu = $('.page_menu');
		var menuContent = $('.page_menu_content');
		TweenMax.to(menuContent, 0.3, {height:0});
		menuActive = false;
	}

	/* 

	5. Init Recently Viewed Slider

	*/

	function initViewedSlider()
	{
		if($('.viewed_slider').length)
		{
			var viewedSlider = $('.viewed_slider');

			viewedSlider.owlCarousel(
			{
				loop:true,
				margin:30,
				autoplay:true,
				autoplayTimeout:6000,
				nav:false,
				dots:false,
				responsive:
				{
					0:{items:1},
					575:{items:2},
					768:{items:3},
					991:{items:4},
					1199:{items:6}
				}
			});

			if($('.viewed_prev').length)
			{
				var prev = $('.viewed_prev');
				prev.on('click', function()
				{
					viewedSlider.trigger('prev.owl.carousel');
				});
			}

			if($('.viewed_next').length)
			{
				var next = $('.viewed_next');
				next.on('click', function()
				{
					viewedSlider.trigger('next.owl.carousel');
				});
			}
		}
	}

	/* 

	6. Init Brands Slider

	*/

	function initBrandsSlider()
	{
		if($('.brands_slider').length)
		{
			var brandsSlider = $('.brands_slider');

			brandsSlider.owlCarousel(
			{
				loop:true,
				autoplay:true,
				autoplayTimeout:5000,
				nav:false,
				dots:false,
				autoWidth:true,
				items:8,
				margin:42
			});

			if($('.brands_prev').length)
			{
				var prev = $('.brands_prev');
				prev.on('click', function()
				{
					brandsSlider.trigger('prev.owl.carousel');
				});
			}

			if($('.brands_next').length)
			{
				var next = $('.brands_next');
				next.on('click', function()
				{
					brandsSlider.trigger('next.owl.carousel');
				});
			}
		}
	}

	/* 

	7. Init Quantity

	*/

	function initQuantity()
	{
		// Handle product quantity input
		if($('.product_quantity').length)
		{
			var input = $('#quantity_input');
			var incButton = $('#quantity_inc_button');
			var decButton = $('#quantity_dec_button');

			var originalVal;
			var endVal;

			incButton.on('click', function()
			{
				originalVal = input.val();
				endVal = parseFloat(originalVal) + 1;
				input.val(endVal);
			});

			decButton.on('click', function()
			{
				originalVal = input.val();
				if(originalVal > 0)
				{
					endVal = parseFloat(originalVal) - 1;
					input.val(endVal);
				}
			});
		}
	}

	/* 

	8. Init Color

	*/

	function initColor()
	{
		if($('.product_color').length)
		{
			var selectedCol = $('#selected_color');
			var colorItems = $('.color_list li .color_mark');
			colorItems.each(function()
			{
				var colorItem = $(this);
				colorItem.on('click', function()
				{
					var color = colorItem.css('backgroundColor');
					selectedCol.css('backgroundColor', color);
				});
			});
		}
	}

	/* 

	9. Init Favorites

	*/

	function initFavs()
	{
		// Handle Favorites
		var fav = $('.product_fav');
		fav.on('click', function()
		{
			fav.toggleClass('active');
		});
	}

	/* 

	10. Init Image

	*/

	function initImage()
	{
		var images = $('.image_list li');
		var selected = $('.image_selected img');

		images.each(function()
		{
			var image = $(this);
			image.on('click', function()
			{
				var imagePath = new String(image.data('image'));
				selected.attr('src', imagePath);
			});
		});
	}
	
	// 리뷰 상세 on-off
	$('.reviewDetail').css('display','none');
	$('.reviewTop').click(function(){
		if(!$(this).hasClass('more')){
			
			var rId = $(this).next().children().eq(0).children().eq(0).val();
			increaserCount(rId);
			getReplyList(rId, $(this).next().children().eq(0).children().eq(1).val());
			$(this).css('border-bottom','none');
			$(this).find('.reviewImg').css('display','none');
			$(this).next().css('display','table-row');
			$(this).addClass('more');
		}else{
			$(this).find('.reviewImg').css('display','inline-table');
			$(this).next().css('display','none');
			$(this).removeClass('more');
			$(this).next().find('.inputReply').val("");
		}
	});
	
	// 리뷰 좋아요 토글
	$(".reviewHart").off().on("click", function(e){
		
		e.stopImmediatePropagation();
		
		if($("#loginUser").val() == null || $("#loginUser").val() == ""){
			return;
		}else{
			
			var rId =$(this).parent().children().eq(0).val();
			var thisHart = $(this);
			
			$.ajax({
				url:"changeCommend.re",
				data:{rId:rId},
				type:"post",
				success:function(data){
					if(data == "success"){
						if(thisHart.text() == "♡"){
							thisHart.html("♥");
							thisHart.next().html(parseInt(thisHart.next().text())+1);
						}else{
							thisHart.html("♡");
							thisHart.next().html(parseInt(thisHart.next().text())-1);
						}
						
					}else{
						alert("처리실패");
					}
				},
				error:function(){
					console.log("서버와의 통신 실패");
				}
			});
		}
	});
	
	// 리플 추가
	$(".add").on("click", function(){
		
		var rId =$(this).parent().parent().parent().children().eq(0).children().eq(0).val();
		var rrContents = $(this).prev().val();
		var mNo = $(this).parent().parent().parent().children().eq(0).children().eq(1).val();
		var inputReply = $(this).prev();
		
		$.ajax({
			url:"addReply.re",
			data:{rId:rId, rrContents:rrContents},
			type:"post",
			success:function(data){
				if(data == "success"){
					getReplyList(rId, mNo)
					inputReply.val("");
				}else{
					alert("처리실패");
				}
			},
			error:function(){
				console.log("서버와의 통신 실패");
			}
		});
		
	});
	
	
	// 상품 문의 처리
	$('.inquiryTr2').hide();
	$('.inquiryTr3').hide();
	$('.inquiryTr1').on("click", function(){
		
		var loginSeller = $(this).find('.sNo').val();
		var loginUser =  $(this).find('.mNo').val();
		var openYn = $(this).find('.openYn').val();
		var imNo = $(this).find('.imNo').val();
		var isNo = $(this).find('.isNo').val();
		var iState = $(this).find('.iState').val();
		
		if($(this).hasClass('more')){ // 닫기
			$(this).removeClass('more');
			$(this).next().next().find('.addAnswer').val("");
			$(this).next().hide();
			$(this).next().next().hide();
			
		}else{ // 열기
			if(openYn == 'Y' || loginSeller == isNo || loginUser == imNo){ // 공개중이거나 판매자거나 본인만 보임
				$(this).addClass('more');
				$(this).next().show();
				if(iState == 'Y' || loginSeller == isNo){ // 미답변 상태일 시 판매자만 보임
					$(this).next().next().show();
				}
			}else{
				alert('비공개 문의내역은 작성자 본인만 확인하실 수 있습니다.');
			}
		}
	});
	
	// 문의답변 엔터키 이벤트
	$(".addAnswer").keypress(function (e) {
        if (e.which == 13){
        	var id = $(this).next().attr('id');
        	addInq(id);
        }
    });
	
	// 댓글 작성 엔터키 이벤트
	$(".inputReply").keypress(function (e) {
        if (e.which == 13){
        	$(this).next().trigger("click");
        }
    });
	
	// 회원 아닐 시 문의 작성 못 함
	$('#addInqDisable').click(function(){
		alert('일반회원으로 로그인 이후 이용 가능합니다.');
	});
	
	// 문의 작성 모달창 호출
	$('#addInq').click(function(){
		var pId = $(this).prev().val();
		$("#pIdInq").val(pId);
		$("#myModal").modal('show');
	});
	
	// 문의내용 글자 수 제한
	 $('#content').on('keyup', function() {
        if($(this).val().length > 500) {
            $(this).val($(this).val().substring(0, 500));
        }
		$('#contentLabel').html($(this).val().length+"/500");
    });
	 
	// 모달 종료 시 input-area 초기화
	$("#myModal").on('hide.bs.modal', function(e){
		$('#title').val('');
		$('#content').val('');
		$('#openYn').prop('checked', true);
		e.stopImmediatePropagation();
	});
	
	// 모달창 제출
	$('#submit').click(function (e) {
		event.stopPropagation();
		$('#submit').click();
	});
	
	
	

});







// 문의 답변 등록
function addInq(id){

	var addInq = $('#'+id);
	var addAnswer = addInq.parent().find('.addAnswer');
	var iId = addInq.parent().find('#iId').val();
	
	$.ajax({
		url:"answerInquiry.in",
		data:{iId:iId, iAnswer:addAnswer.val()},
		type:"post",
		success:function(data){
			if(data == "success"){
				addInq.after("<span id='d"+iId+"' class='deleteInq' onclick='deleteInq(this.id);'>삭제</span>");
				addInq.after("<span class='iAnswer'>"+addAnswer.val()+"</span>");
				addInq.parent().parent().parent().prev().prev().find('.answerYn').html("답변완료");
				
				addInq.remove();
				addAnswer.remove();
			}else{
				alert("처리실패");
			}
		},
		error:function(){
			console.log("서버와의 통신 실패");
		}
	});
}

// 문의 답변 삭제
function deleteInq(id){

	var deleteInq = $('#'+id);
	var iAnswer = deleteInq.parent().find('.iAnswer');
	var iId = deleteInq.parent().find('#iId').val();
	
	$.ajax({
		url:"deleteAnswerInquiry.in",
		data:{iId:iId},
		type:"post",
		success:function(data){
			if(data == "success"){
				deleteInq.after("<span id='a"+iId+"' class='addInq' onclick='addInq(this.id);'>등록</span>");
				deleteInq.after("<input type='text' class='addAnswer' >");
				deleteInq.parent().parent().parent().prev().prev().find('.answerYn').html("미답변");
				
				deleteInq.remove();
				iAnswer.remove();
			}else{
				alert("처리실패");
			}
		},
		error:function(){
			console.log("서버와의 통신 실패");
		}
	});
}






// 리뷰 댓글 불러오기
function getReplyList(rId, mNo){

	$.ajax({
		url:"replyList.re",
		data:{rId:rId},
		dataType:"json",
		success:function(data){
			
			$("#rCount"+rId).html(data.length);
			
			var $replyBody = $("#replyTable"+rId);	
				$replyBody.html("");
			
			if(data.length > 0){
				
				$.each(data, function(index, value){ // value == data[index]
					
					var $tr = $("<tr class='reply'>");
					
					// 날짜 포맷팅
					var date = new Date(value.rrDate),
				    yr      = date.getFullYear(),
				    month   = date.getMonth()+1 < 10 ? '0' + date.getMonth()+1 : date.getMonth()+1,
				    day     = date.getDate()  < 10 ? '0' + date.getDate()  : date.getDate(),
				    hours	= date.getHours(),
				    minutes	= date.getMinutes(),
				    newDate = yr + '.' + month + '.' + day + '&nbsp;&nbsp;' + hours + ':' + minutes;
				   
					$tr.append(
							"<td style='width:20%; text-align:right;'>" + value.mId 	
							+ "<td style='width:2%; '>"
							+ "<div style='height:15px; border: 2px solid #ced3e4;'>"
							+ "<td >"+value.rrContents
							+ "<span class='reviewGray dated'>&nbsp;&nbsp;&nbsp;("+newDate+")&nbsp;&nbsp;	"
							+ "<span class='delete "+value.mNo+"' onclick='deleteReply("+value.rrId+","+rId+","+mNo+");'>삭제</span>"
					);
					
					$replyBody.append($tr);
					
					if(value.mNo != mNo){
					//$tr.append("<td id = 'rrId"+value.rrId+"'style='border-bottom:none; width:24%'>" +
					//		"<input type='hidden' value='"+value.rrId+"'>" );
					$('.'+value.mNo).remove();}
				});
			}
		},
		error:function(){
			console.log("ajax 통신 실패");
		}
	});
}

// 리뷰 상세 보기 시 조회수 증가
function increaserCount(rId){
	
	$.ajax({
		url:"increaserCount.re",
		data:{rId:rId},
		type:"post",
		success:function(data){
			if(data == "success"){
			}else{
			}
		},
		error:function(){
			console.log("서버와의 통신 실패");
		}
	});
}

// 리플 삭제
function deleteReply(rrId,rId,mNo){
	$.ajax({
		url:"deleteReply.re",
		data:{rrId:rrId},
		type:"post",
		success:function(data){
			if(data == "success"){
				//$('#rrId'+rrId).parent().remove();
				getReplyList(rId, mNo);
			}else{
				alert("처리실패");
			}
		},
		error:function(){
			console.log("서버와의 통신 실패");
		}
	});
	
}

// 장바구니 담기 처리
function addCart(t){
	
	if(t == null || t == ""){
		alert('일반회원으로 로그인 이후 이용 가능합니다.');
		return;
	}else{
		// 선택된 옵션과 수량을 변수로 잡아줘야함
		$.ajax({
			url:"addBasket.ba",
			data: {oNo:oNo, amount:amount},
			dataType:"json",
			success:function(data){
				alert(data);
			},
			error:function(){
				console.log("ajax 통신 실패");
			}
		});
	}
	
}

// 찜하기 처리
function addGgim(t){
	
	if(t == null || t == ""){
		alert('일반회원으로 로그인 이후 이용 가능합니다.');
		return;
	}else{
		
		var pId = $("#pId").val();
		
		$.ajax({
			url:"addGgim.gg",
			data: {pId:pId},
			dataType:"json",
			success:function(data){
				alert(data);
				getGgim();
			},
			error:function(){
				console.log("ajax 통신 실패");
			}
		});
	}
	
}

//메인메뉴 찜하기 비동기 처리
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