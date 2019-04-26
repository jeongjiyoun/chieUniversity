<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="kr">

<head>
	<title>Score</title>
	<script src="resources/jquery-3.3.1.min.js"></script>
	  <link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>


<script>
var assignment1Sum=0;
var assignment2Sum=0;
var score1Sum=0;
var score2Sum=0;
var attendScoreSum=0;
var etcScoreSum=0;

var countA=0;
var countBP=0;
var countB0=0;
var countBM=0;
var countCP=0;
var countC0=0;
var countCM=0;
var countD =0;
var countF=0;
var option='';
var lectureNum ='';
var scoreType;

$(function() {
	init();
	dounutData();
// 	$(".grade").on("keyup",updateDounut);
	$("#type").on("change",function(){
		init();
	});
	$("#scoreType").on("change",function(){
		arrayScore();
	});	
	$("#isFinalB").on("click",function(){
		finalCheck();
		
	});	
	
// 	$(document).on("keyup",".grade", updateDounut);
 	
});


function init(){
	lectureNum = $("#lectureNum").val();
	
	type = $("#type option:selected").val();
	$.ajax({
		type :'POST'
	    ,url : 'selectAll'
	    ,data : {
	    	"lectureNum" : lectureNum
	    	,"type" : type
	    }
	    ,success : function(resp){
	    	output2(resp);
	    }	
	});


	$.ajax({
		type:'GET'
		,url: 'selectScorePCT'
		,data: {
			"lectureNum" : lectureNum
		}
		,success : function(scorePCT){
			output1(scorePCT);
		}
	});
	
	 dounutData();
	 
}

function arrayScore(){
	scoreType = $("#scoreType option:selected").val();
	
	$.ajax({
		type :'POST'
	    ,url : 'arrayScore'
	    ,data : {
	    	"lectureNum" : lectureNum
	    	,"scoreType" : scoreType
	    }
	    ,success : function(resp){
	    	output2(resp);
	    }	
	});
}

function updateDounut() {  
	var score_seq = $(this).attr("data-value");
	var score_grade =$(".grade").val();
//		if (countA>3) {
//			alert("Aが多すぎます。")
//		}
	alert(score_grade)
	$.ajax({
		type:'POST'
		,data:{
			"score_seq" :score_seq
			,"score_grade" : score_grade
		}
		,url : 'insertScoreGrade'
		,success : function(){
			dounutData();
		}
	});
}

function dounutData(){

	$.ajax({
		type:'POST'
		,data:{
			"lectureNum" : lectureNum
		}
		,url : 'selectScore_grade'
		,success : function(result){
			countA=0;
			countBP=0;
			countB0=0;
			countBM=0;
			countCP=0;
			countC0=0;
			countCM=0;
			countD =0;
			countF=0;
			for (var i = 0; i < result.length; i++) {
				if (result[i]=='A') {
					countA ++;
				}else if(result[i]=='B+') {
					countBP ++;
				}else if(result[i]=='B-') {
					countBM ++;
				}else if(result[i]=='C+') {
					countCP ++;
				}else if(result[i]=='C0') {
					countC0 ++;
				}else if(result[i]=='C-') {
					countCM ++;
				}else if(result[i]=='D') {
					countD ++;
				}else  {
					countF ++;
				}
			}
			chart();
			
		}
	});
}
function finalCheck(){
	var m;
	if(countA >3){
		m="Aの比率";
	}
	else if(countBP>2){
		if (m==null) {
			m+="B+の比率"
		}
		else{
			m+=",B+の比率"	
		}
	}
	else if(countB0>2){
		if (m==null) {
			m+="B0の比率"
		}
		else{
			m+=",B0の比率"	
		}
	}
	else if(countBM>2){
		if (m==null) {
			m+="B-の比率"
		}
		else{
			m+=",B-の比率"	
		}
	}
	else if(countCP>2){
		if (m==null) {
			m+="C+の比率"
		}
		else{
			m+=",C+の比率"	
		}
	}
	else if(countCM>2){
		if (m==null) {
			m+="C-の比率"
		}
		else{
			m+=",C-の比率"	
		}
	}
	else if(countD>8){
		if (m==null) {
			m+="Dの比率"
		}
		else{
			m+=",Dの比率"	
		}
	}
	if (m!=null) {
		alert(m);
	} else {
		$.ajax({
			type:'POST'
			,data:{
				"lectureNum" : lectureNum
			}
			,url : 'changeIsfinal'
			,success : function(){
				alert("登録成功");
			} 
				
	
});
	}
}

