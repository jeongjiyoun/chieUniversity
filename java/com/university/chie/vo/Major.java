package com.university.chie.vo;

public class Major {

	private String majorSeq;
	private String categories;
	private String name;
	private String explaination;
	private String goal;
	private String roadmap; // 로드맵 설명
	private String roadmap_pic;
	public Major() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Major(String majorSeq, String categories, String name, String explaination, String goal, String roadmap,
			String roadmap_pic) {
		super();
		this.majorSeq = majorSeq;
		this.categories = categories;
		this.name = name;
		this.explaination = explaination;
		this.goal = goal;
		this.roadmap = roadmap;
		this.roadmap_pic = roadmap_pic;
	}
	public String getMajorSeq() {
		return majorSeq;
	}
	public void setMajorSeq(String majorSeq) {
		this.majorSeq = majorSeq;
	}
	public String getCategories() {
		return categories;
	}
	public void setCategories(String categories) {
		this.categories = categories;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getExplaination() {
		return explaination;
	}
	public void setExplaination(String explaination) {
		this.explaination = explaination;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}
	public String getRoadmap() {
		return roadmap;
	}
	public void setRoadmap(String roadmap) {
		this.roadmap = roadmap;
	}
	public String getRoadmap_pic() {
		return roadmap_pic;
	}
	public void setRoadmap_pic(String roadmap_pic) {
		this.roadmap_pic = roadmap_pic;
	}
	@Override
	public String toString() {
		return "Major [majorSeq=" + majorSeq + ", categories=" + categories + ", name=" + name + ", explaination="
				+ explaination + ", goal=" + goal + ", roadmap=" + roadmap + ", roadmap_pic=" + roadmap_pic + "]";
	}
	
	
	
}
