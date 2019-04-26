package com.university.chie.vo;

public class Admin {
	private String adminid;
	private String statusnum;
	private String name;
	private String birthday;
	private String phonenum;
	private String address;
	private String enterdate;
	private String graduateate;
	private int partnum;
	private String email;
	private String indate;
	private String wid;
	private String password;

	public Admin() {
		super();
	}

	public Admin(String adminid, String statusnum, String name, String birthday, String phonenum, String address,
			String enterdate, String graduateate, int partnum, String email, String indate, String wid,
			String password) {
		super();
		this.adminid = adminid;
		this.statusnum = statusnum;
		this.name = name;
		this.birthday = birthday;
		this.phonenum = phonenum;
		this.address = address;
		this.enterdate = enterdate;
		this.graduateate = graduateate;
		this.partnum = partnum;
		this.email = email;
		this.indate = indate;
		this.wid = wid;
		this.password = password;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getStatusnum() {
		return statusnum;
	}

	public void setStatusnum(String statusnum) {
		this.statusnum = statusnum;
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

	public String getGraduateate() {
		return graduateate;
	}

	public void setGraduateate(String graduateate) {
		this.graduateate = graduateate;
	}

	public int getPartnum() {
		return partnum;
	}

	public void setPartnum(int partnum) {
		this.partnum = partnum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIndate() {
		return indate;
	}

	public void setIndate(String indate) {
		this.indate = indate;
	}

	public String getWid() {
		return wid;
	}

	public void setWid(String wid) {
		this.wid = wid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Admin [adminid=" + adminid + ", statusnum=" + statusnum + ", name=" + name + ", birthday=" + birthday
				+ ", phonenum=" + phonenum + ", address=" + address + ", enterdate=" + enterdate + ", graduateate="
				+ graduateate + ", partnum=" + partnum + ", email=" + email + ", indate=" + indate + ", wid=" + wid
				+ ", password=" + password + "]";
	}

}
