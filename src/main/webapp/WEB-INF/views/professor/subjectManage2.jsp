<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<head>

  <!-- 1100ｘ728 -->
  <title>受講講義</title>
  <!-- Jquery -->
  <script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>
 
  <!-- Bootstrap css -->
  <link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">
  <!-- font -->
  <link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">

  <link href="/resources/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
  <link href="/resources/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
  <link href="/resources/vendor/font-awesome-4.7/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
  <link href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/css/resume.css" />" rel="stylesheet" type="text/css">


  <!-- Vendor CSS *-->
  <link href="/resources/vendor/select2/select2.min.css" rel="stylesheet" media="all">
  <link href="/resources/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

  <!-- Main CSS *-->
  <link href="/resources/css/consult.css" rel="stylesheet" media="all">

  <script type="text/javascript" src="resources/js/map.js"></script>
  <script type="text/javascript" src="resources/js/stringBuffer.js"></script>

<!-- 미세 커스텀 조정 -->
<link href="<c:url value="/resources/css/boardCss.css" />" rel="stylesheet" type="text/css">


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
         .dragAndDropDiv {
             border: 2px dashed #92AAB0;
             width: 770px;
             height: 90px;
             color: #92AAB0;
             text-align: center;
             vertical-align: middle;
             padding: 10px 0px 10px 10px;
             font-size:150%;
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
</head>

<body style="padding-left: 0px;">
	  <div class="container-fluid">
    <header>
      <div class="d-none d-lg-block" id="fix-titleC">
        <img id="logoCen" src="<c:url value="/resources/img/logo.png" />">
      </div>
    </header>
    <div id="t1"></div>
	    <div class="row">
      <div class="col-md-10 offset-md-1" id="hiddenright">
                    <h1>講義管理</h1>
              <hr style="width: 95%;">
                <h4>自分が担当している講義の管理と新たに講義を解説することができます</h4>
                <br>
        <div class="table-responsive" style="overflow: hidden; height: 555px;">
          <table class="table table-striped">
            <tbody class = "table table-striped2 tS2">
              <tr>
                <td class="tdT">講義番号</td>
                <td style="width: 30%"><input type="text" value="${detail.COURSENUM}" id="coursenum"  disabled="disabled" style="padding-left: 30px;"></td>
                <td class="tdT">講座名</td>
                <td style="width: 30%"><input type="text" value="${detail.TITLE}" id="title"  style="padding-left: 26px;"></td>
              </tr>
              <tr>
                <td class="tdT">受講可能日</td>
                <td style="width: 30%">
                  <div class="input-group" style="margin-bottom: 0px; height: 37px; border: none;">
                    <label class="label">(初め)</label> 
                    <input class="input--style-1 js-single-datepicker" type="text" name="coundate" placeholder="dd/mm/yyyy" data-drop="1" id="startdate" style="padding : 0px;" value ="${detail.STARTDATE}">
                    <div class="dropdown-datepicker" id="dropdown-datepicker1"></div>
                  </div>
                </td>
                <td class="tdT">受講可能日</td>
                <td style="width: 30%">
                  <div class="input-group" style="margin-bottom: 0px; height: 37px; border: none;">
                    <label class="label">(終り)</label> 
                    <input class="input--style-1 js-single-datepicker" type="text" name="enddate" placeholder="dd/mm/yyyy" data-drop="1" id="enddate" style="padding : 0px;" value ="${detail.ENDDATE}">
                    <div class="dropdown-datepicker" id="dropdown-datepicker1"></div>
                  </div>                        
                </td>
              </tr>
              <tr>
                <td class="tdT">映像</td>
                <td>
                <div id="fileUpload" class="dragAndDropDiv">
						  ファイルを<br>引き落とす
						   </div>
                  </td>
                  <td class="tdT">映像確認</td>
                  <td>
          			<div id='fileTable' style="width: 100%; height: 100%;">	</div>
                  </td>
                </tr>
              <tr>
                <td class="tdT">映像形式</td>
                <td style="width: 30%" id="Movieform">
                </td>
                <td class="tdT" id="duration">レコーダー時間</td>
                <td style="width: 30%" id="kt1">
                </td>
              </tr>
              </tbody>
              <tfoot>
              	<tr>
              		<td colspan="4" style="text-align: right"></td>
              	</tr>
              </tfoot>
            </table>
      <input type="hidden" name="courseSeq" id="courseSeq" value="${detail.COURSESEQ}">
      	<div id ="btnControll">
     	 	<button type="button" id="btn-duration">確認</button>
	      </div>
          </div>
          </div>
    </div>
  </div>
 <footer>
  <div style="position: relative; height: 61px; background-color: rgb(22, 56, 93);">
 	<button class="btn-lg bC" style="right: 15%;" type="button" id="btnExit">EXIT</button>
 </div>
</footer>

<script type="text/javascript">
//파일
var fd = new FormData();
var fd1 = new FormData();
var courseSeq;
var contents;
var ORG_NAME;
var FILE_NAME;

function submitFile(){
	alert($('#kt1').html());
		fd1.append('title',$('#title').val());
		fd1.append('startdate',$('#startdate').val());
		fd1.append('enddate',$('#enddate').val());
		fd1.append('courseSeq',courseSeq);
		fd1.append('ORG_NAME',ORG_NAME);
		fd1.append('FILE_NAME',FILE_NAME);
		fd1.append('ATIME',$('#kt1').html());
		sendFileToServer();
}

var sendFileToServer = function(){
	$.ajax({
		type : "post",
		url : "smFileUpload", //Upload URL
		data : fd1,
		contentType : false,
		processData : false,
		cache : false,
		success : function(data) {
			if (data) {
				alert("登録できました。");
				self.close();
			} else {
				alert("又、やり直してください。");
			}
		}
	});
}

function smGetSrc() {
	$.ajax({
		type : "post",
		url : "smGetSrc", //Upload URL
		data : fd,
		contentType : false,
		processData : false,
		cache : false,
		success : function(data) {
			ORG_NAME = data.ORG_NAME; 
			FILE_NAME = data.FILE_NAME;
			var contes = "<video hidden='hidden' id='test' src='" + FILE_NAME + "' autoplay=''></video>";
			$("#t1").html(contes);
			$('#btn-duration').on('click',check);
		}
	});
}

function check(){
	var vid = document.getElementById('test');
	var k = String(vid.duration);
	var strArray=k.split('.');

	var result = "";
	if (strArray.length == 4) {
		result = strArray[0]　+ ":" + strArray[1] + ":" + strArray[2];		
	} else if(strArray.length ==3){
		result = "00:"+ strArray[0] + ":" + strArray[1];	
	} else if(strArray.length == 2){
		result = "00:"+ "00:"+ strArray[0];
	}
	$('#kt1').html(result);
	$('#btnControll').html("");
	$('#btnControll').html(' <button type="button" onclick="submitFile()">登録</button>');	
}

function delFile(e) {
	//선택한 창의 아이디가 파일의 form name이므로 아이디를 받아온다.
	var formName = e.id;
	//form에서 데이터를 삭제한다.
	fd.delete(formName);
	//맵에서도 올린 파일의 정보를 삭제한다.
	
	// tr을 삭제하기 위해
	$(e).closest('table').remove();
	$('#Movieform').html("");
}


$(document).ready(function(){
	
	courseSeq = $('#courseSeq').val();
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
     
    function handleFileUpload(files) {
    	var megaByte = 1024*1024;
		for (var i = 0; i < files.length; i++) {
			fd.append(files[i].name, files[i]);
			var na1 = "";
			var na = files[i].name.split('.')[1];
			if (!(na == 'aac' || na == 'mp4'|| na == 'f4v' || na == 'm4v' || na == 'mov' || na == 'mp3' || na == 'mpeg' || na == 'ogv' || na == 'ogg' || na == 'oga' || na == 'vorbis' || na == 'webm' || na == 'f4a' || na == 'm3u8' || na == 'm3u' || na == 'hls')) {
				na1 += "<span style = 'color : red'>";
				na1 += na + "(支援しない拡張子)";
				na1 += "</span>";
				$('#Movieform').html(na1);
			} else {
				$('#Movieform').html(na);
			}
			
			// 파일 이름과 정보를 추가해준다.
			var tag = createFile(files[i].name, files[i].size);
				$('#fileTable').append(tag);
	 			$('#btn-duration').on('click',check);
				smGetSrc();
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
					if(name.length > 5){
						this.name = this.name.substr(0,5)+"...";
					}
					return this;
				},
				tag : function() {
					var tag = new StringBuffer();
					tag.append('<table style="width:100%;">');
					tag.append('<tr style="border : none;">');
					tag.append('<td style="border : none; width:60%; padding:0;">'+this.name+'</td>');					
					tag.append('<td style="border : none; width:40%">'+this.size+'</td>');
					tag.append('</tr>');
					tag.append('<tr>');
					tag.append("<td style='border : none;'><button id='btn-duration' style='width:90%;'>アップロード</button></td>");
					tag.append("<td style='border : none;'><button style='width:90%;' id='"+this.name+"' onclick='delFile(this)'>取り消す</button></td>");
					tag.append('</tr>');
					tag.append('</table>');
					return tag.toString();
				}
		}
		return file.format().tag();
	} 
	//업로드 할 파일을 제거할 때 수행되는 함수
  });
</script>
 <!-- Vendor JS-->
  <script src="/resources/vendor/select2/select2.min.js"></script>
  <script src="/resources/vendor/jquery-validate/jquery.validate.min.js"></script>
  <script src="/resources/vendor/datepicker/moment.min.js"></script>
  <script src="/resources/vendor/datepicker/daterangepicker.js"></script>

  <!-- Custom scripts for this template -->
  <script  src="<c:url value="/resources/js/resume.min.js"/>"></script>

  <!-- Main JS-->
  <script src="/resources/js/global.js"></script>

</body>
</html>