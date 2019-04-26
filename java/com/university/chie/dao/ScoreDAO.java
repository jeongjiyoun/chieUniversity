package com.university.chie.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.university.chie.mapper.ScoreMapper;
import com.university.chie.vo.Score;

@Repository
public class ScoreDAO {

	@Autowired
	SqlSession session;
	
	public ArrayList<Map<String,String>> selectAll(Map<String, String> option){
		ArrayList<Map<String,String>> result = null;
		ScoreMapper mapper = session.getMapper(ScoreMapper.class);
		try {
			result = mapper.selectAll(option);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	public Map<String, String> selectScore(String score_seq) {
		Map<String, String> result = null;
		ScoreMapper mapper = session.getMapper(ScoreMapper.class);
		try {
			result = mapper.selectScore(score_seq);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	public int insertScore(Score score) {
		int result = 0;
		ScoreMapper mapper = session.getMapper(ScoreMapper.class);
		try {
			result = mapper.insertScore(score);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	public Map<String, Integer> selectScorePCT(String lectureNum){
		Map<String, Integer> result = null;
		ScoreMapper mapper = session.getMapper(ScoreMapper.class);
		try {
			result = mapper.selectScorePCT(lectureNum);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	public int insertScoreGrade(String score_seq, String score_grade) {
		int result = 0;
		ScoreMapper mapper = session.getMapper(ScoreMapper.class);
		try {
//			System.out.println("dao : score_grade " +score_grade);
			result = mapper.insertScoreGrade(score_seq, score_grade);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	public ArrayList<String> selectScore_grade(String lectureNum){
		ArrayList<String> result = null;
		ScoreMapper mapper = session.getMapper(ScoreMapper.class);
		try {
			result = mapper.selectScore_grade(lectureNum);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	public int changeIsfinal(String lectureNum) {
		int result = 0;
		ScoreMapper mapper = session.getMapper(ScoreMapper.class);
		try {
			result = mapper.changeIsfinal(lectureNum);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	public ArrayList<Map<String,String>> arrayScore (Map<String, String> option){
		ArrayList<Map<String,String>> result = null;
		ScoreMapper mapper = session.getMapper(ScoreMapper.class);
		try {
			result = mapper.selectAll(option);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Map<String,String>> selectStudentScore (String sreginum){
		ArrayList<Map<String,String>> result = null;
		ScoreMapper mapper = session.getMapper(ScoreMapper.class);
		try {
			result = mapper.selectStudentScore(sreginum);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Map<String, String>> selectSemester(String sreginum){
		ArrayList<Map<String,String>> result = null;
		ScoreMapper mapper = session.getMapper(ScoreMapper.class);
		try {
			result = mapper.selectSemester(sreginum);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	public ArrayList<Map<String, String>> selectScoreYearType(Map<String, String> option){
		ArrayList<Map<String, String>> result = null;
		ScoreMapper mapper = session.getMapper(ScoreMapper.class);
		try {
			result = mapper.selectScoreYearType(option);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Map<String, String>> selectScoreSemesterType(Map<String, String> option){
		ArrayList<Map<String, String>> result = null;
		ScoreMapper mapper = session.getMapper(ScoreMapper.class);
		try {
			result = mapper.selectScoreSemesterType(option);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}	
}



