package com.university.chie.vo;

public class QnAQuestion {
	
	private String qSeq;
	private String lectureNum;
	private String sregiNum;
	private String title;
	private String contents;
	private String indate;
	private int count;
	
	public QnAQuestion(String qSeq, String lectureNum, String sregiNum, String title, String contents, String indate,
			int count) {
		super();
		this.qSeq = qSeq;
		this.lectureNum = lectureNum;
		this.sregiNum = sregiNum;
		this.title = title;
		this.contents = contents;
		this.indate = indate;
		this.count = count;
	}

	public QnAQuestion() {
		super();
	}

	public String getqSeq() {
		return qSeq;
	}

	public void setqSeq(String qSeq) {
		this.qSeq = qSeq;
	}

	public String getLectureNum() {
		return lectureNum;
	}

	public void setLectureNum(String lectureNum) {
		this.lectureNum = lectureNum;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "QnAQuestion [qSeq=" + qSeq + ", lectureNum=" + lectureNum + ", sregiNum=" + sregiNum + ", title="
				+ title + ", contents=" + contents + ", indate=" + indate + ", count=" + count + "]";
	}
	
	
}
