<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Hi+Melody&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/style/myPage.css">
<link rel="stylesheet" href="path/css/font-awesome.min.css">


<title>마이페이지</title>
<!-- 아이콘 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 눈 효과 -->
<script src="https://tistory3.daumcdn.net/tistory/941717/skin/images/jquery.min.js" type="text/javascript"></script> 
<script src="https://tistory3.daumcdn.net/tistory/941717/skin/images/snowfall.jquery.js" type="text/javascript"></script>

<style>


	#name{
	font-family: 'Hi Melody', cursive;
	color:#000000;
	}


	.outer{
	font-family: 'Hi Melody', cursive;
	color:#000000;
	font-size:1.5em;
	}

	
	a{
	font-size : larger;
	}
	p{
	text-align: center;
	}
	    
	    
	  /*   		    body {
		    background: rgb(14, 140, 228);
		}
		 */

		
		/* 라디오버튼 영역 */   

	
	/* #loginTable{
	font-size: inherit ;
	} */
	
		#visual-btn {
		z-index: 50;
		color: #000000;
		font-size: 14px;
		border: 2px solid #0100FF;
		padding: 12px 24px;
		border-radius: 5px;
		cursor: pointer;
		background-color: rgba(0, 0, 0, 0);
	}
	
	#visual-btn:hover {
		color: #000000;
		font-size: 17px;
		border: 2px solid #FFE400;
		padding: 12px 24px;
		border-radius: 5px;
		cursor: pointer;
	}









	

	
	
	}
	.form-control{
		width:400px !important; 
	}
	
		.outer{
		width:900px;
		height: 1250px;
		margin-left: auto;
		margin-right: auto;
		margin: center;
		margin-top:5px; 
	}
	
	#success_message{ display: none;}
	
	
	
	

#post_search_btn,#visual-btn{
  text-align:center;
}
#post_search_btn, #visual-btn:before{
  content:'';
  height:100%;
  display:inline-block;
  vertical-align:middle;
}
#post_search_btn{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:45px;
  font-size:0.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
#post_search_btn, #visual-btn:hover{
  background:#fff;
  color:#1AAB8A;
}
#post_search_btn:before,#post_search_btn:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
#post_search_btn:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
#post_search_btn:hover:before,#post_search_btn:hover:after{
  width:100%;
  transition:800ms ease all;
}

	
	
/* 	body {

		background-color:#00ccff;
		
	} */
</style>

</head>
<body>

<div class="tuna"></div>


	<h1 id="name" align="center">${ loginUser.name }님의 가입정보 입니다.</h1>
	<h6 style ="text-align:center;">이름과 아이디는 변경이 안됩니다. 관련 문의는 관리자에게 주세요.</h6>
	
	<div  class="outer" align="center">
		<form action="mupdate.do" method="post">
			<div class="container">

    <!-- <form class="well form-horizontal" action=" " method="post"  id="contact_form"> -->
<fieldset>

<!-- Form Name -->
<legend>Contact Us Today!</legend>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label"><i class="far fa-address-card"></i> 가입한 아이디와 성함입니다.*</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input type="text" class="form-control" name="id" id="userId" style ="text-align:center;" value="${ loginUser.id }" readonly>
  <input type="text" name="name" style ="text-align:center;" value="${ loginUser.name }" readonly>
    </div>
  </div>
</div>
<br>
<!-- Text input-->

<%-- <div class="form-group">
  <label class="col-md-4 control-label" >이름 *</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input type="text" name="name" style ="text-align:center;" value="${ loginUser.name }" readonly>
    </div>
  </div>
</div> --%>

<!-- Text input-->
       <div class="form-group">
  <label class="col-md-4 control-label"><i class="fas fa-address-book"></i> E-Mail과 연락처입니다.</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <input type="email" name="email" style ="text-align:center;" value="${ loginUser.email }">
  <input type="tel" name="phone" style ="text-align:center;" maxLength="11" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${ loginUser.phone }">
    </div>
  </div>
</div>
<br>

<!-- Text input-->
       
<%-- <div class="form-group">
  <label class="col-md-4 control-label">Phone #</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
  <input type="tel" name="phone" style ="text-align:center;" value="${ loginUser.phone }">
    </div>
  </div>
</div>
 --%>
 
 <!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label"><i class="fas fa-search"></i> Age</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
  <input type="date" max="9999-12-31" name="birthDate" value="${ loginUser.birthDate }">
    </div>
