<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>${Major.name}</title>
  <!-- bootstrap -->
<link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">
  
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/introduce.css" />">
  <link href='https://fonts.googleapis.com/earlyaccess/notosansjp.css'   rel='stylesheet' type='text/css'>
  <script src="<c:url value="resources/jquery-3.3.1.min.js"/>"> </script>

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

  <div class="contents-main" style="margin-top: 10%; height: 325%;">
	<div id="introduceMajor">
		<div class="haha"></div>
		<p class="text3" style="font-weight: bold">${Major.name}</p>
		<br>
		<div class = "majorNavi"> 
			<table style="float : right;">
			<tr>
				<td style="text-align: center; background-color : rgb(22,56,93);color : black;	width : 130px; height: 40px;"><p><a href="major?majorSeq=${Major.majorSeq}" style="color : white;">専攻概要</a></p></td>
				<td style="text-align: center; background-color : #dee2e6;	color : black;	width : 130px; height: 40px;"><p><a href="professorIntro?majorSeq=${Major.majorSeq}" style="color : black;">教授紹介</a></p></td>
				<td style="text-align: center; background-color : #dee2e6;	color : black;	width : 130px; height: 40px;"><p><a href="curriculum?majorSeq=${Major.majorSeq}&majorName=${Major.name}" style="color : black;">カリキュラム	</a></p></td>
			</tr>
			</table>
		</div>
		<br>
		<h2>・教育目標</h2>
		<hr class="one"></hr>
		<p style="font-size: 25px;padding-left: 30px;  padding-right: 30px;">${Major.goal}</p><br><br>	
		
		<h2>・専攻の概要</h2>
		<hr class="one"></hr>
		<p style="font-size: 25px;padding-left: 30px;  padding-right: 30px;">${Major.explaination}</p><br><br>
	
		<h2>・RoadMap</h2>
		<hr class="one"></hr>
		<p style="font-size: 25px;padding-left: 30px;  padding-right: 30px;"><img src="${Major.roadmap_pic}"></p><br><br>
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