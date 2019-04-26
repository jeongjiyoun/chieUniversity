<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 	CSS 조정 -->

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>専攻紹介</title>
<!-- bootstrap -->
<link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">


  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/introduce.css" />">
  <link href='https://fonts.googleapis.com/earlyaccess/notosansjp.css' rel='stylesheet' type='text/css'>
  <script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>

</head>
<body style="overflow: auto">

  <header class ="header small">
    <div class="navigation">
      <ol>
        <li><a href="introduce"> 大学紹介 </a> </li>
        <li><a class="drop" href="applyInfo"> 入学案内 </a></li>

        <a href="goHome"><img src="<c:url value="/resources/img/logo.png" />" width="6%" height="6%"></a>

        <li><a href="department"> 学部紹介 </a> </li>
        <li><a href="goTotNotice"> お知らせ </a> </li> 
      	<li>
	<a href="login" style="position : absolute; left :90%; top:6px;">login<img src="<c:url value="/resources/img/lock.png"/>" width="4%" height="4%" style="width:61px;"></a>
    	
    </li>
    </ol>
    </div>
  </header>
  
  <div class="contents-main" style="margin-top: 10%; height: 265%;">
  	<p class="text2" >学科紹介</p><br>
	
	<div class="content1" style="margin-bottom: 100px;">
	<div class="haha"></div>
	<p class="text3" style="font-weight: bold;">融合経営学部</p><br>
	
	<table style="align-content: center;">
	<tr>
		<td rowspan='2'><img src="<c:url value="/resources/images/home/department1.jpg" />" style="width: 360px;"></td>
		<td colspan='3'><p style="margin-top: 10px; margin-left: 18px; font-size: 19px;">人間と社会に対する高次元的思考能力と道徳性を備えたグローバルリーダーになれるよう教育することを目標としています。 このため,多様な基本教科と融合教科,芸術と体育教科, そして英語をはじめ, 様々な外国語の教科を体系的に運営しています。 また, 分野別の教員たちの優れた研究力と幅広い学術活動を基に,社会発展に貢献しています。</p></td>
		<td></td>
	</tr>
	<tr style="text-align: center;">
		<td style="width:33%;" class="majar_td"><a href="major?majorSeq=2" class="major"><p class="majorName">金融保険学科</p></a></td>
		<td style="width:33%;" class="majar_td"><a href="major?majorSeq=3" class="major"><p class="majorName">税務会計学科</p></a></td>
		<td style="width:33%;" class="majar_td"><a href="major?majorSeq=1" class="major"><p class="majorName">経営学科</p></a></td>

	</tr>

  </table>
  </div>

<div class="content2" style="margin-bottom: 100px;">
	<div class="haha"></div>
	<p class="text3" style="font-weight: bold;">社会福祉学部</p><br>
	<table style="align-content: center;">
	
	<tr >
		<td rowspan='2'><img src="<c:url value="/resources/images/home/department2.jpg" />" style="width: 360px;"></td>
		<td colspan='3'><p style="margin-top: 10px; margin-left: 18px; font-size: 19px;">社会福祉学は人間中心の哲学をもとに平等, 正義を実現しようとする進歩的な学問です。 社会福祉学の志向は現代社会で起こる様々な社会問題を探求し, それに対する解決策を提示することです。 社会福祉学は社会科学の一つの分野ですが,具体的に現実に介入し,現実の変化に寄与するという点で,通常の学問とは異なります。</p></td>
		<td></td>
	</tr>
	<tr style="text-align: center;">
		<td style="width:33%;" class="majar_td"><a href="major?majorSeq=4" class="major"><p class="majorName">青少年福祉専攻</p></a></td>
		<td style="width:33%;" class="majar_td"><a href="major?majorSeq=5" class="major"><p class="majorName">児童福祉専攻</p></a></td>
		<td style="width:33%;" class="majar_td"><a href="major?majorSeq=6" class="major"><p class="majorName">老人福祉専攻</p></a></td>

	</tr>

  </table>
  </div>

<div class="content3" style="margin-bottom: 100px;">
	<div class="haha"></div>
	<p class="text3" style="font-weight: bold;">IT工学部</p><br>
	<table style="align-content: center;">
	<tr >
		<td rowspan='2'><img src="<c:url value="/resources/images/home/department3.jpg" />" style="width: 360px;"></td>
		<td colspan='3'><p style="margin-top: 10px; margin-left: 18px; font-size: 19px;">プログラミングと情報システムを中心として、情報学とマネジメントに関する基礎知識を学習。
企業における社内システムや幅広い顧客サービスの問題発見・分析および課題解決のシステム提案ができる人材を育成します。</p></td>
		<td></td>
	</tr>
	<tr style="text-align: center;">
		<td style="width:33%;" class="majar_td"><a href="major?majorSeq=7" class="major" style="font-size: 15px;"><p class="majorName">コンピューター工学</p></a></td>
		<td style="width:33%;" class="majar_td"><a href="major?majorSeq=8" class="major"><p class="majorName">電気電子工学科</p></a></td>
		<td style="width:33%;" class="majar_td"><a href="major?majorSeq=9" class="major"><p class="majorName">情報保護学科</p></a></td>

	</tr>

  </table>
  </div>
  
<div class="content3" style="margin-bottom: 100px;">
	<div class="haha"></div>
	<p class="text3" style="font-weight: bold;">社会科学部</p><br>
	<table style="align-content: center;">
	<tr >
		<td rowspan='2'><img src="<c:url value="/resources/images/home/department4.jpg" />" style="width: 360px;"></td>
		<td colspan='3'><p style="margin-top: 10px; margin-left: 18px; font-size: 19px;">IT（情報技術）の専門知識・スキルに加えて、企業の会計・財務、マネージメント・組織運営に関する知識とノウハウを学習。
ビジネスの現場に求められる問題発見と対応策を柔軟な視点で考察できる人材を育成します。</p></td>
		<td></td>
	</tr>
	<tr style="text-align: center;">
		<td style="width:33%;" class="majar_td"><a href="major?majorSeq=10" class="major"><p class="majorName">不動産学科</p></a></td>
		<td style="width:33%;" class="majar_td"><a href="major?majorSeq=11" class="major"><p class="majorName">法務行政学科</p></a></td>
		<td style="width:33%;" class="majar_td"><a href="major?majorSeq=12" class="major"><p class="majorName">保健行政学科</p></a></td>

	</tr>

  </table>
  </div>

 </div>


  <div class="footer" style="z-index: 2;float: right; margin-right:10%;">
		<div style="width: 100%; height: 155px;">
			<div style="width: 270px; float: left; line-height: 35px; font-size: 1.1rem;">
			> 大学概要 <br>
			> キャンパス案内・アクセス <br>
			> お知らせ<br>
			</div>
			<div style="width: 270px; float: left; line-height: 35px;">
			> サイトマップ<br>
			> ログイン メディアの皆さまへ<br>
			> 大学の魅力 <br>
			</div>
			<div style="width: 270px; float: left; line-height: 35px; font-size: 1.1rem;">
			> よくある質問<br>
			> サイトポリシー<br>
			</div>
			</div>

		</div>
		
		<footer style="width: 100%; height: 30px; z-index: -20">
						<div class="Goodmorning"></div>
						<div style="max-height:300px;">
						<div class="cokio"></div>
						</div>
					</footer>
					
			<div style="    left: 10px;width: 200px;margin: 0 auto;">
			© CHIE Online University
			</div>
</body>
</html>