<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="kr">
<head>
	<c:if test="${qSeq==null}">
	<title>Write Question</title>
</c:if>
<c:if test="${qSeq!=null}">
<title>Write Answer</title>
</c:if>
<script src="resources/ckeditor/ckeditor.js"></script>

<style type="text/css">
	button {
		width: 10%;
		background-color: #06213F;
		border: none;
		border-radius: 10px;
		color: #fff;
		padding: 5px 0;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 20px;
		margin: 5px;
		float: right;
		cursor: pointer;
	}

	th, td {
		width: 30%;
	}

	textarea {

	}

	#title {
		width: 70%;
	}
</style>

<meta charset="utf-8">
<meta name="viewport"
content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="<c:url value="/resources/css/resume.css" />" rel="stylesheet" type="text/css">

<link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">

 <!-- font -->
<link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">

<!-- Jquery -->
<script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>
  
  
<title>subjectHome</title>

<!-- 미세 커스텀 조정 -->
<link href="<c:url value="/resources/css/boardCss.css" />"
rel="stylesheet" type="text/css">

<style type="text/css">
	button {
		width: 10%;
		background-color: #06213F;
		border: none;
		color: #fff;
		padding: 5px 0;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 20px;
		margin: 5px;
		float: right;
		cursor: pointer;
	}
</style>


</head>

<body style="padding-left: 0px;">

	<div class="container-fluid">
		<div class="d-none d-lg-block" id="fix-title">
			<div id="fix-logoDiv">
				<div id="fix-logo">
					<a href="#"> <img id="schoolLogo"
						src="<c:url value="/resources/img/logo.png" />" alt=""> <span
						id="sideLogo"> 知恵通信大学 </span>
					</a>
				</div>
			</div>
			<div id="fix-text">QnA</div>
		</div>

		<div class="row" id="margin-del">
			<!--          <div class ="col-sm-2"> -->
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
			<img class="img-fluid img-profile rounded-circle mx-auto mb-2"
			id="hiddenImg" src="<c:url value="/resources/img/profile.jpg" />">
			<br> <span> チョンチギョン </span>
		</div>

		<div class="collapse navbar-collapse" id="navbarSupportedContent"
		style="font-family: Saira Extra Condensed;">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link js-scroll-trigger"
				href="goSubjectHome">HOME</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="subjectNotice">お知らせ</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="QnA">QnA</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="#skills">宿題</a></li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="consult">試験</a></li>
							</ul>
						</div>
					</nav>
					<div class="col-sm-3" id="hiddenleft"></div>
					<div class="col-sm-9" id="hiddenright">
						<br>
						<div id="conte">
							<div style="min-height: 600px;">
								<!-- 내용 들어가는 부분 -->
								<c:if test="${sessionScope.userType == 'S'}">
								<section id="about">
									<h2>Q&A</h2>
									<br>
									<div id="qWrite">
										<c:if test="${question.QSEQ==null}">
										<form action="submitQ" id="submitQ" method="post">
											<input type="hidden" name="lectureNum" value="${sessionScope.lectureNum}">
											TITLE:&nbsp;&nbsp;&nbsp;<input type="text" name="title"
											id="title"><br> <br>
										</c:if>

										<c:if test="${question.QSEQ!=null}">
										<form action="reWriteQ" method="post">
											<input type="hidden" name="qSeq" value="${question.QSEQ}">
											TITLE:&nbsp;&nbsp;&nbsp;<input type="text" name="title"
											id="title" readonly="readonly" value="${question.TITLE}"><br>
											<br>
										</c:if>
										<textarea name="contents" id="contents1" rows="10" cols="80">
											${question.CONTENTS}
										</textarea>
										<script>
										// Replace the <textarea id="editor1"> with a CKEditor
										// instance, using default configuration.
										CKEDITOR.replace('contents1');
									</script>
									<br> <br>
									<button id="qButton">submit</button>
								</form>
							</div>
						</section>
					</c:if>
					<c:if test="${sessionScope.userType == 'P'}">
					<section>
						<div id="aWrite">
							<c:if test="${answer.aSeq==null}">
							<form action="submitA" method="post">
								<input type="hidden" name="qSeq" value="${qSeq}">
								TITLE:&nbsp;&nbsp;&nbsp;<input type="text" name="title"
								id="title"><br> <br>
							</c:if>
							<c:if test="${answer.aSeq!=null}">
							<form action="reWriteA" method="post">
								<input type="hidden" name="qSeq" value="${answer.aSeq}">
								TITLE:&nbsp;&nbsp;&nbsp;<input type="text" name="title"
								id="title"><br> <br>
							</c:if>
							<textarea name="contents" id="contents2" rows="10" cols="80">

							</textarea>
							<script>
								CKEDITOR.replace('contents2');
							</script>
							<br> <br>
							<button>submitA</button>
						</form>
					</div>
				</section>
			</c:if>
			<br>
		</div>
	</div>

</div>
</body>
</html>