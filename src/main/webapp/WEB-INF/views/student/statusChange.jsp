<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>相談申し込み</title>
  <!-- font -->
  <!-- Bootstrap css -->
  <link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">

  <!-- Jquery -->
  <script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>
 
  <!-- font -->
  <link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">

  <link href="<c:url value="/resources/css/course.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/css/resume.css" />" rel="stylesheet" type="text/css">

  <!-- Title Page-->

  <!-- Icons font CSS *-->
  <link href="/resources/vendor/font-awesome-4.7/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
  <!-- Vendor CSS *-->
  <link href="/resources/vendor/select2/select2.min.css" rel="stylesheet" media="all">
  <link href="/resources/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

  <!-- Main CSS *-->
  <link href="/resources/css/consult.css" rel="stylesheet" media="all">

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
				<h1>休学・復学新規申し込み</h1>
				<hr style="width: 95%; margin-bottom: 3px;">
				<div id="conte">
					<h4>休学、及び、復学を申し込みたい場合、作成してください</h4>
					<br>
            <br>
            <div class="card card-4">
              <div class="card-body">
                <div class="tab-content">
                  <div class="tab-pane active" id="tab2">
                    <form method="POST" action="statusForm" id="statusForm">
                      <div class="row row-space">
                        <div class="col-2">
                          <div class="input-group">
                            <label class="label">事由</label>
                            <div class="rs-select2 js-select-simple select--no-search">
                              <select id="reason" name="reason">
                                <option value="100">休学</option>
                                <option value="300">復学</option>
                            </select>
                            <div class="select-dropdown"></div>
                          </div>
                        </div>
                      </div>
                      <div class="col-2">
                        <div class="input-group">
                          <label class="label">相談理由</label>
                          <div class="rs-select2 js-select-simple select--no-search">
                            <select name="typeNum" id="typeNum">
                              <option value="10">家庭事情</option>
                              <option value="20">学業関連</option>
                              <option value="30">学校生活</option>
                              <option value="40">講義関連</option>
                              <option value="50">定期相談</option>
                              <option value="60">論文相談</option>
                              <option value="90">その他</option>
                            </select>
                            <div class="select-dropdown"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row row-space">
                      <div class="col-2">
                        <div class="input-group">
                          <label class="label">申し込む学期</label>
                          <div class="rs-select2 js-select-simple select--no-search">
                            <select name="semester" id="semester">
                            <c:forEach items="${semesterList}" var="semester"></c:forEach>
                              <option value="10">家庭事情</option>
                              <option value="20">学業関連</option>
                            </select>
                            <div class="select-dropdown"></div>
                          </div>
                        </div>
                      </div>
                      <div class="col-2">
                        <div class="input-group">
                          <label class="label">時間</label>
                          <div class="rs-select2 js-select-simple select--no-search">
                            <select name="conTime" id="conTime">
                              <option value="1" selected="selected">教授と相談日を先に選んでください</option>
                            </select>
                            <div class="select-dropdown"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="input-group input-group-big">
                      <label class="label">相当理由:</label>
                      <textarea class="input--style-1" rows="1" cols="1"
                      style="height: 160px;" placeholder="相談したい内容" id="memo"
                      name="memo" required="required">${memo}</textarea>
                    </div>
                    <button class="btn-submit m-t-0" id="btnSub" type="button">相談
                    申し込み</button>
                  </form>
                </div>
              </div>
            </div>
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

  <!-- Vendor JS-->
  <script src="/resources/vendor/select2/select2.min.js"></script>
  <script src="/resources/vendor/jquery-validate/jquery.validate.min.js"></script>
  <script src="/resources/vendor/datepicker/moment.min.js"></script>
  <script src="/resources/vendor/datepicker/daterangepicker.js"></script>

<!--   <script src="/resources/vendor/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script> -->
<%--   <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script> --%>

  <!-- Plugin JavaScript -->
<%--   <script  src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script> --%>

  <!-- Custom scripts for this template -->
  <script  src="<c:url value="/resources/js/resume.min.js"/>"></script>

  <!-- Main JS-->
  <script src="/resources/js/global.js"></script>

  <script type="text/javascript">

    $(function() {
      $("#preginum").on('change', check);
      $("#coundate").on('change', check);
      $("#btnSub").on('click', regist);
  		$("#btn-logout").on("click",logout);
    });

    function logout() {
        var con_test = confirm("ログアウトしますか。");
        if (con_test == true) {
        	location.href="/logout";
        }
    }
    function check(){
      var preginum = $("#preginum").val();
      var coundate = $("#coundate").val();

        dataload();
    }

    function dataload() {
      var preginum = $("#preginum option:selected").val();
      var coundate = $("#coundate").val();
   		$.ajax({
   			type : 'POST'
   			,url : 'dataload'
   			,data :
   		      {
   		        "preginum" : preginum,
   		        "coundate" : coundate
   		      }
   			,success : function(resp){
   					output(resp);
   			  }
   		});
    }

    function output(resp){
    	var cont = "";
   		$.each(resp,function(index,item){
   	 		cont+="<option value='"+item+"'>"+ item +"</option>";
   		});
   		$("#conTime").html(cont);
    }

    function regist() {
      var preginum = $("#preginum option:selected").val()
      var typeName = $("#typeNum option:selected").val();
      var coundate = $("#coundate").val();
      var conTime = $("#conTime option:selected").val();
      var memo = $("#memo").val();
      if (preginum == null || preginum.length < 1) {
			alert("教授を選択してください");
	  }else if(typeName.length<1){		  
			alert("相談タイプを選択してください");
	  }else if(coundate.length<1){		  
			alert("相談日子を選択してください");
	  }else if(conTime.length<1){		  
			alert("相談時間を選択してください");
	  }else if(memo.length<1){  
			alert("相談理由を入力してください");
	  }else {
		  $("#consultForm").submit();
	  }
    }
  </script>
</body>

</html>
