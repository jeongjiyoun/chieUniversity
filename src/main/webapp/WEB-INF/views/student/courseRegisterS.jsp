<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="resources/jquery-3.3.1.min.js"></script>
<script>

var srSeq;

$(function(){
	$(".syllabus").on("click", syllabus);
})

function syllabus(){
	alert("!");
	var url = $(this).attr("data-value");
	alert(url);
		var url = "/fileWatch?url=" + $(this).attr("data-value");
		window.open(url, '_blank', 'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes, location=no, menubar=no,scrollbars=no', false);
}

function schedulePop(){
	//var score_seq = $(this).attr("data-value");
	var url;
	srSeq = $('#semester').val();
	url = 'schedulePop';
	window.open(url,'_blank','height=500, width=1100, left=100,top=100',false);
}

function selectMajor(e){
	var categories = $('#categories').val();
	srSeq = $('#semester').val();
	$.ajax({
		url:"selectMajor",
		type:"post",
		data:{categories:categories},
		success:function(data){
			$('#majorSeq').find("option").remove().end().append("<option value=''>専攻選択</option>");
			$.each(data,function(index,item){
				$('#majorSeq').append("<option value='"+item.MAJORSEQ+"'>"+item.NAME+"</option>");
				
			});
		}
		
	});
}


function typeSearch(){
	$("#categories option:eq(0)").prop("selected",true);
	$("#keyword option:eq(0)").prop("selected",true);
	$('#search').val("");
	var typeNum = $('#typeNum').val();
	srSeq = $('#semester').val();
	//alert(typeNum);
	$('#resultTable').empty();
	$.ajax({
		url:"typeSearch",
		type:"post",
		data:{typeNum:typeNum,srSeq:srSeq},
		success:function(data){
			if(data!=""){
				
				output(data);
			}else {
				alert('申請失敗！');
			}
		}
		
	});
}

function majorSearch(){
	$("#typeNum option:eq(0)").prop("selected",true);

	$("#keyword option:eq(0)").prop("selected",true);
	$('#search').val("");

	var majorSeq = $('#majorSeq').val();
	if(majorSeq==""){
		alert("please select major");
	}else {
		srSeq = $('#semester').val();
		$('#resultTable').empty();
		$.ajax({
			url:"majorSearch",
			type:"post",
			data:{majorSeq:majorSeq,srSeq:srSeq},
			success:function(data){
				if(data!=""){
					output(data);
				} else {
					alert('申請失敗！');
				}
			}
		});
	}
}

function keywordSearch(){
	$("#typeNum option:eq(0)").prop("selected",true);
	$("#categories option:eq(0)").prop("selected",true);
	var option=$('#keyword').val();
	var search=$('#search').val();
	srSeq = $('#semester').val();
	if(option==""){
		alert("please select option");
	}else if(search==""){
		alert("please input keyword");
	}else{
		//alert(search);
		
		$('#resultTable').empty();
		$.ajax({
			url:"keywordSearch",
			type:"post",
			data:{search:search,option:option,srSeq:srSeq},
			success:function(data){
				if(data!=""){
					output(data);
				} else {
					alert('申請失敗！');
				}
			}
		});
	}
}

function registerCourse(){
	var lectureNum = $(this).attr("data-value");
	srSeq = $('#semester').val();
	$.ajax({
		url:"registerCourse",
		type:"post",
		data:{lectureNum:lectureNum,srSeq:srSeq},
		success:function(data){
				alert(data);
				if($('#typeNum').val()!=""){
					typeSearch();
				}else if( $('#majorSeq').val()!=""){
					majorSearch();
				}else if($('#search').val()!=""){
					keywordSearch();
				}
			}
		
	});
	
}


