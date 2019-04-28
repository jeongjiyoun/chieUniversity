package com.university.chie.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.university.chie.mapper.ProfessorMapper;
import com.university.chie.mapper.StudentMapper;
import com.university.chie.util.Inverter;

@Repository
public class ProfessorDAO {

	@Autowired
	SqlSession session;
	
	@Autowired
	Inverter in;

	public ArrayList<Map<String, String>> getProfessor(String loginId) {
		ArrayList<Map<String, String>> result = null;
		ProfessorMapper mapper = session.getMapper(ProfessorMapper.class);
		try {
			result = mapper.getProfessor(loginId);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public ArrayList<Map<String, String>> getSubjectList(String loginId) {
		ArrayList<Map<String, String>> result = null;
		ProfessorMapper mapper = session.getMapper(ProfessorMapper.class);
		try {
			result = mapper.getSubjectList(loginId);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public ArrayList<Map<String, String>> getCourseList(String lecturenum) {
		ArrayList<Map<String, String>> result = null;
		ProfessorMapper mapper = session.getMapper(ProfessorMapper.class);
		try {
			result = mapper.getCourseList(lecturenum);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public boolean setCourse(Map<String, String> map) {
		boolean result = false;
		ProfessorMapper mapper = session.getMapper(ProfessorMapper.class);
		try {
			result = in.invertBoolean(mapper.setCourse(map));
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public ArrayList<String> getSemesterData(String preginum) {
		ArrayList<String> result = null;
		ProfessorMapper mapper = session.getMapper(ProfessorMapper.class);
		try {
			result = mapper.getSemesterData(preginum);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public ArrayList<Map<String, String>> getSubjectListP(Map<String, String>map) {
		ArrayList<Map<String, String>> result = null;
		ProfessorMapper mapper = session.getMapper(ProfessorMapper.class);
		try {
			result = mapper.getSubjectListP(map);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public ArrayList<Map<String, String>> getSubjectListP1(Map<String, String> map){
		ArrayList<Map<String, String>> result = null;
		ProfessorMapper mapper = session.getMapper(ProfessorMapper.class);
		try {
			result = mapper.getSubjectListP1(map);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;		
	}

	public ArrayList<Map<String, String>> getMovieP(String lecturenum) {
		ArrayList<Map<String, String>> result = null;
		ProfessorMapper mapper = session.getMapper(ProfessorMapper.class);
		try {
			result = mapper.getMovieP(lecturenum);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public Map<String, String> getSubjectManageP(String courseseq) {
		Map<String, String> result = null;
		ProfessorMapper mapper = session.getMapper(ProfessorMapper.class);
		try {
			result = mapper.getSubjectManageP(courseseq);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public ArrayList<Map<String, String>> getMyConsultData(String loginId) {
		ArrayList<Map<String, String>> result = null;
		ProfessorMapper mapper = session.getMapper(ProfessorMapper.class);
		try {
			result = mapper.getMyConsultData(loginId);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public Map<String, String> getMyInfoP(String loginId) {
		Map<String, String> result = null;
		ProfessorMapper mapper = session.getMapper(ProfessorMapper.class);
		try {
			result = mapper.getMyInfoP(loginId);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public String getUDATEP(String loginId) {
			String result = null;
			ProfessorMapper mapper = session.getMapper(ProfessorMapper.class);
			try {
				result = mapper.getUDATEP(loginId);
			} catch(Exception e) {
				e.printStackTrace();
				return result;
			}
			return result;
	}

	public ArrayList<Map<String, String>> getSubjectTime(String loginId) {
		ArrayList<Map<String, String>> result = null;
		ProfessorMapper mapper = session.getMapper(ProfessorMapper.class);
		try {
			result = mapper.getSubjectTime(loginId);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
}
