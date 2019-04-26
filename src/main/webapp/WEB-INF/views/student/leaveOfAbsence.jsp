<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!-- 해야하는 것 : 페이징처리 -->

<html lang="kr">
<head>
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
<title>学生情報管理</title>

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
         <a href="goHome"> <img id="schoolLogo" src="<c:url value="/resources/img/logo.png" />" alt=""> 
           <span id="sideLogo"> 知恵通信大学 </span>
         </a>
       </div>
       </div>
       <div id="fix-text">学生情報</div>
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
								<a class="nav-link js-scroll-trigger" href="MyGrade">成績</a>
							</li>
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="MyInformation">学籍情報</a>
					</li>
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="courseList">講義</a>
					</li>
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="consult">相談</a>
					</li>
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="certificate">証明書</a>
					</li>
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="registration">登録</a>
					</li>
			</ul>
		</div>
	</nav>
		<div class="col-sm-1"></div>
		<div class="col-sm-2" id="hiddenleft"></div>
		<div class="col-sm-9" id="hiddenright">
			<h1>休学・復学内訳</h1>
			<hr style="width: 95%;">
			<br>
			<div id="conte">
				<h4>休学と復学の申し込み内訳と処理結果を確認できます</h4>
				<br>
				<div class="table-responsive">
							<form method="post" enctype="multipart/form-data" >
					<table class="table table-striped">
						<thead class="thead">
								<tr id="table-title" style="background-color: rgb(240,240,240);">
									<th style="width: 4%"></th>
									<th style="width: 13%">学年</th>
									<th style="width: 20%">学期</th>
									<th style="width: 12%">種類</th>
									<th style="width: 18%">申込む日子</th>
									<th style="width: 15%">申込書</th>
									<th style="width: 18%">処理結果</th>
								</tr>
						</thead>
						<tbody>
							<c:forEach items="${statusList}" var="status" varStatus="index">
								<tr>
									<td style="width: 4%">${index.count}</td>
									<!-- 목록번호 -->

									<td style="width: 13%">${status.YEAR} 年 ${status.SEMESTER}</td>
									<!-- 휴학학기 -->

									<td style="width: 20%">${status.GRADE}</td>
									<!-- 휴학학기 -->

									<td style="width: 12%">${status.STATUSNAME}</td>
									<!-- 상태 종류  -->

									<td style="width: 18%">${status.APPLY_DATE}</td>
									<!-- 신청 시간 -->

									<td style="width: 15%">
										<button class="btn btn-primary btn-sm" data-value='${counsel.SSSEQ}' style="width: 95%;">申し込み書</button>
									</td>
									<!-- 신청서보기 -->

									<td style="width: 18%;border-right : none;">
									<c:choose>
										<c:when test="${status.ISAUTH == 'A'}">処理待機</c:when>
										<c:when test="${status.ISAUTH == 'B'}">承認完了</c:when>
										<c:when test="${status.ISAUTH == 'F'}">取り消し</c:when>
										<c:when test="${status.ISAUTH == 'G'}">承認拒否</c:when>												
									</c:choose>
									</td>
									<!-- 처리 결과 확인 -->
								</tr>
							</c:forEach>
						</tbody>
							<tfoot style="border-bottom: 2px solid #dee2e6">
								<tr>
									<td colspan="7" style="text-align: right">件数 ：${fn:length(statusList)}件
									</td>
								</tr>
							</tfoot>
					</table>
				</form>
				<button id="apply" type="button" style="width: 22%; float: right">新規申し込み</button>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="boardFooter" style="position: absolute; bottom: -45%;">
 © ChiE Online University <br>
 Tel : 03-3344-4444 &nbsp &nbsp Fax : 03-3344-5555 &nbsp &nbsp board@chie.ac.kr <br>
 <p id="copyRight"> COPYRIGHTⒸ ChiE Online University <p>
</div>
		
<script type="text/javascript">
var isFileChange = false;
var formData = null;
var fileName = null;

$(function() {
    $("#btn-logout").on("click", logout);
    $("#apply").on("click",apply);
  });

	function apply(){
		location.href="statusChange";
  }
  
    function logout() {
      var con_test = confirm("ログアウトしますか。");
      if (con_test == true) {
    	  location.href="logout";
      }
    }
</script>
</body>
</html>
