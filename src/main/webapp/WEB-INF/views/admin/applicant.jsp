<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>申請</title>
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
<title>申請確認</title>

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
$(function() {
	$(".clickApplicant").on("click",aPopup);
});

function aPopup(){
	var applicantSeq = $(this).attr("data-value");
	var url ='pickApplicant?applicantSeq='+applicantSeq;
	window.open(url,'_blank','height=500, width=1150, left=0,top=0',false); 
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
							src="<c:url value="/resources/img/logo.png" />" alt=""> <span
							id="sideLogo"> 知恵通信大学 </span>
						</a>
					</div>
				</div>
				<div id="fix-text">申請確認</div>
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
				<div id="prof-span">
					<a href="adminhome"><img
						class="img-fluid img-profile rounded-circle mx-auto mb-2"
						id="hiddenImg" src="${sessionScope.PICNAME}"><br> <span>
							${sessionScope.loginName} </span></a>
				</div>
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
				<h1>申請内訳</h1>
				<hr style="width: 95%;">
				<br>
				<div id="conte">
					<!-- 					<h4>ができます。</h4> -->
					<br> <br>
					<section>
						<div class="row placeholders">
							<div class="col-xs-12 col-sm-11 placeholder">
								<div class="table-responsive" style="overflow-x: hidden;">
									<table class="table table-striped">
										<thead class="thead">
											<tr id="table-title" style="background-color: rgb(240, 240, 240)">
												<th style=" border-left: 1px solid #dee2e6;">名前</th>
												<th style=" border-left: 1px solid #dee2e6;">誕生日</th>
												<th style="	border-left: 1px solid #dee2e6;">電話番号</th>
												<th style=" border-left: 1px solid #dee2e6;">Email</th>
												<th style=" border-left: 1px solid #dee2e6;">原書提出日</th>
											</tr>
										</thead>
										<tbody>
											<!-- for each구문을 걸어서 보여주기. -->
											<c:forEach var="applicant" items="${aList}">
												<tr class="clickApplicant" data-value="${applicant.applicantSeq}">
													<td style="text-align: center">${applicant.name}</td>
													<td style="text-align: center">${applicant.birthday}</td>
													<td style="text-align: center">${applicant.phoneNum}</td>
													<td style="text-align: center">${applicant.email}</td>
													<td style="text-align: center">${applicant.wdate}</td>
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
	</div>
	<script type="text/javascript">
	 $(function(){
		init();	 
	 });
	 
	 function init(){
		 $.ajax({
				type :'GET'
				,url : 'adminApplicant'
				,success : function(){
					
				}
			});
	 }
	
		function logout() {
			var con_test = confirm("ログアウトしますか。");
			if (con_test == true) {
				location.href = "/logout";
			}
		}

// 		$(FUNCTION() {
// 			$(".BTN.BTN-PRIMARY.BTN").ON("CLICK", GOSUBJECT);
// 		});

// 		FUNCTION GOSUBJECT() {
// 			VAR SUBJECTNUM = $(THIS).ATTR("DATA-VALUE");
// 		}
	</script>
</body>
</html>