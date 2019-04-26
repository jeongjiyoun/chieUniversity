package com.university.chie.mapper;

import java.util.ArrayList;
import java.util.Map;

public interface ExamMapper {

	public Map<String, String> getQuestion1(String EXAMSEQ2);

	public Map<String, String> getQuestion2(String EXAMSEQ2);

	public Map<String, String> getQuestion0(String EXAMSEQ2);

	public Map<String, String> startExam(String examSeq);

	public int saveAnswer(Map<String, String> map);
	
	public ArrayList<Map<String, String>> getExamList(String lecturenum);
	
}