function output1(scorePCT){
	var cont ="<tr><td>宿題１</td><td>"+scorePCT.ASSIGNMENT1_PCT+"</td><td>宿題２"+scorePCT.ASSIGNMENT2_PCT+"</td></tr>";
	cont+="<tr><td>試験１</td><td>"+scorePCT.SCORE1_PCT+"</td><td>試験２"+scorePCT .SCORE2_PCT+"</td></tr>";
	cont+="<tr><td>出席</td><td>"+scorePCT.ATTENDSCORE_PCT+"</td><td>その他"+scorePCT.ETCSCORE_PCT+"</td></tr>";
	$("#pctTable").html(cont);
}

function output2(resp){
	var cont="<thead><tr><th></th><th></th><th></th><th colspan=2 style='border : 1px solid #dee2e6;'>宿題</th></th><th colspan=2 style='border : 1px solid #dee2e6;'>試験</th><th colspan=3 style='border : 1px solid #dee2e6;'>その他</th><th></th></tr>";
		cont +="<tr><th style='width : 15%;'>順番</th><th style='width : 19%; border :1px solid #dee2e6;'>名前</th><th style='width : 15%; border : 1px solid #dee2e6;'>学番</th><th style='border : 1px solid #dee2e6;'>１</th><th style='1px solid #dee2e6;'>２</th><th style='border : 1px solid #dee2e6;'>1</th><th style='1px solid #dee2e6;'>2</th><th style='border : 1px solid #dee2e6;'>出席</th><th style='border : 1px solid #dee2e6;'>態度</th><th style='border : 1px solid #dee2e6;'>総合</th><th>成績</th></tr></thead>";
/* 			cont +="<tr><th>順番</th><th>名前</th><th>学番</th><th>宿題１</th><th>宿題２</th><th>試験1</th><th>試験2</th><th>出席</th><th>総合</th><th>成績</th></tr></thead>" */
		var ini = 1;

	$.each(resp,function(index, item){
		
		cont+="<tr class = 'hahaha' data-value ='"+item.SCORE_SEQ+"'>";
		cont+="<td class='ss'>"+ini+"</td>";
		cont+="<td class = 'sname'>"+item.SNAME+"</a></td>";
		cont+="<td class = 'sreginum' >"+item.SREGINUM+"</td>";
		cont+="<td class = 'assignment1'>"+item.ASSIGNMENT1+"</td>";
		cont+="<td class = 'assignment2'>"+item.ASSIGNMENT2+"</td>";
		cont+="<td class = 'score1'>"+item.SCORE1+"</td>";
		cont+="<td class = 'score2'>"+item.SCORE1+"</td>";
		cont+="<td class = 'attendScore'>"+item.ATTENDSCORE+"</td>";
		cont+="<td class = 'etcScore'>"+item.ETCSCORE+"</td>";
		cont+="<td class = 'totalscore'>"+item.TOTALSCORE+"</td>";
		cont+="<td class = 'score_grade' data-value ='"+item.SCORE_SEQ+"'>"+item.SCORE_GRADE+"</td></tr>";	

		
		assignment1Sum+=Number(item.ASSIGNMENT1);
		assignment2Sum+=Number(item.ASSIGNMENT2);
		score1Sum+=Number(item.SCORE1);
		score2Sum+=Number(item.SCORE2);
		attendScoreSum+=Number(item.ATTENDSCORE);
		etcScoreSum+=Number(item.ETCSCORE);
		ini++;
	});
	$("#Stable").html(cont);
	$(".hahaha").on("click",insert);

	
	assignment1Sum=Number(assignment1Sum)/30;
	assignment2Sum=Number(assignment2Sum)/30;
	score1Sum=Number(score1Sum)/30;
	score2Sum=Number(score2Sum)/30;
	attendScoreSum=Number(attendScoreSum)/30;
	etcScoreSum=Number(etcScoreSum)/30;
		
	chart();
		
}
function insert(){
	var score_seq = $(this).attr("data-value");
	var url ='goSPopup?score_seq='+score_seq;
	window.open(url,'_blank','height=500, width=1150, left=0,top=0',false); 
}

