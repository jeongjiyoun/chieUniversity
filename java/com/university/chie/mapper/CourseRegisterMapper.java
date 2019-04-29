package com.university.chie.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.university.chie.vo.LectureTime;

public interface CourseRegisterMapper {

	public int selectSemester();
	
	public ArrayList<HashMap<String,String>> selectMySignUp(HashMap<String,String> myInfo);
	
	public ArrayList<HashMap<String,String>> searchMajor(String categories);
	
	public ArrayList<HashMap<String,String>> selectCourseType(HashMap<String,String> type);
	
	public ArrayList<HashMap<String,String>> selectCourseTypeT(HashMap<String,String> type);
	
	public ArrayList<HashMap<String,String>> selectCourseMajor(HashMap<String,String> majorInfo);
	
	public ArrayList<HashMap<String,String>> selectCourseMajorT(HashMap<String,String> majorInfo);
	
	public ArrayList<HashMap<String,String>> selectKeyWord(HashMap<String,String> key);
	
	public HashMap<String,String> selectLectureInfo(String lectureNum);
	
	public int checkRegister(HashMap<String,String> check);
	
	public int courseRegister(HashMap<String,String> info);
	
	public ArrayList<HashMap<String,String>> stuRegisInfo(HashMap<String,String> sInfo);

	public ArrayList<HashMap<String,String>> TotalstuRegisInfo(String sregiNum);

	public ArrayList<LectureTime> lectureRealTime(String lectureNum);
	
	public ArrayList<HashMap<String,String>> selectTimeTable(String sregiNum);
	
	public ArrayList<Integer> selectAllCredits(HashMap<String,String> sInfo);
}
