<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta name="viewport"
  content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- 900ｘ560 -->
  <title>申請者確認 </title>

  <!-- font -->
  <link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">

  <!-- Bootstrap css -->
  <link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">

  <!-- Jquery -->
  <script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>

  <!-- Main CSS *-->
  <link href="<c:url value="/resources/css/consult.css"/>" rel="stylesheet" media="all">

  <!-- 기타 Css -->
  <link href="<c:url value="/resources/css/boardCss.css" />" rel="stylesheet" type="text/css">

</head>

<body>
  <div class="container-fluid">
    <header>
      <div class="d-none d-lg-block" id="fix-titleC">
        <img id="logoCen" src="<c:url value="/resources/img/logo.png" />">
      </div>
    </header>
    <div class="row">
      <div class="col-sm-12" id="hiddenright">
<div class="contents-main">
		<br>
		<div class="table-responsive">
			<form method="post" enctype="multipart/form-data" id="applicantForm">
				<table class="table table-striped" style="border : 1px solid #dee2e6; "> 
					<thead class="thead">
						<tr id="table-title">
						         <th colspan="6"><h2 style="text-align: center">入学申込書</h2></th>
						</tr>
					</thead>
					<tbody id="context">
						<tr class="table-title">
							<td class="cont1">専攻</td>
							<td colspan="3">
							<input id="applicantSeq" value="${Applicant.applicantSeq}" type="hidden">
							<input id="applicantMajor" style="width: 80%; height:50px; border: 1px solid #dee2e6; padding-left : 10px;" placeholder="右のボータンを押し、専攻を選んでください" disabled="disabled" value="${result}">
								<input type="hidden" id="majorSeq" value="${Applicant.majorSeq}">
								<button class="bStyle" id="goCheckMajor" type="button" style="border-radius: 3px;">専攻検索</button></td>
								<td style="width: 20%;" rowspan="4">
									<img id="faceInfo" style="width: 150px; height: 200px;" src="${Applicant.pic_name}">
									<div class="filebox" style="margin-top: 10px; ">
									  <label for="pic_name" style="padding: .5em 1em;">アップロード</label> <input type="file" id="pic_name" name = "pic_name">
									</div>
								</td>
						</tr>
						<tr class="table-title">
							<td class="cont1">名前</td>
							<td class="cont2" colspan='3'><input id="name" name="name" value="${Applicant.name}" style="width: 97%; height:50px; border: 1px solid #dee2e6; padding-left : 10px;" placeholder="性と名前の間に空白のスペースを入れてください　(例：山田　武)"></td>
						</tr>
						<tr class="table-title">
							<td class="cont1">生年月日</td>
							<td class="cont2">
						<input class="input--style-1 js-single-datepicker" type="text" name="birthday" placeholder="dd/mm/yyyy" data-drop="1"
                          id="birthday" value="${Applicant.birthday}" style="border: 1px solid #dee2e6; width: 91%; height: 50px; padding-left: 10px;">
                          <div class="dropdown-datepicker" id="dropdown-datepicker1"></div>
							</td>
							<td class="cont1">パスワード</td>
							<td class="cont2" style="padding-top: 0px; padding-bottom: 0px;">
								<input id="applicantPassword" name="password"  style="width: 92%; height:50px; border: 1px solid #dee2e6; padding-left : 10px; font-size: 1.8rem;"
								type="password" value="${Applicant.password}">
							</td>
						</tr>
						<tr class="table-title">
							<td class="cont1" style="width: 120px;">電話番号</td>
							<td class="cont2" colspan="3">
							<input type="text" value="${Applicant.phoneNum}" id="phoneNum" name="phoneNum" class="phoneNum" style="width: 97%; height:40px; border: 1px solid #dee2e6; padding-left : 10px;  padding-right: 7px;" placeholder="（例：010-8206-5511）"></td>
						</tr>

						<tr class="table-title">
							<td class="cont1">住所</td>
							<td class="cont2" colspan="4" style="padding-left: 8px;">
							<input id="address" name="address" type="text" value="${Applicant.address}" style="width: 97%; height:40px; border: 1px solid #dee2e6; padding-left : 10px;  padding-right: 7px;" placeholder="（例：福岡県北九州市八幡西区　36-9）"></td>
						</tr>
						<tr class="table-title" style="border-bottom: 1px solid #dee2e6;">
							<td class="cont1">Email</td>
							<td class="cont2" colspan="4" style="padding-left: 8px;">
							<input type="email" name="email" value="${Applicant.email}" id="email" style="width: 97%; height:40px; border: 1px solid #dee2e6; padding-left : 10px;  padding-right: 7px;" placeholder="（例：chieUniversity@chie.jp）">
							</td>
						</tr>
						<tr>
							<td class="cont1">添付ファイル</td>
							<td class="cont2" colspan="4" style="border : 1px solid #dee2e6">
									<span id="space" style="    color: black; font-size: 1.2rem; float: left; margin-left: 10px;"><c:if test="${Applicant.requirement_file != null}">添付ファイルある</c:if></span>
									<div class="filebox">
									  <label for="requirement_file" style="padding: .5em 2em; float: right; margin-right: 20px;">アップロード</label> 
									  <input type="file" id="requirement_file" name = requirement_file value="${Applicant.requirement_file}">
									</div>
							</td>
						</tr>
					</tbody>
					<tfoot style="border-bottom: 2px solid #dee2e6">
					</tfoot>
				</table>
					<button id="pass" style="width : 150px;">合格</button>
					<button id="fail" style="width : 150px;">不合格</button>
			</form>
		</div>
	</div>
    </div>
  </div>
</div>
<footer>

</footer>
<script type="text/javascript">
// 	function refresh(){
// 		window.opener.location.reload();
// 		window.close();
// 	}
</script>
<form id="conCo" action="adminCancel"></form>

<script type="text/javascript">
  $(function(){
	$("#pass").on("click",insertStudent);
	$("#fail").on("click",deleteApplicant);

  });

function insertStudent(){
		
}

function deleteApplicant(){
	var applicantSeq =$("#applicantSeq").val();
	
	$.ajax({
		type :'GET'
		,url : 'deleteApplicant'
		,data : {
			"applicantSeq" : applicantSeq
		}
		,success : function(){
			window.opener.location.reload();
		}
		,error : function(){
				alert("不合格失敗");
		}
	});
}

</script>

</body>
</html>
