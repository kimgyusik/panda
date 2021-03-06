<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/pandaicon.ico">
<title>PANDA:채팅</title>
<style>
	#data{
		display:inline-block;
	}
</style>

<!-- 제이쿼리 cdn -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- sockjs 라이브러리 -->
<script type="text/javascript" src="<c:url value="/resources/js/sockjs-0.3.4.js"/>"></script>

</head>
<body>
<div  style="width:450px;height:500px;">
<div id="data" style="width:450px;height:500px;border:1px solid blue;overflow:auto;">


</div>
<div style="width:450px;align:center">
	<c:choose>
	<c:when test="${!empty loginUser || !empty loginSeller}">
		<input type="text" id="message" style="width:402px;">
		<button id="sendBtn" > 전  송 </button>
	</c:when>
	<c:otherwise>
	<input type="text" id="message" value="로그인 해야 채팅을 할 수 있습니다." style="width:440px;" readonly>
	</c:otherwise>
	</c:choose>
</div>

</div>

<script>

$(document).ready(function() {
    
    $("#sendBtn").on("click", function() {   // 전송 버튼을 누를때

        sendMessage();   // 메소드 실행

    });
    $("#message").keydown(function (key) {   // 메세지 input태그에 키가 눌렸을때
        if (key.keyCode == 13) { // 엔터키면
            sendMessage();   // 메소드 실행
        }
    });
});


var sock;

//웸소켓을 지정한 url로 연결한다.
  sock = new SockJS("<c:url value="/echo"/>");



//자바스크립트 안에 function을 집어넣을 수 있음.

//데이터가 나한테 전달되읐을 때 자동으로 실행되는 function

sock.onmessage = onMessage;


//데이터를 끊고싶을때 실행하는 메소드

sock.onclose = onClose;




sock.onopen = function(){

    sock.send("소켓오픈:" + ${p.pId});

}; 

function sendMessage() {

  if($("#message").val() == ""){   // 메세지 내용이 없으면 실행되는 부분
     
  }else{                     // 메세지 내용이 있으면
       /*소켓으로 보내겠다.  */
       sock.send("메세지:"+ ${p.pId} +":" + $("#message").val());   // 메세지를 소켓에 보내고
       $("#message").val("");         // 메세지 내용을 비운다.
     
  }
    

}

//evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)

function onMessage(evt) {

    var data = evt.data;
  
    $("#data").append(data + "<br/>");
    /* document.body.scrollIntoView(false); */   // 스크롤을 제일 아래로
    $("#data").scrollTop($("#data")[0].scrollHeight);
    //sock.close();

}


function onClose(evt) {
  
    $("#data").append("연결 끊김");

}



</script>



</body>
</html>