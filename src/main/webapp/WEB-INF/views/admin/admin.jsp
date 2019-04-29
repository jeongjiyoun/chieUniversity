<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" Style="background-color: #760023;">

<head>
  <meta charset="UTF-8">
  <title>管理者ログイン</title>

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
          <a href="#" style="height: 10%; width: 100%; text-decoration: none;"> 
           <span class ="loginLogo"> 知恵通信大学 </span>
         </a>
       </div>
       <div style="margin-top: 5%;">
       <form action="adminhome" method="post">
          <div class="coex">
            <input type="text" name = "adminid" value="${Admin.adminid}" placeholder="ユーザID"  maxlength ="20"  required="required"/>
            <input type="password" name = "password" value="${Admin.password}" placeholder="パスワード" maxlength ="20" required="required" />
            <div class="caution" style="color: #666565">半角英数字で入力ください</div>
      <c:if test="${message != null}">
            <div class = "message" id ="mesDiv">${message}</div>
            </c:if>
            <c:if test = "${message == null }"> 
            <div class = "message haveText"></div>
            </c:if>
            <input type="submit" value="ログイン" style="margin-bottom:7px;background-color: #760023;text-align: center;color: white;">
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
</body>
</html>