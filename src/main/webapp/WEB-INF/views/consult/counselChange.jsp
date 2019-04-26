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
  <title>相談可能時間設定</title>

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
      <div class="col-sm-8 offset-sm-2" id="hiddenright">
        <div class="table-responsive">
        <h2 style="border-bottom: 2px solid #61A7D0; padding-bottom: 10px;">相談可能時間設定</h2>
        <div style="margin-top: 5px;">
			<div style="margin-top : 10px;">
				<span style="font-size: 1.4rem;"> 登録されている相談スケジュール</span>
				<table class="table1" style="padding: 0px; width: 100%;">
					<thead>
						<tr style="border-bottom: 1px solid #61A7D0; height: 40px; padding-top:10px; border-top: 1px solid #61A7D0;">
							<td style="width: 5%;"></td>
							<td style="width: 20%;">曜日</td>
							<td style="width: 30%;">初め時間</td>
							<td style="width: 30%;">終り	時間</td>
							<td style="width: 15%;">編集</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${dataList}" var="dataL" varStatus="index">
						<tr data-value="${dataL.COUNSELSEQ}" style="border-bottom : 1px solid rgb(235,235,235);">
							<td style="width: 5%;">${index.count}</td>
							<td style="width: 20%;">${dataL.COUNDATE}</td>
							<td style="width: 30%;">${dataL.STARTTIME}</td>
							<td style="width: 30%;">${dataL.ENDTIME}</td>
							<td style="width: 15%;"><button class="delete" style="height: 35px; font-size: 1rem; background-color: transparent; border: 1px solid rgb(150,150,150); color: #06213F; border-radius: 5px; padding: 0;">削除</button></td>
						</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5" style="border-bottom: 2px solid #61A7D0; margin-bottom: 20px;"></td>
						</tr>
					</tfoot>
				</table>
			</div>
			<button style="width: 30%;border-radius: 5px;">追加</button>
        </div>
    </div>
  </div>
</div>
</div>

    
<script type="text/javascript">
  $(function(){
    $(".delete").on("click",deleteBtn);
    $(".btn_cancel").on("click",btnExit);
  });

  function btnExit(){
	alert("パスワードの変更ウィンドウを終了します。");
    self.close();
  }

  function deleteBtn(){
	 //delete
  }
</script>

</body>
</html>
