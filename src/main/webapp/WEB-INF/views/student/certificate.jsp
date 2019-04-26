<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="kr">

<head>
  <title>証明書</title>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<!-- bootstrap -->
<link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">

<link href="<c:url value="/resources/css/course.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/resume.css" />" rel="stylesheet" type="text/css">


<!-- Jquery -->
<script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>

<!-- Font special for pages-->
<link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">

<!-- Main CSS *-->
<link href="<c:url value="/resources/css/consult.css" />" rel="stylesheet" media="all">

<!-- 미세 커스텀 조정 -->
<link href="<c:url value="/resources/css/boardCss.css" />" rel="stylesheet" type="text/css">
<script type="text/javascript">

	function selectButton(){
		var type = $("#cerType").val();
		if (type=="111"){
			getCertificate();
		} else{
			$.ajax({
				url:"checkStatus",
				data:{type:type},
				type:"post",
				success:function(data){
					if(data!=""){
						//alert(data);
					} else{
						getCertificate();
					}
				}
				
				
				
			});
		}
	}



	function getCertificate(){
		var type = $("#cerType").val();
		var url = 'certiPop?type='+type;
		window.open(url,'_blank','height=800, width=900, left=300,top=0',false);
	}


</script>
<style type="text/css">
	#typeButton{
		float:unset;
		width:10%;
	}
</style>

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
        <div id="fix-text">証明書</div>
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
			
			<c:if test="${message!=null}">
				<script>
					var message = ${message};
					alert(message);
				</script>
				
			</c:if>
    <div class="col-sm-1"></div>
    <div class="col-sm-2" id="hiddenleft"></div>
    <div class="col-sm-9" id="hiddenright">
		<div id="ctitle" style="font-size:40px;">
			証明書発給
		</div>
			<br>証明書種類選択　:　
			<select id="cerType">
			<option value=" ">選択</option>
			<option value="111">成績証明書</option>
			<option value="100">在学証明書</option>
			<option value="200">休学証明書</option>
			<option value="300">卒業証明書</option>
												
			</select>
			<button type="submit" id="typeButton" onclick="selectButton();">申請</button>
			<br><br>
			証明書発給履歴
	<hr style="width: 95%;">
	
  </div>
</div>
<script type="text/javascript">
function logout() {
    var con_test = confirm("ログアウトしますか。");
    if (con_test == true) {
    	location.href="/logout";
    }
}

function watch(){
	var counselseq = $(this).attr("data-value");
	var url = '/selectConP?counselseq=' + counselseq;
	window.open(url, '_blank', 'resizable=no, height=600, width=800, location=no, menubar=no, left=20%, top=20%,scrollbars=no', false);
}

$(function(){
	$(".btn.btn-primary.btn").on("click", goSubject);
	$("#btn-logout").on("click", logout);
});

function goSubject(){
	var subjectNum = $(this).attr("data-value");
	location.href="/subjectDetail?lecturenum="+subjectNum;
}
</script>
</body>

</html>
