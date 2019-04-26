package com.university.chie.vo;

public class Assignment_Submit {

	private String aSubSeq;
	private String assSeq;
	private String title;
	private String contents;
	private String indate;
	private String udate;
	private String sregiNum;
	public Assignment_Submit(String aSubSeq, String assSeq, String sregiNum, String title, String contents,
			String indate, String udate) {
		super();
		this.aSubSeq = aSubSeq;
		this.assSeq = assSeq;
		this.sregiNum = sregiNum;
		this.title = title;
		this.contents = contents;
		this.indate = indate;
		this.udate = udate;
	}
	public Assignment_Submit() {
		super();
	}
	public String getaSubSeq() {
		return aSubSeq;
	}
	public void setaSubSeq(String aSubSeq) {
		this.aSubSeq = aSubSeq;
	}
	public String getAssSeq() {
		return assSeq;
	}
	public void setAssSeq(String assSeq) {
		this.assSeq = assSeq;
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
	public String getudate() {
		return udate;
	}
	public void setudate(String udate) {
		this.udate = udate;
	}
	@Override
	public String toString() {
		return "Assignment_Submit [aSubSeq=" + aSubSeq + ", assSeq=" + assSeq + ", sregiNum=" + sregiNum + ", title="
				+ title + ", contents=" + contents + ", indate=" + indate + ", udate=" + udate + "]";
	}
	
	
}
