package com.university.chie.mapper;

import java.util.ArrayList;
import java.util.Map;

import com.university.chie.vo.Score;


public interface ScoreMapper {

	public ArrayList<Map<String,String>> selectAll (Map<String, String> option);
	
	public Map<String,String> selectScore(String score_seq);
	
	public int insertScore(Score score);

	public Map<String, Integer> selectScorePCT(String lectureNum);

	public int insertScoreGrade(String score_seq, String score_grade);

	public ArrayList<String> selectScore_grade(String lectureNum);

	public int changeIsfinal(String lectureNum);
	
	public ArrayList<Map<String,String>> arrayScore (Map<String, String> option);
	
	public ArrayList<Map<String,String>> selectStudentScore (String sreginum);
	
	public ArrayList<Map<String, String>> selectSemester(String sreginum);
	
	public ArrayList<Map<String, String>> selectScoreYearType(Map<String, String> option);

	public ArrayList<Map<String, String>> selectScoreSemesterType(Map<String, String> option);
	
}