function output(data){
	var result = "<tr><th>申請</th><th>課程</th><th>科目コード</th><th>科目名</th><th>班別</th><th>単位</th>";
	result+="<th>担当教授</th><th>定員</th><th>申請人員</th><th>ライブ</th><th>講義時間</th><th>対象</th><th>講義計画書</th></tr>";
	$.each(data,function(index,item){
		result+="<tr>";
		result+="<td><button type='submit' class='lectureNum' data-value='"+item.LECTURENUM+"'>申請</button></td>";
		result+="<td class='typeName'>"+item.TYPENAME+"</td>";
		result+="<td class='lectureNum'>"+item.LECTURENUM+"</td>";
		result+="<td class='name'>"+item.NAME+"</td>";
		result+="<td class='divide'>"+item.DIVIDE+"</td>";
		result+="<td class='credit'>"+item.CREDIT+"</td>";
		result+="<td class='pName'>"+item.PNAME+"</td>";
		result+="<td class='occupancy'>"+item.OCCUPANCY+"</td>"
		result+="<td class='count'>"+item.COUNT+"</td>"
		result+="<td class='real'>"+item.REAL+"</td>";
		result+="<td class='sTime'>"+item.STIME+"</td>";
		result+="<td class='grade'>"+item.GRADE+"</td>";
		result+="<td class='fileName'><button type='button' style='background-color:white;color:blue;' class='syllabus' data-value='"+item.FILENAME+"'>ダウンロード</button></td>";
		result+="</tr>";
	})
	$("#resultTable").append(result);
	$(".lectureNum").on("click",registerCourse);
	$(".syllabus").on("click", syllabus);
}
</script>
<style type="text/css">
	button{
			
			/* background-color:#06213F;
			color:#fff; */
			border:none;
			cursor:pointer;
			font-size:18px;
		}
	#condition{
		border: 1.5px solid rgb(0,103,178); 
		margin: 2%;
		padding: 0.8%;
		margin-left: auto;
		margin-right: auto;
		width:90%;
		font-size:20px;
	}
	
	#resultTable{
		text-align:center;
		width:90%;
		margin-left: auto;
		margin-right: auto;
	}

	select{
		font-size: 18px;
	}
	input{
		font-size:17px;
		vertical-align: top;
	}
</style>
</head>
<body>
	<input type="hidden" id="semester" value="${semester}">
	<table id="condition">
	<tr>
	<td style="padding-left: 49.5px;">課程検索 :
		
		<select style="width: 28%" id="typeNum">
		<option value="">選択</option>
		<option value="2">一般</option>
		<option value="3">教養</option>
		</select>
		<button type="submit" id="typeSearch" onclick="typeSearch();">検索</button>
		
	</td>
	</tr>
	<tr>
	<td style="padding-left: 28px;" >
		&nbsp;&nbsp;&nbsp;専攻検索 :
		<select style="width: 13.4%" name="categories" id="categories" onchange="selectMajor(this);" >
		<option value="">学部選択</option>
		<option value="1">融合経営学部</option>
		<option value="2">社会福祉学部</option>
		<option value="3">IT工学部</option>
		<option value="4">社会科学部</option>
		</select>
		<select id="majorSeq" style="width: 13.4%">
		<option value="">専攻選択</option>
		</select>
		<button type="submit" id="majorSearch" onclick="majorSearch();">検索</button>
	</tr>
	<tr>
		<td style="padding-left: 28px;">キーワード :
		<select name="keyword" id="keyword" style="width:13.5%;">
		<option value="">選択</option>
		<option value="1">科目コード</option>
		<option value="2">科目名</option>
		</select>
		<input type="text" id="search" name="search">
		<button type="submit" id="keywordSearch" onclick="keywordSearch();">検索</button>
		</td>
	</tr>
	<tr>
		<td style="padding-left: 48px;">最大単位 :　24単位&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最低単位:　15単位</td>
	</tr>
	
	<c:if test="${credit>=15&&credit<=24}">
	<tr>
		<td style="color: blue;padding-left: 48px;">現在単位 :　${credit}単位</td>
	</tr>
	
	</c:if>
	<c:if test="${credit<15||credit>24}">
	<tr>
		<td style="color: red;padding-left: 48px;">現在単位 :　${credit}単位</td>
	</tr>
	</c:if>
	<tr>
		<td style="float: right;"><button id="schedule" onclick="schedulePop();">MY TIMETABLE</button></td>
	</tr>
	</table>
	
	<div id="searchResult">
	</div>
		<table id="resultTable">
	
		
		</table>
	
</body>
</html>