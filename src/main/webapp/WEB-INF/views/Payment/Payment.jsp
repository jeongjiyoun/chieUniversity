<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>결제테스트</title>
</head>
<body>

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<input type="hidden" id="enseq" value="0">
<input type="hidden" id="totalcost" value="${Bill.totalcost}">
	<script>
		var IMP = window.IMP;
		var enseq = $("#enseq").val();
		var totalcost = $("#totalcost").val();
		IMP.init("imp81795222");
		function check_module() {
			IMP.request_pay({
				pg : 'html5_inicis',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '授業料決済',
				amount : totalcost,
			}, function(rsp) {
				if (rsp.success) {
				var uri = "action";
				name : '결제테스트',
				amount : 100,
					jQuery.ajax({
						url : uri,
						type : 'POST',
						dataType : 'json',
						data : {
							imp_uid : rsp.imp_uid
						},
						success : function(rsp) {
							alert("merchant_uid");
						},
						error : function(error) {
							alert(JSON.stringify(error));
							console.log(JSON.stringify(error));
						}
					}).done(function(data) {
						if (rsp.success) {
							var msg = '決済が完了しました。';
							alert(msg);

							var today = new Date();
							var result = today.getFullYear()+"/"+(today.getMonth()+1)+"/"+today.getDate()+" ";
							
							// Create a new JavaScript Date object based on the timestamp
							// multiplied by 1000 so that the argument is in milliseconds, not seconds.
							var date = new Date(rsp.paid_at*1000);
							// Hours part from the timestamp
							var hours = date.getHours();
							// Minutes part from the timestamp
							var minutes = "0" + date.getMinutes();
							// Seconds part from the timestamp
							var seconds = "0" + date.getSeconds();

							// Will display time in 10:30:23 format
							var formattedTime = hours + ':' + minutes.substr(-2) + ':' + seconds.substr(-2);							
							$.ajax({
								url : 'finish',
								type : 'POST',
								data : {
									'paymentnum' : rsp.imp_uid,
									'enseq' : enseq,
									'issucess' : rsp.success,
									'meansofpayment' : rsp.pay_method,
									'resultcode' : rsp.apply_num,
									'totprice' : rsp.paid_amount,
									'indate' : result,
									'receipt_url' : rsp.receipt_url
								},
								success : function(rsp) {
									'totprice' : rsp.apply_num,
									'ordernum' : rep.receipt_url,
									'indate' : rsp.paid_at,
									'receipt_url' : rsp.receipt_url
								},
								success : function(rsp.success) {
									alert(rsp.success);
								}
							});
						} else {
							var msg = '決済に失敗しました。';
							msg += '\nエラー内容 : ' + rsp.error_msg;
						}
					});
					alert(msg);
				}
			});
		}
	</script>
	<h1>결제 모듈 테스트</h1>
	<button onclick="check_module()" type="button">카드결제 테스트</button>
	<br>
	<br>
	<!-- <button onclick="check()" type="button">계좌이체 테스트</button> -->
</body>
</html>