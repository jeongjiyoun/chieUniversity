package com.university.chie.vo;

public class Professor extends User {
	private String pRegNum;
	private String picName;
	public Professor(String password, String name, String birthday, String phonenum, String address, String enterdate,
			String status, String email, String pRegNum, String picName) {
		super(password, name, birthday, phonenum, address, enterdate, status, email);
		this.pRegNum = pRegNum;
		this.picName = picName;
	}
	public Professor() {
	}
	public String getpRegNum() {
		return pRegNum;
	}
	public void setpRegNum(String pRegNum) {
		this.pRegNum = pRegNum;
	}
	public String getPicName() {
		return picName;
	}
	public void setPicName(String picName) {
		this.picName = picName;
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
	
	@Override
	public String toString() {
		return super.toString() + "Professor [pRegNum=" + pRegNum + ", picName=" + picName + "]";
	}
	
	

}
