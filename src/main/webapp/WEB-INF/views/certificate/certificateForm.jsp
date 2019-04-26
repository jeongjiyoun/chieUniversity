<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${cInfo.STATUS}証明書</title>
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
<style type="text/css">
	@page {

size: A4;

margin: 0;

}


	.logo{
		background-image: url(resources/img/logo.png);
    	background-size: 40%;
    	background-repeat: no-repeat;
    	background-position: center;
	}
	#certiName{
		margin: 5%;
    	font-size: 35px;
	}
	tr{
		margin:3%;
	}
	td{
		text-align:right;
	}
	table{
		border-spacing: 0 30px;
		margin-right: 5%;
		
	}
	#logo{
	}
	#border{
		margin-top: 5%;
		margin-bottom: 5%;
		margin-left: 10%;
		margin-right: 10%;
		padding-top: 3%;
		padding-bottom: 3%;
		border: 6px solid;
		border-style:double;
		background: rgba(256,256,256,0.5);
	}
	#date{
		font-size: 19px;
	}
	
	@page a4sheet {
		size:21.ocm 29.7cm
	}
	.a4{
		page:a4sheet;
		page-break-after:always
	}
</style>
</head>
<body>
<div class="logo" id="logo">
<div id="border">
<div id="certiName">
	<center>
	${cInfo.STATUS}証明書
	</center>
</div>
<div id="certiContents">
	<center>
	<table>
		<tr>
			<td>名前:　</td>
			<td>${cInfo.NAME}</td>
		</tr>
		<tr>
			<td>生年月日:　</td>
			<td>${cInfo.BIRTHDATE}</td>
		</tr>
		<tr>
			<td>専攻:　</td>
			<td>${cInfo.MNAME}</td>
		</tr>
		<c:if test="${cInfo.SREGINUM!=null}">
		<tr>
			<td>学籍番号:　</td>
			<td>${cInfo.SREGINUM}</td>
		</tr>
		</c:if>
		
		<c:if test="${cInfo.STARTDATE!=null}">
		<tr>
			<td>休学期間:　</td>
			<td>${cInfo.STARTDATE} ~ ${cInfo.ENDDATE}</td>
		</tr>
		</c:if>
		
		<c:if test="${cInfo.GRADATE!=null}">
		<tr>
			<td>入学日:　</td>
			<td>${cInfo.ENTERDATE}</td>
		</tr>
		<tr>
			<td>卒業日:　</td>
			<td>${cInfo.GRADATE}</td>
		</tr>
		<tr>
			<td>学位:　</td>
			<td>学士</td>
		</tr>
		</c:if>
		<tr>
			<td>${cInfo.STATUS}証書番号: </td>
			<td>abc001</td>
		</tr>
		
	</table>
	</center>
	<center>
	<br><br>
	<div id="date">
	上記の事実を証明する
	<br><br>
	
	<center>
		${date}
	</center>
	</div>
	<br>
	
	</center>
</div>
</div>
</div>

<canvas id="canvasFC" width="350" height="260"></canvas>
<!-- .logo -->

<script type="text/javascript">
const canvasEl = document.getElementById('logo');
const width = 849;
const height = 633;

$(function(){
	capture();
})

function capture() {
    const context = canvasEl.getContext('2d');
    context.drawImage(videoEl, 0, 0, width, height);
    submitImage(canvasEl.toDataURL('image/png',1.0));
}


function submitImage(imageData) {
    $.ajax({
     url : 'uploadCertifi',
     data : { "strImg" : imageData,
	      	  "certificateName" : $("#certificateName").val(),
     },
     type : 'POST',
     success : function(result) {
       timestart = result;
     }
   });
    type = null;
  }

</script>
</body>
</html>