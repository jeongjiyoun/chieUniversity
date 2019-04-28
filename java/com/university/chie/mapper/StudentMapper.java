package com.university.chie.mapper;

import java.util.ArrayList;
import java.util.Map;

public interface StudentMapper {

	//LectureList
	public ArrayList<Map<String, String>> getSubList(String loginId);

	//LectureList Time
	public ArrayList<Map<String, String>> getSubList1(String loginId);
	
	//LECTURE DETAIL
	public Map<String, String> getSubjectDetail(String lecturenum);

	//Moive List
	public ArrayList<Map<String, String>> getMovieList(String lecturenum, String sreginum);

	//getMovie
	public Map<String, String> getMovie(String courseSeq);

	//start Course
	public String startTime(String sreginum, String courseSeq);

	//강의 종료시
	public int endWatch(String courseSeq, String loginId);

	//if pass check
	public int checkpass(Map<String, String> map);

	//get Student My Info
	public Map<String, String> getMyInfo(String loginId);

	//update myInfo
	public int UpdateMyInfo(Map<String, String> map);

	//get Lately update password day
	public String getUDATE(String loginId);

	public ArrayList<Map<String, String>> leaveOfAbsence(String loginId);

	//get Subject time for timetable
	public ArrayList<Map<String, String>> getSubjectTime(String loginId);
	
	public Map<String, String> getAssessmentInfo(String smseq);
	
	public int assessProfessor(Map<String, String> map);
}
