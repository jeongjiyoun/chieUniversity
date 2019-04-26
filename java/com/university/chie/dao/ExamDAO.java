package com.university.chie.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.university.chie.mapper.ExamMapper;
import com.university.chie.util.Inverter;

@Repository
public class ExamDAO {

	@Autowired
	SqlSession session;

	@Autowired
	Inverter in;

	public Map<String, String> getQuestion1(String EXAMSEQ2) {
		ExamMapper mapper = session.getMapper(ExamMapper.class);
		Map<String, String> result = null;
		try {
			result = mapper.getQuestion1(EXAMSEQ2);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public Map<String, String> getQuestion0(String EXAMSEQ2) {
		ExamMapper mapper = session.getMapper(ExamMapper.class);
		Map<String, String> result = null;
		try {
			result = mapper.getQuestion0(EXAMSEQ2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	public Map<String, String> getQuestion2(String EXAMSEQ2) {
		ExamMapper mapper = session.getMapper(ExamMapper.class);
		Map<String, String> result = null;
		try {
			result = mapper.getQuestion2(EXAMSEQ2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public Map<String, String> startExam(String examSeq) {
		ExamMapper mapper = session.getMapper(ExamMapper.class);
		Map<String, String> result = null;
		try {
			result = mapper.startExam(examSeq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean saveAnswer(String answer, String exam_Seq2, String loginId, String intime) {
		ExamMapper mapper = session.getMapper(ExamMapper.class);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("ANSWER", answer);
		map.put("EXAMSEQ2", exam_Seq2);
		map.put("SREGINUM", loginId);
		map.put("INTIME", intime);

		boolean result = false;
		try {
			result = in.invertBoolean(mapper.saveAnswer(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}

	public ArrayList<Map<String, String>> getExamList(String lecturenum) {
		ExamMapper mapper = session.getMapper(ExamMapper.class);
		ArrayList<Map<String, String>> result = null;
		try {
			result = mapper.getExamList(lecturenum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
