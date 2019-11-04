<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" href="resources/pandaicon.ico">
<title>PANDA:스트리밍</title>
 <link href="resources/style/style.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

<style>
  #outgoing {
    width: 600px;
    word-wrap: break-word;
    white-space: normal;
  }
</style>
</head>
<body>
 	<div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <div id="content">
            <div class="container-fluid">

                <!-- Page Heading -->
                <!-- <h4 class="font-weight-bold">How to use</h4>
                <li>Open this <a href="./castList.html" target="_blank">link</a> in another tab or a browser. To join the channel you created,
                    click on the channel name from the channel list.
                </li> -->
               

                <!-- Content Row -->
                <div class="row">
                    <div class="col-xl-4 col-lg-5" style="display:none;">
                        <div class="card shadow mb-4"> 
                            <!-- Card Header - Dropdown -->
                             <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">Channels</h6>
                            </div> 
                            <!-- Card Body -->
                            <div class="card-body">
                                <main id="lvChannel" class="text-center">
                                </main>
                            </div>
                        </div>
                    </div> 
                    <div class="col-xl-8 col-lg-7">
                        <div class="card shadow mb-4">
                            <!-- <!-- Card Header - Dropdown -->
                          <!--   <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" >
                                <h6 class="m-0 font-weight-bold text-primary">My Channel</h6>
                            </div>  -->
                            <!-- Card Body -->
                            <div class="card-body">
                                <main class="text-center">
                                    <video id="localVideo" class="remote-video center w-300 h-300" autoplay controls playsinline
                                           style="z-index:1;background: rgba(0, 0, 0, 0.5); width: 100%;"></video>
                                    <h6 id="waitingTv" class="m-0 font-weight-bold text-primary"
                                        style="z-index:3; position: absolute;bottom: 55px;right:45px; visibility: hidden;">
                                        waiting</h6>

                                     <input id="channelNameInput" class="form-control text-center" type="hidden"
                                        value="${p.pId }" autofocus>
                                     <c:if test="${!empty loginSeller }">
	                                    <c:if test="${loginSeller.sNo eq p.sNo}">
	                                    <a id="channelBtn" href="#"
	                                    class="btn btn-primary btn-user btn-block text-center">
	                                        방송시작하기
	                                    </a>
                                    	</c:if>
                                    </c:if>
                                   	 <c:if test="${empty loginSeller or empty loginMember}">
                                    	 <div style="display:none">
	                                    <a id="channelBtn" href="#"
	                                    class="btn btn-primary btn-user btn-block text-center">
	                                        방송시작하기
	                                    </a>
	                                    </div>
                                   
                                   	</c:if>
                                </main>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
            <!-- The webrtc adapter is required for browser compatibility -->
            <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@remotemonster/sdk@2.4.20/remon.min.js"></script>

            <script>
            var pId = ${p.pId}+"";
            var sNo = -1;
            var flag = 0;
            var psNo = ${p.sNo};
            var seller = ${loginSeller.sNo};
