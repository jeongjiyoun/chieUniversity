
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html lang="kr">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


<%-- <link href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet"> --%>
<%-- <link href="<c:url value="/resources/css/course.css"/>" rel="stylesheet"> --%>

<script src="resources/jquery-3.3.1.min.js"></script>
  <link href="<c:url value="/resources/css/resume.css" />" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">
  <link href="<c:url value="/resources/css/course.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">

  <!-- 미세 커스텀 조정 -->
  <link href="<c:url value="/resources/css/boardCss.css" />" rel="stylesheet" type="text/css">

<!-- Title Page-->
<title>Assignment</title>



<!-- <!-- Main CSS *-->
<!-- <link href="/resources/css/consult.css" rel="stylesheet" media="all"> -->

<!-- 미세 커스텀 조정 -->

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
					      <a class="nav-link js-scroll-trigger" href='subjectDetail?lecturenum=${sessionScope.lectureNum}'>講義HOME</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link js-scroll-trigger" href="subjectNotice?lecturenum=${subject.LECTURENUM}">お知らせ</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link js-scroll-trigger" href="QnA?lecturenum=${subject.LECTURENUM}">QnA</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link js-scroll-trigger" href="assignment?lecturenum=${subject.LECTURENUM}">宿題</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link js-scroll-trigger" href="goexam?lecturenum=${subject.LECTURENUM}">試験</a>
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
     	<th>TITLE:</th><td>${assign.title}</td>
     </tr>
    
     <tr>
     <th>DATE:</th><td>${assign.indate}</td>
     </tr>
     <tr>
     	<th>START:</th><td>${assign.startDate}</td>
     </tr>
     <tr>
     	<th>END:</th><td>${assign.endDate}</td>
     </tr>
     </table>
    </div>
     <textarea name="contents" id="contents" rows="12" cols="120" readonly="readonly">${assign.contents}</textarea>

<c:if test="${sessionScope.userType=='P'}">
   <form action="updateAssign" method="post">
   <input type="hidden" name="assSeq" value="${assign.assSeq}">
    <button class="but01" id="updB" style="float: left;margin: 1%;">Update</button>
    </form>
   </c:if>
   
   <c:if test="${sessionScope.userType=='P'}">
   <form action="deleteAssign" method="post">
   <input type="hidden" name="assSeq" value="${assign.assSeq}">
    <button class="but01" id="delB" style="float: left;margin: 1%;">Delete</button>
    </form>
    </c:if>
    </section>
    <br>

	
	<c:if test="${sessionScope.userType=='S'}">
		<c:if test="${assignStu==null}">
    <form action="writeAssignS" id="assignS" method="post">
    <input type="hidden" name="assSeq" id ="assSeq" value="${assign.assSeq}">    
    <button>Submit</button>
    </form>
    </c:if>
   </c:if>
    
     <br>
    <c:if test="${sessionScope.userType=='S'}">
    	<c:if test="${assignStu!=null}">
     <hr>
     <table>
     <tr>
     	<th>TITLE:</th><td>${assignStu.title}</td>
     </tr>
     <tr>
     <th>DATE:</th><td>${assignStu.indate}</td>
     </tr>
     <tr>
     <th>FILE:</th>
     <td>
     <c:forEach var="assign1" items="${afList}">
     <a href="downloadSFile?fileASeq=${assign1.fileASeq}">${assign1.org_Name}</a><br>
     </c:forEach>
     </td>
     </tr>
     </table>
    </div>
     <textarea name="contents" id="contents" rows="12" cols="120" readonly="readonly">${assignStu.contents}</textarea>
     
      <form action="updateAssignS" method="post">
   <input type="hidden" name="aSubSeq" value="${assignStu.aSubSeq}">
    <button class="but01" id="updB" style="float: left;margin: 1%;">Update</button>
    </form>
   
   <form action="deleteAssignS" method="post">
   <input type="hidden" name="aSubSeq" value="${assignStu.aSubSeq}">
    <button class="but01" id="delB" style="float: left;margin: 1%;">Delete</button>
    </form>
    <br>
	</c:if>
   </c:if>

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
