<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ApplycantCheck</title>
  <!-- bootstrap -->
<link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">
   <link rel="stylesheet" type="text/css"   href="<c:url value="/resources/css/schoolInfo.css" />">
  <link rel="stylesheet" type="text/css"   href="<c:url value="/resources/css/introduce.css" />">
  <link href='https://fonts.googleapis.com/earlyaccess/notosansjp.css'
  rel='stylesheet' type='text/css'>
  <script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>

<script>
$(function() {
	
$("#checkApplicantB").on("click", checkApplicantPW);

});




function checkApplicantPW(){
	var url ='checkApplicantPW';
	window.open(url,'_blank','height=500, width=500, left=0,top=0',false); 
	}


</script>


</head>
<body style="overflow: auto">
<header class ="header small">
    <div class="navigation">
      <ol>
        <li><a href="introduce"> 大学紹介 </a> </li>
        <li><a class="drop" href="applyInfo"> 入学案内 </a></li>

        <a href="goHome"><img src="<c:url value="/resources/img/logo.png" />" width="6%" height="6%"></a>

        <li><a href="department"> 学部紹介 </a> </li>
        <li><a href="goTotNotice"> お知らせ </a> </li> 
      	<li>
   		<a href="login" style="position : absolute; left :90%; top:6px;">login<img src="<c:url value="/resources/img/lock.png"/>" width="4%" height="4%" style="width:61px;"></a>
      </ol>
    </div>
  </header>
   <div class="contents-main" style="margin-top: 10%;">
   		<div class="haha"></div>
		<p class="text3" style="font-weight: bold">入学申請</p>
		<br>
	<div class="contents-box" style="padding: 20px 20px 0;  border: 5px solid #ededed; text-align: center">
	
	<p style="font-size: 30px;"> 入学申し込みを決めていただいてありがとうございます。</p><br><br>
	<p style="font-size : 20px;">もう入学申請願書を作成した方は"イヤー作成"ボタンを新たに作成する方は新しく作成するボタンを押してください。。</p><br><br>
	<br>
	</div>
	<br>
	<form action="writeApplicant" method="get">
	<button class="bStyle" style="float : center; width : 200px; ">新しく作成</button>
	</form>	
	<button class="bStyle" id="checkApplicantB" style="float : center;  width : 200px;">継続作成</button>

   
</div>


</body>
</html>