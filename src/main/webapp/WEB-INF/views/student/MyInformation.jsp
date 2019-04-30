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
			<h1>個人情報</h1>
			<hr style="width: 95%;">
			<br>
			<div id="conte">
				<h4>個人情報の変更がある場合、個人情報が管理できます。</h4>
				<br>
				<div class="table-responsive">
				<form method="post" enctype="multipart/form-data" >
					<table class="table table-striped">
						<thead class="thead">
							<tr id="table-title">
							</tr>
						</thead>
						<tbody id = "context">
							<tr class="table-title">
								<td class = "cont1">所属</td>
								<td colspan="3">${USER.COLLEGE} ${USER.MAJOR}</td>
								<td style="width: 20%;" rowspan="5">
									<img id="faceInfo" style="width: 185px; height: 231px;" src="${sessionScope.PICNAME}">
									<div class="filebox">
									  <label for="ex_file">アップロード</label>
									  <input type="file" id="ex_file" name = "ex_file">
									</div>
								</td>
							</tr>
							<tr class="table-title">
								<td class = "cont1">名前</td>
								<td class = "cont2">${sessionScope.loginName}</td>
								<td class = "cont1">学生番号</td>
								<td class = "cont2">${sessionScope.loginId}</td>
							</tr>
							<tr class="table-title">
								<td class = "cont1">生年月日</td>
								<td class = "cont2">${USER.BIRTHDAY}</td>
								<td class = "cont1">パスワード</td>
								<td class = "cont2" style=" padding-top : 0px; padding-bottom : 0px;"><button type="button" class="btn-sm" id="password" style="float: left; width: 98%;">変 &nbsp &nbsp 更</button></td>
							</tr>
							
							<tr class="table-title">
								<td class = "cont1">状態</td>
								<td class = "cont2">${USER.STATUS}</td>

								<td class = "cont1">主専攻</td>
								<td class = "cont2">${USER.MAJOR}</td>
							</tr>
							<tr class="table-title">
								<td class = "cont1">入学時期</td>
								<td class = "cont2">${USER.ENTERDATE}</td>
								<td class = "cont1">複数専攻</td>
								<td class = "cont2">${USER.MAJOR2}</td>
							</tr>
							<tr class="table-title">
								<td class = "cont1">電話番号</td>
								<td class = "cont2" colspan="4">
								<span class="telSpan" style="height: 25px;"> </span>
								<input type="text" value="${USER.TEL1}" id="tel1" name ="tel1" class="myInfoTel" required="required">
								<span class="telSpan">-</span>
								<input type="text" value="${USER.TEL2}" id="tel2" name ="tel2" class="myInfoTel" required="required">
								<span class="telSpan">-</span>
								<input type="text" value="${USER.TEL3}"  id="tel3" name ="tel3" class="myInfoTel" required="required">									
								</td>
							</tr>
							<tr class="table-title">
								<td class = "cont1">住所</td>
								<td class = "cont2" colspan="4"><input id="address" name ="address" type="text" value="${USER.ADDRESS}" required="required" style="border: 1px solid #dee2e6; padding-left : 7px; padding-right : 7px; width: 95%;"></td>
							</tr>
							<tr class="table-title" style="border-bottom: 1px solid #dee2e6;">
								<td class = "cont1">イーメール</td>
								<td class = "cont2" colspan="4"><input type="email" name ="email" value="${USER.EMAIL}" id="email" style="border: 1px solid #dee2e6;  padding-left : 7px; padding-right : 7px; width: 95%;"></td>
							</tr>
						</tbody>
						<tfoot style="border-bottom: 2px solid #dee2e6">
						</tfoot>
					</table>
							</form>
					<button id="status" type="button" style="width: 22%; float: left">休学・復学</button>
					<button id="apply" type="button" style="width: 22%; float: right">情報変更</button>
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
    $("#status").on("click", status);
    $("#password").on("click", password);
    $("#btn-logout").on("click", logout);
    $("#apply").on("click",apply);
    $("#ex_file").change(fileChange);
  });

	//if File attached, change isFileChange
  function fileChange(){
	  isFileChange == true;

		var form = $('form')[0];
		formData = new FormData(form);
	    $.ajax({
	        type : 'POST'
	        ,url : 'upLoadPicture'
	        ,processData : false
            ,contentType: false
	        ,data : formData
	        ,success : function(resp){
	  			$("#faceInfo").src = resp;
	  			fileName = resp;
	        }
	    	,error : function(){
	    	}
	      });
  }

  function apply(){
	  formData = new FormData();
	  if (isFileChange) {
		  formData.append("name",fileName);
	  }
		
	  var tel = $("#tel1").val() + $("#tel2").val() + $("#tel3").val();
	  formData.append("tel",tel);
	  formData.append("address",$("#address").val());
	  formData.append("email",$("#email").val());

	  $.ajax({
	        type : 'POST'
	        ,url : 'UpdateMyInfo'
	        ,processData : false
            ,contentType: false
	        ,data : formData
	        ,success : function(resp){
				alert("変更処理ができました。");
	        }
	      });
		 isFileChange = false;
  }
  
   function password(){
  		window.open('passwordChange', '_blank', 'channelmode=yes, location=no, menubar=no,scrollbars=no', false);
  	}
   
   function status(){
		location.href="leaveOfAbsence";
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
