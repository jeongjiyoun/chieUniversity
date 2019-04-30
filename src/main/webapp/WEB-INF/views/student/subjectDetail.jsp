<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html lang="kr">

<head>
<title>${subject.TITLE}</title>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="<c:url value="/resources/css/resume.css" />"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css"
	rel="stylesheet">
<link href="<c:url value="/resources/css/course.css"/>" rel="stylesheet">
<link
	href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>"
	rel="stylesheet">

<script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>
<!-- 미세 커스텀 조정 -->
<link href="<c:url value="/resources/css/boardCss.css" />"
	rel="stylesheet" type="text/css">
</head>

<body style="padding-left: 0px;">

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
        <div id="fix-text">私の講義室</div>
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

					<a href ="MyPage"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" id="hiddenImg" src="${sessionScope.PICNAME}"><br> <span> ${sessionScope.loginName} </span></a>
				</div>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
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
			<div class="col-sm-1"></div>
			<div class="col-sm-2" id="hiddenleft"></div>
			<div class="col-sm-9" id="hiddenright">

				<section>
					<div class="triangle"></div>
					<h1>${subject.TITLE}</h1>
					<br>
				</section>
				<section>
					<div class="row placeholders">
						<div class="col-sm-9 placeholder">
							<h2 class="sub-header">講義概要</h2>
							<table class="table" style="width: 97%;">
								<tbody>
									<tr>
										<td class="courseContent1">分 &nbsp &nbsp &nbsp &nbsp類</td>
										<td class="courseContent2">${subject.TYPENAME}</td>
										<td class="courseContent1">開設学期</td>
										<td class="courseContent2 con2">${subject.SEMESTER}</td>
									</tr>
									<tr>
										<td class="courseContent1">開設学科</td>
										<td class="courseContent2">${subject.MAJOR}</td>
										<td class="courseContent1">教&nbsp&nbsp 授&nbsp&nbsp 名</td>
										<td class="courseContent2 con2">${subject.PNAME}</td>
									</tr>
									<tr>
										<td class="courseContent1">講義時間</td>
										<td class="courseContent2">${subject.STIME}</td>
										<td class="courseContent1">講&nbsp&nbsp 義&nbsp&nbsp 数</td>
										<td class="courseContent2 con2">${subject.NUMCLASS}/
											14(予定)</td>
									</tr>
									<tr style="border-bottom: 1px solid #dee2e6">
										<td class="courseContent1">講義方式</td>
										<td class="courseContent2"><c:if
												test="${subject.IS_REAL_TIME == 'T'}">リアルタイム講義</c:if> <c:if
												test="${subject.IS_REAL_TIME == 'F'}">動画像講義</c:if></td>
										<td class="courseContent1">講義計画書</td>
										<td class="courseContent2 con2">
								        	<button type="button" class ="btn btn-primary btn-sm syllabus" id="fileDownLoad" data-value ="${subject.FILENAME}" style="float: left; WIDTH: 45%; margin: 0 auto">ダウンロード</button>
              								<button type="button" class ="btn btn-primary btn-sm" id="fileWatch" data-value ="${subject.FILENAME}" style="float: right; WIDTH: 45%; margin: 0 auto">閲覧</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="col-xs-3 placeholder">
							<img class="identificationPicture" src="${subject.PPICTURE}">
							<h4 style="text-align: center;">${subject.PNAME}</h4>
						</div>
						<div class="col-xs-1 col-sm-1 placeholder"></div>
						<div class="col-xs-6 col-sm-8 placeholder">
							<div class="table-responsive">
								<table class="table">
								</table>
							</div>
						</div>
					</div>
				</section>
				<section style="margin-top: 30px;">
					<div class="row placeholders">
						<div class="col-sm-12 placeholder">
							<h2 class="sub-header">講義目次</h2>
							<div class="table-responsive">
								<table class="table table-striped" style="width: 92%;">
									<thead class="thead">
										<tr id="table-title">
											<th></th>
											<th width="40%">講義名</th>
											<th width="15%">講義視聴</th>
											<th width="15%">授業可能時間</th>
											<th width="15%">講義時間</th>
											<th width="15%">視聴確認</th>
										</tr>
									</thead>
									<tbody>
										<!-- for each구문을 걸어서 보여주기. -->
										<c:forEach items="${movieList}" var="movie" varStatus="index">
											<tr>
												<td>${index.count}</td>
												<td>${movie.TITLE}</td>
												<td><jsp:useBean id="now" class="java.util.Date" /> <%-- 			<fmt:parseDate value="${movie.STARTDATE}" pattern="yyyyMMddHHmm" var="startDate" /> --%>
													<%-- 			<fmt:parseDate value="${movie.ENDDATE}" pattern="yyyyMMddHHmm" var="endDate" /> --%>

													<fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm"
														var="nowDate" /> <%-- 오늘날짜 --%> <fmt:formatDate
														value="${movie.STARTDATE}" pattern="yyyy-MM-dd HH:mm"
														var="openDate" /> <%-- 시작날짜 --%> <fmt:formatDate
														value="${movie.ENDDATE}" pattern="yyyy-MM-dd HH:mm"
														var="closeDate" /> <%-- 마감날짜 --%> <%-- 			<c:if test="${openDate <= nowDate && closeDate >= nowDate}"> --%>
													<c:if test="${index.count==8}">
													<button class="btn btn-primary btn-sm watch"
														style="width: 80%;" data-value="${movie.COURSESEQ}">見る</button>
													</c:if>
<%-- 																</c:if></td> --%>
												<td>${movie.MTIME}</td>
												<td>${movie.ATIME}</td>
												<td style="border-right: none;"><c:if
														test="${movie.WTIME >= movie.ATIME2 || movie.WTIME == null}">未受講
            	</c:if> <c:if test="${movie.WTIME < movie.ATIME2}">既受講
            	</c:if></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<div id="boardFooter">
		© ChiE Online University <br> Tel : 03-3344-4444 &nbsp &nbsp Fax
		: 03-3344-5555 &nbsp &nbsp board@chie.ac.kr <br>
		<p id="copyRight">COPYRIGHTⒸ ChiE Online University</p>
	</div>

	<script type="text/javascript">
		$(function() {
			$(".btn.btn-primary.btn.watch").on("click", watch);
			$("#btn-logout").on("click", logout);
			$(".btn.btn-primary.btn.syllabus").on("click", syllabus);
			$("#fileWatch").on("click",fileWatch);

		});

		function fileWatch(){
			var url = "/fileWatch?url=" + $(this).attr("data-value");
			window.open(url, '_blank', 'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes, location=no, menubar=no,scrollbars=no', false);
		}

		function syllabus(){
			var url = $(this).attr("data-value");
			location.href = url;
		}

		function logout() {
			var con_test = confirm("ログアウトしますか。");
			if (con_test == true) {
				location.href = "/logout";
			}
		}

		function watch() {
			var courseNum = $(this).attr("data-value");
			var url = 'watch2?coursenum=' + courseNum;
			window.open(url, '_blank', 'height=' + screen.height + ',width='
					+ screen.width
					+ 'fullscreen=yes, location=no, menubar=no,scrollbars=no',
					false);
		}
	</script>
</body>
</html>