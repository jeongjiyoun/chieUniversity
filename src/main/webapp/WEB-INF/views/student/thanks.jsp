<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta name="viewport"
  content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>講義評価</title>

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

<body style="font-size: 1rem;">
  <div class="container-fluid">
    <header>
      <div class="d-none d-lg-block" id="fix-titleC">
        <img id="logoCen" src="<c:url value="/resources/img/logo.png" />">
		<div style="font-size: 2rem; color: white; padding: 17px;"> 講義評価</div>
      </div>
    </header>
    
    <div class="row">
      <div class="col-sm-10 offset-sm-1" id="hiddenright">
      	<p style ='text-align: center; vertical-align: middle; font-size: 100px; transform: translateY(55%); color: rgb(22, 56, 93); font-weight: 500;'>お疲れ様でした</p>
      </div>
    </div>
  </div>

<footer>
  <div class="d-none d-lg-block" style="position: absolute; bottom: 3%; height: 11%">
  </div>
</footer>

<script type="text/javascript">

  $(function(){
	  setTimeout(function() {
			self.close();
		}, 3000);
  });

</script>
</body>
</html>