const channelBtnEl = document.querySelector('#channelBtn');
const channelList = document.getElementById("lvChannel");
const channelNameInput = document.getElementById("channelNameInput");
const waitingTv = document.getElementById("waitingTv");
let isConnected = false;
let isCaster = false;
let remon;
const key = '1234567890';
const serviceId = 'SERVICEID1';
let myChannelId;
var waitingLoop;
createDummyRemonForSearchLoop();
//startSearchLoop();
// please register your own service key from remotemonster site.
const config = {
    credential: {
        key, serviceId
    },
    view: {
        remote: '#remoteVideo',
        local: '#localVideo'
    }
};
const listener = {
    onConnect(chid) {
        console.log(`EVENT FIRED: onConnect: ${chid}`);
    },
    onComplete() {
        console.log('EVENT FIRED: onComplete');
        setViewsViaParameters(false, 'hidden', 'CLOSE', 'hidden');
    },
    onDisconnectChannel() {
        // is called when other peer hang up.
        remon.close();
        isConnected = false;
        setViewsViaParameters(false, 'hidden', 'CREATE', 'visible');
    },
    onClose() {
        // is called when remon.close() method is called.
        console.log('EVENT FIRED: onClose');
        remon.close();
        isConnected = false;
        myChannelId = "";
        setViewsViaParameters(false, 'hidden', 'CREATE', 'visible');
    },
    onError(error) {
        console.log(`EVENT FIRED: onError: ${error}`);
    },
    onStat(result) {
        console.log(`EVENT FIRED: onStat: ${result}`);
    }
};
function setViewsViaParameters(runWaitLoop, waitingTvVisibility, btnText, inputVisiblility) {
    if (runWaitLoop) {
        waitingMsgLoop();
    } else {
        clearInterval(waitingLoop);
    }
    waitingTv.style.visibility = waitingTvVisibility;
    channelBtnEl.innerHTML = "종료하기";
    channelNameInput.style.visibility = inputVisiblility;
    
}
function start(isViewer) {
    if (isConnected) {
        isConnected = false;
        isCaster = false;
        setViewsViaParameters(false, 'hidden', 'CREATE', 'visible');
        remon.close();
        myChannelId = "";
        alert("방송이 종료됐습니다. 메인화면으로 이동합니다.");
        location.href="stopStreaming.do?pId="+pId;
    } else {
        isConnected = true;
        isCaster = !isViewer;
        setViewsViaParameters(true, 'visible', 'CLOSE', 'hidden');
        if (!isCaster) {
            config.view.remote = '#localVideo';
        }
        remon = new Remon({config, listener});
        myChannelId = channelNameInput.value ? channelNameInput.value : getRandomId();
        channelNameInput.value = "";
        isCaster? remon.createCast(myChannelId): remon.joinCast(myChannelId);
       
    }
}
function getRandomId() {
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    for (var i = 0; i < 5; i++)
        text += possible.charAt(Math.floor(Math.random() * possible.length));
    /* return Date.now() + "_" + text; */
    flag = 1;
    return pId;
}
if(channelBtnEl != null){
channelBtnEl.addEventListener('click', (evt) => {
    start(false);
    evt.preventDefault();
}, false);
}

function createDummyRemonForSearchLoop() {
    if (remon) remon.close();
    let cfg = {
        credential: {key: key, serviceId: serviceId},
        view: {local: '#localVideo1', remote: '#remoteVideo1'},
        media: {audio: false, video: false}
    };
    remon = new Remon({config: cfg});
}
function waitingMsgLoop() {
    var numOfPoint = 0;
    var pointStr = "";
    waitingLoop = setInterval(async function () {
        pointStr = "";
        numOfPoint++;
        if(numOfPoint === 4) numOfPoint = 0;
        for (var i = 0; i < numOfPoint; i++) {
            pointStr += ".";
        }
        waitingTv.innerText = "waiting" + pointStr;
    }, 1000);
}
/*
function startSearchLoop() {
    setInterval(async function () {
        remon.config.credential.serviceId = serviceId;
        remon.config.credential.key = key;
        var searchResult = await remon.fetchCasts();
        while (channelList.firstChild) {
            channelList.removeChild(channelList.firstChild);
        }
        searchResult.forEach((ch, i) => {
            if (ch.status === 'COMPLETE' && ch.id !== myChannelId && !isCaster && ch.name === "1000") {
                var btn = document.createElement("input");
                btn.type = "button";
                btn.name = "1000";
                btn.value = ch.name;
                btn.className = "btn btn-primary btn-user btn-block text-center";
                btn.addEventListener('click', (evt) => {
                    channelNameInput.value = "1000";
                    start(true);
                    evt.preventDefault();
                }, false);
                channelList.appendChild(btn);
            }
        });
    }, 3000);
}*/

function test(){
	 channelNameInput.value = pId;
     start(true);
       /* evt.preventDefault(); */  
}
$(function(){
	if(seller == null){
		setTimeout(test, 1000);
		console.log(pId);
	}
})
            </script>
        </div>

    </div>

</div>

<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<script>
    $(document).ready(function () {
        $("#accordionSidebar").load("nav.html");
    });
</script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-84812645-1"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'UA-84812645-1');
</script>

</html>