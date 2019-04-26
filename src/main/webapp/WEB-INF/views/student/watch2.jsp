<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!doctype html>
<html>
<head>

<!-- Bootstrap css -->
<link
	href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>"
	rel="stylesheet">

<!-- Jquery -->
<script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>

<!-- font -->
<link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css"
	rel="stylesheet">

<link rel="stylesheet" href="<c:url value="resources/css/watch.css"/>">

<!-- 동영상 재생 jwplayer 연결 -->
<script type="text/javascript"
	src="https://cdn.jwplayer.com/libraries/hxrulIIy.js"
	jwplayer.key="Ejt3tNq0WWpEuB2xqE5vgjV1"></script>

<title>${movie.TITLE}</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<meta content="width=device-width, initial-scale=1, user-scalable=no"
	name="viewport">
<script src="/resources/js/red5/lib/red5pro/red5pro-utils.js"></script>
<script src="//webrtchacks.github.io/adapter/adapter-latest.js"></script>
<script src="//webrtchacks.github.io/adapter/adapter-latest.js"></script>
<script src="/resources/js/red5/lib/screenfull.min.js"></script>

<script src="/resources//\js/red5/lib/red5pro/testbed-config.js"></script>
<script src="/resources/js/red5/lib/red5pro/reachability.js"></script>

</head>
<body>
	<input type="hidden" id="courseSeq" value="${movie.COURSESEQ}">
	<header>
		<div class="margin10" style="margin: 0px;">
			<img class="Slogo" src="/resources/img/logo.png"> <span>知恵通信大学</span>
			<span
				style="position: absolute; right: 3%; font-size: 1.38rem; text-align: right">${movie.TITLE}<br>${movie.PNAME}</span>
		</div>
	</header>
	<div class="box-padding-big white-bg">
		<div class="con1" style="margin-left: 7px;">
			<div class="row">
				<div class="col-md-9">

					<div id="app">
						<span id="stream-title" hidden="hidden"></span>
						<script
							src="/resources/js/red5/lib/red5pro/subscription-status.js"></script>
						<div class="centered">
							<video id="red5pro-subscriber" autoplay playsinline
								class="red5pro-media red5pro-media-background" width="1146.75"
								height="600">
							</video>
						</div>
					</div>
					<div id="checkMessage"
						style="min-height: 100px; bottom: 7px; right: 5px; background-color: #06213F;">
					</div>
				</div>
				<div class="col-md-3">
					<div
						style="width: 100%; height: 593px; margin-left: 10px; margin-right: 5px;">
						<div style="width: 96.4%;">
							<iframe src="resources/img/pdf/${movie.FILECONTENTS}"
								style="width: 101%; height: 593px; margin-left: -4px;">
							</iframe>
						</div>
						<div id = "btnExit"
							style="min-height: 100px; height: 10%; right: 5px; background-color: #06213F; position: relative; margin-top: 7px; width: 97.5%;">
							<p
								style="top: 100%; transform: translateY(70%); text-align: center; color: white; font-size: 1.8em;">受講終了</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/resources/js/red5/lib/es6/es6-promise.min.js"></script>
	<script src="/resources/js/red5/lib/es6/es6-bind.js"></script>
	<script src="/resources/js/red5/lib/es6/es6-array.js"></script>
	<script src="/resources/js/red5/lib/es6/es6-object-assign.js"></script>
	<script src="/resources/js/red5/lib/es6/es6-fetch.js"></script>
	<script src="/resources/js/red5/lib/red5pro/red5pro-sdk.min.js"></script>
	<script>
	
	   var exitTimer = 0;
	   var intervalTimer = 0;
	   var courseSeq = $("#courseSeq").val();
	   var timestart = '${timestart}';
	   var type = "first";
	
		$(function(){
			$("#btnExit").on("click",btnExit);
		})
		
    function btnExit(){
      checkWatch();
      alert("受講を終了します。");
      self.close();
    }

	    function checkWatch(){
	  	  $.ajax({
		       url : 'checkWatch',
		       data : {
		    	  	  "timestart" : timestart,
			      	  "courseseq" : courseSeq,
			     	  "type" : type
		       },
		       type : 'POST',
		       success : function(result) {
		    	   timestart = result;
		    	   return result;
		       }
		     });
	    }
		
		(function(window) {
			var configuration = (function() {
				var conf = sessionStorage.getItem('r5proTestBed');
				try {
					return JSON.parse(conf);
				} catch (e) {
					console
							.error('Could not read testbed configuration from sessionstorage: '
									+ e.message);
				}
				return {}
			})();

			if (configuration.verboseLogging) {
				window.publisherLog = function(message) {
					console.log('[Red5ProRTMPPublisher:SWF] - ' + message);
				};
				window.subscriberLog = function(message) {
					console.log('[Red5ProRTMPSubscriber:SWF] - ' + message);
				};
			}

			if (configuration.authentication.enabled) {
				var node = document.createElement('div');
				node.classList.add('hint-block', 'auth-alert');
				var note = document.createElement('span');
				note.innerHTML = '*<strong>Authentication is Enabled</strong>*';
				node.appendChild(note);
				node.appendChild(link);
				var testBody = document.getElementById('back-link-container').nextElementSibling;
				testBody.parentNode.insertBefore(node, testBody);
			}
		})(this);
	</script>
	<script src="/resources/js/red5/lib/red5pro/index2.js"></script>
</body>

</html>
