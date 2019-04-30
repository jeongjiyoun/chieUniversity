<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成績証明書</title>
<script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
/* 
// 뒤로가기 방지

window.history.forward(1);



// 우클릭방지

oncontextmenu='return false' 



 // 드래그 방지

ondragstart='return false'



// 선택복사 방지

onselectstart='return false'



//새로고침, 뒤로가기 막기

document.onkeydown = function(e) {

 key = (e) ? e.keyCode : event.keyCode;

 if(key==8 || key==116) {

  if(e) {

   e.preventDefault();

  } else {

   event.keyCode = 0;

   event.returnValue = false;

  }

 }

}

//오른쪽마우스 막기

document.oncontextmenu = function(e){

 if(e){

  e.preventDefault();

 }

 else{

  event.keyCode = 0;

  event.returnValue = false;

 }

}
 */
</script>
<style>
@media print{
	#sett{
		border: 3px solid;
   		border-style: double;
    	margin-left: 3%;
    	margin-right: 3%;
    	margin: 3%;

    	}

    
    .logo{
    	background-image: url(resources/img/logo.png);
    	background-size: 37%;
    	background-repeat: no-repeat;
    	background-position: center;
    	webkit-print-color-adjust:exact;
    	
    
    }
 
	.multi{
		column-count: 2;
		column-rule: 1px solid;
		column-rule-style: solid;
		margin-top:15%;
		margin-left:5%;
		margin-right:5%;
		margin-bottom:10%;
		border: 2px solid;
   		padding: 2%;
   		background: rgba(256,256,256,0.4);
   		webkit-print-color-adjust:exact;
	}
	
	
	#sInfoTa{
		
		position: absolute;
		margin-right: 3%;
		margin-left: 3%;
		left: -27px;
		
	}
	td.sInfo{
		width:200px;
		text-align: right;
	}
	td.sInfo2{
		width:200px;
		text-align: left;
	}
	#title{
		font-size: 32px;
		margin: 3%;
	}
	#first{
		column-count: 1;
	}
	#grade{
		text-align:left;
		margin-left: auto;
		margin-right: auto;
	}
	
	#print{
		display: none;
	}
	
	}
	
	#sett{
		border: 3px solid;
   		border-style: double;
    	margin-left: 3%;
    	margin-right: 3%;
    	margin: 3%;

    	}

    
    .logo{
    	background-image: url(resources/img/logo.png);
    	background-size: 37%;
    	background-repeat: no-repeat;
    	background-position: center;
    	webkit-print-color-adjust:exact;
    	
    
    }
 
	.multi{
		column-count: 2;
		column-rule: 1px solid;
		column-rule-style: solid;
		margin-top:15%;
		margin-left:5%;
		margin-right:5%;
		margin-bottom:10%;
		border: 2px solid;
   		padding: 2%;
   		background: rgba(256,256,256,0.4);
   		webkit-print-color-adjust:exact;
	}
	
	
	#sInfoTa{
		
		position: absolute;
		margin-right: 3%;
		margin-left: 3%;
		left: -27px;
		
	}
	td.sInfo{
		width:200px;
		text-align: right;
	}
	td.sInfo2{
		width:200px;
		text-align: left;
	}
	#title{
		font-size: 32px;
		margin: 3%;
	}
	#first{
		column-count: 1;
	}
	#grade{
		text-align:left;
		margin-left: auto;
		margin-right: auto;
	}
	
	#print{
		float:right;
		background-color: navy;
		color: white;
	}
	

</style>

</head>
<body>
	<button type="submit" id="print" onclick="printArea();">PRINT</button>
<br><br>
<div id="sett">
	<div id="first">
	<center>
	<div id="title">
	成績証明書
	
	</div>
	</center>
	
	
	<table id="sInfoTa">
	<tr>
	<td class="sInfo">名前:</td>
	<td class="sInfo2">${sInfo.NAME}</td>
	<td class="sInfo">生年月日:</td>
	<td class="sInfo2">${sInfo.BIRTHDATE}</td>
	</tr>
	<tr>
	<td class="sInfo">学籍番号:</td>
	<td class="sInfo2">${sInfo.SREGINUM}</td>
	<td class="sInfo">専攻:</td>
	<td class="sInfo2">${sInfo.MNAME}</td>
	</tr>
	<tr>
	<td class="sInfo">学籍状態:</td>
	<td class="sInfo2">${sInfo.STATUS}</td>
	<td class="sInfo"></td>
	<td class="sInfo2"></td>
	</tr>
	</table>
	
	
	</div>
	<div class="logo">
	<div class="multi">
	<table id="grade">
	<tr>
	<td class="name">科目名</td>
	<td class="credit">単位</td>
	<td class="score">成績</td>
	</tr>
	
	<c:forEach var="item" items="${tInfo}"  varStatus="status">
	<c:if test="${status.index==0}">
	<tr>
		<td colspan="3" style="text-align: center;">${item.year}&nbsp;${item.semester}</td>
	</tr>
	</c:if>
	<c:if test="${status.index!=0}">
		
		<c:if test="${tInfo[status.index].year ne tInfo[status.index-1].year}">
			<tr>
				<td colspan="3" style="text-align: center;">${item.year}&nbsp;${item.semester}</td>
			</tr>
		</c:if>
		
		<c:if test="${tInfo[status.index].year eq tInfo[status.index-1].year}">
			<c:if test="${tInfo[status.index].semester ne tInfo[status.index-1].semester}">
				<tr>
				<td colspan="3" style="text-align: center;">${item.year}&nbsp;${item.semester}</td>
			</tr>
			</c:if>
		</c:if>
	
	</c:if>
	
	
	
	<tr>
		<td>${item.name}</td>
		<td>${item.credit}</td>
		<td>${item.grade}</td>
	</tr>
	
	</c:forEach>
	</table>

	</div>
	</div>
	</div>
<script type="text/javascript">
	function printArea(printThis){
	
	window.print();
	
}
</script>
</body>
</html>