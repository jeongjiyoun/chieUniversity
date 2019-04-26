package com.university.chie.vo;

public class Ass_File {

	private String fileASeq;
	private String aSubSeq;
	private String org_Name;
	private String name;
	private String sregiNum;
	private String wdate;
	
	public Ass_File(String fileASEQ, String aSubSeq, String org_Name, String name, String sregiNum, String wdate) {
		super();
		this.fileASeq = fileASEQ;
		this.aSubSeq = aSubSeq;
		this.org_Name = org_Name;
		this.name = name;
		this.sregiNum = sregiNum;
		this.wdate = wdate;
	}

	public Ass_File() {
		super();
	}

	public String getFileASeq() {
		return fileASeq;
	}

	public void setFileASeq(String fileASeq) {
		this.fileASeq = fileASeq;
	}

	public String getaSubSeq() {
		return aSubSeq;
	}

	public void setaSubSeq(String aSubSeq) {
		this.aSubSeq = aSubSeq;
	}

	public String getOrg_Name() {
		return org_Name;
	}

	public void setOrg_Name(String org_Name) {
		this.org_Name = org_Name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSregiNum() {
		return sregiNum;
	}

	public void setSregiNum(String sregiNum) {
		this.sregiNum = sregiNum;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "Ass_File [fileASEQ=" + fileASeq + ", aSubSeq=" + aSubSeq + ", org_Name=" + org_Name + ", name=" + name
				+ ", sregiNum=" + sregiNum + ", wdate=" + wdate + "]";
	}
	
	
	
	
	
	
	
}
