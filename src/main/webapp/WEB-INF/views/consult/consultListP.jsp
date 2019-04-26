<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!Doctype html>
<!-- 교수님이 바라본 상담 페이지 -->
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
<title>相談申請内訳</title>

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
            <a href="#"> <img id="schoolLogo"
              src="<c:url value="/resources/img/logo.png" />" alt=""> <span
              id="sideLogo"> 知恵通信大学 </span>
            </a>
          </div>
        </div>
        <div id="fix-text">相談管理</div>
        <button class="btn-lg" id="btn-logout">ログアウト</button>
      </div>
    </header>
    <div class="row" id="margin-del">
      <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top"
      id="sideNav">
      <a class="navbar-brand js-scroll-trigger" style="margin-top: -20px;"
      href="#page-top"> <span class="d-block d-lg-none">知恵通信大学</span>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse"
    data-target="#navbarSupportedContent"
    aria-controls="navbarSupportedContent" aria-expanded="false"
    aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div id="prof-span">
    <img class="img-fluid img-profile rounded-circle mx-auto mb-2" id="hiddenImg" src="${sessionScope.PICNAME}"><br> <span> ${sessionScope.loginName} </span>
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
				<h1>相談申し込み内訳</h1>
				<hr style="width: 95%;">
				<br>
				<div id="conte">
					<h4>学業や個人的な問題のため、相談が必要な学生が相談を申し込んだ相談内訳です。</h4>
					<br>
					<div id="search-div">
						<button class="btn-sm" id="search-btn">検索</button>
						<select id="search-select">
							<option value="Z">全部</option>
							<option value="A">相談予約</option>
							<option value="C">相談終了</option>
							<option value="F">取り消し申請</option>
							<option value="G">取り消し承認</option>
						</select>
					</div>
					<div class="table-responsive">
						<table class="table table-striped2">
							<thead class="thead">
								<tr id="table-title">
									<th style="width: 4%"></th>
									<th style="width: 10%">
										学生名
									</th>
									<th style="width: 18%">相談分類</th>
									<th style="width: 18%">日時</th>
									<th style="width: 10%">申込書</th>
									<th style="width: 18%">相談結果</th>
									<th style="width: 12%">面接開始</th>
								</tr>
							</thead>
							<tbody id = "context">
								<c:if test="${counselList != null}">
									<c:forEach items="${counselList}" var="counsel" varStatus="status">
										<tr>
											<td style="width: 4%">${status.count}</td>
											<!-- 목록번호 -->
											<td style="width: 10%">${counsel.SNAME}</td>
											<!-- 학생이름  -->
											<td style="width: 18%">${counsel.TYPENAME}</td>
											<!-- 상담분류명 -->
											<td style="width: 18%">${counsel.COUNDATE}<br>${counsel.COUNTIME}
											</td>
											<!-- 상담 시작 시간 -->
											<td style="width: 10%">
												<c:choose>
												<c:when test="${counsel.ISCOUNSEL == 'F' || counsel.ISCOUNSEL == 'G'}">
													<button class="btn btn-primary btn-sm watch" data-counsel='${counsel.ISCOUNSEL}'
														data-value='${counsel.COUNSELSEQ}' style="width: 95%;">取消要請書</button>
												</c:when>
												<c:when test="${!(counsel.ISCOUNSEL == 'F' || counsel.ISCOUNSEL == 'G')}">
													<button class="btn btn-primary btn-sm watch" data-counsel='${counsel.ISCOUNSEL}'
														data-value='${counsel.COUNSELSEQ}' style="width: 95%;">申し込み書</button>
												</c:when>
											</c:choose>
											</td>
											<!-- 면접시작버튼 -->
											<td style="width: 18%">
											<c:choose>
												<c:when test="${counsel.ISCOUNSEL == 'A'}">相談予約</c:when>
												<c:when test="${counsel.ISCOUNSEL == 'C'}">相談終了</c:when>
												<c:when test="${counsel.ISCOUNSEL == 'F'}">取り消し申請</c:when>
												<c:when test="${counsel.ISCOUNSEL == 'G'}">取り消し承認</c:when>												
											</c:choose>
											
											</td>
											<!-- 상담했는지 결과 -->
												<td style="border-right: none; width: 12%;">
														<c:if test="${counsel.ISCOUNSEL =='A'}">
														<button class="btn btn-primary btn-sm start" data-value='${counsel.COUNSELSEQ}'style="width: 95%;">ビデオ通話</button>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${counselList == null}">
									<tr>
									</tr>
										<td colspan="7" style="border-right: none;">相談の申し込み内訳がありません。</td>
								</c:if>
							</tbody>
							<tfoot style="border-bottom: 2px solid #dee2e6">
								<tr>
									<td colspan="7" style="text-align: right">件数 ：${fn:length(counselList)}件
									</td>
								</tr>
							</tfoot>
						</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<form id="formCL"></form>
	<div id="boardFooter">
		© ChiE Online University <br> Tel : 03-3344-4444 &nbsp &nbsp Fax
		: 03-3344-5555 &nbsp &nbsp board@chie.ac.kr <br>
		<p id="copyRight">COPYRIGHTⒸ ChiE Online University
		<p>
	</div>

