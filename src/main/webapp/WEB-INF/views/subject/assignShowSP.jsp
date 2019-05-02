
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html lang="kr">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet">

<link href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet">
<%-- <link href="<c:url value="/resources/css/course.css"/>" rel="stylesheet"> --%>
<link href="<c:url value="/resources/css/resume.css" />" rel="stylesheet" type="text/css">

<link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">

<script src="resources/jquery-3.3.1.min.js"></script>
<!-- Title Page-->
<title>Assignment</title>

<!-- Icons font CSS *-->
<link href="/resources/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
<link href="/resources/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">

<!-- Font special for pages-->
<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Vendor CSS *-->
<link href="/resources/vendor/select2/select2.min.css" rel="stylesheet" media="all">
<link href="/resources/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

<!-- <!-- Main CSS *-->
<!-- <link href="/resources/css/consult.css" rel="stylesheet" media="all"> -->

<!-- 미세 커스텀 조정 -->
<link href="<c:url value="/resources/css/boardCss.css" />" rel="stylesheet" type="text/css">

<style type="text/css">
button{
			width:10%;
			background-color:#06213F;
			border:none;
			
			color:#fff;
			padding:5px 0;
			text-align:center;
			text-decoration:none;
			display:inline-block;
			font-size:20px;
			margin:5px;
			float:right;
			cursor:pointer;
		}
		
		button.but01{
			width:10%;
			background-color:#06213F;
			border:none;
			color:#fff;
			padding:5px 0;
			text-align:center;
			text-decoration:none;
			display:inline-block;
			font-size:16px;
			margin:1%;
			float:left;
			cursor:pointer;
		}
	
</style>



</head>

<body style="padding-left: 0px;">
	<div class="container-fluid">
	<div class ="row">
		<div class = "col-sm-12">
			<div class="d-none d-lg-block" id="fix-title" style="margin-left: 0;">
				<div id = "fix-logoDiv">
					<div id = "fix-logo">
						<a href="goHome">
							<img id = "schoolLogo" src="<c:url value="/resources/img/logo.png" />"alt="">
							<span id="sideLogo">
								知恵通信大学
							</span>
						</a>
					</div>
				</div>
				<div id="fix-text">
					Assignment
				</div>
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
								<a class="nav-link js-scroll-trigger" href="goSubjectHome">HOME</a>
							</li>
							<li class="nav-item">
								<a class="nav-link js-scroll-trigger" href="subjectNotice">お知らせ</a>
							</li>
							<li class="nav-item">
								<a class="nav-link js-scroll-trigger" href="QnA">QnA</a>
							</li>
							<li class="nav-item">
								<a class="nav-link js-scroll-trigger" href="assignment">宿題</a>
							</li>
							<li class="nav-item">
								<a class="nav-link js-scroll-trigger" href="consult">試験</a>
							</li>
							
						</ul>
					</div>
				</nav>
					<div class = "col-sm-1"></div>
					<div class = "col-sm-2" id="hiddenleft"></div>
					<div class = "col-sm-9" id="hiddenright">
						<br>
						<div id = "conte">
						<div style="min-height: 600px;">
								<!-- 내용 들어가는 부분 -->
 		    
 		        <section id="about2">
 		    <div id="qTable">
     <table>
     <tr>
     	<th>TITLE:</th><td>${assign.TITLE}</td>
     </tr>
    
     <tr>
     <th>NAME:</th><td>${assign.SNAME}</td>
     </tr>
     <tr>
     	<th>DATE:</th><td>${assign.UDATE}</td>
     </tr>
     
     <tr>
     	<th>FILE:</th>
     	<td>
     	<c:if test="${aList!=null}">
     	<c:forEach var ="file" items="${aList}">
     	<a href="downloadSFile?fileASeq=${file.fileASeq}">${file.org_Name}</a><br>
     	</c:forEach>
     	</c:if>
     	</td>
     </tr>
     </table>
    </div>
     <textarea name="contents" id="contents" rows="12" cols="120" readonly="readonly">${assign.CONTENTS}</textarea>


    <form action="ShowAllAssignP" id="assignS" method="get">
    <input type="hidden" name="assSeq" id ="assSeq" value="${assign.ASSSEQ}">    
    <button>Return</button>
    </form>
    
     <br><br>
    <hr>
  </div>
 		
							</div>
						</div>
	        </div>
</div>
</div>
	<div id="boardFooter" style="position:absolute;">
	© ChiE Online University <br>
	Tel : 03-3344-4444 &nbsp &nbsp Fax : 03-3344-5555 &nbsp &nbsp board@chie.ac.kr <br>
			<p id="copyRight"> COPYRIGHTⒸ ChiE Online University <p>
	</div>
	    </div>
	    
	</div>
			
</body>

</html>
