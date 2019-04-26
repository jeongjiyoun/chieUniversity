<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
  <meta content="width=device-width, initial-scale=1, user-scalable=no" name="viewport">
  <title>講義撮影</title>
  <!-- Jquery -->
  <script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>
 
  <!-- Bootstrap css -->
  <link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">
  <!-- font -->
  <link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">

  <!-- Main CSS *-->
  <link href="/resources/css/consult.css" rel="stylesheet" media="all">
  <!-- 미세 커스텀 조정 -->
  <link href="<c:url value="/resources/css/boardCss.css" />" rel="stylesheet" type="text/css">

  <script src="//webrtchacks.github.io/adapter/adapter-latest.js"></script>
  <script src="resources/js/red5/lib/screenfull.min.js"></script>
  <script src="resources/js/red5/lib/red5pro/testbed-config.js"></script>
  <script src="resources/js/red5/lib/red5pro/red5pro-utils.js"></script>
  <script src="resources/js/red5/lib/red5pro/reachability.js"></script>

</head>
<body style="padding-left: 0px;">
	  <div class="container-fluid">
    <header>
      <div class="d-none d-lg-block" id="fix-titleC" style="padding:6px;">
	      <span style="font-size: 3rem; margin-left: 30px; color: white;">講義撮影</span>
        <img id="logoCen" src="<c:url value="/resources/img/logo.png" />">
            <span class="input-group-btn pull-right"> <button class="btn-lg bC" style="margin-top : 15px; right: 13%;" id="btnExit">EXIT</button></span>
      </div>
    </header>
    <div id="t1"></div>
	    <div class="row">
      <div class="col-md-10 offset-md-1" style="margin-top: 4%;">
      <input type="hidden" name="courseSeq" id="courseSeq" value="${detail.COURSESEQ}">
  <div id="app">
    <span id="stream-title" hidden="hidden"></span>
      <p id="status-field" class="centered status-field" hidden="hidden"></p>
      <script src="resources/js/red5/lib/red5pro/publisher-status.js"></script>
      <div class="centered">
        <video id="red5pro-publisher" controls autoplay playsinline muted style="max-height: 700px;"></video>
      </div>
    </div>
    <script src="resources/js/red5/lib/es6/es6-promise.min.js"></script>
    <script src="resources/js/red5/lib/es6/es6-bind.js"></script>
    <script src="resources/js/red5/lib/es6/es6-array.js"></script>
    <script src="resources/js/red5/lib/es6/es6-object-assign.js"></script>
    <script src="resources/js/red5/lib/es6/es6-fetch.js"></script>
    <script src="resources/js/red5/lib/red5pro/red5pro-sdk.min.js"></script>

    <script>
    
    	$(function(){
    		$("#btnExit").on("click",exit);
    	})
    	
    	function exit(){
    		self.close();
    	}
      (function(window) {
        var configuration = (function () {
          var conf = sessionStorage.getItem('r5proTestBed');
          try {
            return JSON.parse(conf);
          }
          catch (e) {
            console.error('Could not read testbed configuration from sessionstorage: ' + e.message);
          }
          return {}
        })();
    
        if (configuration.authentication.enabled) {
          var node = document.createElement('div');
          node.classList.add('hint-block', 'auth-alert');
          var note = document.createElement('span');
          note.innerHTML = '*<strong>Authentication is Enabled</strong>*';
          node.appendChild(note);
          var testBody = document.getElementById('back-link-container').nextElementSibling;
          testBody.parentNode.insertBefore(node, testBody);
        }
    
      })(this);
    </script>
    <script src="/resources/js/red5/lib/red5pro/index.js"></script>

          </div>
          </div>
    </div>
</body>
</html>