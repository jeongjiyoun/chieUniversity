package com.university.chie.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.university.chie.mapper.StudentMapper;
import com.university.chie.util.Inverter;

@Repository
public class StudentDao {

	@Autowired
	SqlSession session;
	
	@Autowired
	Inverter in;

	//get LectureList data
	public ArrayList<Map<String, String>> getSubList(String loginId) {
		ArrayList<Map<String, String>> result = null;
		StudentMapper mapper = session.getMapper(StudentMapper.class);
		try {
			result = mapper.getSubList(loginId);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	//get lectureList Time
	public ArrayList<Map<String, String>> getSubList1(String loginId) {
		ArrayList<Map<String, String>> result = null;
		StudentMapper mapper = session.getMapper(StudentMapper.class);
		try {
			result = mapper.getSubList1(loginId);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	
	// course LECTURE DETAIL
		public Map<String, String> getSubjectDetail(String lecturenum){
			Map<String, String> result = null;
			StudentMapper mapper = session.getMapper(StudentMapper.class);
			try {
				result = mapper.getSubjectDetail(lecturenum);
			} catch(Exception e) {
				e.printStackTrace();
				return result;
			}
			return result;
		}

		public ArrayList<Map<String, String>> getMovieList(String lecturenum, String sreginum) {
			ArrayList<Map<String, String>> result = null;
			StudentMapper mapper = session.getMapper(StudentMapper.class);
			try {
				result = mapper.getMovieList(lecturenum, sreginum);
			} catch(Exception e) {
				e.printStackTrace();
				return result;
			}
			return result;
		}

		public Map<String, String> getMovie(String courseSeq) {
			Map<String, String> result = null;
			StudentMapper mapper = session.getMapper(StudentMapper.class);
			try {
				result = mapper.getMovie(courseSeq);
			} catch(Exception e) {
				e.printStackTrace();
				return result;
			}
			return result;
		}

		public String startTime(String sreginum, String courseNum) {
			String result = null;
			StudentMapper mapper = session.getMapper(StudentMapper.class);
			try {
				result = mapper.startTime(sreginum, courseNum);
			} catch(Exception e) {
				e.printStackTrace();
				return result;
			}
			return result;
		}

		public boolean endWatch(String courseSeq, String loginId) {
			boolean result = false;
			StudentMapper mapper = session.getMapper(StudentMapper.class);
			try {
				result = in.invertBoolean(mapper.endWatch(courseSeq, loginId));
			} catch(Exception e) {
				e.printStackTrace();
				return result;
			}
			return result;
		}

		public boolean checkpass(Map<String, String> map) {
			boolean result = false;
			StudentMapper mapper = session.getMapper(StudentMapper.class);
			try {
				result = in.invertBoolean(mapper.checkpass(map));
			} catch(Exception e) {
				e.printStackTrace();
				return result;
			}
			return result;
		}

		public Map<String, String> getMyInfo(String loginId) {
			Map<String, String> result = null;
			StudentMapper mapper = session.getMapper(StudentMapper.class);
			try {
				result = mapper.getMyInfo(loginId);
			} catch(Exception e) {
				e.printStackTrace();
				return result;
			}
			return result;
		}
		
		
		public boolean UpdateMyInfo(Map<String, String> map) {
			boolean result = false;
			StudentMapper mapper = session.getMapper(StudentMapper.class);
			try {
				result = in.invertBoolean(mapper.UpdateMyInfo(map));
			} catch(Exception e) {
				e.printStackTrace();
				return result;
			}
			return result;
		}

		public String getUDATE(String loginId) {
			String result = null;
			StudentMapper mapper = session.getMapper(StudentMapper.class);
			try {
				result = mapper.getUDATE(loginId);
			} catch(Exception e) {
				e.printStackTrace();
				return result;
			}
			return result;
		}

		public ArrayList<Map<String, String>> leaveOfAbsence(String loginId) {
			ArrayList<Map<String, String>> result = null;
			StudentMapper mapper = session.getMapper(StudentMapper.class);
			try {
				result = mapper.leaveOfAbsence(loginId);
			} catch(Exception e) {
				e.printStackTrace();
				return result;
			}
			return result;
		}

		public ArrayList<Map<String, String>> getSubjectTime(String loginId) {
			ArrayList<Map<String, String>> result = null;
			StudentMapper mapper = session.getMapper(StudentMapper.class);
			try {
				result = mapper.getSubjectTime(loginId);
			} catch(Exception e) {
				e.printStackTrace();
				return result;
			}
			return result;
		}
		
		public Map<String, String> getAssessmentInfo(String smseq) {
			Map<String, String> result = null;
			StudentMapper mapper = session.getMapper(StudentMapper.class);
			try {
				result = mapper.getAssessmentInfo(smseq);
			} catch(Exception e) {
				e.printStackTrace();
				return result;
			}
			return result;
		}
		
		public boolean assessProfessor(Map<String,String> map) {
			boolean result = false;
			StudentMapper mapper = session.getMapper(StudentMapper.class);
			try {
				result = in.invertBoolean(mapper.assessProfessor(map));
			} catch(Exception e) {
				e.printStackTrace();
				return result;
			}
			return result;
		}
		
}
