package com.university.chie.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.university.chie.mapper.SchoolInfoMapper;
import com.university.chie.vo.Applicant;
import com.university.chie.vo.Major;

@Repository
public class SchoolInfoDAO {

	@Autowired
	SqlSession session;

	public Major selectMajor(String majorSeq) {
		Major result = new Major();
		System.out.println("dao : "+majorSeq);
		SchoolInfoMapper mapper = session.getMapper(SchoolInfoMapper.class);
		
		try {
			result = mapper.selectMajor(majorSeq);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Map<String, String>> selectMajorProfessor(String majorSeq){
		ArrayList<Map<String, String>> result = new ArrayList<>();
		SchoolInfoMapper mapper = session.getMapper(SchoolInfoMapper.class);
		try {
			result = mapper.selectMajorProfessor(majorSeq);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Map<String, String>> selectMajorCurriculum(String majorSeq){
		ArrayList<Map<String, String>> result = new ArrayList<>();
		SchoolInfoMapper mapper = session.getMapper(SchoolInfoMapper.class);
		try {
			result = mapper.selectMajorCurriculum(majorSeq);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Major> majorList(String categories){
		ArrayList <Major> mList = new ArrayList<>();
		SchoolInfoMapper mapper = session.getMapper(SchoolInfoMapper.class);
		try {
			mList = mapper.majorList(categories);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return mList;
	}
	public String checkMajor(String majorSeq) {
		String result = null;
		SchoolInfoMapper mapper = session.getMapper(SchoolInfoMapper.class);
		try {
			result = mapper.checkMajor(majorSeq);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	//�ӽ������س��� ��� Ȯ��
	public Applicant checkA(Map<String, String> check) {
		Applicant result = null;
		SchoolInfoMapper mapper = session.getMapper(SchoolInfoMapper.class);
		try {
			result = mapper.checkA(check);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	//insert �ϴ� �ӽ�����
	public int temSubmit(Applicant ap) {
		int result = 0;
		SchoolInfoMapper mapper = session.getMapper(SchoolInfoMapper.class);
		try {
			result = mapper.temSubmit(ap);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	//update �ϴ� �ӽ�����
	public int temSubmit2(Applicant ap) {
		int result = 0;
		SchoolInfoMapper mapper = session.getMapper(SchoolInfoMapper.class);
		try {
			result = mapper.temSubmit2(ap);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	//��������
	public int fSubmit(Applicant ap) {
		int result = 0;
		SchoolInfoMapper mapper = session.getMapper(SchoolInfoMapper.class);
		try {
			result = mapper.fSubmit(ap);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
}
