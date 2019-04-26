<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>



<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link	href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>"	rel="stylesheet">

<script src="resources/jquery-3.3.1.min.js"></script>

  <link href="<c:url value="/resources/css/resume.css" />" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">
  <link href="<c:url value="/resources/css/course.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">

  <!-- 미세 커스텀 조정 -->
  <link href="<c:url value="/resources/css/boardCss.css" />" rel="stylesheet" type="text/css">
<title>Write Assignment</title>


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





<!-- Title Page-->
<title>subjectHome</title>

<!-- Icons font CSS *-->
<link
	href="/resources/vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">
<link href="/resources/vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">

<!-- Font special for pages-->
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Vendor CSS *-->
<link href="/resources/vendor/select2/select2.min.css" rel="stylesheet"
	media="all">
<link href="/resources/vendor/datepicker/daterangepicker.css"
	rel="stylesheet" media="all">

<!-- <!-- Main CSS *-->
<!-- <link href="/resources/css/consult.css" rel="stylesheet" media="all"> -->

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
					<a href="goHome"> <img id="schoolLogo"
						src="<c:url value="/resources/img/logo.png" />" alt=""> <span
						id="sideLogo"> 知恵通信大学 </span>
					</a>
				</div>
			</div>
			<div id="fix-text">宿題</div>
		</div>

		<div class="row" id = "margin-del">
<!-- 			<div class ="col-sm-2"> -->
				<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
				<a class="navbar-brand js-scroll-trigger" style = "margin-top : 15px;" href="#page-top">
					<span class="d-block d-lg-none">知恵通信大学</span>
				</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
						<div id="prof-span">
					<a href="MyPage"><img
						class="img-fluid img-profile rounded-circle mx-auto mb-2"
						id="hiddenImg" src="${sessionScope.PICNAME}"><br> <span>
							${sessionScope.loginName} </span></a>
							</div>
					
					<div class="collapse navbar-collapse" id="navbarSupportedContent" style="font-family: Saira Extra Condensed;">
						<ul class="navbar-nav">
					     <li class="nav-item">
					      <a class="nav-link js-scroll-trigger" href='subjectDetail?lecturenum=${sessionScope.lectureNum}'>講義HOME</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link js-scroll-trigger" href="subjectNotice?lecturenum=${sessionScope.lectureNum}">お知らせ</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link js-scroll-trigger" href="QnA?lecturenum=${sessionScope.lectureNum}">QnA</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link js-scroll-trigger" href="assignment?lecturenum=${sessionScope.lectureNum}">宿題</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link js-scroll-trigger" href="goexam?lecturenum=${sessionScope.lectureNum}">試験</a>
					    </li>
							
						</ul>
					</div>
				</nav>
		<div class="col-sm-3" id="hiddenleft"></div>
		<div class="col-sm-9" id="hiddenright">
			<br>
			<div id="conte">
				<div style="min-height: 600px;">
					<!-- 내용 들어가는 부분 -->

					<section id="AssignmentP">
						<h2>書く</h2>
						<br>
						<div id="assignWrite">
							<c:if test="${assign==null}">
								<form action="submitAssign" method="post">

									TITLE:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
										type="text" name="title" id="title">
							</c:if>
							<c:if test="${assign!=null}">
								<form action="rewriteAssign" method="post">
									<input type="hidden" name="assSeq" id="assSeq"
										value="${assign.assSeq}">
									TITLE:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
										type="text" name="title" id="title" value="${assign.title}"
										readonly="readonly">
							</c:if>

							<br>
							<br> PERIOD:&nbsp;&nbsp;&nbsp; <input type="date"
								name="startDate" id="startDate" value="${assign.startDate}">
							&nbsp;~&nbsp;<input type="date" name="endDate" id="endDate"
								value="${assign.endDate}"> <br>
							<br>

							<textarea name="contents" id="contents" rows="10" cols="103">
                                ${assign.contents}
                              </textarea>
							<br>

							<script>
								// Replace the <textarea id="editor1"> with a CKEditor
								// instance, using default configuration.
								CKEDITOR.replace('contents');
							</script>
							<br>
							<button id="qButton">submit</button>
							</form>
						</div>
					</section>

					<br>
				</div>
			</div>
		</div>
</body>
</html>