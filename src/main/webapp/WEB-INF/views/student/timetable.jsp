<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>受講講義</title>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

<link href="<c:url value="/resources/css/course.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/resume.css" />" rel="stylesheet" type="text/css">

<!-- bootstrap -->
<link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">

<!-- Jquery -->
<script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>

<!-- Font special for pages-->
<link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">

<!-- Main CSS *-->
<link href="<c:url value="/resources/css/consult.css" />" rel="stylesheet" media="all">

<!-- 미세 커스텀 조정 -->
<link href="<c:url value="/resources/css/boardCss.css" />" rel="stylesheet" type="text/css">
</head>

<body>

  <div class="container-fluid">

    
    <div class="row" id="margin-del">


    <div class="col-sm-1"></div>
    
   
		<table class="timetableTable1">
		<tbody style="border-right: 1px solid gray;">
		<tr><td style="border-bottom : 1px solid gray;">備考</td></tr>
		<tr><td>9:00</td></tr>
		<tr><td>9:30</td></tr>
		<tr><td>10:00</td></tr>
		<tr><td>10:30</td></tr>
		<tr><td>11:00</td></tr>
		<tr><td>11:30</td></tr>
		<tr><td>12:00</td></tr>
		<tr><td>12:30</td></tr>
		<tr><td>13:00</td></tr>
		<tr><td>13:30</td></tr>
		<tr><td>14:00</td></tr>
		<tr><td>14:30</td></tr>
		<tr><td>15:00</td></tr>
		<tr><td>15:30</td></tr>
		<tr><td>16:00</td></tr>
		<tr><td>16:30</td></tr>
		<tr><td>17:00</td></tr>
		<tr><td>17:30</td></tr>
		<tr><td>18:00</td></tr>
		<tr><td>18:30</td></tr>
		<tr><td>19:00</td></tr>
		<tr><td>19:30</td></tr>
		</tbody>
		</table>
		<table style="width:80%;">
			<thead>
				<tr>
				<td style="width: 16%; border-bottom : 1px solid gray;">月</td>
				<td style="width: 16%; border-bottom : 1px solid gray;">火</td>
				<td style="width: 16%; border-bottom : 1px solid gray;">水</td>
				<td style="width: 16%; border-bottom : 1px solid gray;">木</td>
				<td style="width: 16%; border-bottom : 1px solid gray;">金</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${timetable}" var="time1" begin = "0" step = "1" end ="22" varStatus="index">
				<tr>
					<c:forEach items="${time1}" var="time2"  begin = "0" step = "1" end ="4">
						<c:choose>
						<c:when test="${time2 != ' '}">
						<td style="width: 20%; background-color: skyblue;">${time2}</td>
						</c:when>
						<c:otherwise>
						<td style="width: 20%;">${time2}</td>						
						</c:otherwise>
						</c:choose>
					</c:forEach>		
				</tr>
				</c:forEach>
			</tbody>
		</table>
     
    
  </div>
</div>

<br>
<button id="back" onclick="tableExit();" style="width:10%;margin:0;">exit</button>

<br>
<br>
<script type="text/javascript">
function tableExit(){
	close();

}
</script>


	
	
</body>

</html>
