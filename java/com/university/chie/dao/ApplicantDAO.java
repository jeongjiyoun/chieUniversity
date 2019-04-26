package com.university.chie.dao;

import java.util.ArrayList;


import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.university.chie.mapper.applicantMapper;
import com.university.chie.util.PageNavigator;
import com.university.chie.vo.Applicant;

@Repository
public class ApplicantDAO {
	
	@Autowired
	SqlSession session;
	
	public ArrayList<Applicant> selectApplicantList(String applicantseq,int startRecord, int countPerPage){
		ArrayList<Applicant> applicant = null;
		
		RowBounds rb=new RowBounds(startRecord, countPerPage);//어디위치부터, 몇개까지
		
		applicantMapper mapper = session.getMapper(applicantMapper.class);
		
		try {
			applicant = mapper.selectApplicantList(rb,applicantseq);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return applicant;
	}
	
	
	public int countRecord(String search) {
		applicantMapper mapper = session.getMapper(applicantMapper.class);
		int total =0;
		//total = mapper.countRecord(search);
		return total;
	}
}
