<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>登録</title>
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
<title>登録確認</title>

<!-- Font special for pages-->
<link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">

<!-- Main CSS *-->
<link href="<c:url value="/resources/css/consult.css" />" rel="stylesheet" media="all">

<!-- 미세 커스텀 조정 -->
<link href="<c:url value="/resources/css/boardCss.css" />" rel="stylesheet" type="text/css">

</head>
<body>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	var IMP = window.IMP;
	IMP.init("imp81795222");
	var enseq = null;
	var totalcost = null;
	
	$(function() {
		$("#check").on('click', appendCheck);
	})
	
	function appendCheck(){
		var enSeq = $(this).attr("data-value1");
		var cont="";
		$.ajax({
			type:'GET'
			,url: 'registInfo'
			,success : function(result){
				alert("??");
				$.each(result,function(index, item){	
					if (item.ENSEQ==enSeq) {
				cont="<tr><td colspan='4'>( 全単位   "+item.TOTLALCREDIT+"X 7000円  ="+item.TOTALCOST+") -奨学金  "+item.TOTSCOLASHIP+"<br>= 最終決済金額  "+item.SUBTOTAL+"</td><td><button>口座決済</button></td><td><button id='#'>カード決済</button></td></tr>";
		
					}
			});
			$('tbody').after(cont);
				}
		});
		$("#check2").on('click', check_module);
	}
	
	function check_module() {
		enseq = $(this).attr("data-value1");
		totalcost = $(this).attr("data-value2");
		IMP.request_pay({
			pg : 'html5_inicis',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '授業料決済',
			amount : 1//totalcost,
		}, function(rsp) {
			if (rsp.success) {
				var uri = "action";
				jQuery.ajax({
					url : uri,
					type : 'POST',
					dataType : 'json',
					data : {
						imp_uid : rsp.imp_uid
					},
					success : function(rsp) {
						alert("!");
					},
					error : function(error) {
						alert(JSON.stringify(error));
						console.log(JSON.stringify(error));
					}
				}).done(
						function(data) {
							if (rsp.success) {
								var msg = '決済が完了しました。';
								alert(msg);

								var today = new Date();
								var result = today.getFullYear() + "/"
										+ (today.getMonth() + 1) + "/"
										+ today.getDate() + " ";

								// Create a new JavaScript Date object based on the timestamp
								// multiplied by 1000 so that the argument is in milliseconds, not seconds.
								var date = new Date(rsp.paid_at * 1000);
								// Hours part from the timestamp
								var hours = date.getHours();
								// Minutes part from the timestamp
								var minutes = "0" + date.getMinutes();
								// Seconds part from the timestamp
								var seconds = "0" + date.getSeconds();

								// Will display time in 10:30:23 format
								var formattedTime = hours + ':'
										+ minutes.substr(-2) + ':'
										+ seconds.substr(-2);
								$.ajax({
									url : 'finish',
									type : 'POST',
									data : {
										'paymentnum' : rsp.imp_uid,
										'enseq' : enseq,
										'issucess' : rsp.success,
										'meansofpayment' : rsp.pay_method,
										'resultcode' : rsp.apply_num,
										'totprice' : rsp.paid_amount,
										'indate' : result,
										'receipt_url' : rsp.receipt_url
									},
									success : function(rsp) {
										alert(rsp);
										location.reload();
									},
									error : function(error) {
										alert(JSON.stringify(error));
										console.log(JSON.stringify(error));
									}
								});
							} else {
								var msg = '決済に失敗しました。';
								msg += '\nエラー内容 : ' + rsp.error_msg;
							}
						});
				alert(msg);
			}
		});
	}

</script>
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
				<h1>登録の内訳</h1>
				<hr style="width: 95%;">
				<br>
				<div id="conte">
					<h4>学生の登録現況を見ることができ,登録金決済ができます。</h4>
				<br>
			<span style="float:right; width: 400px;">
				<input type="button" value="決済" onClick="location.href='registration';" style="width: 38%; background-color:rgb(22,56,93); align: right; padding:8px; color:white">
				<input type="button" value="奨学" onClick="location.href='scholaship';" style="width: 38%;  align: right; padding:8px;">
				</span>
				<br>
				<section style="margin-top: 30px;">
					<div class="row placeholders">
						<div class="col-xs-12 col-sm-11 placeholder">
							<div class="table-responsive" style="overflow-x: hidden;">
								<table class="table table-striped">
									<thead class="thead">
										<tr id="table-title"
											style="background-color: rgb(240, 240, 240)">
											<th style="width: 20%; border-left: 1px solid #dee2e6;">学期</th>
											<th style="width: 10%; border-left: 1px solid #dee2e6;">単位</th>
											<th style="width: 20%; border-left: 1px solid #dee2e6;">金額</th>
											<th style="width: 15%; border-left: 1px solid #dee2e6;"><a href = "scholaship">総長学金</a></th>
											<th style="width: 15%; border-left: 1px solid #dee2e6;">決済額</th>
											<th style="width: 15%; border-left: 1px solid #dee2e6;">決済可否</th>
										</tr>
									</thead>
									<tbody>
										<!-- for each구문을 걸어서 보여주기. -->
										<c:forEach var="Bill" items="${result}">
											<tr>
												<td style="width: 20%; text-align: center">${Bill.YEAR}年${Bill.SEMESTER}</td>
												<td style="width: 10%; text-align: center">${Bill.TOTLALCREDIT}</td>
												<td style="width: 20%;  text-align: center"><fmt:formatNumber value="${Bill.SUBTOTAL}" pattern="¥#,###.##"/></td>
												<td style="width: 15%; text-align: center"><fmt:formatNumber value="${Bill.TOTSCOLASHIP}" pattern="¥#,###.##"/></td>
												<td style="width: 15%; text-align: center"><fmt:formatNumber value="${Bill.TOTALCOST}" pattern="¥#,###.##"/></td>
											<td style="width: 15%; border-bottom: 1px solid #dee2e6;">
											<c:choose>
												<c:when test="${Bill.ISPAYED == 'F'}">
												<button id="check" type="button" data-value1="${Bill.ENSEQ}" data-value2="${Bill.TOTALCOST}" style="width: 95%;">決済</button> 
												</c:when>
												<c:when test="${Bill.ISPAYED == 'T'}">
													決済完了
												</c:when>
											</c:choose>
											</td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<td style="width: 20%; text-align: center"></td>
											<td style="width: 10%; text-align: center"></td>
											<td style="width: 20%; text-align: center"></td>
											<td style="width: 15%; text-align: center"></td>
											<td style="width: 15%; text-align: center"></td>
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
		function logout() {
			var con_test = confirm("ログアウトしますか。");
			if (con_test == true) {
				location.href = "/logout";
			}
		}

		$(function() {
			$(".btn.btn-primary.btn").on("click", goSubject);
		});

		function goSubject() {
			var subjectNum = $(this).attr("data-value");
		}
	</script>
</body>
</html>