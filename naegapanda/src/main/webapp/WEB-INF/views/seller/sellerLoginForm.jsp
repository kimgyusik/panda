<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)session.getAttribute("msg");
	
	String contextPath = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
<meta charset="utf-8">
    <title>Ryan Login</title>
    <link rel="stylesheet" href="style.css"> 
    <link rel="stylesheet" type="text/css" href="resources/style/memberLoginForm.css">
    <link rel="stylesheet" type="text/css" href="resources/style/memberLoginContainer.css">
    

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 눈 효과 -->
<script src="https://tistory3.daumcdn.net/tistory/941717/skin/images/jquery.min.js" type="text/javascript"></script> 
<script src="https://tistory3.daumcdn.net/tistory/941717/skin/images/snowfall.jquery.js" type="text/javascript"></script>

<style>
	 p{
	        text-align: center;
	    }
	    
	    
	    		    body {
		    background: rgb(14, 140, 228);
		}
		
		form {
		    width: 320px;
		    padding: 60px 25px 80px;
		    margin: 50px auto;
		    background: rgb(14, 140, 228);
		    display: flex;
		    flex-direction: column;
		}
		
		/* 라디오버튼 영역 */   
	.switch-contents {
	  padding: 1em;
	  text-align: center;
	}
	input[name="layout"] {
	  display: none;
	}
	label {
	  display: inline-block;
	  margin: 0 1em;
	  font-size: 1.2rem;
	  font-family: 'Open Sans', sans-serif;
	  font-weight: 300;
	  cursor: pointer;
	}
	label:hover {
	  border-bottom: 2px solid #000;
	}
	input[name="layout"]:checked + label {
	  border-bottom: 2px solid #3498db;
	  cursor: default;
	}
	ul {
	  margin: 0;
	  padding: 1em 0 0;
	  list-style: none;
	  text-align: left;
	}
	ul li {
	  min-height: 200px;
	  background: #3498db;
	}
		
</style>
</head>
<body>
    <form action="sLogin.do" method="post"> 
        <svg id="ryan" viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
            <path d="M0,150 C0,65 120,65 120,150" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="ears">
                <path d="M46,32 L46,30 C46,16 26,16 26,30 L26,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(-10,38,24)" />
                <path d="M74,32 L74,30 C74,16 94,16 94,30 L94,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(10,82,24)" />
            </g>
            <circle cx="60" cy="60" r="40" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="eyes">
                <!-- left eye and eyebrow-->
                <line x1="37" x2="50" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="44" cy="55" r="3" fill="#000" />
                <!-- right eye and eyebrow -->
                <line x1="70" x2="83" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="76" cy="55" r="3" fill="#000" />
            </g>
            <g class="muzzle">
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" />
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" stroke="#000" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round" />
                <polygon points="59,63.5,60,63.4,61,63.5,60,65" fill="#000" stroke="#000" stroke-width="5" stroke-linejoin="round" />
            </g>
            <path d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105" fill="#fff" />
        </svg>


		<div class="container">

			<table id="loginTable" style="text-algin: center">
				<tr>
					<td style="display:block"><input type="text" name="sId" id="sId" placeholder="아이디" required></td>
				</tr>
				<tr>
					<td><input type="password" name="sPwd" placeholder="비밀번호" id="sPwd" required></td>
						
				</tr>
				<tr>
					<td colspan="3">
						<p>
							<a href="join.do">회원가입</a> <a href="findSeller.do">아이디/비밀번호찾기</a>
						</p>
						<button type="submit" id="loginBtn">로그인</button>
					</td>
				</tr>
			</table>


	


			<div id="indexBtn" class="center">
				<button type="button" id="visual-btn" onclick="location.href='home.do';">처음으로</button>
			</div>
		</div>






		<script src="script.js"></script>
    <script src="resources/js/memberLoginForm.js"></script>
    <script>
    	$(document).ready(function(){
    		$(document).snowfall({deviceorientation : true, round : true, minSize: 1, maxSize:8,  flakeCount : 250});
    	});
    	
    	
    	$("#loginBtn").click(function(){
    		
    		if($("#sId").val() == ""){
    			alert("아이디를 입력해주세요")
    			$("#sId").focus();
    			return false;
    		}
    		
    		if($("#sPwd").val() == ""){
    			alert("비밀번호를 입력해주세요")
    			$("#sPwd").focus();
    			return false;
    		}
    		
    	});
    	
    	
    	
    	    	
    </script>
</form> 
</body>