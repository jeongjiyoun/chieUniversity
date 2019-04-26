package com.university.chie.mapper;

import java.util.ArrayList;
import java.util.Map;

import com.university.chie.vo.Admin;
import com.university.chie.vo.Applicant;

public interface adminMapper {
	public Admin selectAdmin(Admin admin);
	
	public ArrayList<Map<String, String>> getStudentAdmin(String QUERY);
	
	public Map<String, String> getStudentInfoAdmin(String sreginum);

	public int setUserState(Map<String,String> map);
	
	public int insertStuState(Map<String,String> map);

	public int updateStuState(Map<String,String> map);
	
	public int alumiMake(Map<String, String> map);
	
	public int admitLecture(String lectureNum);

	public Admin loginAdmin(Admin admin);
	
	//applicant 뽑아오기
	public ArrayList<Applicant> selectApplicantAdmin();

	public Applicant pickApplicant(String applicantSeq);
	
	public int deleteApplicant(String applicantSeq);
}
