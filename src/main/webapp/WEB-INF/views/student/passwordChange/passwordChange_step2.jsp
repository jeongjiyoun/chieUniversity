<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta name="viewport"
  content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- 900ｘ560 -->
  <title>パスワード変更案内ウィンドウズ</title>

  <!-- font -->
  <link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">

  <!-- Bootstrap css -->
  <link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">

  <!-- Jquery -->
  <script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>

  <!-- Main CSS *-->
  <link href="<c:url value="/resources/css/consult.css"/>" rel="stylesheet" media="all">

  <!-- 기타 Css -->
  <link href="<c:url value="/resources/css/boardCss.css" />" rel="stylesheet" type="text/css">

</head>
<body>
  <div class="container-fluid">
    <header>
      <div class="d-none d-lg-block" id="fix-titleC">
        <img id="logoCen" src="<c:url value="/resources/img/logo.png" />">
      </div>
    </header>
    <div class="row">
      <div class="col-sm-10 offset-sm-1" id="hiddenright">
        <div class="table-responsive">
        <h2 style="border-bottom: 2px solid #61A7D0; padding-bottom: 10px;">パスワード変更</h2>
        <div style="margin-top: 5px; border: 1px solid #ddd;">
<div id="container">
    	<form name="loginform" method="post">
	        <div class="contents pas2">
	            <div class="txt2">下記本人確認手段の中一つを選択し,認証してください。
		            <div class="stxt">
		            	<span class="u_txt_big"><span style="width: 10px; height : 10px;"></span>現在の統合パスワードで本人確認</span>
		            		<div class="c_pw2">
			                    <input name="pw" class= "pwInput" type="password" placeholder="現在の統合パスワード" id="pw">
								<button type="button" class= "btn-admit" id="pwPass">認証</button>
		                    </div>
		            </div>
		            <c:if test="${sessionScope.userType == 'S' }">
		            <span class="stxt"><span class="u_txt_big">顔面認識で確認</span>
		            <br>
		                <span class="c_pw2">
		                    <input name="sname" class= "pwInput" type="text" placeholder="名前" id="snameIn">
							<button type="button" class= "btn-admit" id="faceLogin" style="margin-top: 15px;">認識ページへ</button>
		                </span>
		            </span>
		            <span style="color: red; margin-left: 30px;" id="message"></span>
	            	</c:if>
	            </div>
	        </div>
	        <div class="btn_area">
	            <button type="button" class="btn_next">取り消す</button>
	        </div>           
        </form>
    </div>

        </div>
    </div>
  </div>
</div>
</div>

<div style="visibility: hidden;">
  <video id="myface" width="350" height="210" autoplay=""></video>
  <canvas id="canvasFC" width="350" height="260"></canvas>
</div>

<script type="text/javascript">


  $(function(){
    $("#pwPass").on("click",pwCheck);
    $("#faceLogin").on("click",nameCheck);
    $(".btn_next").on("click",btnExit);
  });

  function btnExit(){
	alert("パスワード変更を取り消します");
    self.close();
  }

  function pwCheck(){
	  $("#message").html("");
	  var password = $("#pw").val();

	  $.ajax({
	       url : 'pwCheck',
	       data : {
		       "password" : password
	       },
	       type : 'POST',
	       success : function(result) {
		       if(result){
	 			 location.href="passwordChange_step3"
		       } else {
			     $("#message").html("情報を確認してください。");
			   }
	       }
	     });
  }

  function nameCheck(){
	 $("#message").html("");
	 var userName = $("#snameIn").val();
	 
   if (userName.length>1) {   
     camready();
   } else {
     $("#message").text("名前を入力してください");
   }
 }
 
 function camready(){
  navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia;
  const videoEl = document.getElementById('myface');
  const canvasEl = document.getElementById('canvasFC');
  const width = 350;
  const height = 210;

  //캠 허가를 받을 경우
  function success(stream) {
    videoEl.srcObject = stream;
    capture();
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
    var context = canvasEl.getContext('2d');
    context.drawImage(videoEl, 0, 0, width, height);
    submitImage(canvasEl.toDataURL('image/png',1.0));	
    count++;
  }

     // 캡쳐한 이미지를 서버로 보냄.
   function submitImage(imageData) {
		 var userName = $("#snameIn").val();
       $.ajax({
         url : 'faceLogin',
         data : { 
        	 "name" : userName,
        	 "strImg" : imageData
        	 },
         type : 'POST',
         success : function(result) {
           if(!(result == 'False')){
			 location.href="/passwordChange_step3";
           } else {
        	  $("#message").text("顔面認識に失敗しました。やり直してください");
           }
         }
       });
     }
 }
  
</script>

</body>
</html>
