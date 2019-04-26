package com.university.chie.vo;

public class Transcript {
	
	private String year;
	private String semester;
	private String name;
	private String grade;
	private String assSeq;
	private String scoreSeq;
	private int credit;
	public Transcript(String year, String semester, String name, String grade, String assSeq, String scoreSeq,
			int credit) {
		super();
		this.year = year;
		this.semester = semester;
		this.name = name;
		this.grade = grade;
		this.assSeq = assSeq;
		this.scoreSeq = scoreSeq;
		this.credit = credit;
	}
	public Transcript() {
		super();
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getAssSeq() {
		return assSeq;
	}
	public void setAssSeq(String assSeq) {
		this.assSeq = assSeq;
	}
	public String getScoreSeq() {
		return scoreSeq;
	}
	public void setScoreSeq(String scoreSeq) {
		this.scoreSeq = scoreSeq;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	@Override
	public String toString() {
		return "Transcript [year=" + year + ", semester=" + semester + ", name=" + name + ", grade=" + grade
				+ ", assSeq=" + assSeq + ", scoreSeq=" + scoreSeq + ", credit=" + credit + "]";
	}
	
	
}
