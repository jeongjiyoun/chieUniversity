<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>入学への道</title>
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
  <div class="contents-main" style="height: 253%;">
  <div class="content1">
  <div class="haha"></div>
   <p class="text2">大学説明会
</p>
   <br>
   <p class="text3">
   	知恵通信大学では、大学説明や個別相談を行っています。
	あなたの目的や予定に合せて気軽に参加ください。</p><br>
 
   <p style="font-size : 25px;">
   	「ランチタイムを使って学んだ内容が、その日の仕事で使えた」
	そんなふうに、学んだ瞬間から仕事や日常生活ですぐに使えるのが、東京通信大学の授業の魅力。
	今のあなたを成長させ、人生を前に進める原動力にもなる。
	それが東京通信大学の学びです。
   </p>
   <p class="textR">日程は今後お知らせいたします。</p>
  </div>
  
  <div class="content2">
  <div class="haha"></div>
  <p class="text2">・出願期間</p><br>
  
  	<p style="font-size : 25px;"> 
  	 <2019年4月入学></p><br>
	<p style="font-size : 25px;">
	[第1回] 　 12月1日～2月28日<br>
	[第2回] 　 3月1日～3月17日	</p>
	<p class="textR">※終了しました。</p>
	
  	<p class="text3"> 
  	 <2019年10月入学></p><br>
	<p style="font-size : 25px;">
	[第1回] 　 6月15日～8月31日<br>
	[第2回] 　 9月1日～9月20日（予定）</p>
  </div>
  
  <div class="content3">
  <div class="haha"></div>
  <p class="text2">・正科生について</p><br><br>
  <p class="text3">
  	卒業時に学士の学位（4年制大学卒業資格）の取得が可能です。</p><br>
  <p style="font-size : 25px;">
	 本学ではすべての入試区分において学力試験は行いません。アドミッション・ポリシーに基づき、入学希望者の熱意や意欲、これまでの経験や実績を評価できるように、下記の入試区分を設け、広く入学希望者を受け入れています。
</p> 
	
  </div>
  </div>
  
  
  <div class="footer" style="z-index: 2;float: right; margin-right:10%;">
		<div style="width: 100%; height: 155px;">
			<div style="width: 270px; float: left; line-height: 35px; font-size: 1.1rem;">
			> 大学概要 <br>
			> キャンパス案内・アクセス <br>
			> お知らせ<br>
			</div>
			<div style="width: 270px; float: left; line-height: 35px;">
			> サイトマップ<br>
			> ログイン メディアの皆さまへ<br>
			> 大学の魅力 <br>
			</div>
			<div style="width: 270px; float: left; line-height: 35px; font-size: 1.1rem;">
			> よくある質問<br>
			> サイトポリシー<br>
			</div>
			</div>

		</div>
		
		<footer style="width: 100%; height: 30px; z-index: -20">
						<div class="Goodmorning"></div>
						<div style="max-height:300px;">
						<div class="cokio"></div>
						</div>
					</footer>
					
			<div style="    left: 10px;width: 200px;margin: 0 auto;">
			© CHIE Online University
			</div>
</body>
</html>