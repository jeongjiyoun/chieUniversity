package com.university.chie.vo;

public class Lecture {
	private String lectureNum; //고유강의번호
	private String mpSeq; //담당교수님
	private String srSeq; //강의개설학기
	private String mcSeq; //전공커리큘럼번호
	private String scoreType_Seq; //점수배정방식시퀀스
	private String name; //강의명
	private String occupancy; //인원제한
	private String contents; //설명
	private String grade; //몇학년대상
	private String is_real_time; //스트리밍강의인지
	private String divide; //분반
	private String credit; //학점(이수단위)
	private String note; //비고란
	private String isPermitted; //관리자확인여부
	private String fileName; //강의계획표파일저장명
	public Lecture() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Lecture(String lectureNum, String mpSeq, String srSeq, String mcSeq, String scoreType_Seq, String name,
			String occupancy, String contents, String grade, String is_real_time, String divide, String credit,
			String note, String isPermitted, String fileName) {
		super();
		this.lectureNum = lectureNum;
		this.mpSeq = mpSeq;
		this.srSeq = srSeq;
		this.mcSeq = mcSeq;
		this.scoreType_Seq = scoreType_Seq;
		this.name = name;
		this.occupancy = occupancy;
		this.contents = contents;
		this.grade = grade;
		this.is_real_time = is_real_time;
		this.divide = divide;
		this.credit = credit;
		this.note = note;
		this.isPermitted = isPermitted;
		this.fileName = fileName;
	}
	public String getLectureNum() {
		return lectureNum;
	}
	public void setLectureNum(String lectureNum) {
		this.lectureNum = lectureNum;
	}
	public String getMpSeq() {
		return mpSeq;
	}
	public void setMpSeq(String mpSeq) {
		this.mpSeq = mpSeq;
	}
	public String getSrSeq() {
		return srSeq;
	}
	public void setSrSeq(String srSeq) {
		this.srSeq = srSeq;
	}
	public String getMcSeq() {
		return mcSeq;
	}
	public void setMcSeq(String mcSeq) {
		this.mcSeq = mcSeq;
	}
	public String getScoreType_Seq() {
		return scoreType_Seq;
	}
	public void setScoreType_Seq(String scoreType_Seq) {
		this.scoreType_Seq = scoreType_Seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOccupancy() {
		return occupancy;
	}
	public void setOccupancy(String occupancy) {
		this.occupancy = occupancy;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getIs_real_time() {
		return is_real_time;
	}
	public void setIs_real_time(String is_real_time) {
		this.is_real_time = is_real_time;
	}
	public String getDivide() {
		return divide;
	}
	public void setDivide(String divide) {
		this.divide = divide;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getIsPermitted() {
		return isPermitted;
	}
	public void setIsPermitted(String isPermitted) {
		this.isPermitted = isPermitted;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	@Override
	public String toString() {
		return "Lecture [lectureNum=" + lectureNum + ", mpSeq=" + mpSeq + ", srSeq=" + srSeq + ", mcSeq=" + mcSeq
				+ ", scoreType_Seq=" + scoreType_Seq + ", name=" + name + ", occupancy=" + occupancy + ", contents="
				+ contents + ", grade=" + grade + ", is_real_time=" + is_real_time + ", divide=" + divide + ", credit="
				+ credit + ", note=" + note + ", isPermitted=" + isPermitted + ", fileName=" + fileName + "]";
	}
	
	
	
	
}