function chart(){
	var ctx = document.getElementById("myChart");
	var ctx2 = document.getElementById("myDoughnutChart");
	
	
	var myChart = new Chart(ctx, {
	
	    type: 'bar',

	    data: {

	        labels: ["宿題1", "宿題2", "試験１", "試験２", "出席", "その他"],

	        datasets: [{

	            label: '成績平均点数',

	            data: [assignment1Sum, assignment2Sum, score1Sum, score2Sum, attendScoreSum, etcScoreSum],

	            backgroundColor: [

	                'rgba(255, 99, 132, 0.2)',

	                'rgba(54, 162, 235, 0.2)',

	                'rgba(255, 206, 86, 0.2)',

	                'rgba(75, 192, 192, 0.2)',

	                'rgba(153, 102, 255, 0.2)',

	                'rgba(255, 159, 64, 0.2)'

	            ],

	            borderColor: [

	                'rgba(255,99,132,1)',

	                'rgba(54, 162, 235, 1)',

	                'rgba(255, 206, 86, 1)',

	                'rgba(75, 192, 192, 1)',

	                'rgba(153, 102, 255, 1)',

	                'rgba(255, 159, 64, 1)'

	            ],

	            borderWidth: 1

	        }]

	    },

	    options: {

	        scales: {

	            yAxes: [{

	                ticks: {

	                    beginAtZero:true

	                }

	            }]

	        }

	    }

	});
	// And for a doughnut chart
	var myDoughnutChart = new Chart(ctx2, {
	    type: 'doughnut',
	    data:  {
	    	    datasets: [{
	    	        data: [countA, countBP, countB0, countBM, countCP, countC0, countCM, countD, countF],
	    	        backgroundColor: [

	    	            'rgba(251,27,37, 0.6)',

	    	            'rgba(203,194,93, 0.6)',

	    	            'rgba(50,180,110, 0.6)',

	    	            'rgba(75, 192, 192, 0.6)',

	    	            'rgba(250,121,167, 0.6)',

	    	            'rgba(239,161,34, 0.6)',
	    	            
	    	            'rgba(230,66,105, 0.6)',

	    	            'rgba(62,37,150, 0.6)',
	    	            
	    	            'rgba(246,212,231, 0.6)'

	    	        ],

	    	    }],

	    	    // These labels appear in the legend and in the tooltips when hovering different arcs
	    	    labels: [
	    	        'A',
	    	        'B+',
	    	        'B0',
	    	        'B-',
	    	        'C+',
	    	        'C0',
	    	        'C-',
	    	        'D',
	    	        'F'
	    	    ],
	
	

	    	},

	});

}



</script>
<style type="text/css">
	button {
		width: 10%;
		background-color: #06213F;
		border: none;
		border-radius: 10px;
		color: #fff;
		padding: 5px 0;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 20px;
		margin: 5px;
		float: right;
		cursor: pointer;
	}

	th, td {
		width: 30%;
	}

	textarea {

	}

	#title {
		width: 70%;
	}
</style>

<meta charset="utf-8">
<meta name="viewport"content="width=device-width, initial-scale=1, shrink-to-fit=no">


<link href="<c:url value="/resources/css/resume.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/Chart.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/sb-admin-2.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">


<!-- Title Page-->
<title>subjectHome</title>



<!-- 미세 커스텀 조정 -->
<link href="<c:url value="/resources/css/boardCss.css" />"
rel="stylesheet" type="text/css">

<style type="text/css">
	button {
		width: 10%;
		background-color: #06213F;
		border: none;
		color: #fff;
		padding: 5px 0;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 20px;
		margin: 5px;
		float: right;
		cursor: pointer;
	}
</style>




