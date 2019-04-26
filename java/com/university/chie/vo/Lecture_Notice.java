package com.university.chie.vo;

public class Lecture_Notice {
	
	private String lnSeq;
	private String lectureNum;
	private String pregiNum;
	private String title;
	private String contents;
	private String indate;
	public Lecture_Notice(String lnSeq, String lectureNum, String pregiNum, String title, String contents,
			String indate) {
		super();
		this.lnSeq = lnSeq;
		this.lectureNum = lectureNum;
		this.pregiNum = pregiNum;
		this.title = title;
		this.contents = contents;
		this.indate = indate;
	}
	public Lecture_Notice() {
		super();
	}
	public String getLnSeq() {
		return lnSeq;
	}
	public void setLnSeq(String lnSeq) {
		this.lnSeq = lnSeq;
	}
	public String getLectureNum() {
		return lectureNum;
	}
	public void setLectureNum(String lectureNum) {
		this.lectureNum = lectureNum;
	}
	public String getPregiNum() {
		return pregiNum;
	}
	public void setPregiNum(String pregiNum) {
		this.pregiNum = pregiNum;
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
		return "Lecture_Notice [lnSeq=" + lnSeq + ", lectureNum=" + lectureNum + ", pregiNum=" + pregiNum + ", title="
				+ title + ", contents=" + contents + ", indate=" + indate + "]";
	}
	
	
}