</div>
</div>
<br>
<!-- Text input-->
 
   
  <div class="form-group">
  <label class="col-md-4 control-label"><i class="fas fa-map-marked-alt"></i> Address</label>  
    
   
        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
        <c:if test="${ empty loginUser.address }">  
        <button type="button" id="post_search_btn">검색</button>
        <br>
 		<input type="text" name="post" size="6" class="postcodify_postcode5">
		<br>
		<input type="text" name="address1" class="postcodify_address">
		<br>
		<input type="text" name="address2" class="postcodify_extra_info">
		</c:if>
		<c:if test="${ !empty loginUser.address }">
					<c:forTokens items="${ loginUser.address }" delims="," var="addr" varStatus="status">
						<c:if test="${ status.index eq 0 }">
		<br>
			<input type="text" name="post" size="6" value="${ addr }" class="postcodify_postcode5">
			<button type="button" id="post_search_btn">검색</button>
		</c:if>
						<c:if test="${ status.index eq 1 }">
						<input type="text" name="address1" value="${ addr }"  class="postcodify_address">
						</c:if>
						<c:if test="${ status.index eq 2 }">
						<input type="text" name="address2" value="${ addr }"  class="postcodify_extra_info">
						</c:if>
					</c:forTokens>
				</c:if>				
   
  
</div>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<script>
					$(function(){
						// 검색 버튼 누르면 팝업 레이어가 열리도록 설정
						$("#post_search_btn").postcodifyPopUp();
					});
	</script>
<!-- Text input-->
 







<!-- radio checks -->
<br>
				<a><i class="fas fa-venus-mars"></i> 성별</a>
					<c:choose>
						<c:when test="${ loginUser.gender eq 'M' }">
								<input type="radio" name="gender" value="M" checked> 남 
								<input type="radio" name="gender" value="F"> 여
						</c:when>
						<c:when test="${ loginUser.gender eq 'F' }">
								<input type="radio" name="gender" value="M"> 남 
								<input type="radio" name="gender" value="F" checked> 여
						</c:when>
						<c:otherwise>
								<input type="radio" name="gender" value="M"> 남 
								<input type="radio" name="gender" value="F"> 여
						</c:otherwise>
					</c:choose>
<!-- Text area -->
 
  <br>  <br> 
						<button type="submit" id="visual-btn" >수정하기</button> 
						<c:url var="mdelete" value="mdelete.do">
							<c:param name="id" value="${ loginUser.id }"/>
						</c:url>
						
						<button type="button" id="visual-btn" onclick="location.href='change.do';">비밀번호 변경</button>
						<button type="button" id="visual-btn" onclick="location.href='${mdelete}';">탈퇴하기</button> 
						<p>
						<button type="reset" id="visual-btn">취소하기</button>
						<button type="button" id="visual-btn" onclick="location.href='home.do';">처음으로</button>
</fieldset>
</form>
</div>
	

 	<script>
     	$(document).ready(function(){
    		$(document).snowfall({deviceorientation : true, round : true, minSize: 1, maxSize:8,  flakeCount : 250});
    	});   	
    	
    </script>
    </div>
    <script>
    $(document).ready(function() {
        $('#contact_form').bootstrapValidator({
            // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                first_name: {
                    validators: {
                            stringLength: {
                            min: 2,
                        },
                            notEmpty: {
                            message: 'Please supply your first name'
                        }
                    }
                },
          /*        last_name: {
                    validators: {
                         stringLength: {
                            min: 2,
                        },
                        notEmpty: {
                            message: 'Please supply your last name'
                        }
                    }
                }, */
                email: {
                    validators: {
                        notEmpty: {
                            message: 'Please supply your email address'
                        },
                        emailAddress: {
                            message: 'Please supply a valid email address'
                        }
                    }
                },
                /* phone: {
                    validators: {
                        notEmpty: {
                            message: 'Please supply your phone number'
                        },
                        phone: {
                            country: 'US',
                            message: 'Please supply a vaild phone number with area code'
                        }
                    }
                }, */
                address: {
                    validators: {
                         stringLength: {
                            min: 8,
                        },
                        notEmpty: {
                            message: 'Please supply your street address'
                        }
                    }
                },
                
             
                zip: {
                    validators: {
                        notEmpty: {
                            message: 'Please supply your zip code'
                        },
                        zipCode: {
                            country: 'US',
                            message: 'Please supply a vaild zip code'
                        }
                    }
                },
                comment: {
                    validators: {
                          stringLength: {
                            min: 10,
                            max: 200,
                            message:'Please enter at least 10 characters and no more than 200'
                        },
                        notEmpty: {
                            message: 'Please supply a description of your project'
                        }
                        }
                    }
                }
            })
            .on('success.form.bv', function(e) {
                $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
                    $('#contact_form').data('bootstrapValidator').resetForm();

                // Prevent form submission
                e.preventDefault();

                // Get the form instance
                var $form = $(e.target);

                // Get the BootstrapValidator instance
                var bv = $form.data('bootstrapValidator');

                // Use Ajax to submit form data
                $.post($form.attr('action'), $form.serialize(), function(result) {
                    console.log(result);
                }, 'json');
            });
    });
    
    </script>
    
</body>
</html>









