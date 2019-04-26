<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta name="viewport"  content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- 900ｘ560 -->
  <title>専攻検索</title>

  <!-- font -->
  <link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">

  <!-- Bootstrap css -->
  <link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">

  <!-- Jquery -->
  <script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>

<%--   <!-- Main CSS *-->
  <link href="<c:url value="/resources/css/consult.css"/>" rel="stylesheet" media="all"> --%>
   <link rel="stylesheet" type="text/css"   href="<c:url value="/resources/css/schoolInfo.css" />">
  <!-- 기타 Css -->
  <link href="<c:url value="/resources/css/boardCss.css" />" rel="stylesheet" type="text/css">
<script>
var categories='';
$(function() {
	$("#categories").on("change",function(){
		majorList();
	});	
	$("#check").on("click",checkMajor);
});
     
function majorList(){
	categories = $("#categories option:selected").val();

	
	$.ajax({
		type :'POST'
	    ,url : 'majorList'
	    ,data : {
	    	"categories" : categories
	    }
	    ,success : function(mList){
	    	output(mList);
	    }	
	});
}

function checkMajor(){
	var majorSeq = $("#majorSeq:checked").val();
	$.ajax({
		type :'POST'
	    ,url : 'checkMajor'
	    ,data : {
	    	"majorSeq" : majorSeq
	    }
	    ,success :function(result){
	    	window.opener.document.getElementById("applicantMajor").value = result;
			window.opener.document.getElementById("majorSeq").value = majorSeq;
	    	close();
	    }
	});
}


	
	
function output(mList){
	var cont="<thead><tr><th></th><th style='width: 139px;'>専攻名</th><th>専攻説明</th><th></th></tr></thead>";
	var ini = 1;
	$.each(mList,function(index, item){
		
		cont+="<tr class = 'hahaha' data-value ='"+item.majorSeq+"'>";
		cont+="<td class='ss'>"+ini+"</td>";
		cont+="<td class = 'mName'><p style='font-weight : bold;'>"+item.name+"</p></td>";
		cont+="<td class = 'explaination' >"+item.explaination+"</td>";
		cont+="<td class = 'check' ><input type='radio' id='majorSeq' value="+item.majorSeq+"></td></tr>";
		ini++;
	});
	$("#mtable").html(cont);
}
	
</script>
</head>
	

<body>
  <div class="container-fluid">
    <header>
      <div class="d-none d-lg-block" id="fix-titleC">
        <img id="logoCen" src="<c:url value="/resources/img/logo.png" />" style="left: 39%; ">
      </div>
    </header>
    <div class="row">
      <div class="col-sm-12" id="hiddenright">
      <div class="table-responsive" style="padding-left: 30px; padding-right: 30px;">
    	<br><br>
    	学部 :  
    	<select id="categories" name="categories">
		  <option value="1" selected="selected">融合経営学部</option>
		  <option value="2">社会福祉学部</option>
		  <option value="3" >IT工学部</option>
		  <option value="4" >社会科学部</option>
		</select>

<!-- 		<a href ="goWriteApplicant2?categories=categories&name=name" style="boder : 1px solid black;">選択完了</a> -->
		<button class="bStyle" id="check" style="float : right ; width : 102px; height: 33px;">選択完了</button><br><br>

		 <table  class ="mtable" id ="mtable" style="text-align: center;">
		 </table>
		 
    </div>
   </div>
  </div>
 </div>

</body>
</html>