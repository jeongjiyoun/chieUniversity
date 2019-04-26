<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>奨学金</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="<c:url value="/resources/css/course.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/resume.css" />" rel="stylesheet" type="text/css">

<!-- bootstrap -->
<link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">

<!-- Jquery -->
<script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>

<!-- Title Page-->
<title>奨学金確認</title>

<!-- Font special for pages-->
<link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">

<!-- Main CSS *-->
<link href="<c:url value="/resources/css/consult.css" />" rel="stylesheet" media="all">

<!-- 미세 커스텀 조정 -->
<link href="<c:url value="/resources/css/boardCss.css" />" rel="stylesheet" type="text/css">

</head>
<body>
<div class="container-fluid">
		<header>
			<div class="d-none d-lg-block" id="fix-title">
				<div id="fix-logoDiv">
					<div id="fix-logo">
						<a href="goHome"> <img id="schoolLogo"
							src="<c:url value="/resources/img/logo.png" />" alt=""> <span
							id="sideLogo"> 知恵通信大学 </span>
						</a>
					</div>
				</div>
				<div id="fix-text">登録確認</div>
				<button class="btn-lg" id="btn-logout">ログアウト</button>
			</div>
		</header>
		<div class="row" id="margin-del">
			<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top"
				id="sideNav">
				<a class="navbar-brand js-scroll-trigger" style="margin-top: 15px;"
					href="#page-top"> <span class="d-block d-lg-none">知恵通信大学</span>
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div id="prof-span">
					<a href="sMyPage"><img
						class="img-fluid img-profile rounded-circle mx-auto mb-2"
						id="hiddenImg" src="${sessionScope.PICNAME}"><br> <span>
							${sessionScope.loginName} </span></a>
				</div>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav">
							<li class="nav-item">
								<a class="nav-link js-scroll-trigger" href="MyGrade">成績</a>
							</li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="MyInformation">学籍情報</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="courseList">講義</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="consult">相談</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="certificate">証明書</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="registration">登録</a></li>
					</ul>
				</div>
			</nav>
			<div class="col-sm-1"></div>
			<div class="col-sm-2" id="hiddenleft"></div>
			<div class="col-sm-9" id="hiddenright">
				<h1>奨学金の内訳</h1>
				<hr style="width: 95%;">
				<br>
				<div id="conte">
					<h4>学生の奨学金をもらった内訳を見ることができます。</h4>
				<br>
				<span style="float:right; width: 400px;">
				<input type="button" value="決済" onClick="location.href='registration';" style="width: 38%; align: right; padding:8px">
				<input type="button" value="奨学" onClick="location.href='scholaship';" style="width: 38%; background-color:rgb(22,56,93); align: right; padding:8px; color : white;">
				</span>
				<br>
				<section style="margin-top: 30px;">
					<div class="row placeholders">
						<div class="col-xs-12 col-sm-11 placeholder">
							<div class="table-responsive" style="overflow-x: hidden;">
								<table class="table table-striped">
									<thead class="thead">
										<tr id="table-title" style="background-color: rgb(240, 240, 240)">
											<th style="width: 20%; border-left: 1px solid #dee2e6;">学期</th>
											<th style="width: 20%; border-left: 1px solid #dee2e6;">総長学金</th>
											<th style="width: 20%; border-left: 1px solid #dee2e6;">奨学事由</th>
										</tr>
									</thead>
									<tbody>
										<!-- for each구문을 걸어서 보여주기. -->
										<c:forEach var="scholarship" items="${sresult}">
											<tr>
												<td style="width: 20%; text-align: center">${scholarship.YEAR}年${scholarship.SEMESTER}</td>
												<td style="width: 20%;  text-align: center"><fmt:formatNumber value="${scholarship.SCHOLARSHIP}" pattern="¥#,###.##"/></td>
												<td style="width: 20%; text-align: center">${scholarship.MEMO}</td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<td style="width: 20%; text-align: center"></td>
											<td style="width: 20%; text-align: center"></td>
											<td style="width: 20%; text-align: center"></td>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	</div>
		<div id="boardFooter">
 © ChiE Online University <br>
 Tel : 03-3344-4444 &nbsp &nbsp Fax : 03-3344-5555 &nbsp &nbsp board@chie.ac.kr <br>
 <p id="copyRight"> COPYRIGHTⒸ ChiE Online University <p>
 </div>
	<script type="text/javascript">


		$(function() {
			$(".btn.btn-primary.btn").on("click", goSubject);
			$("#btn-logout").on("click",logout);
		});

		function logout() {
		    var con_test = confirm("ログアウトしますか。");
		    if (con_test == true) {
		    	location.href="/logout";
		    }
		}
		function goSubject() {
			var subjectNum = $(this).attr("data-value");
		}
	</script>
</body>
</html>