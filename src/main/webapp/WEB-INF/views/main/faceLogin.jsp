<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>ログイン</title>

  <link rel="stylesheet" href="/resources/css/loginstyle.css">

  <!-- Jquery -->
  <script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>
  
  <!-- font -->
  <link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">

</head>

<body>
  <div class = "containner">

    <div class = "leftPane">
      <div class="cont">
        <div>
          <a href="#" style="height: 10%; width: 100%; text-decoration: none;"> 
           <span class ="loginLogo"> 知恵通信大学 </span>
         </a>
       </div>
       <div id = "change" style="margin-top: 5%;">
	        <input type="text" id="userName" placeholder="名前" maxlength ="20" required="required"/>
	     	<div class = "message haveText"></div>
	    	<button type="button" id="faceLogin" class="submit" style="margin-bottom: 7px;">顔面認識でログイン</button>            
	    	<button type="button" id="gologin" class="submit" style="margin-bottom: 7px; margin-top: 5px;">ログインに戻る</button>
  	   </div>
	  <div style="visibility: hidden;">
	    <video id="myface" width="350" height="210" autoplay=""></video>
	    <canvas id="canvasFC" width="350" height="260"></canvas>
	  </div>
</div>
<div style="position: absolute; left: 36%; top: 5%; background-color : transparent; height: 100px; width: 100px;">
<img src="/resources/img/logo.jpg" style="width: 100%; height: 100%;">
</div>
</div>
    <div class = "rightPane">
      <img src="/resources/img/faceLogin.jpg" style="z-index: -1; height: 727.8px; float: right; width: 100%;">
    </div>
</div>

<script type="text/javascript">
  var count =1;
  function gologin(){
    location.href="/login";
  }
  
  $( document ).ready(function() {
    $("#gologin").on("click",gologin);
    $("#faceLogin").on("click",nameCheck);  
  });
  
  function nameCheck(){
     var userName = $("#userName").val();
     $(".message.haveText").text("");
   if (userName.length>1) {   
     camready();
   } else {
     $(".message.haveText").text("名前を入力してください");
   }
 }
 
 function camready(){
  navigator.getUserMedia = navigator.getUserMedia ||
  navigator.webkitGetUserMedia || navigator.mozGetUserMedia;
  const videoEl = document.getElementById('myface');
  const canvasEl = document.getElementById('canvasFC');
  const width = 350;
  const height = 210;

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
    capture();
  }
  initialize();

  //비디오 이미지를 캔버스로 그림
  function capture() {
   var context = canvasEl.getContext('2d');
   context.drawImage(videoEl, 0, 0, width, height);
	 if (count == 2) {
	   submitImage(canvasEl.toDataURL('image/png',1.0));	
	}
	 count++;
 }

     // 캡쳐한 이미지를 서버로 보냄.
   function submitImage(imageData) {
    	 var name = $("#userName").val();
       $.ajax({
         url : 'faceLogin',
         data : { 
        	 "name" : name,
        	 "strImg" : imageData
        	 },
         type : 'POST',
         success : function(result) {
        	 
           if(!(result == 'Fail')){
  			 $("#change").html("");
  			 var cont = "<input type='text' id='userId' value='学生番号　"+ result +"' readonly='readonly'/>"
			 cont += "<input type='text' id='userName' readonly='readonly' value = ' 氏　名　 " + name + "'/>"
			 cont += "<button type='button' id='loginbtn' class='submit' style='margin-bottom: 7px;'>この情報でログイン</button>"
		     cont += "<button type='button' id='cancelbtn' class='submit' style='margin-bottom: 7px;'>私の情報ではないです</button>"
			 $("#change").html(cont);
			 $("#loginbtn").on("click", goMyPage);
			 $("#cancelbtn").on("click", cancelbtn);			 
           } else {
        	  $(".message.haveText").text("顔面認識に失敗しました。やり直してください");
           }
         }
       });
     }
     
     function cancelbtn(){
    	 location.href="/backLogin";
     }
     
     function goMyPage(){
    	 location.href="/MyPage";
     }
   }
 </script>

</body>

</html>
