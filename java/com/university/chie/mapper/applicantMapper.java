package com.university.chie.mapper;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.university.chie.vo.Applicant;

public interface applicantMapper {
	
	public ArrayList<Applicant> selectApplicantList(RowBounds rb, String applicantseq);
	
}
