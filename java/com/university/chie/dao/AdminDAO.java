package com.university.chie.dao;


import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.university.chie.mapper.adminMapper;
import com.university.chie.vo.Admin;
import com.university.chie.vo.Applicant;

@Repository
public class AdminDAO {
	
	@Autowired
	SqlSession session;
	
	public Admin loginAdmin(Admin admin) {
		Admin result = null;
		
		adminMapper mapper = session.getMapper(adminMapper.class);
		
		try {
			result = mapper.loginAdmin(admin);
		} catch (Exception e) {
			// TODO: handle exception
			return result;
		}
		
		return result;
	}
	public ArrayList<Applicant> selectApplicantAdmin(){
		ArrayList <Applicant> result = null;
		adminMapper mapper = session.getMapper(adminMapper.class);
		try {
			result = mapper.selectApplicantAdmin();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	
	public ArrayList<Map<String, String>> getStudentAdmin(String QUERY){
		ArrayList<Map<String, String>> result = null;
		adminMapper mapper = session.getMapper(adminMapper.class);
		try {
			result = mapper.getStudentAdmin(QUERY);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;		
		
	}
	
	public Map<String, String> getStudentInfoAdmin(String sreginum){
		Map<String, String> result = null;
		adminMapper mapper = session.getMapper(adminMapper.class);
		try {
			result = mapper.getStudentInfoAdmin(sreginum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;		
		
	}

	//applicant의 seq를 받아서 팝업창에서 띄우는 것 
	public Applicant pickApplicant(String applicantSeq) {
		Applicant result = null;
		adminMapper mapper = session.getMapper(adminMapper.class);
		try {
			result =mapper.pickApplicant(applicantSeq);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	//불합격한 입한신청자 날려버릭
	public int deleteApplicant(String applicantSeq) {
		int result = 0;
		adminMapper mapper = session.getMapper(adminMapper.class);
		try {
			result = mapper.deleteApplicant(applicantSeq);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
}
