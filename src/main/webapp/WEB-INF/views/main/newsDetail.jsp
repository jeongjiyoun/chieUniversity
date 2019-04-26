<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>${newsDetail.TITLE}</title>
  <!-- bootstrap -->
  <link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">
  
  <link rel="stylesheet" type="text/css"
  href="<c:url value="/resources/css/introduce.css" />">
  <link href='https://fonts.googleapis.com/earlyaccess/notosansjp.css'
  rel='stylesheet' type='text/css'>
  <script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>

</head>
<body style="overflow: auto">

  <header class ="header small">
    <div class="navigation">
      <ol>
        <li><a href="introduce">大学紹介 </a> </li>
        <li><a href="applyInfo"> 入学案内 </a></li>
        <a href="goHome"><img src="<c:url value="/resources/img/logo.png" />" width="6%" height="6%"></a>
        <li><a href="department"> 学部紹介 </a> </li>
        <li><a href="goTotNotice"> お知らせ </a> </li>
      	<a href="login" style="position : absolute; left :90%; top:6px;">login<img src="<c:url value="/resources/img/lock.png"/>" width="4%" height="4%" style="width:61px;"></a>
      </ol>
    </div>
  </header>
  
  <br><br><br><br>
  <br><br><br><br>
  <div class="contents-main">
  <div class="content1">
  <div class="haha"></div>
   <p class="text1">お知らせ</p>
   <br>
   <p class="text3">
   	${newsDetail.TITLE}
   </p>
   <hr>
	<pre style="font-size: 1.3rem;width: 80%; line-height: 45px; white-space: pre-wrap;"> ${newsDetail.CONTENTS}</pre>
	<button class="btn btn-lg" style="background-color: #212529; color: white; font-size: 0.6rem; padding: 7px;
	 padding-left: 20px; border-radius: 2px; padding-right: 20px; left: 50%;
	      position: absolute; transform: translateX(-50%); margin-top: 30px;">一覧へ戻る</button>
  </div>
  </div>
  <script type="text/javascript">
   $(function(){
	 $(".btn.btn-lg").on("click",goback);
   })
   
   function goback(){
	   location.href="/goTotNotice"
   }
  </script>
</body>
</html>