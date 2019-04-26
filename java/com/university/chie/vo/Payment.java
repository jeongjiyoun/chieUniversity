package com.university.chie.vo;

public class Payment {
	public String paymentnum;//고유번호
	public int enseq;//시퀀스
	public String issucess;//거래성공여부
	public String meansofpayment;//결제방법(카드,계좌이체)
	public String resultcode;//승인번호
	public String totprice;//총 결제금액
	public String ordernum;//거래번호
	public String indate;//승인날짜
	public String receipt_url;
	public Payment() {
		super();
	}
	public Payment(String paymentnum, int enseq, String issucess, String meansofpayment, String resultcode,
			String totprice, String ordernum, String indate, String receipt_url) {
		super();
		this.paymentnum = paymentnum;
		this.enseq = enseq;
		this.issucess = issucess;
		this.meansofpayment = meansofpayment;
		this.resultcode = resultcode;
		this.totprice = totprice;
		this.ordernum = ordernum;
		this.indate = indate;
		this.receipt_url = receipt_url;
	}
	public String getPaymentnum() {
		return paymentnum;
	}
	public void setPaymentnum(String paymentnum) {
		this.paymentnum = paymentnum;
	}
	public int getEnseq() {
		return enseq;
	}
	public void setEnseq(int enseq) {
		this.enseq = enseq;
	}
	public String getIssucess() {
		return issucess;
	}
	public void setIssucess(String issucess) {
		this.issucess = issucess;
	}
	public String getMeansofpayment() {
		return meansofpayment;
	}
	public void setMeansofpayment(String meansofpayment) {
		this.meansofpayment = meansofpayment;
	}
	public String getResultcode() {
		return resultcode;
	}
	public void setResultcode(String resultcode) {
		this.resultcode = resultcode;
	}
	public String getTotprice() {
		return totprice;
	}
	public void setTotprice(String totprice) {
		this.totprice = totprice;
	}
	public String getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public String getReceipt_url() {
		return receipt_url;
	}
	public void setReceipt_url(String receipt_url) {
		this.receipt_url = receipt_url;
	}
	@Override
	public String toString() {
		return "Payment [paymentnum=" + paymentnum + ", enseq=" + enseq + ", issucess=" + issucess + ", meansofpayment="
				+ meansofpayment + ", resultcode=" + resultcode + ", totprice=" + totprice + ", ordernum=" + ordernum
				+ ", indate=" + indate + ", receipt_url=" + receipt_url + "]";
	}
	
}
