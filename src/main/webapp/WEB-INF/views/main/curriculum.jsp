<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>カリキュラム</title>
<!-- bootstrap -->
<link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">

  <link rel="stylesheet" type="text/css"
  href="<c:url value="/resources/css/introduce.css" />">
  <link href='https://fonts.googleapis.com/earlyaccess/notosansjp.css' rel='stylesheet' type='text/css'>
  <script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>
<style type="text/css">

td{
vertical-align: middle;
}
th{
background-color:  #dee2e6;
height: 50px;
vertical-align: middle;
}

table{
background-color: white;
}
</style>
</head>
<body style="overflow: auto;">
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
   <div class="contents-main" style="margin-top: 10%; height: 460%;">
   
   <div class="haha"></div>
	<p class="text3" style="font-weight: bold;">${majorName} カリキュラム</p><br>

 			<div class = "majorNavi" style="margin-bottom: 80px;"> 
			<table style="float : right;">
			<tr>
				<td style="text-align: center; background-color : #dee2e6; color : black;	width : 130px; height: 40px;"><p><a href="major?majorSeq=${Major.majorSeq}&majorName=${Major.majorName}" style="color : black;">専攻概要</a></p></td>
				<td style="text-align: center; background-color : #dee2e6; 	color : black;	width : 130px; height: 40px;"><p><a href="professorIntro?majorSeq=${Major.majorSeq}&majorName=${Major.majorName}" style="color : black;">教授紹介</a></p></td>
				<td style="text-align: center; background-color : rgb(22,56,93);	color : black;	width : 130px; height: 40px;"><p><a href="curriculum?majorSeq=${Major.majorSeq}&majorName=${Major.majorName}" style="color : white;">カリキュラム</a></p></td>
			</tr>
			</table>
		</div>
	<table style="text-align: center; padding-left: 100px;" class="table table-striped">
	<tr>
		<th style="width:10%"> 学年 </th><th style="width:15%"> 科目 </th><th style="width:65%;" > 説明 </th><th style="width:10%;border-right : none;"> 単位</th>
	</tr>
	<c:forEach var="item" items="${mcList}">
	<tr>
		<td>${item.GRADE}学年</td><td>${item.SUBJECT}</td><td style="text-align: left;">${item.EXPLANATION}</td><td style="border-right : none;">${item.CREDIT}</td>
	</tr>
	</c:forEach>
	<tfoot>
		<tr><td colspan="4"></td></tr>
	</tfoot>
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
					
			<div style="    left: 10px;width: 200px;margin: 0 auto;">
			© CHIE Online University
			</div>
</body>
</html>