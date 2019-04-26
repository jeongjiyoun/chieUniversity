<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- 해야하는 것 : 페이징처리, 검색 기능 구현, 버튼 누를 시에 신청서 보기, 버튼 눌러서 취소 신청 받기, 버튼 눌러서 화상 시작하기 -->

<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta name="viewport"
  content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- 900ｘ560 -->
  <title>成績登録</title>

  <!-- font -->
  <link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">

  <!-- Bootstrap css -->
  <link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">

  <!-- Jquery -->
  <script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>

<%--   <!-- Main CSS *-->
  <link href="<c:url value="/resources/css/consult.css"/>" rel="stylesheet" media="all"> --%>

  <!-- 기타 Css -->
  <link href="<c:url value="/resources/css/boardCss.css" />" rel="stylesheet" type="text/css">

   <link rel="stylesheet" type="text/css"   href="<c:url value="/resources/css/schoolInfo.css" />">
<script>
$(function() {
	$("#sbutton").on("click",function(){
	
		window.opener.location.href="checkA?phoneNum="+$("#phoneNum").val() + "&password=" + $("#password").val();

	self.close();
	});
	
});

</script>

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
      <div class="table-responsive" style="padding-left: 30px; padding-right: 30px;">
      	<br><br>
      
      	<form action="checkA" method="get" id="checkA">
      		<table style="float:center;">
      		<tr>
	      		<td><p style="font-size: 20px;">電話番号</p></td>
	      		<td><input type="text" id="phoneNum" name="phoneNum" ></td>
	      	</tr>
      		<tr>
      			<td><p style="font-size: 20px;">暗証番号</p></td>
      			<td><input type="password" id="password" name="password" ></td>
      		</tr>
      		<button class ="bStyle" style="bottom: 287px;width: 60px; position: absolute;left: 376px;" id="sbutton">確認</button>
      		
      		</table>
      		
      		　
      	</form>
      
      </div>
      </div>
      </div>
     </div>
      