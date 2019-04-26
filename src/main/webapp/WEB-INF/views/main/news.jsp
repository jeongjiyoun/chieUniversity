
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html lang="kr">

<head>
<meta charset="UTF-8">
<title>お知らせ</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/introduce.css" />">
<link href='https://fonts.googleapis.com/earlyaccess/notosansjp.css'
	rel='stylesheet' type='text/css'>
<script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>

<!-- bootstrap -->
<link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">

</head>
<body>

	<header class="header small">
		<div class="navigation">
			<ol>
				<li><a href="introduce"> 大学紹介 </a></li>
				<li><a class="drop" href="applyInfo"> 入学案内 </a></li>

				<a href="goHome"><img
					src="<c:url value="/resources/img/logo.png" />" width="6%"
					height="6%"></a>

				<li><a href="department"> 学部紹介 </a></li>
				<li><a href="goTotNotice"> お知らせ </a></li>
				<li><a href="login"
					style="position: absolute; left: 90%; top: 6px;">login<img
						src="<c:url value="/resources/img/lock.png"/>" width="4%"
						height="4%" style="width: 61px;"></a>
				</li>
			</ol>
		</div>
	</header>
	<div class="container-fluid">
	<div class="row" id="margin-del">
		<div class="col-sm-10 offset-sm-1" id="hiddenright">
		  <br><br><br><br>
  <br><br><br><br>
  <div class="contents-main">
					<!-- 내용 들어가는 부분 -->
					  <div class="haha"></div>
					  <p class="text1">NEWS</p>
					  		<button class="btn btn-sm" id="btn2017" data-value="2017" style="font-size: 0.5rem; margin: 0 auto; float: right; border: 1px solid rgb(22,56,93) ">> 2017年度</button>
					  		<button class="btn btn-sm" id="btn2018" data-value="2018" style="font-size: 0.5rem; margin: 0 auto;margin-right : 5px; float: right;border: 1px solid rgb(22,56,93) ">> 2018年度</button>
					  		<button class="btn btn-primary btn-sm" data-value="2019" id="btn2019" style="font-size: 0.5rem; margin: 0 auto;margin-right : 5px;  float: right ">> 2019年度</button>
						<div id="qTable">
							<table style="width: 100%; border-collapse: separate; border-spacing: 0 20px;">
								<thead>
								</thead>
								<tbody style="font-size: 1.25rem;">
								<c:if test="${newList!=null}">
									<c:forEach var="news" items="${newList}">
										<tr data-value="${news.NOTICESEQ}" style="height: 20px;" class="trhover">
											<td style="width: 20%;border-top: 1px solid #dfdfdf; padding-top: 15px;">${news.INDATE}</td>
											<td style="width: 80%;border-top: 1px solid #dfdfdf; padding-top: 15px;">${news.TITLE}</td>
										</tr>
									</c:forEach>
								</c:if>
								</tbody>
							</table>
						</div>
							<br>
						</div>
					<br>

				</div>
			</div>
		</div>
	<script>
		$(function(){
			$("tr").on("click",showNews);
			$("#btn2017").on("click",show);
			$("#btn2018").on("click",show);
			$("#btn2019").on("click",show);
		});
		
		function show(){
			var number = $(this).attr("data-value");
			 $.ajax({
		         url : 'getNews',
		         data : { 
		        	 "year" : number,
		        	 },
		         type : 'POST',
		         success : function(result) {
		        	 var cont = "";
						$.each(result,function(index,item){
						cont+="<tr>";
						cont+='<td style="width: 20%;border-top: 1px solid #dfdfdf; padding-top: 15px;">';
						cont+=item.INDATE;
						cont+='</td>';
						cont+='<td style="width: 80%;border-top: 1px solid #dfdfdf; padding-top: 15px;">'
						cont+=item.TITLE;
						cont+='</td>';
						cont+="</tr>";
						});
					$("tbody").html(cont);		
					$("tr").on("click",showNews);
					}
		         });
		}
		
		function showNews(){
			var post = $(this).attr("data-value");
			location.href="/newsDetail?post=" + post;
		}
	
	</script>
</body>

</html>