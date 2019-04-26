<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta name="viewport"
  content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title><c:if test="${exam.TYPE == 'M'}">中間</c:if><c:if test="${exam.TYPE == 'F'}">期末</c:if>試験</title>

  <!-- font -->
  <link href="https://fonts.googleapis.com/earlyaccess/notosansjp.css" rel="stylesheet">

  <!-- Bootstrap css -->
  <link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css"/>" rel="stylesheet">

  <!-- Jquery -->
  <script src="<c:url value="resources/jquery-3.3.1.min.js"/>"></script>

  <!-- Main CSS *-->
  <link href="<c:url value="/resources/css/consult.css"/>" rel="stylesheet" media="all">

  <!-- 기타 Css -->
  <link href="<c:url value="/resources/css/boardCss.css" />" rel="stylesheet" type="text/css">

</head>
<body>
  <div class="container-fluid">
    <header>
      <div class="d-none d-lg-block" id="fix-titleC">
        <div style="height: 100%; font-size: 3rem; color: white; float: left; margin-left: 2%"> <c:if test="${exam.TYPE == 'M'}">中間</c:if><c:if test="${exam.TYPE == 'F'}">期末</c:if>試験
        </div>
        <img id="logoCen" src="<c:url value="/resources/img/logo.png" />" style="float: left">
	<span style="color: white; position: absolute; top: 16%; right: 16%; height: 84%; font-size: 2rem; margin-left: 35px;">${exam.NAME} (${exam.DIVIDE})</span>
      </div>
    </header>
    <div class="row">
      <div class="col-sm-10 offset-sm-1" id="hiddenright">
        <div class="table-responsive" style="overflow-x : hidden;">
          <table class="table table-striped2">
            <thead class="thead">
              <tr id="table-title">
                <th colspan="4"><h1 style="text-align: center">試験概要</h1></th>
              </tr>
            </thead>
            <tbody class = "table table-striped2 tS2">
              <tr>
                <td class="tdT">受験者名前</td>
                <td style="width: 30%" class ="tdC">${sessionScope.loginName}</td>
                <td class="tdT">学生番号</td>
                <td style="width: 30%" class ="tdC">${sessionScope.loginId}</td>
              </tr>
              <tr>
                <td class="tdT">科目名</td>
                <td  class ="tdC">${exam.SUTITLE}</td>
                <td class="tdT">教授名</td>
                <td  class ="tdC">${exam.SUPROF}</td>
              </tr>
              <tr>
                <td class="tdT">学年</td>
                <td  class ="tdC"style="width: 30%">${exam.GRADE}</td>
                <td class="tdT">受験時間</td>
                <td  class ="tdC" style="width: 30%">約${exam.TIMELIMIT}分</td>
              </tr>
              <tr>
                <td class="tdT">受験注意事項</td>
                <td colspan="3" style="font-weight: 380; text-align: left; font-size: 1rem;">
試験問題は<span style="color: red;">非公開</span>です。受験者は受験にあたり、以下の事項に同意いただく必要があります。 <br>
同意いただけない場合は受験できません。 <br>
<span style="margin-left : 1rem;">(1)試験問題を第三者に開示（漏洩）しないこと</span><br>
<span style="margin-left : 1rem;">(2)試験問題を開示（漏洩）した場合、関係法令等に基づき損害賠償請求等の措置が取られること </span><br>
なお、試験問題は著作権法で保護されています。<br><br>

<b>-試験開始時の注意事項</b><br>
<span style="margin-left : 1rem;">
	■試験開始時刻になるまで、試験は開始できません。 <br></span>
	<span style="margin-left : 1rem;">
	■試験開始時刻の１分前になりましたら、画面上に試験開始案内を表示します。 <br></span>
	<span style="margin-left : 1rem;">
	ただし、試験開始時刻に遅れた方には、試験開始案内は表示されません。 <br></span>
	<span style="margin-left : 1rem;">	
	■試験の開始及び終了は、受験者端末の時刻を基準として使用します。 <br></span>
	<span style="margin-left : 1rem;">
	■試験開始時刻に遅れた方は、その分試験時間が短くなります。 <br></span>
	<span style="margin-left : 1rem;">
	■文字色等を変更することにより、問題表示画面を見やすい画面に調整することができます。 <br></span>
	<span style="margin-left : 1rem;">
	　変更可能なこと ： 白黒反転、背景色、文字色、表示倍率<br></span>
	<span style="margin-left : 1rem;">
	■マウスの調整（移動スピード等）はできません。 <br></span>
	<span style="margin-left : 1rem;">
	■画面の明るさを調整したい場合は、手を挙げて合図をしてください。 <br></span>
	<span style="margin-left : 1rem;">
	■試験中のメモは会場で用意してあるメモ用紙とシャープペンシルを使用してください。 <br></span>
	<br>
