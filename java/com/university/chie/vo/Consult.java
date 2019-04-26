package com.university.chie.vo;

public class Consult {
	private String counsel_seq;
	private String preginum;
	private String pName;
	private String sreginum;
	private String typeName;
	private String coundate;
	private String memo;
	private String isCounsel;
	private String endate;
	private String key;
	private String wdate;

	public Consult() {
	}

	public Consult(String counsel_seq, String preginum, String pName, String sreginum, String typeName, String coundate,
			String memo, String isCounsel, String endate, String key, String wdate) {
		super();
		this.counsel_seq = counsel_seq;
		this.preginum = preginum;
		this.pName = pName;
		this.sreginum = sreginum;
		this.typeName = typeName;
		this.coundate = coundate;
		this.memo = memo;
		this.isCounsel = isCounsel;
		this.endate = endate;
		this.key = key;
		this.wdate = wdate;
	}

	public String getCounsel_seq() {
		return counsel_seq;
	}

	public void setCounsel_seq(String counsel_seq) {
		this.counsel_seq = counsel_seq;
	}

	public String getPreginum() {
		return preginum;
	}

	public void setPreginum(String preginum) {
		this.preginum = preginum;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getSreginum() {
		return sreginum;
	}

	public void setSreginum(String sreginum) {
		this.sreginum = sreginum;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getCoundate() {
		return coundate;
	}

	public void setCoundate(String coundate) {
		this.coundate = coundate;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getIsCounsel() {
		return isCounsel;
	}

	public void setIsCounsel(String isCounsel) {
		this.isCounsel = isCounsel;
	}

	public String getEndate() {
		return endate;
	}

	public void setEndate(String endate) {
		this.endate = endate;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "Consult [counsel_seq=" + counsel_seq + ", preginum=" + preginum + ", pName=" + pName + ", sreginum="
				+ sreginum + ", typeName=" + typeName + ", coundate=" + coundate + ", memo=" + memo + ", isCounsel="
				+ isCounsel + ", endate=" + endate + ", key=" + key + ", wdate=" + wdate + "]";
	}
	
}
