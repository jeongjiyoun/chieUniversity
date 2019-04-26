package com.university.chie.vo;

public class User {
	private String password;
	private String name;
	private String birthday;
	private String phonenum;
	private String address;
	private String enterdate;
	private String status;
	private String email;
	public User(String password, String name, String birthday, String phonenum, String address, String enterdate,
			String status, String email) {
		super();
		this.password = password;
		this.name = name;
		this.birthday = birthday;
		this.phonenum = phonenum;
		this.address = address;
		this.enterdate = enterdate;
		this.status = status;
		this.email = email;
	}
	public User() {
		super();
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEnterdate() {
		return enterdate;
	}
	public void setEnterdate(String enterdate) {
		this.enterdate = enterdate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "User [password=" + password + ", name=" + name + ", birthday=" + birthday + ", phonenum=" + phonenum
				+ ", address=" + address + ", enterdate=" + enterdate + ", status=" + status + ", email=" + email + "]";
	}

}


