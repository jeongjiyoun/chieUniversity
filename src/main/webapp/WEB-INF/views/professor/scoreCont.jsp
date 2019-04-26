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

<script>

var assignment1_pct ='';
var assignment2_pct='';
var score1_pct='';
var score2_pct='';
var attendScore_pct='';
var etecScore_pct='';


$(function(){
	init();
	$(".insertScore").on("click",insert);

});

function init(){
	var assignment1_pct ;
	var assignment2_pct;
	var score1_pct;
	var score2_pct;
	var attendScore_pct;
	var etcScore_pct;
	
	$.ajax({
		type:'GET'
		,url: 'selectScorePCT'
		,data: {
			"lectureNum" : '001'
		}
		,success : function(scorePCT){
			output1(scorePCT);
		}
	});
}

function output1(scorePCT){
	var cont ="<tr><td style='border :1px solid #dee2e6;'>宿題１</td><td style='border :1px solid #dee2e6;'>"+scorePCT.ASSIGNMENT1_PCT+"&#37;</td><td style='border :1px solid #dee2e6;'>宿題２"+scorePCT.ASSIGNMENT2_PCT+"&#37;</td>";
	cont+="<td style='border :1px solid #dee2e6;'>試験１</td><td style='border :1px solid #dee2e6;'>"+scorePCT.SCORE1_PCT+"&#37;</td><td style='border :1px solid #dee2e6;'>試験２"+scorePCT .SCORE2_PCT+"&#37;</td>";
	cont+="<td style='border :1px solid #dee2e6;'>出席</td><td>"+scorePCT.ATTENDSCORE_PCT+"&#37;</td><td style='border :1px solid #dee2e6;'>その他"+scorePCT.ETCSCORE_PCT+"&#37;</td></tr>";
	$("#pctTable").html(cont);
	
	assignment1_pct =scorePCT.ASSIGNMENT1_PCT;
	assignment2_pct=scorePCT.ASSIGNMENT2_PCT;
	score1_pct=scorePCT.SCORE1_PCT;
	score2_pct=scorePCT.SCORE2_PCT;
	attendScore_pct=scorePCT.ATTENDSCORE_PCT;
	etcScore_pct=scorePCT.ETCSCORE_PCT;
}


function insert(){
	var assignment1 = $("#assignment1").val();
	var assignment2 = $("#assignment2").val();
	var attendScore = $("#attendScore").val();
	var etcScore =$("#etcScore").val();
	var score_seq =$("#score_seq").val();
	var score1 = $("#score1").val();
	var score2 = $("#score2").val();
	var score_grade =$("#score_grade").val();
	
	var totalScore = String((Number(assignment1)*Number(assignment1_pct))/100 + (Number(assignment2)*Number(assignment2_pct))/100 +  (Number(attendScore)*Number(attendScore_pct))/100 + (Number(etcScore)*Number(etcScore_pct))/100 + (Number(score1)*Number(score1_pct))/100 + (Number(score2)*Number(score1_pct))/100);
	
	
	
	var score = {
			 "assignment1" : assignment1
		   , "assignment2" : assignment2
		   , "attendScore" : attendScore
		   , "etcScore" : etcScore
		   , "score1" : score1
		   , "score2" : score2
		   , "score_seq" : score_seq
		   , "totalScore" : totalScore
		   , "score_grade" :score_grade
	};
	
	console.log(score);
	
	$.ajax({
		type :'POST'
		,url : 'insertScore'
		,data : score
		,success : function(score){

			$("#totalScore").val(totalScore);
			window.opener.location.reload();
			}
		,error : function(data){
				alert("登録失敗");
		}
	});
}
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
		<h2>学生成績登録</h2>
		<br>
		<table class="sTable" id="sTable" style="border :1px solid #dee2e6; text-align: center; ">
				<tr><th></th><th></th><th colspan=2 style='border : 1px solid #dee2e6; width : 16%;'>宿題</th><th colspan=2 style='border : 1px solid #dee2e6; width : 16%;'>試験</th><th colspan=3 style='border : 1px solid #dee2e6; width : 23%;'>その他</th><th></th></tr>
					<tr><th style='width : 19%; border :1px solid #dee2e6;'>名前</th><th style='width : 18%; border : 1px solid #dee2e6;'>学番</th><th style='border : 1px solid #dee2e6;'>１</th><th style='border : 1px solid #dee2e6;'>２</th><th style='border : 1px solid #dee2e6;'>1</th><th style='1px solid #dee2e6;'>2</th><th style='border : 1px solid #dee2e6;'>出席</th><th style='border : 1px solid #dee2e6;'>態度</th><th style='border : 1px solid #dee2e6;'>総合</th><th style='border :1px solid #dee2e6;'>成績</th></tr>
				<tr>
					<td style='border :1px solid #dee2e6;'>
						<input id="score_seq" type="hidden" value="${score.SCORE_SEQ}">
						${score.SNAME}
					</td>
					<td style='border : 1px solid #dee2e6;'>
						${score.SREGINUM}
					</td>
					<td style='border : 1px solid #dee2e6;'>
						<input id="assignment1" type="text" name="assignment1" value="${score.ASSIGNMENT1}" style="width: 50px;"/>
					</td>
					<td style='border : 1px solid #dee2e6;'>
						<input id="assignment2" type="text" name="assignment2" value="${score.ASSIGNMENT2}" style="width: 50px;"/>
					</td>
					<td style='border : 1px solid #dee2e6;'>
						<input id="score1" type="text" name="score1" value="${score.SCORE1}" style="width: 50px;"/>
					</td>
					<td style='border : 1px solid #dee2e6;'>
						<input id="score2" type="text" name="score2" value="${score.SCORE2}" style="width: 50px;"/>
					</td>
					<td style='border : 1px solid #dee2e6;'>
						<input id="attendScore" type="text" name="attendScore" value="${score.ATTENDSCORE}" style="width: 50px;"/>
					</td>
					<td style='border : 1px solid #dee2e6;'>
						<input id="etcScore" type="text" name="etcScore" value="${score.ETCSCORE}" style="width: 50px;"/>
					</td>
					<td style='border : 1px solid #dee2e6;'>
						<input id="totalScore" type="text" name="totalScore" value="${score.TOTALSCORE}" style="width: 50px;"/>
					</td>
					<td style='border : 1px solid #dee2e6;'>
						<input id="score_grade" type="text" name="score_grade" value="${score.SCORE_GRADE}" style="width: 50px;"/>
					</td>
					
				</tr>
			</table>
			<br>
    				<button class="insertScore" style="width: 100px;">登録</button>
      	<p style="font-size : 20px;font-weight: bold; ">・成績反映比率</p>
      	<table id="pctTable" style="text-align : center; border : 1px solid #dee2e6"></table>      
      </div>
    </div>
  </div>
</div>




</body>
</html>
