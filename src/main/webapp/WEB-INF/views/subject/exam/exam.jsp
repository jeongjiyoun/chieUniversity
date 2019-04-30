<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta name="viewport"
  content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title><c:if test="${test.EXAM_NUM == 'F'}">期末</c:if><c:if test="${test.EXAM_NUM == 'M'}">中間</c:if>考査</title>

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
	<span style="width:22%; color: white; position: absolute; top: 16%; height: 84%; font-size: 2rem; margin-left: 35px;">残り時間  <span id="timeO"></span></span>
	<span style="color: white; position: absolute; top: 16%; right: 16%; height: 84%; font-size: 2rem; margin-left: 35px;">${test.NAME} (${test.DIVIDE})</span>
      </div>
    </header>
    <div class="row">
      <div class="col-sm-10 offset-sm-1" id="hiddenright">
        <div style="height : 16%; width: 100%">
          <div style="width:40%; float: right">
           <table class="table table-striped2">
            <tr style="border: 1px solid #dee2e6">
              <td class="tdT">名前</td>
              <td style="width: 30%">${sessionScope.loginName}</td>
              <td class="tdT">学生番号</td>
              <td style="width: 30%">${sessionScope.loginId}</td>                                          
            </tr>
          </table>
        </div>
      </div>
      <div style="height: 40%; width: 100%;">
        <div id="questionnum" style="width : 4%; font-size: 4rem; float: left; min-width: 20px;">${test.QUESTIONNUM}</div>
        <input type="hidden" value="${test.EXAMSEQ2}" id="exam_Seq2">
        <input type="hidden" value="${test.EXAMSEQ}" id="examSeq">
        <div id="questionScore" style="margin-top: 2%; width : 85%; font-size: 2rem; float: left; margin-left: 2%;">${test.QUESTION} (${test.QUESTION_SCORE}点)</div>
      </div>
      <div style="width: 100%; min-height: 70%; margin-top: 2%;">
        <textarea id="answer" style="padding:20px; width: 100%; max-height:300px;min-height: 200px; font-size: 1rem; border: 1px solid gray; border-radius: 7px;" placeholder="1000字内外で作成できます" ></textarea>
        <br>
        <span style="float: right;" id="sp02"><span id="sp01">0</span>/1000字</span>
      </div>
    </div>
  </div>
</div>

<footer>
  <div class="d-none d-lg-block" style="position: absolute; bottom: 0%; height: 11%">
    <button class="btn-lg bCD" style="left: 26%;" type="button" id="btnBefo">以前</button>
    <button class="btn-lg bCD" style="left: 43%;" type="button" id="btnNext">以後</button>
    <button class="btn-lg bCD" style="right: 15%;" type="button" id="btnExit">終了</button>
	<input type="hidden" value="${test.TIMELIMIT}" id="timeLimit">
  </div>
</footer>

<script type="text/javascript">
	var time = 0;
	var running = 1;
 	var timeLimit = $("#timeLimit").val();

  $(function(){
    $("#btnBefo").on("click",btnBefo);
    $("#btnNext").on("click",btnNext);
    $("#btnExit").on("click",btnExit);
    $("#answer").on("keyup",countingWords);
    calcuTime(timeLimit);
    startTime();
  });

  function btnBefo(){
	  saveAnswer();
	  getQuestion("Before");
  }

  function btnNext(){
	  saveAnswer();
	  getQuestion("Next");
  }

  function saveAnswer(){
	    var exam_Seq2 = document.getElementById('exam_Seq2').value;
	    var answer = document.getElementById('answer').value;
	    var intime = document.getElementById('timeO').innerHTML;
	    alert(exam_Seq2);
	    $.ajax({
		      type : 'POST'
		      ,url : "saveAnswer"
		      ,data : {
		        "exam_Seq2" : exam_Seq2,
		        "answer" : answer,
		        "intime" : intime
		      }
		      ,success : function(resp){
		      }
		    });
  }

  function getQuestion(type){
	    var exam_Seq2 = document.getElementById('exam_Seq2').value;
	  $.ajax({
	      type : 'POST'
	      ,url : "getQuestion"
	      ,data : {
	        "exam_Seq2" : exam_Seq2,
	        "type" : type
	      }
	      ,success : function(resp){
	    	  if (resp.EXAMSEQ2 == null) {
	    		  examLast();
			} else {
// 				alert(resp);
	        	showQuestion(resp);
			}
	      }
	    });
  }

  //SHOW LAST PAGE
  function examLast(){
	  $("#exam_Seq2").remove();
	  $("#answer").remove();
	  $("#questionnum").remove();	  
	  $("#questionScore").remove();
	  $("#sp02").remove();
	  var cont = "<p style ='text-align: center; vertical-align: middle; font-size: 100px; transform: translateY(55%); color: rgb(22, 56, 93); font-weight: 500;'>お疲れ様でした</p>"
	  $("#hiddenright").html(cont);
	  $("#btnBefo").remove();
	  $("#btnNext").remove();
  }

  //SHOW TEST QUESTION
  function showQuestion(resp){
	  	var ques = resp.QUESTION + " (" + resp.QUESTION_SCORE + "点)"
	  	$("#exam_Seq2").val(resp.EXAMSEQ2);
// 	  	$("#answer").html(resp.QUESTION);
	    $("#questionnum").html(resp.QUESTIONNUM);
	    document.getElementById('questionScore').innerHTML = ques;
  }
  
  //CALCULATE TIME FOR TEST
  function calcuTime(Etime){
	   var mins = Math.floor(Etime%60);
	   var hour = Math.floor(Etime/60);

	   if(mins < 10){
		   	mins = "0" + mins;
		   }
		   if(hour < 10){
		   	hour = "0" + hour;
		   }
	   
	   var result = hour + ":" + mins;
	   document.getElementById('timeO').innerHTML = result;
  }

  //TEST IN TIME
  function startTime(){
   if(running == 1){
	   setTimeout(function(){
		   time++;
		   if (timeLimit == time*60) {
				alert("時間が終わりました。お疲れ様でした。");
				btnExit();
			}
 		   Etime = (timeLimit *60) - time; 
		   var timeS = calcuTime(Etime);			   
		   startTime();
		}, 1000*60);
    }
  }

  //COUNTING WORDS
  function countingWords(){
   document.getElementById("sp01").innerHTML= document.getElementById("question").value.length;
 }

  function btnExit(){
	  saveAnswer();
	  self.close();
}

</script>
</body>
</html>