package com.university.chie.mapper;

import java.util.ArrayList;
import java.util.Map;

public interface ProfessorMapper {

	public ArrayList<Map<String, String>> getProfessor(String loginId);

	public ArrayList<Map<String, String>> getCourseList(String lecturenum);

	public ArrayList<Map<String, String>> getSubjectList(String loginId);

	public int setCourse(Map<String, String> map);
	
	public ArrayList<String> getSemesterData(String preginum);

	public ArrayList<Map<String, String>> getSubjectListP(Map<String, String> map);

	public ArrayList<Map<String, String>> getMovieP(String lecturenum);
	
	public Map<String, String> getSubjectManageP(String courseseq);

	public ArrayList<Map<String, String>> getMyConsultData(String loginId);

	public Map<String, String> getMyInfoP(String loginId);

	public String getUDATEP(String loginId);

	public ArrayList<Map<String, String>> getSubjectTime(String loginId);

}
