<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>講義管理</title>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
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
        <div id="fix-text">講義管理</div>
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
								<a class="nav-link js-scroll-trigger" href="/MyPage">HOME</a></li>
							<li class="nav-item">
								<a class="nav-link js-scroll-trigger" href="/MyInformation">情報修正</a></li>
							<li class="nav-item">
								<a class="nav-link js-scroll-trigger" href="/courseList">講義管理</a></li>
							<li class="nav-item">
								<a class="nav-link js-scroll-trigger" href="/consult">相談管理</a></li>
					</ul>
				</div>
			</nav>
    <div class="col-sm-1"></div>
    <div class="col-sm-2" id="hiddenleft"></div>
    <div class="col-sm-9" id="hiddenright">

	<h1>講義管理</h1>
	<hr style="width: 95%;">
	<div id="conte">
		<h4>講義の情報編集や講義映像管理ができます。管理をしたい講義を選んでください。</h4>
		<br>
      <section style="margin-top: 30px;">
        <div class="row placeholders">
          <div class="col-xs-12 col-sm-11 placeholder">
            <div class="table-responsive" style="overflow-x: hidden;">
            <section></section>
					<div id="search-div">
						<button class="btn-sm" id="search-btn">検索</button>
						<select id="search-select">
								<option value = "All">全体</opteion>
							<c:forEach items="${semesterList}" var="semester">
								<option value="${semester.SRSEQ}">${semester.SEMESTER}</option>
							</c:forEach>
						</select>
					</div>
              <table class="table table-striped">
                <thead class="thead">
                  <tr id="table-title">
                    <th style="width:5%;"></th>
                    <th style="width:15%; border-left: 1px solid #dee2e6;">開設学期</th>
                    <th style="width:15%; border-left: 1px solid #dee2e6;">分類</th>
                    <th style="width:50%; border-left: 1px solid #dee2e6;">講義名</th>
                    <th style="width:20%; border-left: 1px solid #dee2e6;">講義室</th>
                  </tr>
                </thead>
                <tbody>
                  <!-- for each구문을 걸어서 보여주기. -->
                  <c:forEach var="subject" items="${subList}" varStatus="status">
                  <tr>
                    <td style="width:5%">${status.count}</td>
                    <td style="width:15%; text-align: center">
                    	${subject.SEMESTER}
                    </td>
                    <td style="width:15%; text-align: center">${subject.TYPENAME}</td>
                    <td style="width:50%; text-align: center"><h3>${subject.TITLE}</h3>
                    <c:choose>
                    <c:when test="${subject.ISREALTIME == 'T'}">
                    ${subject.STIME}
                    </c:when>
                    <c:otherwise>
                    	[動画講義]
                    </c:otherwise>
                    </c:choose>
                    </td>
                    <td style="width:20%; text-align: center"><button class="btn btn-primary btn" type = "button" style="width: 80%;" data-value = "${subject.LECTURENUM}">入る</button></td>
                  </tr>
                  </c:forEach>
                </tbody>
                <tfoot>
                <tr>
                 <td style="width:5%"></td>
                  <td style="width:15%; text-align: center"></td>
                  <td style="width:15%; text-align: center"></td>
                  <td style="width:50%; text-align: center"></td>
                  <td style="width:20%; text-align: center"></td>
                </tr>
                </tfoot>
              </table>
            </div>
            <div>
	        <button class="btn btn-lg btn-primary" id= "courseMake" style="width: 30%; float: right">講義開設</button>
	        </div>
          </div>
        </div>
      </section>
    </div>
  </div>
</div>

<script type="text/javascript">
	$(function(){
		$(".btn.btn-primary.btn").on("click", goSubject);
		$("#btn-logout").on("click", logout);
		$("#search-btn").on("click",search);
		$("#courseMake").on("click",courseMake);
	});
	
	function courseMake(){
		location.href="/courseMake";
	}

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
	
	
	function goSubject(){
		var subjectNum = $(this).attr("data-value");
		location.href="/subjectDetail?lecturenum="+subjectNum;
	}
	
	function search(){
		$("tbody").html("");
	    var SRSEQ = $("#search-select option:selected").val();
	    if (SRSEQ == 'All') {
			SRSEQ = null;
		}
 		$.ajax({
		       url : 'getCourseListP',
		       data : {
			       "SRSEQ" : SRSEQ
		       },
		       type : 'POST',
		       success : function(result) {
			      showSearch(result);
		       }
		     });
	
	}
	
	function showSearch(resp){
       var cont = "";
       var i = 1;
       $.each(resp,function(index,item){
    	   cont +="<tr>";
     	   cont +='<td style="width:5%">'+ i++ +'</td>'
       	   cont += '<td style="width:15%; text-align: center">'+ item.SEMESTER+ '</td>'
           cont += '<td style="width:15%; text-align: center">'+ item.TYPENAME+ '</td>'
           cont += '<td style="width:50%; text-align: center"><h3>' + item.TITLE +'</h3>';
           
           if (item.STIME=='[]') {
				cont += "[動画講義]";
			} else {
				cont+= item.STIME;
			}
           cont +='</td>';
           cont += '<td style="width:20%; text-align: center"><button class="btn btn-primary btn" type = "button" style="width: 80%;" data-value ="' + item.LECTURENUM + '">入る</button></td>';
      	   cont += '</tr>';
       });
       $("tbody").html(cont);
       $(".btn.btn-primary.btn").on("click",goSubject);
	}
</script>
</body>

</html>
