package com.university.chie.vo;

public class Assignment {
	
	private String assSeq;
	private String lectureNum;
	private String title;
	private String contents;
	private String indate;
	private String startDate;
	private String endDate;
	public Assignment(String assSeq, String lectureNum, String title, String contents, String indate, String startDate,
			String endDate) {
		super();
		this.assSeq = assSeq;
		this.lectureNum = lectureNum;
		this.title = title;
		this.contents = contents;
		this.indate = indate;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	public Assignment() {
		super();
	}
	public String getAssSeq() {
		return assSeq;
	}
	public void setAssSeq(String assSeq) {
		this.assSeq = assSeq;
	}
	public String getLectureNum() {
		return lectureNum;
	}
	public void setLectureNum(String lectureNum) {
		this.lectureNum = lectureNum;
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
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	@Override
	public String toString() {
		return "Assignment [assSeq=" + assSeq + ", lectureNum=" + lectureNum + ", title=" + title + ", contents="
				+ contents + ", indate=" + indate + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
	
	
}
