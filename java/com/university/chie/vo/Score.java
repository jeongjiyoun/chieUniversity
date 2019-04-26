package com.university.chie.vo;

public class Score {
	private String score_seq;
	private String smSeq;
	private String assignment1;
	private String assignment2;
	private String score1;
	private String score2;
	private String attendScore;
	private String etcScore;
	private String totalScore;
	
/*	private int assignment1;
	private int assignment2;
	private int score1;
	private int score2;
	private int attendScore;
	private int etcScore;
	private int totalScore;
*/	private String score_grade;
	private String isFinal;
		
	public Score() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Score(String score_seq, String smSeq, String assignment1, String assignment2, String score1, String score2,
			String attendScore, String etcScore, String totalScore, String score_grade, String isFinal) {
		super();
		this.score_seq = score_seq;
		this.smSeq = smSeq;
		this.assignment1 = assignment1;
		this.assignment2 = assignment2;
		this.score1 = score1;
		this.score2 = score2;
		this.attendScore = attendScore;
		this.etcScore = etcScore;
		this.totalScore = totalScore;
		this.score_grade = score_grade;
		this.isFinal = isFinal;
	}

	public String getScore_seq() {
		return score_seq;
	}

	public void setScore_seq(String score_seq) {
		this.score_seq = score_seq;
	}

	public String getSmSeq() {
		return smSeq;
	}

	public void setSmSeq(String smSeq) {
		this.smSeq = smSeq;
	}

	public String getAssignment1() {
		return assignment1;
	}

	public void setAssignment1(String assignment1) {
		this.assignment1 = assignment1;
	}

	public String getAssignment2() {
		return assignment2;
	}

	public void setAssignment2(String assignment2) {
		this.assignment2 = assignment2;
	}

	public String getScore1() {
		return score1;
	}

	public void setScore1(String score1) {
		this.score1 = score1;
	}

	public String getScore2() {
		return score2;
	}

	public void setScore2(String score2) {
		this.score2 = score2;
	}

	public String getAttendScore() {
		return attendScore;
	}

	public void setAttendScore(String attendScore) {
		this.attendScore = attendScore;
	}

	public String getEtcScore() {
		return etcScore;
	}

	public void setEtcScore(String etcScore) {
		this.etcScore = etcScore;
	}

	public String getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}

	public String getScore_grade() {
		return score_grade;
	}

	public void setScore_grade(String score_grade) {
		this.score_grade = score_grade;
	}

	public String getIsFinal() {
		return isFinal;
	}

	public void setIsFinal(String isFinal) {
		this.isFinal = isFinal;
	}

	@Override
	public String toString() {
		return "Score [score_seq=" + score_seq + ", smSeq=" + smSeq + ", assignment1=" + assignment1 + ", assignment2="
				+ assignment2 + ", score1=" + score1 + ", score2=" + score2 + ", attendScore=" + attendScore
				+ ", etcScore=" + etcScore + ", totalScore=" + totalScore + ", score_grade=" + score_grade
				+ ", isFinal=" + isFinal + "]";
	}
	
}
