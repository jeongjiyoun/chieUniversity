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
	<div class="contents-main" style="margin-top: 10%;">
		<div class="haha"></div>
		<p class="text2">入学案内</p>
		<br>
		<p class="text3">あなたの人生に新しい一歩を。目的に合せた入学形態が選べます。</p>
		<br>
		<br>

		<div class="contents-box"
			style="padding: 20px 20px 0; border: 5px solid #ededed; text-align: center">
			<p style="font-size: 30px;">2019年夏入学 出願受付中！</p>
			<br>
			<br>
			<p style="font-size: 20px;">正科生は2019年秋入学を融合経営学部, 社会福祉学部, IT工学部,
				社会科学部募集します。</p>
			<br>
			<br> <br>
		</div>
		<br>
		<br>
		<p class="text3">・入学申請順序</p>
		<hr class="one"></hr>
		<br>
		<div class="contents-box"
			style="padding-top: 5px; padding: 20px 20px 0; border: 5px solid #ededed; text-align: center">
			<p style="font-size: 25px;">STEP1 出願情報の登録</p>
			<br>
			<p style="font-size: 20px">希望する入試区分を選択し、氏名・住所等を入力</p>
		</div>
		<p 		style="font-size: 40px; text-align: center; color: #c3c0c0; font-weight: bold;">&darr;</p>
		<div class="contents-box"
			style="padding-top: 5px; padding: 20px 20px 0; border: 5px solid #ededed; text-align: center">
			<p style="font-size: 25px;">STEP2 選考料の納入</p>
			<br>
			<p style="font-size: 20px">
				納入方法を以下から選択<br> ・銀行振込<br> ・クレジットカード<br> ・ペイジー<br>
				・コンビニエンスストア
			</p>
		</div>
		<p style="font-size: 40px; text-align: center; color: #c3c0c0; font-weight: bold;">&darr;</p>
		<div class="contents-box" style="padding-top: 5px; padding: 20px 20px 0; border: 5px solid #ededed; text-align: center; background-color: rgba(22, 56, 93, 0.1)">
			<p style="font-size: 25px; font-weight: bold;">出願完了</p>
			<br>
		</div>
		<br>
		<p class="text1" style="font-weight: bold; text-align: center;">知恵は一緒に勉強しましょう&#33;&#33;</p>
		<a 	style="text-decoration: none; font-size: 2rem; color: whtie; padding: 20px 30px 20px 30px; margin: 20px; display: inline-block; position: absolute; border-radius: 10px; background-color: rgb(22, 56, 93); left: 33%;"
			href="applicantCheck">入学願書作成 </a>
</body>
</html>