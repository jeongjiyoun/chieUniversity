
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html lang="kr">

<head>
<meta charset="UTF-8">
<title>お知らせ</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/introduce.css" />">
<link href='https://fonts.googleapis.com/earlyaccess/notosansjp.css'
	rel='stylesheet' type='text/css'>
<script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>

<!-- bootstrap -->
<link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">

</head>
<body>

	<header class="header small">
		<div class="navigation">
			<ol>
				<li><a href="introduce"> 大学紹介 </a></li>
				<li><a class="drop" href="applyInfo"> 入学案内 </a></li>

				<a href="goHome"><img
					src="<c:url value="/resources/img/logo.png" />" width="6%"
					height="6%"></a>

				<li><a href="department"> 学部紹介 </a></li>
				<li><a href="goTotNotice"> お知らせ </a></li>
				<li><a href="login"
					style="position: absolute; left: 90%; top: 6px;">login<img
						src="<c:url value="/resources/img/lock.png"/>" width="4%"
						height="4%" style="width: 61px;"></a>
				</li>
			</ol>
		</div>
	</header>
	<div class="container-fluid">
	<div class="row" id="margin-del">
		<div class="col-sm-10 offset-sm-1" id="hiddenright">
		  <br><br><br><br>
  <br><br><br><br>
  <div class="contents-main" >
					<!-- 내용 들어가는 부분 -->
					<div class="content1">
					  <div class="haha"></div>
					  <p class="text1">NEWS</p>
						<div id="qTable">
							<table style="width: 100%; border-collapse: separate; border-spacing: 0 10px;">
								<thead>
								</thead>
								<tbody style="font-size: 1.25rem;">
								<c:if test="${newList!=null}">
									<c:forEach var="news" items="${newList}" step="1" begin="0" end="5">
										<tr data-value="${news.NOTICESEQ}" class="newsTR">
											<td style="width: 20%;padding-top: 9px;">${news.INDATE}</td>
											<td style="width: 80%"><a class="bottomLine">${news.TITLE}</a></td>
										</tr>
									</c:forEach>
								</c:if>
								</tbody>
							</table>
								<button class="btn btn-lg" style="    background-color: #212529; color: white; font-size: 0.6rem; padding: 7px;
								 padding-left: 20px; border-radius: 2px; padding-right: 20px; left: 50%;
								      position: absolute; transform: translateX(-50%); margin-top: 30px;">お知らせ一覧</button>
						</div>
						</div>
							<br>
							<br><br><br><br><br>
							<div class="content2">
					<div class="haha"></div>
					  <p class="text1">学校日程</p>
						<div id="qTable">
							<table style="width: 100%; border-collapse: separate; border-spacing: 0 10px;">
								<thead>
								</thead>
								<tbody style="font-size: 1.25rem;">
								<c:if test="${dayList!=null}">
									<c:forEach var="days" items="${dayList}" step="1" begin="0" end="5">
										<tr data-value="${days.DATESEQ}">
											<td style="width: 30%;padding-top: 9px;">${days.STARTDATE}~${days.ENDDATE}</td>
											<td style="width: 70%"><a class="bottomLine">${days.NAME}</a></td>
										</tr>
									</c:forEach>
								</c:if>
								</tbody>
							</table>
								<button class="btn btn-lg" style="    background-color: #212529; color: white; font-size: 0.6rem; padding: 7px;
								 padding-left: 20px; border-radius: 2px; padding-right: 20px; left: 50%;
								      position: absolute; transform: translateX(-50%); margin-top: 30px;">年間計画表一覧</button>
							</div>
							<br>
						</div>
					<br></div>
				</div>
			</div>
		</div>
		<div class="footer" style="z-index: 2;float: right; margin-right:10%;">
		<div style="    width: 100%; height: 155px;">
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
	<script>
		$(function(){
			$(".newsTR").on("click",showNews);
			$(".btn.btn-lg").on("click",news);
		})
		
		function showNews(){
			var post = $(this).attr("data-value");
			location.href="/newsDetail?post=" + post;
		}
	
		function news(){
			location.href="/news";
		}
	</script>
</body>
</html>