</head>

<body style="padding-left: 0px;">
	<div class="container-fluid">
		<div class="d-none d-lg-block" id="fix-title">
			<div id="fix-logoDiv">
				<div id="fix-logo">
					<a href="goHome"> <img id="schoolLogo"
						src="<c:url value="/resources/img/logo.png" />" alt=""> <span
						id="sideLogo"> 知恵通信大学 </span>
					</a>
				</div>
			</div>
			<div id="fix-text">Professor CoursePage</div>
		</div>

		<div class="row" id="margin-del">
			<!--          <div class ="col-sm-2"> -->
			<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top"
				id="sideNav">
				<a class="navbar-brand js-scroll-trigger" style="margin-top: 15px;"
					href="#page-top"> <span class="d-block d-lg-none">知恵通信大学</span>
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div id="prof-span">
					<img class="img-fluid img-profile rounded-circle mx-auto mb-2" id="hiddenImg" src="${sessionScope.PICNAME}"><br> <span> ${sessionScope.loginName} </span>
				</div>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav">
					     <li class="nav-item">
					      <a class="nav-link js-scroll-trigger" href='subjectDetail?lecturenum=${lectureNum}'>講義メーン</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link js-scroll-trigger" href="subjectNotice?lecturenum=${lectureNum}">お知らせ</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link js-scroll-trigger" href="QnA?lecturenum=${lectureNum}">QnA</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link js-scroll-trigger" href="assignment?lecturenum=${lectureNum}">宿題</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link js-scroll-trigger" href="goexam?lecturenum=${lectureNum}">試験</a>
					    </li>
					</ul>
				</div>
			</nav>
					<div class="col-sm-3" id="hiddenleft"></div>
					<div class="col-sm-9" id="hiddenright">
						<br>
						<div id="conte" style="margin: none;">
							<div class="chart" style="width: 30%; float: left">
								<!-- 내용 들어가는 부분 -->
								
								  <!-- Area Chart -->
							<input id="lectureNum" type="hidden" value="${lectureNum}">
								<table class ="pctTable" id="pctTable">
								</table>
								
								<div class="Chart1">
								<canvas id="myChart" style="width:400px; height :300px"></canvas>
								</div>
							
								<div class="Chart2">
								<canvas id="myDoughnutChart" style="width : 400px; height: 300px; MARGIN-TOP: 47px;"> 
								</canvas>
								</div>
							</div>

							
							<div style="float : right;">
									
<!-- 									[点数整列基準] -->
									<select name="type" id="type" style="float : left; margin-left: 20px; OVERFLOW-Y: AUTO;
    OVERFLOW-X: HIDDEN;">
									  <option value="asc">総点昇順</option>
									  <option value="desc" selected="selected">総点降順</option>
									</select>
									
									<select name="scoreType" id="scoreType" style="float : left; margin-left: 20px; OVERFLOW-Y: AUTO;
    OVERFLOW-X: HIDDEN;">
									  <option value="assignment1">宿題１</option>
									  <option value="assignment1">宿題２</option>
									  <option value="score1">試験１</option>
									  <option value="score1">試験２</option>
									  <option value="attendScore">出席</option>
									  <option value="etcScore">態度</option>
									  <option value="totalScore" selected="selected">総点 </option>
									</select><br>
									<button id="isFinalB">最終提出	</button>
								</div>		
							<div class="table" style="height: 100%; width:67%; float: left; max-height: 647px; margin-left: 20px; min-width: 640px; OVERFLOW-Y: AUTO;
    OVERFLOW-X: HIDDEN;">
								 
									
								<table class ="Stable" id="Stable"style="float : left; border : 1px solid #dee2e6;">
								<%-- <c:forEach items="${slist}" var="score" varStatus="index"></c:forEach> --%>
								</table>
							</div>
								
						</div>
				</div>
			</div>
			</div>

			   <div id="boardFooter">
   © ChiE Online University <br>
   Tel : 03-3344-4444 <p> &nbsp &nbsp Fax : 03-3344-5555 &nbsp &nbsp board@chie.ac.kr</p><br>
   </div>
</body>
</html>