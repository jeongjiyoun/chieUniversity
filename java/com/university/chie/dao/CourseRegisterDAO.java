package com.university.chie.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.university.chie.mapper.CourseRegisterMapper;
import com.university.chie.vo.LectureTime;

@Repository
public class CourseRegisterDAO {
	
	@Autowired
	SqlSession session;
	
	
	public ArrayList<Integer> selectAllCredits(HashMap<String,String> sInfo){
		ArrayList<Integer> result = null;
		CourseRegisterMapper mapper = session.getMapper(CourseRegisterMapper.class);
		try {
			result = mapper.selectAllCredits(sInfo);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return result;
		
	}
	
	
	public int selectSemester() {
		int result = 0;
		CourseRegisterMapper mapper = session.getMapper(CourseRegisterMapper.class);
		try {
			result = mapper.selectSemester();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return result;
	}
	
	public ArrayList<HashMap<String,String>> selectMySignUp(HashMap<String,String> myInfo){
		ArrayList<HashMap<String,String>> result = null;
		CourseRegisterMapper mapper = session.getMapper(CourseRegisterMapper.class);
		try {
			result = mapper.selectMySignUp(myInfo);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return result;
	}
	
	public ArrayList<HashMap<String,String>> searchMajor(String categories){
		ArrayList<HashMap<String,String>> result = null;
		CourseRegisterMapper mapper = session.getMapper(CourseRegisterMapper.class);
		try {
			result = mapper.searchMajor(categories);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return result;
	}
	
	public ArrayList<HashMap<String, String>> selectCourseType(HashMap<String,String> type){
		ArrayList<HashMap<String,String>> result = null;
		CourseRegisterMapper mapper = session.getMapper(CourseRegisterMapper.class);
		try {
			result = mapper.selectCourseType(type);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return result;
	}
	
	public ArrayList<HashMap<String,String>> selectCourseMajor(HashMap<String,String> majorInfo){
		ArrayList<HashMap<String,String>> result = null;
		CourseRegisterMapper mapper = session.getMapper(CourseRegisterMapper.class);
		try {
			result = mapper.selectCourseMajor(majorInfo);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return result;
	}
	
	public ArrayList<HashMap<String,String>> selectKeyWord(HashMap<String,String> key){
		ArrayList<HashMap<String,String>> result = null;
		CourseRegisterMapper mapper = session.getMapper(CourseRegisterMapper.class);
		try {
			result = mapper.selectKeyWord(key);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return result;
	}
	
	public HashMap<String,String> selectLectureInfo(String lectureNum){
		HashMap<String,String> result = null;
		CourseRegisterMapper mapper = session.getMapper(CourseRegisterMapper.class);
		try {
			result = mapper.selectLectureInfo(lectureNum);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return result;
	}
	
	//if it is null,the student can register course
	public int checkRegister(HashMap<String,String> check) {
		int result = 0;
		CourseRegisterMapper mapper = session.getMapper(CourseRegisterMapper.class);
		try {
			result = mapper.checkRegister(check);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
		
	}
	
	public int courseRegister(HashMap<String,String> info) {
		int result = 0;
		CourseRegisterMapper mapper = session.getMapper(CourseRegisterMapper.class);
		try {
			result = mapper.courseRegister(info);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public ArrayList<HashMap<String,String>> stuRegisInfo(HashMap<String,String> sInfo){
		ArrayList<HashMap<String,String>> result = null;
		CourseRegisterMapper mapper = session.getMapper(CourseRegisterMapper.class);
		try {
			result = mapper.stuRegisInfo(sInfo);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return result;
	}
	
	//for get registered data for timetable print
	public ArrayList<HashMap<String,String>> TotalstuRegisInfo(String sregiNum){
		ArrayList<HashMap<String,String>> result = null;
		CourseRegisterMapper mapper = session.getMapper(CourseRegisterMapper.class);
		try {
			result = mapper.TotalstuRegisInfo(sregiNum);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return result;
	}
	
	public ArrayList<LectureTime> lectureRealTime(String lectureNum){
		ArrayList<LectureTime> result = null;
		CourseRegisterMapper mapper = session.getMapper(CourseRegisterMapper.class);
		try {
			result = mapper.lectureRealTime(lectureNum);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return result;
	}
	
	public ArrayList<HashMap<String,String>> selectTimeTable(String sregiNum){
		ArrayList<HashMap<String,String>> result = null;
		CourseRegisterMapper mapper = session.getMapper(CourseRegisterMapper.class);
		try {
			result = mapper.selectTimeTable(sregiNum);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return result;
		
	}
}
