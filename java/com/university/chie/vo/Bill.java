package com.university.chie.vo;

public class Bill {
	String enseq;
	String ispayed;
	String totscolaship;
	String subtotal;
	String srseq;
	String sreginum;
	String totalcost;

	String totrtlalcredit;

	public Bill() {
		super();
	}

	public Bill(String enseq, String ispayed, String totscolaship, String subtotal, String srseq, String sreginum,
			String totalcost, String totrtlalcredit) {
		super();
		this.enseq = enseq;
		this.ispayed = ispayed;
		this.totscolaship = totscolaship;
		this.subtotal = subtotal;
		this.srseq = srseq;
		this.sreginum = sreginum;
		this.totalcost = totalcost;
		this.totrtlalcredit = totrtlalcredit;
	}

	public String getEnseq() {
		return enseq;
	}

	public void setEnseq(String enseq) {
		this.enseq = enseq;
	}

	public String getIspayed() {
		return ispayed;
	}

	public void setIspayed(String ispayed) {
		this.ispayed = ispayed;
	}

	public String getTotscolaship() {
		return totscolaship;
	}

	public void setTotscolaship(String totscolaship) {
		this.totscolaship = totscolaship;
	}

	public String getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(String subtotal) {
		this.subtotal = subtotal;
	}

	public String getSrseq() {
		return srseq;
	}

	public void setSrseq(String srseq) {
		this.srseq = srseq;
	}

	public String getSreginum() {
		return sreginum;
	}

	public void setSreginum(String sreginum) {
		this.sreginum = sreginum;
	}

	public String getTotalcost() {
		return totalcost;
	}

	public void setTotalcost(String totalcost) {
		this.totalcost = totalcost;
	}

	@Override
	public String toString() {
		return "Bill [enseq=" + enseq + ", ispayed=" + ispayed + ", totscolaship=" + totscolaship + ", subtotal="
				+ subtotal + ", srseq=" + srseq + ", sreginum=" + sreginum + ", totalcost=" + totalcost
				+ ", totrtlalcredit=" + totrtlalcredit + "]";
	}


}
