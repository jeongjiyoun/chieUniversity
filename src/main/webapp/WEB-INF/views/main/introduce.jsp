<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>学校紹介</title>
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
  <div class="contents-main" style="height: 210%;">
  <div class="content1">
  <div class="haha"></div>
   <p class="text2">大学紹介</p>
   <br>
   <p class="text3">
   	世界に未来へ羽ばたく知恵通信大学で<br>明日の夢を育てて行ってください。</p>
  	<br><br>
   <p style="font-size : 20px;">
   	「ランチタイムを使って学んだ内容が、その日の仕事で使えた」
	そんなふうに、学んだ瞬間から仕事や日常生活ですぐに使えるのが、東京通信大学の授業の魅力。
	今のあなたを成長させ、人生を前に進める原動力にもなる。
	それが東京通信大学の学びです。
   </p>
  </div>
  
  <div class="content2">
  <div class="haha"></div>
  <p class="text2">学長よりみなさまへ</p>
  <img class="president" src="<c:url value="resources/img/president.jpg"/>" style="width : 182px; height :286px; float : left;">
  
  	<p class="text3" style="margin-left: 246px;"> 
  	 現代社会で活躍したい	すべての人へ。	学びの機会を開放する。 </p>
	<p style="font-size : 20px;margin-left: 248px;">
	本学の講義はスマートフォンやPCを使って、いつでもどこでも聴講することができます。さらに講義は15分単位の動画で構成されていますから、纏まった時間を取りにくい社会人でも単位の取得が容易にできるようになっています。講義の内容等はこれまでの大学と全く同等です。インターネットを使うからと云って、講義の品質が劣っていることはありません。それぞれの分野で一流の教員が、大学に相応しいレベルの講義を行います。
	</p>
  </div>
  
  <div class="content3">
  <div class="haha"></div>
  <p class="text2">入学に関する問合せ</p>
  <p style="font-size: 20px;">
  	© ChiE Online University <br>
	Tel : 03-3344-4444 &nbsp &nbsp Fax : 03-3344-5555 &nbsp &nbsp board@chie.ac.kr <br></p>
		<p class="text4">（10:00～20:00 日曜・祝日、8/13～15、12/27～1/5を除く）
			COPYRIGHTⒸ ChiE Online University </p> 
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