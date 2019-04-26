<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>

<!-- Bootstrap css -->
<link
	href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>"
	rel="stylesheet">

<!-- Jquery -->
<script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>

<!-- font -->
<link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css"
	rel="stylesheet">

<link rel="stylesheet" href="<c:url value="resources/css/watch.css"/>">

<!-- 동영상 재생 jwplayer 연결 -->
<script type="text/javascript"
	src="https://cdn.jwplayer.com/libraries/hxrulIIy.js"
	jwplayer.key="Ejt3tNq0WWpEuB2xqE5vgjV1"></script>
<title>${movie.TITLE}</title>
</head>
<!-- <body> -->
<body style="overflow: hidden;">
	<input type="hidden" id="courseSeq" value="${movie.COURSESEQ}">
	<header>
		<div class="margin10">
			<img class="Slogo" src="/resources/img/logo.png"> <span>知恵通信大学</span>
			<span
				style="position: absolute; right: 3%; font-size: 1.38rem; text-align: right">${movie.TITLE}<br>${movie.PNAME}</span>
		</div>
	</header>
	<div class="box-padding-big white-bg">
		<div class="con1" style="margin-left: 7px;">
			<div class="row">
				<div class="col-md-9">
					<!-- 영상 들어가는 부분 -->
					<div id="mediaspace">
						<script type="text/javascript">
          	 	 var linkK = 'http://10.10.15.161/FTP/Video/${movie.FILENAME}.mp4';
	          	  jwplayer('mediaspace').setup({
	          	    'file': linkK,
	          	    'controlbar': 'bottom',
	          	    'height': '609',
	          	    'width': '1146.75'
 	          	  });
          	 	</script>
					</div>
					<div id="checkMessage"
						style="min-height: 100px; bottom: 7px; right: 5px; background-color: #06213F; margin-top: 9.3px;">
					</div>
				</div>
				<div class="col-md-3">
					<div
						style="width: 100%; height: 93%; margin-left: 10px; margin-right: 5px;">
						<div style="width: 96.4%;">
							<iframe src="resources/img/pdf/${movie.FILECONTENTS}"
								style="width: 101%; height: 80%; margin-left: -4px;"> </iframe>
						</div>
						<div
							style="min-height: 100px; height: 10%; right: 5px; background-color: #06213F; position: relative; margin-top: 7px; width: 97.5%;">
							<p
								style="top: 100%; transform: translateY(70%); text-align: center; color: white; font-size: 1.8em;">受講終了</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 출석 인증을 위한 부분 -->
	<div class="two-peace">
		<div>
			<input type="button" id="btn-capture" value="촬영">
		</div>
		<div>
			<video id="myface" width="350" height="260" autoplay=""></video>
		</div>
		<div>
			<canvas id="canvasFC" width="350" height="260"></canvas>
		</div>
	</div>

	<script type="text/javascript">

   var exitTimer = 0;
   var intervalTimer = 0;
   var courseSeq = $("#courseSeq").val();
   var timestart = '${timestart}';
   var type = "first";

   $(function() {
     camready();
     $("#btnExit").on("click",btnExit);
     startCheck();
     startWatch();
   });
   
   function startWatch(){
	capture();
   }

  function camready(){
      navigator.getUserMedia = navigator.getUserMedia ||
      navigator.webkitGetUserMedia || navigator.mozGetUserMedia;
      const videoEl = document.getElementById('myface');
      const canvasEl = document.getElementById('canvasFC');
      const width = 350;
      const height = 260;

  //캠 허가를 받을 경우
  function success(stream) {
    videoEl.srcObject = stream;
  }

  //캠 허가를 받지 못한 경우
  function error(err) {
    alert("カメラ利用権限を許可してください.");
  }

  function initialize() {
    canvasEl.width = width;
    canvasEl.height = height;
    navigator.getUserMedia({ audio: false, video: true }, success, error);
  }
  	initialize();
  
    //비디오 이미지를 캔버스로 그림
    function capture() {
     const context = canvasEl.getContext('2d');
     context.drawImage(videoEl, 0, 0, width, height);
     submitImage(canvasEl.toDataURL('image/png',1.0));
   }

    // 캡쳐한 이미지를 서버로 보냄.
    function submitImage(imageData) {
      $.ajax({
       url : 'canvasUpload',
       data : { "strImg" : imageData,
	      	  "courseseq" : courseSeq,
	     	  "type" : type
       },
       type : 'POST',
       success : function(result) {
         timestart = result;
       }
     });
      type = null;
    }

    function startCheck(){
     intervalTimer = setInterval(function() {
       capture();
     }, 1000*6);
//   }, 1000*60*10);
    }

    function btnExit(){
      checkWatch();
      alert("受講を終了します。");
      self.close();
    }

    function checkWatch(){
  	  $.ajax({
	       url : 'checkWatch',
	       data : {
	    	  	  "timestart" : timestart,
		      	  "courseseq" : courseSeq,
		     	  "type" : type
	       },
	       type : 'POST',
	       success : function(result) {
	    	   timestart = result;
	    	   return result;
	       }
	     });
    }

    function showCheck(){
     var content = "<label style='font-size: xx-large; color : white'>顔面認識に失敗しました。出席確認にご協力お願いします。 &nbsp &nbsp<input type='checkbox' id = 'isWatching'></label>";
     $("#checkMessage").html(content);
     $("#isWatching").change(checkPass);
     exitTimer = setTimeout("btnExit()", 1000*5);
   }

    function checkPass(){
     if ($("#isWatching").is(":checked")) {
       var content = "<label style='font-size: xx-large; color : white'>ありがとうございます。</label>";
       $("#checkMessage").html(content);
       clearTimeout(exitTimer);
       checkWatch();
     }
   }
    
  </script>

</body>
</html>
