package com.university.chie.vo;

public class Applicant {

	private String applicantSeq;
	private String majorSeq;
	private String name;
	private String birthday;
	private String password;
	private String phoneNum;
	private String address;
	private String email;
	private String requirement_file;
	private String indate;
	private String procedding;
	private String pic_name;
	private String wdate;

	public Applicant() {
		super();
	}

	public Applicant(String applicantSeq, String majorSeq, String name, String birthday, String password,
			String phoneNum, String address, String email, String requirement_file, String indate, String procedding,
			String pic_name, String wdate) {
		super();
		this.applicantSeq = applicantSeq;
		this.majorSeq = majorSeq;

		this.name = name;
		this.birthday = birthday;
		this.password = password;
		this.phoneNum = phoneNum;
		this.address = address;
		this.email = email;
		this.requirement_file = requirement_file;
		this.indate = indate;
		this.procedding = procedding;
		this.pic_name = pic_name;
		this.wdate = wdate;
	}

	public String getApplicantSeq() {
		return applicantSeq;
	}
	public void setApplicantSeq(String applicantSeq) {
		this.applicantSeq = applicantSeq;
	}
	public String getMajorSeq() {
		return majorSeq;
	}
	public void setMajorSeq(String majorSeq) {
		this.majorSeq = majorSeq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRequirement_file() {
		return requirement_file;
	}
	public void setRequirement_file(String requirement_file) {
		this.requirement_file = requirement_file;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public String getProcedding() {
		return procedding;
	}
	public void setProcedding(String procedding) {
		this.procedding = procedding;
	}
	public String getPic_name() {
		return pic_name;
	}
	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	@Override
	public String toString() {
		return "Applicant [applicantSeq=" + applicantSeq + ", majorSeq=" + majorSeq + ", name=" + name + ", birthday="
				+ birthday + ", password=" + password + ", phoneNum=" + phoneNum + ", address=" + address + ", email="
				+ email + ", requirement_file=" + requirement_file + ", indate=" + indate + ", procedding=" + procedding
				+ ", pic_name=" + pic_name + ", wdate=" + wdate + "]";
	}
	
	
	
	
}
