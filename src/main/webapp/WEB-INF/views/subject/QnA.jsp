﻿<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html lang="kr">

<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">

<link href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/resume.css" />" rel="stylesheet" type="text/css">

<link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">

<script src="resources/jquery-3.3.1.min.js"></script>

<!-- Title Page-->
<title>Q&A</title>
<script>
function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage;
	form.submit();
	
}
</script>

<!-- Vendor CSS *-->
<link href="/resources/vendor/select2/select2.min.css" rel="stylesheet" media="all">
<link href="/resources/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">
<!-- <!-- Main CSS *-->
<link href="/resources/css/consult.css" rel="stylesheet" media="all">

<!-- 미세 커스텀 조정 -->
<link href="<c:url value="/resources/css/boardCss.css" />" rel="stylesheet" type="text/css">

<style type="text/css">
a{
	color:#007bff;
}

th,td{
	color:#212529;
}

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
   
</style>


</head>

<body style="padding-left: 0px;">

   <div class="container-fluid">
   <div class ="row">
      <div class = "col-sm-12">
         <div class="d-none d-lg-block" id="fix-title">
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
               QnA
            </div>
         </div>
      
      <div class="row" id = "margin-del">
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
					<a href="MyPage"><img
						class="img-fluid img-profile rounded-circle mx-auto mb-2"
						id="hiddenImg" src="${sessionScope.PICNAME}"><br> <span>
							${sessionScope.loginName} </span></a>
							</div>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav">
					     <li class="nav-item">
					      <a class="nav-link js-scroll-trigger" href='subjectDetail?lecturenum=${sessionScope.lectureNum}'>講義HOME</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link js-scroll-trigger" href="subjectNotice?lecturenum=${sessionScope.lectureNum}">お知らせ</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link js-scroll-trigger" href="QnA?lecturenum=${sessionScope.lectureNum}">QnA</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link js-scroll-trigger" href="assignment?lecturenum=${sessionScope.lectureNum}">宿題</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link js-scroll-trigger" href="goexam?lecturenum=${sessionScope.lectureNum}">試験</a>
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

    <section id="about">
     <h2>Q&A</h2>
     <br>
     <div id="qTable">
     <table style="width: 100%;">
     <tr>
        <th style="width: 4%;"></th><th style="width:40%;">TITLE</th><th style="width:28%;">NAME</th><th style="width:28%">DATE</th>
     </tr>
     <c:if test="${qList!=null}">
     <c:forEach var="question" items="${qList}">
     <tr>
        <td style="width: 4%">${question.QSEQ}</td>
        <td style="width:40%">
        <a href="showQ?qSeq=${question.QSEQ}">${question.TITLE}</a>
        <c:if test="${question.COUNT!=0}">
        [answer]
        </c:if>
        </td>
        <td style="width:28%">${question.SNAME}</td>
        <td style ="width:28%">${question.INDATE}</td>
     </tr>
     </c:forEach>
     </c:if>
     </table>
    </div>
     <br>
     <div id="navigator" style="text-align: center;">
	<!-- 페이지 이동 부분 -->                      
	<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;

	<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
		<c:if test="${counter == navi.currentPage}"><b></c:if>
			<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
		<c:if test="${counter == navi.currentPage}"></b></c:if>
	</c:forEach>
	&nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>

<!-- /페이지 이동 끝 -->  

    <br><br>
    <form id="pagingForm" method="get" action="QnA">
	<input type="hidden" name="page" id="page" />
</form>
    </div>
    </section>
    <br>
	<c:if test="${sessionScope.userType=='S'}">
    <form action="writeQ" id="writeQ">
    <button>write</button>
    </form>
    </c:if>
    
     <br>
    <hr class="m-5">

                     </div>
                  </div>
           </div>
</div>
</div>

	<div id="boardFooter">
	© ChiE Online University <br>
	Tel : 03-3344-4444 &nbsp &nbsp Fax : 03-3344-5555 &nbsp &nbsp board@chie.ac.kr <br>
			<p id="copyRight"> COPYRIGHTⒸ ChiE Online University <p>
	</div>
	    </div>
	    
	</div>
			
  </div>

  <!-- Bootstrap core JavaScript -->
  <script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
  <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

  <!-- Plugin JavaScript -->
  <script  src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

  <!-- Custom scripts for this template -->
    <script  src="<c:url value="/resources/js/resume.min.js"/>"></script>


</body>

</html>