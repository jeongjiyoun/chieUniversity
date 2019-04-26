package com.university.chie.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.university.chie.mapper.MemberMapper;
import com.university.chie.util.Inverter;
import com.university.chie.vo.Professor;
import com.university.chie.vo.Student;

@Repository
public class MemberDAO {

	@Autowired
	SqlSession session;
	
	@Autowired
	Inverter in;
	
	public Student loginStudent(Map<String, String> map) {
		Student result = null;
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		try {
			result = mapper.loginStudent(map);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public Professor loginProfessor(Map<String, String> map) {
		Professor result = null;
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		try {
			result = mapper.loginProfessor(map);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;

	}

	public ArrayList<String> getIdByName(String name) {
		ArrayList<String> result = null;
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		try {
			result = mapper.getIdByName(name);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public String idFind(String email, String userName) {
		String result = null;
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		try { 
			result = mapper.idFind(email,userName);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	//미사용
	public String pwFind(String sreginum, String userName) {
		String result = null;
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		try { 
			result = mapper.pwFind(sreginum,userName);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public boolean pwUpdate(String sreginum, String password) {
		boolean result = false;
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		try { 
			result = in.invertBoolean(mapper.pwUpdate(sreginum,password));
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public boolean pwUpdateP(String preginum, String password) {
		boolean result = false;
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		try { 
			result = in.invertBoolean(mapper.pwUpdateP(preginum,password));
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public Student getInfo(String resultId) {
		Student result = null;
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		try { 
			result = mapper.getInfo(resultId);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public boolean UpdateMyInfoP(Map<String, String> map) {
		boolean result = false;
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		try {
			result = in.invertBoolean(mapper.UpdateMyInfoP(map));
			result = in.invertBoolean(mapper.UpdateMyInfoP1(map));
		} catch(Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public ArrayList<Map<String, String>> getTotNotice(String year) {
		ArrayList<Map<String, String>> result = null;
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		try {
			result = mapper.getTotNotice(year);
		} catch(Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public Map<String, String> getnewsDetail(String post) {
		Map<String, String> result = null;
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		try {
			result = mapper.getnewsDetail(post);
		} catch(Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public ArrayList<Map<String, String>> getdayList() {
		ArrayList<Map<String, String>> result = null;
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		try {
			result = mapper.getdayList();
		} catch(Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	
	


}