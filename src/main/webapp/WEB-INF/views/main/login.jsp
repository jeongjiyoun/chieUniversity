<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>サイバー講義室へ</title>

  <link rel="stylesheet" href="/resources/css/loginstyle.css">

  <!-- Jquery -->
  <script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>
  
  <!-- font -->
  <link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">

  <style type="text/css">
    .coex{
      padding-bottom:40px;
    }
  </style>
</head>

<body>
  <div class = "containner">
    <div class = "leftPane">
      <div class="cont">
        <div>
          <a href="goHome" style="height: 10%; width: 100%; text-decoration: none;"> 
           <span class ="loginLogo"> 知恵通信大学 </span>
         </a>
       </div>
       <div style="margin-top: 5%;">
        <form action="login" method="post" id="loginForm">
          <div class="coex">
            <input type="text" id="userId" name = "userId" placeholder="ユーザID" maxlength ="20" required="required"/>
            <input type="password" id="userPw" name = "userPw" placeholder="パスワード" maxlength ="20" required="required" />
            <div class="caution" style="color: #666565">半角英数字で入力ください</div>
			<c:if test="${message != null}">
            <div class = "message" id ="mesDiv">${message}</div>
            </c:if>
            <c:if test = "${message == null }">
            <div class = "message haveText"></div>
            </c:if>
            <button type="button" id="login" class="submit" style="margin-bottom: 7px;">ログイン</button>
            <button type="button" id="faceLogin" class="submit" style="margin-top: 7px;">顔面認識でログイン</button>
            <span class = "caution"><a href="javascript:idFind()">ユーザID / パスワード</a>を忘れた場合</span>
          </div>
        </form>
      </div>
    </div>
    <div style="position: absolute;
    left: 36%;
    top: 5%;
    background-color : transparent;
    height: 100px;
    width: 100px;">
    <img src="/resources/img/logo.jpg" style="width: 100%; height: 100%;">
    </div>
  </div>
  <div class = "rightPane">
    <img src="/resources/img/loginImg.jpg" style="z-index: -1; height: 727.8px; float: right">
  </div>
</div>

