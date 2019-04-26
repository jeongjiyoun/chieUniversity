<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>



<head>
   
   <title>Write Notice</title>

<script src="resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/map.js"></script>
<script type="text/javascript" src="resources/js/stringBuffer.js"></script>

<script src="resources/ckeditor/ckeditor.js"></script>

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

   textarea {

   }

   #title {
      width: 70%;
   }
</style>


<script type="text/javascript">
        	//파일
        	var fd = new FormData();
        	var contents;
       		
        	
        	
        	function submitFile(){
        			contents = CKEDITOR.instances["contents"].getData();
        			fd.append('title',$('#title').val());
        			fd.append('contents',contents);
        			
        			
        				sendFileToServer();
        			
        	}
        
        	var sendFileToServer = function() {
        		$.ajax({
        			type : "post",
        			url : "noticeUpload", //Upload URL
        			data : fd,
        			contentType : false,
        			processData : false,
        			cache : false,
        			success : function(data) {
        				if(data==null) {
        					alert('실패');
        					
        					
        				}else {
        					alert('성공');
        					location.href='./showNotice?lnSeq='+data;
        				}
        			}
        		});
        	}
        	
        	
        	function delFile(e) {
        		//선택한 창의 아이디가 파일의 form name이므로 아이디를 받아온다.
        		var formName = e.id;
        		//form에서 데이터를 삭제한다.
        		fd.delete(formName);
        		//맵에서도 올린 파일의 정보를 삭제한다.
        		
        		// tr을 삭제하기 위해
        		$(e).parents('tr').remove();
        		alert('삭제 완료!');		
        	}
        	
        	
        	
            $(document).ready(function(){
            	
            	
                var objDragAndDrop = $(".dragAndDropDiv");
                 
                $(document).on("dragenter",".dragAndDropDiv",function(e){
                    e.stopPropagation();
                    e.preventDefault();
                    $(this).css('border', '2px solid #0B85A1');
                });
                $(document).on("dragover",".dragAndDropDiv",function(e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                $(document).on("drop",".dragAndDropDiv",function(e){
                     
                    $(this).css('border', '2px dotted #0B85A1');
                    e.preventDefault();
                    var files = e.originalEvent.dataTransfer.files;
                 
                    handleFileUpload(files);
                });
                 
                $(document).on('dragenter', function (e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                $(document).on('dragover', function (e){
                  e.stopPropagation();
                  e.preventDefault();
                  objDragAndDrop.css('border', '2px dotted #0B85A1');
                });
                $(document).on('drop', function (e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                 
                function handleFileUpload(files)
                {
                	var megaByte = 1024*1024;
            		for (var i = 0; i < files.length; i++) {
            			fd.append(files[i].name, files[i]);
        				
        				
        				// 파일 이름과 정보를 추가해준다.
        				var tag = createFile(files[i].name, files[i].size);
        				$('#fileTable').append(tag);
            			}
            	    }
                
                 
                function createFile(fileName, fileSize) {
            		var file = {
            				name : fileName,
            				size : fileSize,
            				format : function() {
            					var sizeKB = this.size / 1024;
            					if (parseInt(sizeKB) > 1024) {
            						var sizeMB = sizeKB / 1024;
            						this.size = sizeMB.toFixed(2) + " MB";
            					} else {
            						this.size = sizeKB.toFixed(2) + " KB";
            					}
            					//파일이름이 너무 길면 화면에 표시해주는 이름을 변경해준다.
            					if(name.length > 70){
            						this.name = this.name.substr(0,68)+"...";
            					}
            					return this;
            				},
            				tag : function() {
            					var tag = new StringBuffer();
            					tag.append('<tr>');
            					tag.append('<td>'+this.name+'</td>');
            					tag.append('<td>'+this.size+'</td>');
            					tag.append("<td><button class='canclebut' id='"+this.name+"' onclick='delFile(e)'>cancle</button></td>");
            					tag.append('</tr>');
            					return tag.toString();					
            				}
            		}
            		return file.format().tag();
            	}
            	//업로드 할 파일을 제거할 때 수행되는 함수
              });
        </script>
        <style>
        	.afont{
        		color: #92AAB0;
        	}
        	#tabFileName{
				width: 470px;
				text-align: left;
			}
			
			#tabFileSize{
				width: 70px;
			}
			
			#tabFileDel{
				width: 50px;
			}
			table , tr , td{
				border: 1px solid black;
				border-collapse: collapse;
				width: 500px;
				
			}
            .dragAndDropDiv {
                border: 2px dashed #92AAB0;
                width: 770px;
                height: 90px;
                color: #92AAB0;
                text-align: center;
                vertical-align: middle;
                padding: 10px 0px 10px 10px;
                font-size:200%;
                display: table-cell;
            }
            
              

            .filename{
                display:inline-block;
                vertical-align:top;
                width:60%;
            }
            .filesize{
                display:inline-block;
                vertical-align:top;
                color:#30693D;
                width:15%;
                margin-left:10px;
                margin-right:5px;
            }
            button.canclebut{
            	float:inherit;
            	width:40%;
            	padding:2px;
            	font-size: 15px;
            }
            .abort{
                background-color:#A8352F;
                -moz-border-radius:4px;
                -webkit-border-radius:4px;
                border-radius:4px;display:inline-block;
                color:#fff;
                font-family:arial;font-size:13px;font-weight:normal;
                padding:4px 15px;
                cursor:pointer;
                vertical-align:top
            }
            
        </style>

<meta charset="utf-8">
<meta name="viewport"
content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- font -->
<link
href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700"
rel="stylesheet">
<link
href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i"
rel="stylesheet">

<link
href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>"
rel="stylesheet">
<%-- <link href="<c:url value="/resources/css/course.css"/>" rel="stylesheet"> --%>
<link href="<c:url value="/resources/css/resume.css" />"
rel="stylesheet" type="text/css">

<link
href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>"
rel="stylesheet">


         
        
<!-- Title Page-->
<title>お知らせ</title>

<!-- Icons font CSS *-->
<link
href="/resources/vendor/mdi-font/css/material-design-iconic-font.min.css"
rel="stylesheet" media="all">
<link href="/resources/vendor/font-awesome-4.7/css/font-awesome.min.css"
rel="stylesheet" media="all">

<!-- Font special for pages-->
<link
href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
rel="stylesheet">
<link
href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
rel="stylesheet">

<!-- Vendor CSS *-->
<link href="/resources/vendor/select2/select2.min.css" rel="stylesheet"
media="all">
<link href="/resources/vendor/datepicker/daterangepicker.css"
rel="stylesheet" media="all">

<!-- <!-- Main CSS *-->
<!-- <link href="/resources/css/consult.css" rel="stylesheet" media="all"> -->

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
               <a href="#"> <img id="schoolLogo"
                  src="<c:url value="/resources/img/logo.png" />" alt=""> <span
                  id="sideLogo"> 知恵通信大学 </span>
               </a>
            </div>
         </div>
         <div id="fix-text">お知らせ</div>
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
         <img class="img-fluid img-profile rounded-circle mx-auto mb-2"
         id="hiddenImg" src="<c:url value="/resources/img/profile.jpg" />">
         <br> <span> チョンチギョン </span>
      </div>

      <div class="collapse navbar-collapse" id="navbarSupportedContent"
      style="font-family: Saira Extra Condensed;">
      <ul class="navbar-nav">
         <li class="nav-item"><a class="nav-link js-scroll-trigger"
            href="goSubjectHome">HOME</a></li>
            <li class="nav-item"><a class="nav-link js-scroll-trigger"
               href="subjectNotice">お知らせ</a></li>
               <li class="nav-item"><a class="nav-link js-scroll-trigger"
                  href="QnA">QnA</a></li>
                  <li class="nav-item"><a class="nav-link js-scroll-trigger"
                     href="assignment">宿題</a></li>
                     <li class="nav-item"><a class="nav-link js-scroll-trigger"
                        href="consult">試験</a></li>
                     </ul>
                  </div>
               </nav>
               <div class="col-sm-3" id="hiddenleft"></div>
               <div class="col-sm-9" id="hiddenright">
                  <br>
                  <div id="conte">
                     <div style="min-height: 600px;">
                        <!-- 내용 들어가는 부분 -->

				
				<%--                         <c:if test="${sessionScope.userType == 'P'}"> --%>
                        <section id="SubjectNotice">
                           <h2>書く</h2>
                           <br>
                           <div id="noticeWriteS">
                             
                             
                              <form action="submitNotice" method="post">
                              
                                 TITLE:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="title" id="title"><br><br>
                                 
             				
                              <textarea name="contents" id="contents" rows="10" cols="103">
                                ${notice.contents}
                              </textarea>
                              <br>
                               
						   <div id="fileUpload" class="dragAndDropDiv">
						   Drag & Drop Files Here
						   </div>
						   <br>
						   
						   		<table id='fileTable'>
						   			<!-- <tr>
							            <td id='tabFileName'>파일명</td>
							            <td id='tabFileSize'>사이즈</td>
							            <td id='tabFileDel'>삭제 </td>
						   			</tr> -->
						   			
						   		</table>
							
							<br>
                              <script>
                              // Replace the <textarea id="editor1"> with a CKEditor
                              // instance, using default configuration.
                              CKEDITOR.replace('contents');
                           </script>
                           
                           <button type="button" onclick="submitFile()">Submit</button>
                        
                        </form>
                     </div>
                  </section>
				<%-- </c:if> --%>
         <br>
      </div>
   </div>
</div>
</body>
</html>