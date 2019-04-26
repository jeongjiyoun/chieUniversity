package com.university.chie.vo;

public class QnAAnswer {

	private String aSeq;
	private String pregiNum;
	private String qSeq;
	private String sregiNum;
	private String title;
	private String contents;
	private String indate;
	
	public QnAAnswer(String aSeq, String pregiNum, String qSeq, String sregiNum, String title, String contents,
			String indate) {
		super();
		this.aSeq = aSeq;
		this.pregiNum = pregiNum;
		this.qSeq = qSeq;
		this.sregiNum = sregiNum;
		this.title = title;
		this.contents = contents;
		this.indate = indate;
	}
	
	public QnAAnswer() {
		super();
	}
	public String getaSeq() {
		return aSeq;
	}
	public void setaSeq(String aSeq) {
		this.aSeq = aSeq;
	}
	public String getPregiNum() {
		return pregiNum;
	}
	public void setPregiNum(String pregiNum) {
		this.pregiNum = pregiNum;
	}
	public String getqSeq() {
		return qSeq;
	}
	public void setqSeq(String qSeq) {
		this.qSeq = qSeq;
	}
	public String getSregiNum() {
		return sregiNum;
	}
	public void setSregiNum(String sregiNum) {
		this.sregiNum = sregiNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	
	@Override
	public String toString() {
		return "QnAAnswer [aSeq=" + aSeq + ", pregiNum=" + pregiNum + ", qSeq=" + qSeq + ", sregiNum=" + sregiNum
				+ ", title=" + title + ", contents=" + contents + ", indate=" + indate + "]";
	}
	
	
}
