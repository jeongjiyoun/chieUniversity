package com.university.chie.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.university.chie.mapper.CertificateMapper;
import com.university.chie.vo.Transcript;

@Repository
public class CertificateDAO {
	
	@Autowired
	SqlSession session;
	
	public HashMap<String, String> selectEnroll(HashMap<String,String> sInfo){
		HashMap<String,String> result = null;
		CertificateMapper mapper = session.getMapper(CertificateMapper.class);
		try {
			result = mapper.selectEnroll(sInfo);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public HashMap<String,String> selectAbsence(HashMap<String,String> sInfo){
		HashMap<String,String> result = null;
		CertificateMapper mapper = session.getMapper(CertificateMapper.class);
		try {
			result = mapper.selectAbsence(sInfo);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public HashMap<String,String> checkStatus(String sregiNum){
		HashMap<String,String> result = null;
		CertificateMapper mapper = session.getMapper(CertificateMapper.class);
		try {
			result = mapper.checkStatus(sregiNum);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public HashMap<String,String> selectAlumi(HashMap<String,String> sInfo){
		HashMap<String,String> result = null;
		CertificateMapper mapper = session.getMapper(CertificateMapper.class);
		try {
			result = mapper.selectAlumi(sInfo);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public ArrayList<Transcript> selectTranscript(String sregiNum){
		ArrayList<Transcript> result = null;
		CertificateMapper mapper = session.getMapper(CertificateMapper.class);
		try {
			result = mapper.selectTranscript(sregiNum);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public HashMap<String,String> selectSInfo(String sregiNum){
		HashMap<String,String> result = null;
		CertificateMapper mapper = session.getMapper(CertificateMapper.class);
		try {
			result = mapper.selectSInfo(sregiNum);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
		
	}
}
