package com.university.chie.vo;

public class Student extends User {
	private String sRegNum;
	private String applicantSeq;
	private String semester;
	private String picName;


	public Student(String password, String name, String birthday, String phonenum, String address, String enterdate,
			String statusNum, String email, String sRegNum, String applicantSeq, String semester, String picName) {
		super(password, name, birthday, phonenum, address, enterdate, statusNum, email);
		this.sRegNum = sRegNum;
		this.applicantSeq = applicantSeq;
		this.semester = semester;
		this.picName = picName;
	}

	public Student() {
		super();
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return super.getPassword();
	}

	@Override
	public void setPassword(String password) {
		// TODO Auto-generated method stub
		super.setPassword(password);
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return super.getName();
	}

	@Override
	public void setName(String name) {
		// TODO Auto-generated method stub
		super.setName(name);
	}

	@Override
	public String getBirthday() {
		// TODO Auto-generated method stub
		return super.getBirthday();
	}

	@Override
	public void setBirthday(String birthday) {
		// TODO Auto-generated method stub
		super.setBirthday(birthday);
	}

	@Override
	public String getPhonenum() {
		// TODO Auto-generated method stub
		return super.getPhonenum();
	}

	@Override
	public void setPhonenum(String phonenum) {
		// TODO Auto-generated method stub
		super.setPhonenum(phonenum);
	}

	@Override
	public String getAddress() {
		// TODO Auto-generated method stub
		return super.getAddress();
	}

	@Override
	public void setAddress(String address) {
		// TODO Auto-generated method stub
		super.setAddress(address);
	}

	@Override
	public String getEnterdate() {
		// TODO Auto-generated method stub
		return super.getEnterdate();
	}

	@Override
	public void setEnterdate(String enterdate) {
		// TODO Auto-generated method stub
		super.setEnterdate(enterdate);
	}

	@Override
	public String getStatus() {
		// TODO Auto-generated method stub
		return super.getStatus();
	}

	@Override
	public void setStatus(String status) {
		// TODO Auto-generated method stub
		super.setStatus(status);
	}

	@Override
	public String getEmail() {
		// TODO Auto-generated method stub
		return super.getEmail();
	}

	@Override
	public void setEmail(String email) {
		// TODO Auto-generated method stub
		super.setEmail(email);
	}

	public String getsRegNum() {
		return sRegNum;
	}

	public void setsRegNum(String sRegNum) {
		this.sRegNum = sRegNum;
	}

	public String getApplicantSeq() {
		return applicantSeq;
	}

	public void setApplicantSeq(String applicantSeq) {
		this.applicantSeq = applicantSeq;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public String getPicName() {
		return picName;
	}

	public void setPicName(String picName) {
		this.picName = picName;
	}

	@Override
	public String toString() {
		return "Student [sRegNum=" + sRegNum + ", applicantSeq=" + applicantSeq + ", semester=" + semester
				+ ", picName=" + picName + ", toString()=" + super.toString() + "]";
	}

}