<b>-試験結果確認</b><br>
<span style="margin-left : 1rem;">■試験終了時刻に達すると試験終了となり、解答の入力等の操作ができなくなり、自動的に採点が開始されます。 </span><br>
<span style="margin-left : 1rem;">■試験終了時刻前に解答を終了する方は、「解答終了」ボタンを押してください。採点が開始されます。 </span><br>
<span style="margin-left : 1rem;">■採点が終了すると、試験結果が表示されます。 </span><br>
<span style="margin-left : 1rem;">■試験結果は印刷し持ち帰ることはできませんが、試験終了後にITパスポート試験ホームページから試験結果レポートをダウンロードすることができます。 </span><br>
<span style="margin-left : 1rem;">■試験監督員によるメモ用紙等の回収後、試験室から退出してください。試験終了時刻前でも退出可能です。</span><br>

<br>
<b>次の事項に該当する者の答案は、採点されません。</b><br>
<span style="margin-left : 1rem;">(1)監督員など係員の指示に従わない者（*） <br></span>

<span style="margin-left : 1rem;">(2)不正行為をした者（*） <br></span>
<span style="margin-left : 2rem;">■カンニング、替え玉受験をした者</span><br>
<span style="margin-left : 2rem;">■時計（腕時計も含む）、電子機器（携帯電話（スマートフォンを含む）、ウェアラブル端末、パソコン、オーディオプレーヤー、ゲーム機、電子辞書、電卓）、書籍（参考書、ノートなど）をカバン（ロッカーのある会場ではロッカー）にしまっていない者</span><br>
<span style="margin-left : 2rem;">■USBメモリ等の外部メディアを接続した者</span><br>
<span style="margin-left : 2rem;">■受験に必要のない操作をした者（受験に必要な操作：キーボードによる受験番号、利用者ＩＤ、マウス操作）</span><br>

<span style="margin-left : 1rem;">(3)机上に置けるもの以外を机上に置いている者 <br></span>

<span style="margin-left : 1rem;">(4)受験者端末の電源を切った者、ネットワークケーブルを抜いた者、試験会場の設備以外のものに変更した者 <br></span>


<br><b>その他の注意事項</b><br>
<span style="margin-left : 1rem;">■メモ用紙とシャープペンシルは持ち帰らないでください。 </span><br>
<span style="margin-left : 1rem;">■試験中は、試験の公平性や安全性などの確保のため、ビデオ録画やその他方法で記録される場合があります。 </span><br>
<span style="margin-left : 1rem;">■試験問題の内容や試験結果に関する質問には、お答えできません。 </span><br>
<span style="margin-left : 1rem;">■試験室内は禁煙です。指定された場所以外では喫煙できません。試験会場によっては、全館禁煙のところがあります。 </span><br>
<span style="margin-left : 1rem;">■試験当日に出た飲み物などのゴミは、各自持ち帰ってください。 </span><br>
<span style="margin-left : 1rem;">■試験会場における盗難、紛失について、試験会場では一切責任を負いません。貴重品の管理はご自身の責任で行ってください。 </span><br>
<span style="margin-left : 1rem;">■試験会場では、料金を徴収するようなことは、一切おこなっていません。 </span><br>
<span style="margin-left : 1rem;">■試験会場によっては、冷暖房が入らないなど、空調が十分でない場合があります。 </span><br>
<span style="margin-left : 1rem;">■地震、台風などの災害が起きた場合には、試験実施に関する情報を当サイトに掲載します。 </span><br>
</td>
              </tr>
              <tr>
                <td class="tdT" rowspan="2">確認</td>
                <td colspan="2" class = "tdC"><input type="checkbox" name="identi1" id="identi1"> &nbsp 私は上記の受験者本人で、間違いがないです。</td>
                <td rowspan="2" id ="btnReady">
                </td>
              </tr>
              <tr>
                <td colspan="2" class = "tdC"><input type="checkbox" name="identi1" id="identi2"> &nbsp 受験注意事項を確認し、遵守します。</td>
              </tr>
              <tr>
                <td colspan="4"></td>
              </tr>
        	 </tbody>
              <tfoot>
              </tfoot>
            </table>
          </div>
        </div>
      </div>
    </div>
    <footer>
      <div class="d-none d-lg-block" style="position: relative; bottom: 0%; height: 11%;height: 60px;">
      	<button class="btn-lg bC" style="right: 15%;" type="button" id="btnExit">EXIT</button>
  	  </div>
	</footer>

<script type="text/javascript">
  $(function(){
    $("#btnExit").on("click",btnExit);
    $("input").change(waitCheck);
  });

  function btnExit(){
    self.close();
  }
  
  function waitCheck(){
      	if ($("#identi1").is(":checked") && $("#identi2").is(":checked")) {
      		$("#btnReady").html("<button type='button' id='startExam'>試験開始</button>");
  			$("#startExam").on("click",startExam);
      	} 
   }

  function startExam(){
	  var id1 = $("#identi1");
	  var id2 = $("#identi2");
	if ($("#identi1").is(":checked") && $("#identi2").is(":checked")) {
		location.href="exam?examseq=" + ${exam.EXAMSEQ};
	} else {
		alert("チェックを確認してください");
	}
  }
</script>

</body>
</html>