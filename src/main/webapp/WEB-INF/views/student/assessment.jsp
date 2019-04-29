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
        <div style="height : 16%; width: 100%">
          <div style="width:40%; float: right">
           <table class="table table-striped2">
            <tr style="border: 1px solid #dee2e6">
              <td class="tdT">講義名</td>
              <td style="width: 30%">${assessment.TITLE}</td>
              <td class="tdT">教授名</td>
              <td style="width: 30%">${assessment.PNAME}</td>                                          
            </tr>
          </table>
        </div>
      </div>
<div class="table-responsive" style="overflow-x: hidden;overflow-y: auto; height: 60%;">
	<form id="myForm" action="assessProfessor">
	  <input type="hidden" name ="smseq" value="${assessment.SMSEQ}">
      <table class="table table-striped">
      		<thead>
      		<tr>
      			<th style="width: 30%;">
      			評価項目
      			</th>
      			<th style="width:14%;">
      			当てはまる
      			</th>
      			<th  style="width:14%;">
      			そのような方だ
      			</th>
      			<th  style="width:14%;">
      			普通だ
      			</th>
      			<th  style="width:14%;">
      			そうではない方だ
      			</th>
      			<th  style="width:14%;">
      			全然そうではない
      			</th>
      		</tr>
      		</thead>
      		<tbody>
	      		<tr>
	      			<td style="width: 30%;">
	      			教授は授業に忠実でした。
	      			</td>
	      			<td style="width:14%;">
	      			<input type="radio" name="fidelity" value="5">
	      			</td>
	      			<td  style="width:14%;">
	      			<input type="radio" name="fidelity" value="4">
	      			</td>
	      			<td  style="width:14%;">
	      			<input type="radio" name="fidelity" value="3">
	      			</td>
	      			<td  style="width:14%;">
	      			<input type="radio" name="fidelity" value="2">
	      			</td>
	      			<td  style="width:14%;">
	      			<input type="radio" name="fidelity" value="1">
	      			</td>
	      		</tr>
	      		<tr>
	      			<td colspan="6">
	      			<textarea id="fidlityReason" name="fidlityReason" style="padding:20px; width: 100%;height: 70px; font-size: 1rem; border: 1px solid gray; border-radius: 7px;" placeholder="点数を付けた理由を500字内外で作成できます" ></textarea>
	      			</td>
	      		</tr>
	      		<tr>
	      			<td style="width: 30%;">
	      			授業内容は専門的でした
	      			</td>
	      			<td style="width:14%;">
	      			<input type="radio" name="professionality" value="5">
	      			</td>
	      			<td  style="width:14%;">
	      			<input type="radio" name="professionality" value="4">
	      			</td>
	      			<td  style="width:14%;">
	      			<input type="radio" name="professionality" value="3">
	      			</td>
	      			<td  style="width:14%;">
	      			<input type="radio" name="professionality" value="2">
	      			</td>
	      			<td  style="width:14%;">
	      			<input type="radio" name="professionality" value="1">
	      			</td>
	      		</tr>
	      		<tr>
	      			<td colspan="6">
	      			<textarea id="professionalityReason" name ="professionalityReason" style="padding:20px; width: 100%;height: 70px; font-size: 1rem; border: 1px solid gray; border-radius: 7px;" placeholder="点数を付けた理由を500字内外で作成できます" ></textarea>
	      			</td>
	      		</tr>
	      		<tr>
	      			<td style="width: 30%;">
	      			授業は優しくて理解できました。
	      			</td>
	      			<td style="width:14%;">
	      			<input type="radio" name="understanding" value="5">
	      			</td>
	      			<td  style="width:14%;">
	      			<input type="radio" name="understanding" value="4">
	      			</td>
	      			<td  style="width:14%;">
	      			<input type="radio" name="understanding" value="3">
	      			</td>
	      			<td  style="width:14%;">
	      			<input type="radio" name="understanding" value="2">
	      			</td>
	      			<td  style="width:14%;">
	      			<input type="radio" name="understanding" value="1">
	      			</td>
	      		</tr>      		
	      		<tr>
	      			<td colspan="6">
	      			<textarea id="understandingReason" name="understandingReason"style="padding:20px; width: 100%;height: 70px; font-size: 1rem; border: 1px solid gray; border-radius: 7px;" placeholder="点数を付けた理由を500字内外で作成できます" ></textarea>
	      			</td>
	      		</tr>
      		</tbody>
      	</table>
      	</form>
        </div>
      </div>
    </div>
  </div>

<footer>
  <div class="d-none d-lg-block" style="position: absolute; bottom: 3%; height: 11%">
    <button class="btn-lg bCD" style="right: 33%;" type="button" id="btnsubmit">伝送</button>
    <button class="btn-lg bCD" style="right: 15%;" type="button" id="btnExit">終了</button>
  </div>
</footer>

<script type="text/javascript">
	var time = 0;
	var running = 1;

  $(function(){
    $("#btnExit").on("click",btnExit);
    $("#btnsubmit").on("click",btnsubmit);
  });

  function btnExit(){
	  alert("講義評価を取り消します");
	  self.close();
	}

  //if click btnsubmit;
  function btnsubmit(){
	var fidelity = $("input[name='fidelity']:checked").val();
	var professionality = $("input[name='professionality']:checked").val();
	var understanding = $("input[name='understanding']:checked").val();
	var fidlityReason = $("#fidlityReason").val();
	var professionalityReason = $("#professionalityReason").val();
	var understandingReason = $("#understandingReason").val();

	//if all answer is filled
	if (fidelity != null && professionality!= null && understanding != null && fidlityReason != null 
			&& professionalityReason != null && understandingReason != null) {
		$("#myForm").submit();
		self.close();
	} else{
		alert("入力を残した部分を確認してください。");
	}
}

</script>
</body>
</html>