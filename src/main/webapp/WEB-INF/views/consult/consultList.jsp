<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %> 


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
<title>相談申し込み内訳</title>

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
					<a href="MyPage"><img
						class="img-fluid img-profile rounded-circle mx-auto mb-2"
						id="hiddenImg" src="${sessionScope.PICNAME}"><br> <span>
							${sessionScope.loginName} </span></a>
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
						<table class="table table-striped">
							<thead class="thead">
								<tr id="table-title" style="background-color: rgb(240,240,240);">
									<th style="width: 4%"></th>
									<th style="width: 10%">教授名</th>
									<th style="width: 18%">相談分類</th>
									<th style="width: 13%">日時</th>
									<th style="width: 15%">申込書</th>
									<th style="width: 18%">相談結果</th>
									<th style="width: 12%">面接開始</th>
								</tr>
							</thead>
							<tbody id = "context">
								<!-- for each구문을 걸어서 보여주기. -->
								<c:if test="${counselList != null}">
									<c:forEach items="${counselList}" var="counsel" varStatus="status">
										<tr>
											<td style="width: 4%">${status.count}</td>
											<!-- 목록번호 -->
											<td style="width: 10%">${counsel.NAME}</td>
											<!-- 교수이름  -->
											<td style="width: 18%">${counsel.TYPENAME}</td>
											<!-- 상담분류명 -->
											<td style="width: 13%">${counsel.COUNDATE}<br>${counsel.COUNTIME}
											</td>
											<!-- 상담 시작 시간 -->
											<td style="width: 15%">
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
											<!-- 상담했는지 결과 -->
											<td style="width: 18%" id = "iscounsel">
												<c:choose>
													<c:when test="${counsel.ISCOUNSEL == 'A'}">相談予約</c:when>
													<c:when test="${counsel.ISCOUNSEL == 'C'}">相談終了</c:when>
													<c:when test="${counsel.ISCOUNSEL == 'F'}">取り消し申請</c:when>
													<c:when test="${counsel.ISCOUNSEL == 'G'}">取り消し承認</c:when>												
												</c:choose>
											<td style="width: 12%; border-right : none;">
												<c:if test="${counsel.ISCOUNSEL =='A'}">
														<button class="btn btn-primary btn-sm start" data-value='${counsel.COUNSELSEQ}'style="width: 95%;">ビデオ通話</button>
												</c:if>
											</td>
											<!-- 면접시작버튼 -->
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${counselList == null}">
									<tr>
										<td colspan="7">相談の申し込み内訳がありません。</td>
									</tr>
								</c:if>
							</tbody>
							<tfoot style="border-bottom: 2px solid #dee2e6">
								<tr>
									<td colspan="7" style="text-align: right">件数 ：
										${fn:length(counselList)}件
									</td>
								</tr>
							</tfoot>
						</table>
						<button id="apply" type="button" style="width: 22%;">申し込み</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="boardFooter" style="position: absolute; bottom: -55%;">
  © ChiE Online University <br>
  Tel : 03-3344-4444 &nbsp &nbsp Fax : 03-3344-5555 &nbsp &nbsp board@chie.ac.kr <br>
  <p id="copyRight"> COPYRIGHTⒸ ChiE Online University <p>
  </div>
<script type="text/javascript">
$(function() {
    $("#search-btn").on("click", search);
    $(".btn.btn-primary.btn-sm.watch").on("click", show);
    $(".btn.btn-primary.btn-sm.start").on("click", start);
    $("#btn-logout").on("click", logout);
    $("#apply").on("click",apply);
  });
  
  function apply(){
	  location.href="consultApply";
  }

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
	  $("#context").html("");
	  var cont = "<tr>";
	  var i = 1;
		$.each(resp,function(index,item){
				cont += "<td style='width: 4%'>" + i++ + "</td>";
				cont += "<td style='width: 10%'>" + item.NAME + "</td>";
				cont += "<td style='width: 18%'>" + item.TYPENAME + "</td>";
				cont += "<td style='width: 13%'>" + item.COUNDATE + "</td>";
				if (item.ISCOUNSEL == 'F' || item.ISCOUNSEL == 'G') {
					cont += "<td style='width: 15%'><button class='btn btn-primary btn-sm watch' data-value='" + item.COUNSELSEQ + " data-counsel='"+ item.ISCOUNSEL +"''style='width: 95%;'>取消要請書</button></td>";
				} else {
					cont += "<td style='width: 15%'><button class='btn btn-primary btn-sm watch' data-value='" + item.COUNSELSEQ + " data-counsel='"+ item.ISCOUNSEL +"''style='width: 95%;'>申し込み書</button></td>"
				}
				cont += "<td style='width: 18%'>"
				switch (item.ISCOUNSEL) {
				case "A":
					cont+="相談予約";
					break;
				case "C":
					cont+="相談終了";
					break;
				case "F":
					cont+="取り消し申請";
					break;
				case "G":
					cont+="取り消し承認";
					break;
				}
 				cont += "</td>";
			if (item.ISCOUNSEL =='待機' && Number(item.WAITTIME) < 40 && Number(item.WAITTIME) > -10) {
				cont += "<td style='width: 12%; border-right : none;'> <button class='btn btn-primary btn-sm start' data-value='"+ item.COUNSELSEQ + "'style=width: 95%;'>ビデオ通話開始</button></td>";
			} else {
				cont += "<td style='width: 12%; border-right : none;'></td>"
			}
			cont +="</tr>"
			});
		var tfootText ="<tr>";
		tfootText +="<td colspan='7' style='text-align: right'>件数 ：";
		tfootText += --i + "件</td></tr>"

		$("tfoot").html(tfootText);
	    $("#context").html(cont);
	    $(".btn.btn-primary.btn-sm.watch").on("click", show);
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
  
  function counsulted(counselseq){
  	    $.ajax({
  	        type : 'POST'
  	        ,url : 'counsulted'
  	        ,data :
  	        {
  	          "counselseq" : counselseq
  	        }
  	      });
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
  	  			counsulted(counselseq);
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
    	  location.href="logout";
      }
    }
  </script>

</body>

</html>
