<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<!-- 새로운원서접수 -->
<meta charset="UTF-8">
<title>申込書受付</title>
<!-- bootstrap -->

  <link href="/resources/vendor/font-awesome-4.7/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
  <link href="/resources/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">
  <!-- Main CSS *-->
<link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">

<script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <link rel="stylesheet" type="text/css"   href="<c:url value="/resources/css/schoolInfo.css" />">
   
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/introduce.css" />">
<link href='https://fonts.googleapis.com/earlyaccess/notosansjp.css'
	rel='stylesheet' type='text/css'>

<!-- 미세 커스텀 조정 -->
<link href="<c:url value="/resources/css/boardCss.css" />" rel="stylesheet" type="text/css">

<script>

	var applicantSeq
	var pwReg = /^(((?=.*[a-z])(?=.*[A-Z])(?=.*[\d]))|((?=.*[a-z])(?=.*[\W])(?=.*[\d]))|((?=.*[A-Z])(?=.*[\W])(?=.*[\d]))|((?=.*[a-z])(?=.*[A-Z])(?=.*[\W])))([A-Za-z\d\W]{6,20})$/
	var emReg = /^([-_.0-9a-zA-Z])*@([-_.0-9a-zA-Z])*\.([a-zA-Z]){2,3}$/
	var phoneReg = /^(0([0-9]{1,3})|01(41[0-4]|3[13]|42[12]|33|43[13]|44[126]))-[\d]{3,4}-[\d]{3,4}$/
	
	var address;
	var birthday;
	var email
	var majorSeq;
	var name;
	var password;
	var phoneNum;
	var pic_name = $("#faceInfo").src;//증명사진
	var procedding;
	var requirement_file;//첨부파일
	
	var formData;
	history.replaceState({}, null, location.pathname);
	$(function() {
		init();
		$("#selectApplicant").on("click", selectApplicant);

		$("#goCheckMajor").on("click", goCheckMajor);

// 		$("#fSubmit"),on("click",function(){
// 			$("#applicantForm").submit();
// 		});
		$("#tSubmit1").on("click",temSubmit);//insert하는 임시저장
		
		$("#tSubmit2").on("click",temSubmit2);//update하는 임시저장
		
		$("#fSubmit").on("click",fSubmit);//최종제출
		
	    $("#pic_name").change(imgChange); //이미지 파일 변경
	    
	    $("#requirement_file").change(fileChange);
	    
	});

	function init(){
		majorSeq=$("#majorSeq").val();
		
		$.ajax({
			 type :'POST'
			,url : 'checkMajor'
			,data : {
				"majorSeq" :majorSeq
			}
			,success :function(result){
				$("#applicantMajor").val(result);
			}
		 });
	}
	
	  function imgChange(){
			var form = $('form')[0];
			formData = new FormData(form);
		    $.ajax({
		        type : 'POST'
		        ,url : 'upLoadPictureApply'
		        ,processData : false
	            ,contentType: false
		        ,data : formData
		        ,success : function(resp){
		        	pic_name = resp;
		        	faceInfo.src = resp;
		        }
		      });
	  }

	  function fileChange(){
		  var fileValue = $("#requirement_file").val().split("\\");
		  var fileName = fileValue[fileValue.length-1];
		 $("#space").html(fileName);
	  }

	  function goCheckMajor() {
		var url = 'goCheckMajor';
		window.open(url, '_blank', 'height=500, width=820, left=0,top=0',	false);
	}

	function selectApplicant() {
		var url = 'selectApplicant';
		window.open(url, '_blank', 'height=500, width=500, left=0,top=0',
						false);
	}

	//insert하는 임시저장
	function temSubmit(){
		var form = $('form')[0];
		formData = new FormData(form);
		formData.append("picName",pic_name);
		formData.append("majorSeq",$("#majorSeq").val());
		
	 $.ajax({
		 type :'POST'

		 ,url : 'temSubmit'
		,data : formData
        ,processData : false
        ,contentType: false
		,success : function(){
			alert("一時貯蔵成功 一週間以内に作成が可能です。");
		}
	 });
	 
	}
	
	//update하는 임시저장
	function temSubmit2(){
		var form = $('form')[0];
		formData = new FormData(form);
		formData.append("picName",pic_name);	
		formData.append("majorSeq",$("#majorSeq").val());
		$.ajax({
		 type :'POST'
		,url : 'temSubmit2'
        ,processData : false
        ,contentType: false
		,data : formData
		,success : function(){
			alert("一時貯蔵成功 一週間以内に作成が可能です。");
		}
	 });
	 
	}
	
	//최종제출
	function fSubmit(){
		var form = $('form')[0];
		formData = new FormData(form);
		formData.append("picName",pic_name);
		formData.append("majorSeq",$("#majorSeq").val());
		alert(majorSeq);
		$.ajax({
		 type :'POST'
		,url : 'fSubmit'
		,data : formData
        ,processData : false
        ,contentType: false
		,success : function(){
			alert("提出成功！");
		}
	 });
	}
</script>
</head>


<body style="overflow: auto">

	<header class="header small">
		<div class="navigation">
			<ol>
				<li><a href="introduce">大学紹介 </a></li>
				<li><a href="applyInfo"> 入学案内 </a></li>
				<a href="goHome">
					<img src="<c:url value="/resources/img/logo.png" />" width="6%" height="6%">
				</a>
				<li><a href="department"> 学部紹介 </a></li>
				<li><a href="goTotNotice"> お知らせ </a></li>
			</ol>
		</div>
	</header>

	<div class="contents-main" style="margin-top: 10%;">
		<div class="haha"></div>
		<p class="text3">入学願書作成</p>
		<p style="font-size: 20px; color : red;">携帯番号と暗証番号を入力しなければ,臨時保存ファイルを読み込むことができません。 </p>
		<br>
		<div class="table-responsive">
			<form method="post" enctype="multipart/form-data" id="applicantForm">
				<table class="table table-striped" style="border : 1px solid #dee2e6; "> 
					<thead class="thead">
						<tr id="table-title"></tr>
					</thead>
					<tbody id="context">
						<tr class="table-title">
							<td class="cont1">専攻</td>
							<td colspan="3">
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
			</form>
			<c:if test="${Applicant==null}">
			<button class="bStyle" id="tSubmit1">一時保存</button>
			</c:if>
			<c:if test="${Applicant!=null}">
			<button class="bStyle" id="tSubmit2">一時保存</button>
			</c:if>
			<button class="bStyle" id="fSubmit">原書提出</button>
		</div>

	</div>
	
  <script src="/resources/vendor/jquery-validate/jquery.validate.min.js"></script>
  <script src="/resources/vendor/datepicker/moment.min.js"></script>
  <script src="/resources/vendor/datepicker/daterangepicker.js"></script>
  <!-- Custom scripts for this template -->
<%--   <script  src="<c:url value="/resources/js/resume.min.js"/>"></script> --%>

  <!-- Main JS-->
  <script src="/resources/js/global.js"></script>
	
</body>
</html>