<script type="text/javascript">
  $(function() {
    $("#search-btn").on("click", search);
    $(".btn.btn-primary.btn-sm.watch").on("click", show);
    $(".btn.btn-primary.btn-sm.start").on("click", start);
    $("#btn-logout").on("click", logout);
  });

  function search() {
    var type = $("#search-select option:selected").val();
    $.ajax({
      type : 'POST'
      ,url : 'consultList'
      ,data :
      {
        "type" : type
      }
      ,success : function(resp){
        output(resp);
      }
    });
  }
  
  function output(resp){
	  var cont = "<tr>";
	  var i = 1;
		$.each(resp,function(index,item){
				cont += "<td>" + i++ + "</td>";
				cont += "<td>" + item.NAME + "</td>";
				cont += "<td>" + item.TYPENAME + "</td>";
				cont += "<td>" + item.COUNDATE + "</td>";
			if (item.ISCOUNSEL == '取り消し') {
				cont += "<td><button class='btn btn-primary btn-sm' id='btn-show' data-value='" + item.COUNSELSEQ + "'style='width: 80%;'>申し込み書を見る</button></td>"
			} else {
				cont += "<td><button class='btn btn-primary btn-sm' id='btn-show' data-value='" + item.COUNSELSEQ + "'style='width: 80%;'>取消要請書を見る</button></td>";
			}
			cont += "<td>" + item.ISCOUNSEL + "</td>";
			cont += "<td style='border-right: none;'>";
			if (item.ISCOUNSEL =='待機' && Number(item.WAITTIME) < 40) {
				cont += "<td> <button class='btn btn-primary btn-sm' id='btn-start' data-value='"+ item.COUNSELSEQ + "'style=width: 80%;'>ビデオ通話開始</button></td>";
			}
			cont +="</tr>"
			});
	  	$("#context").html(cont);
	    $("#btn-show").on("click", show);
	    $("#btn-show").on("click", show);
  }

  function show(){
		var counselseq = $(this).attr("data-value");
		var url = "/selectCon?counselseq=" + counselseq;
		var iscounsel = $(this).attr("data-counsel");
		var win = null;
		if (iscounsel === 'F' || iscounsel === 'G') {
			win = window.open(url, '_blank', 'width=952, height=568, channelmode=yes, location=no, menubar=no,scrollbars=no', false);
		} else {
			win = window.open(url, '_blank', 'width=952, height=459, channelmode=yes, location=no, menubar=no,scrollbars=no', false);
		}
	}

      function start() {
  		var counselseq = $(this).attr("data-value");

  	    $.ajax({
  	        type : 'POST'
  	        ,url : 'getKey'
  	        ,data :
  	        {
  	          "counselseq" : counselseq
  	        }
  	        ,success : function(keynum){
  	        	if (keynum != null) {
  				var url = 'http://localhost:4567/r/' + keynum;
  				window.open(url, '_blank', 'channelmode=yes, location=no, menubar=no,scrollbars=no', false);				
  	        	}
  	        }
  	      });
  		
      }

    function logout() {
      var con_test = confirm("ログアウトしますか。");
      if (con_test == true) {
        $("#formCL").attr("action", "logout");
        $("#formCL").submit();
      }
    }
  </script>

</body>

</html>
