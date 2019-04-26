package com.university.chie.vo;

public class LectureTime {
	private int ltSeq;
	private String lectureNum;
	private String startTime;
	private String endTime;
	private String day;
	public LectureTime(int ltSeq, String lectureNum, String startTime, String endTime, String day) {
		super();
		this.ltSeq = ltSeq;
		this.lectureNum = lectureNum;
		this.startTime = startTime;
		this.endTime = endTime;
		this.day = day;
	}
	public LectureTime() {
		super();
	}
	public int getLtSeq() {
		return ltSeq;
	}
	public void setLtSeq(int ltSeq) {
		this.ltSeq = ltSeq;
	}
	public String getLectureNum() {
		return lectureNum;
	}
	public void setLectureNum(String lectureNum) {
		this.lectureNum = lectureNum;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	@Override
	public String toString() {
		return "LectureTime [ltSeq=" + ltSeq + ", lectureNum=" + lectureNum + ", startTime=" + startTime + ", endTime="
				+ endTime + ", day=" + day + "]";
	}
	
	
	
}
