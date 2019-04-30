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

		<div id="container">
	        <div style="margin-top: 5px; border: 1px solid #ddd;">
	    		<form name="loginform" method="post">
		        <div class="contents pas2">
		            <div class="txt2">変更するパスワードを入力してください
			            <div class="stxt" style="height: 190px;">
			            	<span class="u_txt_big"><span style="width: 10px; height : 10px;"></span>新しいパスワードに変更</span>
			            		<div class="c_pw2">
				                    <input name="pw" class= "pwInput" type="password" placeholder="変更するパスワード" id="pw1">
			                    <input name="pw2" class= "pwInput" type="password" placeholder="パスワード確認" id="pw2">
								<button type="button" class= "btn-admit" id="pwchange">パスワード変更</button>
			                    </div>
			                    <span style="float: right; font-size: 1rem; margin-right: 209px;">特殊文字と半角英大小字と数字で3つ混ざって6～10字でください</span>
		           	 </div>
			            <span style="color: red; margin-left: 30px;" id="message"></span>
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

<script type="text/javascript">
  var pwreg = /^(((?=.*[a-z])(?=.*[A-Z])(?=.*[\d]))|((?=.*[a-z])(?=.*[\W])(?=.*[\d]))|((?=.*[A-Z])(?=.*[\W])(?=.*[\d]))|((?=.*[a-z])(?=.*[A-Z])(?=.*[\W])))([A-Za-z\d\W]{6,20})$/
  
  $(function(){
    $("#pwchange").on("click",pwchange);
    $(".btn_next").on("click",btnExit);
  });

  function btnExit(){
	alert("パスワード変更を取り消します");
    self.close();
  }

  function pwchange(){
	  var password = $("#pw1").val();
	  var pw2 = $("#pw2").val();
	  
	  if (pwreg.test(pw1)) {
		   $("#message").html("パスワードの規則に当てはめて入力してください。")
		   return false;
	  }

	  if(password == pw2){
		  $.ajax({
		       url : 'pwChange',
		       data : {
		    	   "password" : password
		       },
		       type : 'POST',
		       success : function(result) {
			       if(result){
		 			 alert("変更完了しました。ありがとうございます。");
		 			 self.close();
			       }
		       }
		     });
	  } else {
		$("#message").html("パスワードが合致していません");  
	  }
  }

</script>

</body>
</html>
