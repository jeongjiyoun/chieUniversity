<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>成績</title>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

<link href="<c:url value="/resources/css/course.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/resume.css" />" rel="stylesheet" type="text/css">

<!-- bootstrap -->
<link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">

<!-- Jquery -->
<script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>

<!-- Title Page-->
<title>成績確認</title>

<!-- Font special for pages-->
<link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">

<!-- Main CSS *-->
<link href="<c:url value="/resources/css/consult.css" />" rel="stylesheet" media="all">

<!-- 미세 커스텀 조정 -->
<link href="<c:url value="/resources/css/boardCss.css" />" rel="stylesheet" type="text/css">


<script>
var sreginum =$("#sreginum").val();
var year;
$(function(){
	init();
	$("#year").on("change",selectScoreYearType);
	
	$("#semester").on("change",selectScoreSemesterType);
	$("#btn-logout").on("click",logout);
	$("#reset").on("click",reset);
});

function reset(){
location.reload();	
}

function logout() {
    var con_test = confirm("ログアウトしますか。");
    if (con_test == true) {
    	location.href="/logout";
    }
}

function init(){
	var sreginum=$("#sreginum").val();
	//이 학생의 성적을 뽑아오는것
	$.ajax({
		type :'POST'
	    ,url : 'selectStudentScore'
	    ,data : {
	    	"sreginum" : sreginum
	    }
	    ,success : function(resp){
	    	output(resp);
	    }	
	});
	

}

//선택한 타입별로 점수 뽑아오는것
function selectScoreYearType(){
	var year=$("#year option:selected").val();
	sreginum=$("#sreginum").val();
// 	var semester =$("#semester option:selected").val();

	$.ajax({
			type :'POST'
		    ,url : 'selectScoreYearType'
		    ,data : {
		    	"year" : year
		    	,"sreginum" :sreginum
// 		    	,"semester":semester
		    }
		    ,success : function(resp){
		    	output(resp);
		    }
	});
}

function selectScoreSemesterType(){
	var semester =$("#semester option:selected").val();
	var year =$("#year option:selected").val();
	sreginum=$("#sreginum").val();

	$.ajax({
		type :'POST'
		    ,url : 'selectScoreSemesterType'
		    ,data : {
		    	"year" : year
		    	,"sreginum" :sreginum
		    	,"semester":semester
		    }
		    ,success : function(resp){
		    	output(resp);
		    }
	});	
}

function output(sList){
	var ini = 1;
	var cont ="";
	$.each(sList,function(index, item){
	cont+="<tr class = 'hahaha' data-value ='"+item.SMSEQ+"'>";
	cont+="<td class='ss' style='width : 7%;'>"+ini+"</td>";
	cont+="<td class = 'year' style='width : 10%;'>"+item.YEAR+"</td>";
	cont+="<td class = 'semester' style='width : 15%;'>"+item.SEMESTER+"</td>";
	cont+="<td class = 'name' style='width : 37%;'>"+item.NAME+"</td>";

	if (item.ASS_SEQ!=null) {
	cont+="<td class = 'score_grade' style='width : 15%;'>"+item.SCORE_GRADE+"</td>";
	cont+="<td class = 'ass_seq1' style='width : 16%;'>評価完了</td></tr>";
		}
	else{
		cont+="<td class = 'score_grade' style='width : 15%;'></td>";
		cont+="<td class = 'ass_seq2' style='width : 16%;'><a href='javascript:goAssessment("+item.SMSEQ+")'>敎授評価</a></td></tr>";
	}	
		ini++;
	});
	$("#sTable").html(cont);
}

function goAssessment(smseq){
	var url = "goAssessment?smSeq="+smseq;
	window.open(url, '_blank', 'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes, location=no, menubar=no,scrollbars=no', false);
}
</script>

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
        <div id="fix-text">成績管理</div>
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
					<a href ="MyPage"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" id="hiddenImg" src="${sessionScope.PICNAME}"><br> <span> ${sessionScope.loginName} </span></a><br>
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
			<h1>成績確認</h1>
			<hr style="width: 95%;">
			<br>
				<h4>講義評価をしてから成績を確認することができます。</h4>
				<br>
        <div class="row placeholders">
          <div class="col-xs-12 col-sm-11 placeholder">
          <br><br>
			<input id="sreginum" type="hidden" value="${sessionScope.loginId}">
			
			学年 : <select name ="year" id="year">
				<option value="NULL">全学年</option>
				<c:forEach items="${yList}" var="Year">
				<option value="${Year}">${Year}</option>
				</c:forEach>
			</select>
			
			学期 :<select name ="semester" id="semester">
				<option value="NULL">全学期</option>
				<c:forEach items="${semList}" var="Semester">
				<option value="${Semester}">${Semester}</option>
				</c:forEach>
			</select>
			<button id="reset" style="width: 127px;">新しい検索</button>
			<br>
			<hr class="one"></hr>
			<table class="table table-striped" style="border : 1px solid #dee2e6; display: table;">
			<thead>
				<tr style="background-color: rgb(240, 240, 240);">
					<th style='width : 7%; border-right : 1px solid #dee2e6;'></th>
					<th style='width : 10%;'>学年</th>
					<th style='width : 15%; border :1px solid #dee2e6;'>学期</th>
					<th style='width : 37%; border : 1px solid #dee2e6;'>講義名</th>
					<th style='border : 1px solid #dee2e6; width:15%;'>成績</th>
					<th style='border : 1px solid #dee2e6; width:16%;'>敎授評価</th>
				</tr>
			</thead>
			<tbody id="sTable">
			</tbody>
			</table>
          </div>
        </div>
    </div>
  </div>
</div>
	<div id="boardFooter" style="position: absolute;">
 © ChiE Online University <br>
 Tel : 03-3344-4444 &nbsp &nbsp Fax : 03-3344-5555 &nbsp &nbsp board@chie.ac.kr <br>
 <p id="copyRight"> COPYRIGHTⒸ ChiE Online University <p>
 </div>

</body>

</html>
