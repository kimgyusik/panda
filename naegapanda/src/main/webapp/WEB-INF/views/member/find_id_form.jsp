<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="style.css"> 
<link rel="stylesheet" type="text/css" href="resources/style/memberLoginForm.css">
<link rel="stylesheet" type="text/css" href="resources/style/memberLoginContainer.css">   

<title>아이디 찾기</title>
<style>
switch-contents {
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
	
	#size{

	height: 600px;

	width: 600px;

	margin-left:auto;
	margin-right:auto;
	margin:center;
	
	}


#ryan{
	margin-left:auto; margin-right:auto; display:block;
	}
</style>
<!-- 눈 효과 -->
<script src="https://tistory3.daumcdn.net/tistory/941717/skin/images/jquery.min.js" type="text/javascript"></script> 
<script src="https://tistory3.daumcdn.net/tistory/941717/skin/images/snowfall.jquery.js" type="text/javascript"></script>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top" id="size" >
		<div class="w3-container w3-card-4">
			<form action="find_id.do" method="post">
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
			
			
				<div class="w3-center w3-large w3-margin-top">
					<h3>아이디 찾기</h3>
				</div>
				<div>
					<p>
						<label>Email</label>
						<input class="w3-input" type="text" id="email" name="email" required>
					</p>
					<p class="w3-center">
						<button type="submit" id=findBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">find</button>
						<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
					</p>
				</div>
			</form>
		</div>
	</div>
	
	<script src="script.js"></script>
    <script src="resources/js/memberLoginForm.js"></script>
    <script>
     	$(document).ready(function(){
    		$(document).snowfall({deviceorientation : true, round : true, minSize: 1, maxSize:8,  flakeCount : 250});
    	});   	
    	
    </script>
</body>
</html>