<script type="text/javascript">
  var idreg = /^[0-9]{10}$/
  var pwreg = /^(((?=.*[a-z])(?=.*[A-Z])(?=.*[\d]))|((?=.*[a-z])(?=.*[\W])(?=.*[\d]))|((?=.*[A-Z])(?=.*[\W])(?=.*[\d]))|((?=.*[a-z])(?=.*[A-Z])(?=.*[\W])))([A-Za-z\d\W]{6,20})$/
  var sreginum = null;
  $(function() {
    $("#login").on("click", logincheck);
    $("#faceLogin").on("click", faceLogin);
  });
  
  function idFind(){
	  $("#loginForm").html("");
	  var cont = "<div class='coex'>";
	  cont += "<input type='email' id='email' name = 'email' placeholder='メールアドレス' maxlength ='40' required='required'/>";
      cont += "<input type='text' id='userName' placeholder ='氏名' />"      
      cont += "<div class='caution' style='color: #666565'>半角英数字で入力ください</div>"
      cont += "<div class = 'message haveText'></div>"
      cont += "<button type='button' id='goIdFind' class='submit' style='margin-bottom: 7px;'>本人確認へ進む</button>"
      cont += "<button type='button' id='refresh' class='submit' style='margin-top: 7px;'>ログインへ戻る</button>"
      cont += "</div>"
      
      $("#loginForm").html(cont);
      $("#goIdFind").on("click", goIdFind);
      $("#refresh").on("click", refresh);
  }
  
  function goIdFind(){
	  var email = $("#email").val();
	  var userName = $("#userName").val();
	  
	  $.ajax({
	         url : 'idFind',
	         type : 'POST',
	         data : { 
	        	 "email" : email,
	        	 "userName" : userName
	        	 },
	         success : function(result) {
	        	 if (result != null && result.length>7) {
	        		  $("#loginForm").html("");
	        		  var cont = "<div class='coex'>";
	        		  cont += "<input type='text' id='sreginum' name = 'sreginum' value='ユーザーID　　"+result+"' readonly='readonly'/>";
	        	      cont += "<div class='caution' style='color: #666565'>半角英数字で入力ください</div>"
	        	      cont += "<div class = 'message haveText'></div>"
	        	      cont += "<button type='button' id='goPwFind' class='submit' style='margin-bottom: 7px;'>パスワードを探す</button>"
	        	      cont += "<button type='button' id='refresh' class='submit' style='margin-top: 7px;'>ログインへ戻る</button>"
	        	      cont += "</div>"
	        	  sreginum = result;
	              $("#loginForm").html(cont);
                  $("#refresh").on("click", refresh);
	        	  $("#goPwFind").on("click", goPwFind);	
				} else {
					idFind();
					$(".message.haveText").html("情報に誤りがあるか、登録されていません");
				}
	         }
      });
  }
  
  function goPwFind(){
	  $("#loginForm").html("");
	  var cont = "<div class='coex'>";
	  cont += "ユーザー情報を見つけました。パスワード変更をお手伝いします。"
	  cont += "<input type='text' id='pw1' placeholder ='パスワード'/>";
      cont += "<input type='text' id='pw2' placeholder ='パスワード確認' />"
      cont += "<div class='caution' style='color: #666565'>半角英数字で入力ください</div>"
      cont += "<div class = 'message haveText'></div>"
      cont += "<button type='button' id='updatePw' class='submit' style='margin-bottom: 7px;'>パスワード変更</button>"
      cont += "<button type='button' id='refresh' class='submit' style='margin-top: 7px;'>ログインへ戻る</button>"
      cont += "</div>"
      
      $("#loginForm").html(cont);
      $("#refresh").on("click", refresh);
	  $("#updatePw").on("click", updatePw);	
  }
  
  function updatePw(){
	 var pw1 = $("#pw1").val();
	 var pw2 = $("#pw2").val();
	 if (!pwreg.test(pw1)) {
	   $(".message.haveText").html("特殊文字と半角英大小字と数字で3つ混ざって6～10字でください")
	   return false;
	} else if (pw1 == pw2) {
		$.ajax({
	         url : 'updatePw',
	         type : 'POST',
	         data : { 
	        	 "password" : pw1,
	        	 "sreginum" : sreginum
	        	 },
	         success : function(result) {
	        	 if (result != null) {
	        		  $("#loginForm").html("");
	        		  var cont = "<div class='coex'>";
	        		  cont += "変更完了です。ログインしてください";
	        	      cont += "<button type='button' id='refresh' class='submit' style='margin-top: 7px;'>ログインへ戻る</button>"
	        	      cont += "</div>"
	        		  
	             $("#loginForm").html(cont);
                 $("#refresh").on("click", refresh);
				} else {
					goPwFind();
					$(".message.haveText").html("もう一度試みてください");
				}
	         }
     });
	} else {
	    $(".message.haveText").html("二つのパスワードが合致しないです");
	}
  }
  function refresh(){
	  $("#loginForm").html("");

	  var cont = "<div class='coex'>";
      	  cont += "<input type='text' id='userId' name = 'userId' placeholder='ユーザID' maxlength ='20' required='required'/>";
      	  cont += "<input type='password' id='userPw' name = 'userPw' placeholder='パスワード' maxlength ='20' required='required' />";
       	  cont += "<div class='caution' style='color: #666565'>半角英数字で入力ください</div>";
       	  cont += "<div class = 'message' id ='mesDiv'>${message}</div>";
       	  cont += "<button type='button' id='login' class='submit' style='margin-bottom: 7px;'>ログイン</button>";
       	  cont += "<button type='button' id='faceLogin' class='submit' style='margin-top: 7px;'>顔面認識でログイン</button>";
       	  cont += "<span class = 'caution'><a href='javascript:idFind()'>ユーザID / パスワード</a>を忘れた場合</span>"
    	  cont += "</div>"

      $("#loginForm").html(cont);
      $("#login").on("click", logincheck);
      $("#faceLogin").on("click", faceLogin);
    	  
  }

  function logincheck() {
	$(".message.haveText").html("");
	var userId = document.getElementById("userId").value;
    var userPw = document.getElementById("userPw").value;
    if (!idreg.test(userId)) {
      $(".message.haveText").text("学籍番号を確認してください");
    } else if (!pwreg.test(userPw)) {
      $(".message.haveText").html("暗証番号を確認してください")
    } else {
      $("#loginForm").submit();
    }
  }
  
  function faceLogin(){
	  location.href="/faceLogin";
  }
  
</script>

</body>

</html>
