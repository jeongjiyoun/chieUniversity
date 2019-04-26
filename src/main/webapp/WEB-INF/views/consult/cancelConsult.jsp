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
  <title>相談申し込み詳細内訳</title>

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
                <th colspan="4"><h2 style="text-align: center">相　談　<c:if test="${consult.ISCOUNSEL == 'F'}">取　消　</c:if>申　込　書</h2></th>
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
                <td>${consult.COUNDATE}</td>
              </tr>
              <tr>
                <td class="tdT">相談理由</td>
                <td colspan="3">${consult.MEMO}</td>
              </tr>
              <c:if test="${consult.ISCOUNSEL == 'F'}">
              <tr>
                <td class="tdT">取消申し込み日</td>
                <td>${consult.CDATE}</td>
                <td class="tdT">承認可否</td>
                <td><c:if test="${consult.ISPERMITTED} =='F'">承認待機</c:if>
                  <c:if test="${consult.ISPERMITTED} =='T'">承認完了</c:if>
                </td>
              </tr>
              <tr>
                <td class="tdT">相談取り消し理由</td>
                <td colspan="3">${consult.REASON}</td>
              </tr>
            </c:if>
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
  <div style="position: relative; height: 61px; background-color: rgb(22, 56, 93);">
  <c:choose>
  	<c:when test="${consult.ISCOUNSEL == 'F' && sessionScope.userType == 'P'}">
	    <button class="btn-lg bC" style="left : 20%;" id="btnAdt">確認</button>
	    <button class="btn-lg bC" style="left : 51%;" id="btnExit">EXIT</button>
  	</c:when>
  	<c:when test="${consult.ISCOUNSEL == 'A' && sessionScope.userType == 'S'}">
	    <button class="btn-lg bC" style="left : 20%;" id="btnCnl">取消</button>
	    <button class="btn-lg bC" style="left : 51%;" id="btnExit">EXIT</button>
  	</c:when>
  	<c:otherwise>
	 	<button class="btn-lg bC" style="right: 15%;" type="button" id="btnExit">EXIT</button>
  	</c:otherwise>
  </c:choose>
 </div>
</footer>

<form id="conCo"　action="adminCancel"></form>

<script type="text/javascript">
  $(function(){
    $("#btnExit").on("click",btnExit);
    $("#btnAdt").on("click",btnAdt);
    $("#btnCnl").on("click",btnCnl);
  });
  
  function btnCnl(){
	  location.href="cancelConsult"
  }

  function btnExit(){
    self.close();
  }

  function btnAdt(){
	var counselseq = ${consult.COUNSELSEQ};
	$.ajax({
			type : 'POST'
			,url : 'adminCancel'
			,data :
		      {
		        "counselseq" : counselseq
		      }
			,success : function(resp){
			    alert("取り消しの申し込みが承認できました。");
			    self.close();
			}
		});
  }
</script>

</body>
</html>
