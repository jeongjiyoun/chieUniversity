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
  <title>パスワード変更案内ウィンドウズ</title>

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
      <div class="col-sm-10 offset-sm-1" id="hiddenright">
        <div class="table-responsive">
        <h2 style="border-bottom: 2px solid #61A7D0; padding-bottom: 10px;">パスワード変更</h2>
        <div style="margin-top: 5px;">
	         <p style="margin-bottom: 5px; padding: 15px; text-align: justify; border: 1px solid #FCE1DF; background-color: #FAE9E8;">
	      	<span style="color: #dd5a43; font-size: 1.3rem; display: block;">${sessionScope.loginName}様の統合暗証番号が${date}日に変更されました。</span>
			   統合暗証番号は少なくとも6ヵ月単位で変更することを推奨致します。</p>
			   
			  <p style="border: 1px solid rgb(170, 170, 170); margin-bottom: 5px; padding: 15px; text-align: justify; ">
			 	本校は顔面認識などのプライバシー情報を含める最先端の技術を使う学校のため、個人も個人情報に気をつかなければなりません。

			<span style="color: #1A69AE; font-size: 1.4rem; margin-top: 10px; display: block;margin-left: 20px;">統合暗証番号って?</span>
			校内各種情報システムを一つのパスワードで接続できる統合されたパスワードです。 パスワードの変更一度で,以下のような情報システムのパスワードを等しく管理することができます。
				<span class="samplePage">
				業務ポータルシステム,電子決裁システム,大学資源管理システム,情報電算院ホームページなど,<br>図書館,学生支援システム,ホームページ,機関/学科及び教授のホームページ,サイバー講義室など
				</span>
			  </p>
        </div>
		<div class="btn_area">
                <button type="submit" class="btn_apply" style="width: 40%; float: left">今、変更します</button>
                <button type="button" class="btn_cancel">後で、変更します</button>
        </div>
    </div>
  </div>
</div>
</div>

<script type="text/javascript">
  $(function(){
    $(".btn_apply").on("click",btnApply);
    $(".btn_cancel").on("click",btnExit);
  });

  function btnExit(){
	alert("パスワードの変更ウィンドウを終了します。");
    self.close();
  }

  function btnApply(){
	  location.href="passwordChage_step2"
  }
</script>

</body>
</html>
