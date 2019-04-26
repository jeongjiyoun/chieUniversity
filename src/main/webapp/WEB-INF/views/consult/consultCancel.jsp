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
  <title>相談取り消し書作成</title>

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
        <div class="table-responsive">
          <table class="table table-striped2">
            <thead class="thead">
              <tr id="table-title">
                <th colspan="4"><h2 style="text-align: center">相　談　取　消　申　込　書</h2></th>
              </tr>
            </thead>
            <tbody class = "table table-striped2 tS2">
              <tr>
                <td class="tdT">名前</td>
                <td style="width: 30%">${consult.SNAME}</td>
                <td class="tdT">学生番号</td>
                <td style="width: 30%">${consult.SREGINUM}</td>
              </tr>
              <tr>
                <td class="tdT">学年</td>
                <td style="width: 30%">${consult.GRADE}</td>
                <td class="tdT">相談分類</td>
                <td style="width: 30%">${consult.TYPENAME}</td>
              </tr>
              <tr>
                <td class="tdT">相談申し込み日時</td>
                <td>${consult.WDATE}</td>
                <td class="tdT">相談希望日時</td>
                <td>${consult.INDATE}</td>
              </tr>
              <tr>
                <td class="tdT">相談理由</td>
                <td colspan="3">${consult.MEMO}</td>
              </tr>

              <tr style="height: 161px;">
                <td class="tdT">相談取り消し理由</td>
                <td colspan="3" style="height: 161px;"><textarea id="reason" rows="1" cols="1" style="width: 100%: height: 100%;" placeholder="詳細に記入してください"></textarea></td>
              </tr>
          </tbody>
          <tfoot>
            <tr>
              <td colspan="4"></td>
            </tr>
          </tfoot>
        </table>
      </div>
    </div>
  </div>
</div>
<footer>
  <div class="d-none d-lg-block" style="position: absolute; bottom: 0%; height: 11%">
    <button class="btn-lg bC" style="left : 20%;" id="btnAdt">申し込み</button>
    <button class="btn-lg bC" style="left : 51%;" id="btnExit">EXIT</button>
</div>
</footer>

<form id="conCo" action="adminCancel"></form>

<script type="text/javascript">
  $(function(){
    $("#btnExit").on("click",btnExit);
    $("#btnAdt").on("cllick",btnAdt);
  });

  function btnExit(){
    self.close();
  }

  function btnAdt(){
	var counselseq = ${consult.COUNSELSEQ};
	var reason = $("#reason").val();
	$.ajax({
			type : 'POST'
			,url : 'applyCancel'
			,data :
		      {
		         "counselseq" : counselseq
		        ,"reason" : reason
		      }
			,success : function(resp){
			    alert("取り消しの申し込みが申し込みました。");
			    self.close();
			}
		});
  }
</script>

</body>
</html>
