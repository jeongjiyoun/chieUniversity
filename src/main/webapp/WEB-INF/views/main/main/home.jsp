<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Full page scroll</title>

  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/full-page-scroll.css" />">
  <link href='https://fonts.googleapis.com/earlyaccess/notosansjp.css'
  rel='stylesheet' type='text/css'>
  <script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>

</head>
<body>

  <header class ="header small">
    <div class="navigation">
      <ol>
        <li><a href="introduce"> 大学紹介 </a> </li>
        <li><a class="drop" href="applyInfo"> 入学案内 </a></li>

        <a href="goHome"><img src="<c:url value="/resources/img/logo.png" />" width="6%" height="6%"></a>

        <li><a href="department"> 学部紹介 </a> </li>
        <li><a href="goTotNotice"> お知らせ </a> </li> 
      	<li>
      	<c:if test="${sessionScope.loginId==null}">
      	<a href="login" style="position : absolute; left :90%; top:6px;">login<img src="<c:url value="/resources/img/lock.png"/>" width="4%" height="4%" style="width:61px;"></a>
      	</c:if>
   		<c:if test="${sessionScope.loginId!=null}">
   		<a href="logout" style="position : absolute; left :88%; top:6px;">logout<img src="<c:url value="/resources/img/lock.png"/>" width="4%" height="4%" style="width:61px;"></a>
   		</c:if>
      </ol>
    	
    
    </div>
  </header>

  <div id="main" class="scroll-container">
    <section class="section1">
      <div class="section1 baImg">
        <img src='<c:url value="resources/images/home/main0.jpg"/>'
        style="height: 100%">
      </div>

			<c:if test="${sessionScope.userType == 'S'}">
				<a class="btn btn-large btn-red" href="MyPage"
					style="position: absolute; bottom: 3%; left: 3%;"> ▶ &nbsp;
					StudentMyPage</a>
			</c:if>
			<c:if test="${sessionScope.userType == 'P'}">
				<a class="btn btn-large btn-red" href="MyPage"
					style="position: absolute; bottom: 3%; left: 3%;"> ▶ &nbsp;
					ProfessorMyPage </a>
			</c:if>

			<div class="text-container">
        <div class="container2 container2--textT" id="title1">
          <span></span>
          <p id="titleText1">I am &nbsp &nbsp &nbsp &nbsp &nbsp Chie!</p>
          <span></span>
        </div>

        <script type="text/javascript">
          $(function() {
            $("#titleText1").on("mouseover", setting);
          });

          function setting() {
            setTimeout(function() {
              $("#titleText1").attr('style',
                'font-size:11.5rem; text-shadow:none;');
              $("#title1").removeClass("container2--textT");
            }, 390);
          }
        </script>
      </div>
      <div style="position: fixed; color: white; z-index: 1234; left: 44%; font-size: 3rem; top: 84%; line-height: 27px;">
        <a href="#1">SCROLL<span style="font-size: 2rem;"><br>∨<br>∨</span></a>
      </div>

    </section>

    <section class="section2">
      <div style="width: 100%; height: 100%;">
        <div style="width: 30%; height: 100%; float: left;">
          <div class="sC1title">
            パッション
          </div>
          <div style="width: 100%; height: 27%; font-size: 3.2rem; text-align: left; position: relative; color: #F7FFF7; transform: none; top: 17%; margin-left: 12%;">
            年齢に関わらず
            <br>習いへの情熱、<br><span class="sec1T" style="  padding: 4px;  float: left;">知恵</span>で叶う
          </div>
        </div>
        <div class="w7h10fl">
          <img class="sec2" src="<c:url value="resources/images/home/main1.jpg"/>">
          <a class="btn btn-large btn-red" href="applicant" style="position: absolute; bottom: 3%; right: 3%;">
          ▶ &nbsp;　入学申し込み</a>
        </div>
      </div>
    </section>


    <section class="section3">
      <div class="secCon">
        <div class="w7h10fl">
          <img class="sec2" src="<c:url value="resources/images/home/main2.jpg"/>">
          <a class="btn btn-large btn-brown" href="curriculum" style="position: absolute; bottom: 3%; left: 3%;">
          ▶ &nbsp　授業の進め方</a>
        </div>
        <div style="width: 30%; height: 100%; float: left;">
          <div class="sC1title sC1titleR" style="color : #241203">
            チャンス
          </div>
          <div class="contentSec">
            状況に関わらず
            <br>受講生の貴方に<br><span class="sec1T" style="float: left; padding: 4px;">知恵</span>が伺う
          </div>
        </div>
      </div>
    </section>


    <section class="section4">
      <div style="width: 100%; height: 100%;">
        <div style="width: 30%; height: 100%; float: left;">
          <div class="sC1title" style="color: #44291e">
           コミュニティ
         </div>
         <div class="contentSec">
          独学より一緒に!
          <br>コミュニティを<br><span class="sec1T" style="FLOAT: left; color: #44291e;">知恵</span>に任せる。
        </div>
      </div>
      <div class="w7h10fl">
        <img id="sec4" src="<c:url value="resources/images/home/main3.jpg"/>">
        <a class="btn btn-large btn-ivory" href="introduce" style="position: absolute; bottom: 3%; right: 3%;">
        ▶ &nbsp　大学の魅力</a>
      </div>
    </div>
  </section>
  
  
  <section class="section5">
    <div style="width: 100%; height: 100%;">
      <div style="width: 70%; height: 100%; float: left">
        <img class="sec2" src="<c:url value="resources/images/home/main4.jpg"/>">
        <a class="btn btn-large btn-woody" href="department" style="position: absolute; bottom: 3%; left: 3%;">
        ▶ &nbsp　学部紹介</a>
        
      </div>
      <div style="width: 30%; height: 100%; float: left;">
       <div class="sC1title sC1titleR" style="color : #241203">
        ノレッジ
      </div>
      <div class="contentSec">
        実践的な学び
        <br>実務重心の講義<br><span class="sec1T" style="   padding: 4px; float: left;">知恵</span>でできる
      </div>
    </div>
  </div>
</section>
</div>

<script src="<c:url value="/resources/jquery-3.3.1.min.js" />"></script>
<script src="<c:url value="/resources/js/full-page-scroll.js"/>"></script>
<script type="text/javascript">
  new fullScroll({
    displayDots : true,
    dotsPosition : 'left',
    animateTime : 0.7,
    animateFunction : 'ease'
  });

    var speed = 700; // 스크롤 스피드 수치로 사용할 변수 

    //로직
    function scrolling(obj) {
      if (!obj) { // 예외처리, 현재는 기능적으로 필요한 부분은 아님, 관례적 사용
        $('html, body').animate({
          scrollTop : 0
        }, speed);
      } else {
        var posTop = $(obj).offset().top - 80; // posTop = 매개변수로 들어온 컨텐츠 obj 의 offset().top - 네비게이션 높이
        $('html, body').animate({
          scrollTop : posTop
        }, speed) // body의 스크롤이동 : posTop
      }
    };

    $("ul li a").click(function() { // 네비게이션 클릭시
      var direction = $(this).attr("href"); // direction = 클릭한 요소의 href 속성
      scrolling(direction); // direction 을 인자로 함수 실행
      return false; // 본래 이벤트 방지 
    });
  </script>

</body>
</html>