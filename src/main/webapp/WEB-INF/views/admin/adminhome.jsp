<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>管理者</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="<c:url value="/resources/css/course.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/resume.css" />"
	rel="stylesheet" type="text/css">

<!-- bootstrap -->
<link
	href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>"
	rel="stylesheet">

<!-- Jquery -->
<script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>

<!-- Title Page-->
<title>管理者</title>

<!-- Font special for pages-->
<link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css"
	rel="stylesheet">

<!-- Main CSS *-->
<link href="<c:url value="/resources/css/consult.css" />"
	rel="stylesheet" media="all">

<!-- 미세 커스텀 조정 -->
<link href="<c:url value="/resources/css/boardCss.css" />"
	rel="stylesheet" type="text/css">

<script>
	function pagingFormSubmit(currentPage) {
		var form = document.getElementById('pagingForm');
		var page = document.getElementById('page');
		page.value = currentPage;
		form.submit();

	}
</script>

</head>
<body>
	<div class="container-fluid">
		<header>
			<div class="d-none d-lg-block" id="fix-title"
				style="background-color: #760023">
				<div id="fix-logoDiv">
					<div id="fix-logo">
						<a href="goHome"> <img id="schoolLogo"
							src="<c:url value="/resources/img/logo.png" />" alt=""> 
							<span id="sideLogo"> 知恵通信大学 </span>
						</a>
					</div>
				</div>
				<div id="fix-text">管理者</div>
				<button class="btn-lg" id="btn-logout"
					onclick="location.href='admin';" style="background-color: #760023;">ログアウト</button>
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
<!-- 				<div id="prof-span"> -->
<!-- 					<a href="adminhome"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" -->
<%-- 						id="hiddenImg" src="${sessionScope.PICNAME}"><br> <span> --%>
<%-- 							${sessionScope.loginName} </span></a><br> --%>
<!-- 				</div> -->

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="adminHome">HOME</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="goTotNotice">お知らせ</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="adminApplicant">受講申請管理</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="adminApplicant">入学管理</a></li>
					</ul>
				</div>
			</nav>
			
			<div class="col-sm-1"></div>
			<div class="col-sm-2" id="hiddenleft"></div>
			<div class="col-sm-9" id="hiddenright">
				<h1>管理者</h1>
				<hr style="width: 95%;">
				<br>
				<div id="conte">
					<h4>管理者メニューを利用できます。</h4>
					<br> <br>
					<section style="margin-top: 30px;">
						<div class="row placeholders">
							<div class="col-xs-12 col-sm-11 placeholder">
								<span style="float: left; width: 400px;"> <input
									type="button" value="申請確認"
									onclick="location.href='Adminapplicant';"
									style="width: 38%; padding: 8px; background-color: #760023; color: white;">
								</span>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
</body>
</html>