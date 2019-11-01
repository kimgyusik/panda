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
			getReplyList($(this).next().children().eq(0).children().eq(0).val(), $(this).next().children().eq(0).children().eq(1).val());
			$(this).css('border-bottom','none');
			$(this).find('.reviewImg').css('display','none');
			$(this).next().css('display','table-row');
			$(this).addClass('more');
		}else{
			$(this).find('.reviewImg').css('display','inline-table');
			$(this).next().css('display','none');
			$(this).removeClass('more');
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
	
});

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
							+ "<span class='reviewGray dated'>&nbsp;&nbsp;&nbsp;("+newDate+")"
					);

					if(value.mNo == mNo){
						$tr.append("<td style='border-bottom:none;'>" +
								"<input type='hidden' value='"+value.rrId+"'>" +
									"<span class='update'>수정</span>" +
									"<span class='delete'>삭제</span>");
					}	
					$replyBody.append($tr);
				});
			}
		},
		error:function(){
			console.log("ajax 통신 실패");
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