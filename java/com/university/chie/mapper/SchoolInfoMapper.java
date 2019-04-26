package com.university.chie.mapper;

import java.util.ArrayList;
import java.util.Map;

import com.university.chie.vo.Applicant;
import com.university.chie.vo.Major;

public interface SchoolInfoMapper {

	public Major selectMajor(String majorSeq);
	
	public ArrayList<Map<String, String>> selectMajorProfessor(String majorSeq);
	 
	public ArrayList<Map<String, String>> selectMajorCurriculum(String majorSeq);
	
	public ArrayList<Major> majorList(String categories);
	
	public String checkMajor(String majorSeq);
	
	public Applicant checkA(Map<String, String> check);

	//insert 임시저장
	public int temSubmit(Applicant ap);
	
	//update 임시저장
	public int temSubmit2(Applicant ap);
	
	//최종제출
	public int fSubmit(Applicant ap);

}
