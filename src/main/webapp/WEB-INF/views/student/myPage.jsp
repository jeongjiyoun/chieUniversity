<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>私の講義室</title>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<!-- bootstrap -->
<link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">

<link href="<c:url value="/resources/css/resume.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/course.css"/>" rel="stylesheet">

<style>
.menu a{cursor:pointer;}
.menu .hide{display:none;}
    
#tTbody tr td{
	height : 40px;
	
}
a.bottomLine{
/* 	border-bottom: 1px solid black; */
}

a.bottomLine:hover{
	font-weight : 480;
	border-bottom: none;	
}

</style>

<!-- Jquery -->
<script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>

<!-- Font special for pages-->
<link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">

<!-- Main CSS *-->
<link href="<c:url value="/resources/css/consult.css" />" rel="stylesheet" media="all">

<!-- 미세 커스텀 조정 -->
<link href="<c:url value="/resources/css/boardCss.css" />" rel="stylesheet" type="text/css">

<style type="text/css">
.menu ul li a{
  line-height:40px;
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
					<a href ="myPage"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" id="hiddenImg" src="${sessionScope.PICNAME}"><br> <span> ${sessionScope.loginName} </span></a>
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
    <div class="col-sm-2" id="hiddenleft"></div>
    <div class="col-sm-7" style="background-color: white; margin-top: 60px; min-height: 700px;">
    	<div style="margin-left: 85px; margin-top:40px;">
    			<span style="font-size: 2.1rem; color : rgb(5, 33, 63); font-weight: 480;">受講中の講義</span>
    			<br>
    			<br>
    			<div class="subjectList"  style="background-color: #f7f9fa85; width: 90%; padding : 10px; border: 1.1px solid #aeafaf;">
	    			<ul style="list-style-type: none;  list-style-position: inside; margin-left: 30px;">
		    			<li class="menu">
		    				<a style="border-bottom: 1px solid gray;width: 70%;"><img src=""/>受講中の科目<span style="right: -110%; position: relative; color : #aeafaf;">▽</span></a>
		    				<ul class="hide" style="list-style-type: none; list-style-position: inside;">
				    			<c:forEach items="${subjectList}" var="subject">
				    					<li><a style="text-indent: 20px;" href="/subjectDetail?lecturenum=${subject.LECTURENUM}">${subject.TITLE}(${subject.PNAME})</a></li>
				  				</c:forEach>
		    				</ul>
		    			</li>
    				</ul>
    			</div>
    			<br>
    			<br>
    			<div class="notice">
    			<span style="font-size: 1.8rem; color : rgb(5, 33, 63); font-weight: 480; margin-right: 20px;">お知らせ</span>
    			<span style="position: relative; top: -6px; color : #727c87">|</span>
    			<span style="font-size: 1.8rem; color : #62666a; font-weight: 480; margin-left:20px;">学校日程</span>
    			<hr style="width: 90%;">
    			<div id="qTable">
							<table style="width: 100%; border-collapse: separate; border-spacing: 0 10px;">
								<thead>
								</thead>
								<tbody style="font-size: 1.25rem;">
								<c:if test="${newList!=null}">
									<c:forEach var="news" items="${newList}" step="1" begin="0" end="5">
										<tr data-value="${news.NOTICESEQ}">
											<td style="width: 20%;padding-top: 9px;">${news.INDATE}</td>
											<td style="width: 80%"><a class="bottomLine">${news.TITLE}</a></td>
										</tr>
									</c:forEach>
								</c:if>
								</tbody>
							</table>
						</div>
    			</div>
    	</div>
    </div>
    <div class="col-sm-3"style="background-color: #f7f9fa; margin-top: 60px;">
		<div style="margin-left: 20px; margin-top:40px;">
				<button id="register" style="float: left;border-radius: 2px; width: 90%; margin: 0 auto; padding-top: 20px; padding-bottom: 20px;">受講申し込み</button>
    			<br>
    			<br><br>
    			<span style="font-size: 2.1rem; font-weight: 480;color : rgb(5, 33, 63); "> - 授業時刻表</span>
    			<div class="subjectList" style="background-color: #f7f9fa85; width: 90%; padding : 10px; border: 1.1px solid #aeafaf;">
				<table class="timetableTable1" style="float: left;">
					<tbody style="border-right: 1px solid gray; font-size: 5px;" id="tTbody">
					<tr><td style="border-bottom : 1px solid gray;height: 31.2px;">備考</td></tr>
					<tr><td>9:00</td></tr>
					<tr><td>10:00</td></tr>
					<tr><td>11:00</td></tr>
					<tr><td>12:00</td></tr>
					<tr><td>13:00</td></tr>
					<tr><td>14:00</td></tr>
					<tr><td>15:00</td></tr>
					<tr><td>16:00</td></tr>
					<tr><td>17:00</td></tr>
					<tr><td>18:00</td></tr>
					<tr><td>19:00</td></tr>
					</tbody>
					</table>
					<table style="width: 89%; font-size: 5px;">
						<thead>
							<tr>
							<td style="width: 20%; border-bottom : 1px solid gray;">月</td>
							<td style="width: 20%; border-bottom : 1px solid gray;">火</td>
							<td style="width: 20%; border-bottom : 1px solid gray;">水</td>
							<td style="width: 20%; border-bottom : 1px solid gray;">木</td>
							<td style="width: 20%; border-bottom : 1px solid gray;">金</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${timetable}" var="time1" begin = "0" step = "1" end ="22" varStatus="index">
							<tr>
								<c:forEach items="${time1}" var="time2"  begin = "0" step = "1" end ="4">
									<c:choose>
									<c:when test="${time2 != ' '}">
										<td style="width: 20%;"> </td>
									</c:when>
									<c:otherwise>
										<td style="width: 20%; background-color: #75b1f2;"> </td>						
									</c:otherwise>
									</c:choose>
								</c:forEach>		
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<br>
    			</div>
    			</div>
    
    </div>


  </div>
</div>
<script type="text/javascript">
$(function(){
	$(".btn.btn-primary.btn").on("click", goSubject);
	$("#btn-logout").on("click",logout);
	// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
    $(".menu>a").click(function(){
        var submenu = $(this).next("ul");

        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
        if( submenu.is(":visible") ){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
    });
	$("tr").on("click",showNews);
    $("#register").on("click",registerPop);
});

function logout() {
    var con_test = confirm("ログアウトしますか。");
    if (con_test == true) {
    	location.href="/logout";
    }
}

function showNews(){
	var post = $(this).attr("data-value");
	location.href="/newsDetail?post=" + post;
}

function goSubject(){
	var subjectNum = $(this).attr("data-value");
	location.href="/subjectDetail?lecturenum="+subjectNum;
}

function registerPop(){
	var url;
	$.ajax({
		url:"checkPeriod",
		type:"get",
		success:function(data){
			if(data){
				url = 'goRegipop';
				window.open(url,'_blank','height=600, width=1300, left=100,top=100',false); 
			} else{
				alert("수강신청기간이 아닙니다");
			}
		}
		
	});
}

</script>
</body>

</html>
