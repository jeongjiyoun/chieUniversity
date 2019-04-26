<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>講義開設</title>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

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
<title>講義開設</title>

<!-- Font special for pages-->
<link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css"
	rel="stylesheet">

<!-- Main CSS *-->
<link href="<c:url value="/resources/css/consult.css" />"
	rel="stylesheet" media="all">

<!-- 미세 커스텀 조정 -->
<link href="<c:url value="/resources/css/boardCss.css" />"
	rel="stylesheet" type="text/css">

<style type="text/css">
   .dragAndDropDiv {
             border: 2px dashed #92AAB0;
             width: 770px;
             height: 90px;
             color: #92AAB0;
             text-align: center;
             vertical-align: middle;
             padding: 10px 0px 10px 10px;
             font-size:150%;
             display: table-cell;
         }

</style>

</head>

<body>

	<div class="container-fluid">
		<header>
			<div class="d-none d-lg-block" id="fix-title">
				<div id="fix-logoDiv">
					<div id="fix-logo">
						<a href="#"> <img id="schoolLogo"
							src="<c:url value="/resources/img/logo.png" />" alt=""> <span
							id="sideLogo"> 知恵通信大学 </span>
						</a>
					</div>
				</div>
				<div id="fix-text">相談管理</div>
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
					<a href ="sMyPage"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" id="hiddenImg" src="${sessionScope.PICNAME}"><br> <span> ${sessionScope.loginName} </span></a>
				</div>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav">
							<li class="nav-item">
								<a class="nav-link js-scroll-trigger" href="/MyPage">HOME</a></li>
							<li class="nav-item">
								<a class="nav-link js-scroll-trigger" href="/MyInformation">情報修正</a></li>
							<li class="nav-item">
								<a class="nav-link js-scroll-trigger" href="/courseList">講義管理</a></li>
							<li class="nav-item">
								<a class="nav-link js-scroll-trigger" href="/consult">相談管理</a></li>
					</ul>
				</div>
			</nav>
			<div class="col-sm-1"></div>
			<div class="col-sm-2" id="hiddenleft"></div>
			<div class="col-sm-9" id="hiddenright">

				<h1>講義開設</h1>
				<hr style="width: 95%;">
				<div id="conte">
					<h4>講義を開設する申し込みができます。開設は管理者の承認があってから開設します。</h4>
					<br>
					<section style="margin-top: 30px;">
						<div class="row placeholders">
							<div class="col-xs-12 col-sm-11 placeholder">
								<form method="post" enctype="multipart/form-data">
									<table class="table table-striped">
										<thead class="thead">
											<tr id="table-title">
											</tr>
										</thead>
										<tbody id="context">
											<tr class="table-title">
												<td class="cont1">講 義 名</td>
												<td colspan="3"><input type="text"  id="tel1" name="tel1" class="myInfoTel" style="width: 95%;"
												required="required"></td>

											</tr>
											<tr class="table-title">
												<td class="cont1">教授名前</td>
												<td class="cont2">${sessionScope.loginName}</td>
												<td class="cont1">所　　属</td>
												<td class="cont2">融合経営学部 経営学科</td>
											</tr>
											<tr class="table-title">
												<td class="cont1">開設学期</td>
												<td class="cont2">2019年　1学期</td>
												<td class="cont1">教育課程</td>
												<td class="cont2"
													style="padding-top: 0px; padding-bottom: 0px;"><button
														type="button" class="btn-sm" id="password"
														style="float: left; width: 98%;">入 &nbsp &nbsp 力</button></td>
											</tr>
											<tr class="table-title">
												<td class="cont1">受講人数</td>
												<td class="cont2"><input type="number"  id="tel1" name="tel1" class="myInfoTel" style="width: 73%;" required="required" value="30">名</td>
												<td class="cont1">ク ラ ス</td>
												<td class="cont2"><input type="number"  id="tel1" name="tel1" class="myInfoTel" style="width: 73%;" required="required" value="1">分部</td>
												</td>
											</tr>
											<tr class="table-title">
												<td class="cont1">対象学年</td>
												<td class="cont2"><input type="number"  id="tel1" name="tel1" class="myInfoTel" style="width: 73%;" required="required" placeholder="1">年生</td>

												<td class="cont1">科目種類</td>
												<td class="cont2"><select style="width: 280px; padding-left:20px;">
												<option value="専攻" selected="selected" style="width: 280px;">専攻</option>
												</select>

											</tr>
											<tr class="table-title">
												<td class="cont1">連関過程*</td>
												<td class="cont2"><label>ある</label><input type="radio" style="width: 10%;"><label>ない</label><input type="radio" style="width: 10%;"></td>
												<td class="cont1">過程選択</td>
												<td class="cont2"><select  style="width: 280px; padding-left:20px;"><option value="専攻" selected="selected" style="width: 280px;">教育課程の選択</option></select></td>
											</tr>
											<tr class="table-title">
												<td class="cont1">講義方法</td>
												<td class="cont2"><label>動画</label><input type="radio" style="width: 10%;"><label>リアルタイム</label><input type="radio" style="width: 10%;"></td>
												<td class="cont1">講義時間</td>
													<td class="cont2"　style="padding-top: 0px; padding-bottom: 0px;"><button
														type="button" disabled="disabled" class="btn-sm" id="password"
														style="float: left; width: 98%;">時　間　 登　録</button></td>
											</tr>
											<tr class="table-title">
												<td class="cont1">講義計画書</td>
												<td class="cont2" colspan="4" style="    padding-left: 32px;">
												　　<div id="fileUpload" class="dragAndDropDiv" style="width: 756px;">
												  ファイルを<br>引き落とす
												   </div>
												</td>
											</tr>
											<tr class="table-title"
												style="border-bottom: 1px solid #dee2e6;">
												<td class="cont1">教授目標</td>
												<td class="cont2" colspan="4">
													<textarea rows="1" cols="1" style="width: 95%; height: 150px; border : 1px solid #dee2e6"></textarea>
												</td>
											</tr>
											<tr class="table-title"
												style="border-bottom: 1px solid #dee2e6;">
												<td class="cont1">案内内容</td>
												<td class="cont2" colspan="4">
													<textarea rows="1" cols="1" style="width: 95%; height: 150px; border : 1px solid #dee2e6"></textarea>
												</td>
											</tr>
										</tbody>
										<tfoot style="border-bottom: 2px solid #dee2e6">
											<tr>
											</tr>
										</tfoot>
									</table>
								</form>
								<button id="apply" type="button"
									style="width: 22%; float: right">開設申し込み</button>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
</body>

</html>
