package com.university.chie.vo;

public class LectureNoticeFile {
	
	private String fileSeq;
	private String lnSeq;
	private String org_Name;
	private String name;
	private String idate;
	private String pregiNum;
	public LectureNoticeFile(String fileSeq, String lnSeq, String org_Name, String name, String idate,
			String pregiNum) {
		super();
		this.fileSeq = fileSeq;
		this.lnSeq = lnSeq;
		this.org_Name = org_Name;
		this.name = name;
		this.idate = idate;
		this.pregiNum = pregiNum;
	}
	public LectureNoticeFile() {
		super();
	}
	public String getFileSeq() {
		return fileSeq;
	}
	public void setFileSeq(String fileSeq) {
		this.fileSeq = fileSeq;
	}
	public String getLnSeq() {
		return lnSeq;
	}
	public void setLnSeq(String lnSeq) {
		this.lnSeq = lnSeq;
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
	public String getIdate() {
		return idate;
	}
	public void setIdate(String idate) {
		this.idate = idate;
	}
	public String getPregiNum() {
		return pregiNum;
	}
	public void setPregiNum(String pregiNum) {
		this.pregiNum = pregiNum;
	}
	@Override
	public String toString() {
		return "LectureNoticeFile [fileSeq=" + fileSeq + ", lnSeq=" + lnSeq + ", org_Name=" + org_Name + ", name="
				+ name + ", idate=" + idate + ", pregiNum=" + pregiNum + "]";
	}
	
	
}
