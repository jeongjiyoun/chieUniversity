<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>教授陣紹介</title>

<!-- bootstrap -->
  <link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/introduce.css" />">
  <link href='https://fonts.googleapis.com/earlyaccess/notosansjp.css' rel='stylesheet' type='text/css'>
  <script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>

<style type="text/css">

.professorInfo tr td{
	height: 40px;
	vertical-align: middle;
}

</style>
</head>
<body style="overflow: auto">
	<header class ="header small">
    <div class="navigation">
      <ol>
        <li><a href="introduce"> 大学紹介 </a> </li>
        <li><a class="drop" href="applyInfo"> 入学案内 </a></li>
        <a href="goHome"><img src="<c:url value='/resources/img/logo.png' />" width="6%" height="6%"></a>
        <li><a href="department"> 学部紹介 </a> </li>
        <li><a href="curriculum"> 学事案内 </a> </li> 
      	<li>
   		<a href="login" style="position : absolute; left :94%; top:6px;"><img src="<c:url value="/resources/img/lock.png"/>" width="4%" height="4%" style="width:61px;"></a>
      </ol>
    	    
    </div>
  </header>
<div class="contents-main" style="margin-top: 10%; height: 130%;">
<div class="haha"></div>
	<p class="text3" style="font-weight: bold; margin-left: 10px;">教授紹介</p><br>
			<div class = "majorNavi" style="margin-bottom: 50px;"> 
			<table style="float : right;">
			<tr>
				<td style="text-align: center; background-color : #dee2e6; color : black;	width : 130px; height: 40px;"><p><a href="major?majorSeq=${Major.majorSeq}&majorName=${Major.name}" style="color : black;">専攻概要</a></p></td>
				<td style="text-align: center; background-color : rgb(22,56,93); 	color : white;	width : 130px; height: 40px;"><p><a href="professorIntro?majorSeq=${Major.majorSeq}&majorName=${Major.name}" style="color : white;">教授紹介</a></p></td>
				<td style="text-align: center; background-color : #dee2e6;	color : black;	width : 130px; height: 40px;"><p><a href="curriculum?majorSeq=${Major.majorSeq}&majorName=${Major.name}" style="color : black;">カリキュラム	</a></p></td>
			</tr>
			</table>
		</div>
	<br>
   <table style="text-align: center; padding-left: 100px; width: 100%; background-color: white;" class="professorInfo">
   <c:forEach var="item" items="${mpList}">
   		
   			<tr>
   				<td colspan="2" rowspan="5" style="text-align: center;">
   				<img class="listPicture" src="${item.PPICTURE}" style=" width: 45%; float: right;
   				width: 80px; height: 120px;    background-color: white;    border: 1px solid gray; margin-right: 45px;">
    			</td>
   			</tr>
   			<tr>
   				<td style="background-color: #dee2e6; border-bottom: 1px solid #dee2e6; ">名前</td><td style="border-bottom: 1px solid #dee2e6;">${item.NAME}</td><td style="background-color: #dee2e6; border-bottom: 1px solid #dee2e6; ">肩書</td><td style="border-bottom: 1px solid #dee2e6;">${item.TITLE}</td>
   			</tr>
   			<tr>
   				<td style="background-color: #dee2e6; border-bottom: 1px solid #dee2e6; ">連絡先</td><td style="width: 40%; color: 2#dee2e6; border-bottom: 1px solid #dee2e6;">${item.TEL}</td><td colspan='2'  style="border-bottom: 1px solid #dee2e6;">${item.EMAIL}</td><td></td>
   			</tr>
			<tr>
				<td style="background-color: #dee2e6; border-bottom: 1px solid #dee2e6; ">担当科目</td><td colspan='3' style="border-bottom: 1px solid #dee2e6;">${item.SUBJECT}</td><td></td><td></td>
			</tr>
			<tr>
				<td style="background-color: #dee2e6; border-bottom: 1px solid #dee2e6; ">主要業績</td><td colspan='3'style="border-bottom: 1px solid #dee2e6;">${item.CAREER}</td><td></td><td></td>
			</tr>
	</c:forEach>
  </table>
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
					
			<div style="left: 10px;width: 200px;margin: 0 auto;">
			© CHIE Online University
			</div>
</body>
</html>