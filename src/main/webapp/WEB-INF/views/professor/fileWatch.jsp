<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

  <!-- 1100ｘ728 -->
  <title>授業計画書</title>
  <!-- Bootstrap css -->
  <link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">
  <!-- font -->
  <link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">

  <!-- Main CSS *-->
  <link href="/resources/css/consult.css" rel="stylesheet" media="all">
<!-- 미세 커스텀 조정 -->
<link href="<c:url value="/resources/css/boardCss.css" />" rel="stylesheet" type="text/css">

</head>
<body style="padding-left: 0px;">
    <header style="height: 75px;">
      <div class="d-none d-lg-block" id="fix-titleC">
        <img id="logoCen" src="<c:url value="/resources/img/logo.png" />">
      </div>
    </header>

  <div class="container-fluid">
     <iframe src="/resources/img/pdf/020.pdf" style="width: 100%; height: 100%; min-height: 700px;"></iframe>
  </div>
 
</body>
</html>