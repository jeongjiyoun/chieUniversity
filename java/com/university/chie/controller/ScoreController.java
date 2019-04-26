package com.university.chie.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.university.chie.dao.ScoreDAO;
import com.university.chie.vo.Score;


@Controller
public class ScoreController {
	
	@Autowired
	ScoreDAO sDAO;
	//학생 MyGrade로 가기 
	@RequestMapping(value="/MyGrade",method=RequestMethod.GET)
	public String MyGrade(Model model, HttpSession session) {
		String sreginum =String.valueOf(session.getAttribute("loginId"));
		ArrayList<Map<String, String>> seList =new ArrayList<Map<String, String>>();
		seList = sDAO.selectSemester(sreginum);
		ArrayList<String> yList= new ArrayList<String>();
		ArrayList<String> semList= new ArrayList<String>();
		
		for (Map<String, String> map : seList) {
			yList.add(String.valueOf(map.get("YEAR")));
			semList.add(String.valueOf(map.get("SEMESTER")));
		}
		
		ArrayList<String> yListF= new ArrayList<String>();
		   for (int i = 0; i < yList.size(); i++) {
             if (!yListF.contains(yList.get(i))) {
             	yListF.add(yList.get(i));
             }
         }
		
		ArrayList<String> semListF= new ArrayList<String>();
		   for (int i = 0; i < semList.size(); i++) {
	         if (!semListF.contains(semList.get(i))) {
	        	 semListF.add(semList.get(i));
	            }
	         }
		   
//		System.out.println("yListF "+yListF );
		model.addAttribute("yList", yListF);

//		System.out.println("semListF "+semListF );
		model.addAttribute("semList", semListF);

		return "student/MyGrade";
	}
	
	// 학생의 모든 점수를 DB에서 조회함.
		@RequestMapping (value="/selectAll", method=RequestMethod.POST)
		public @ResponseBody ArrayList<Map<String, String>> selectAll(String lectureNum, String type) {
			ArrayList<Map<String, String>> sList = null;
			HashMap<String, String> option = new HashMap<String, String>();
			try {
				option.put("lectureNum", lectureNum);
				option.put("type", type);
				System.out.println(option);
				sList = sDAO.selectAll(option);
				System.out.println(sList);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return sList;
	}
		
		@RequestMapping (value="/goSPopup", method=RequestMethod.GET)
		public String goSPopup(Model model, String score_seq, String lectureNum) {
			Map<String,String> result = null;
			try {
				result = sDAO.selectScore(score_seq);
				model.addAttribute("lectureNum", lectureNum);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			model.addAttribute("score", result);
			return "professor/scoreCont";
		}
	
	//팝업창에 띄워질 학생의 점수
		@RequestMapping (value="/selectScore", method=RequestMethod.GET)
		public @ResponseBody Map<String,String> selectScore(String score_seq) {
			Map<String,String> score = null;
			try {
				score = sDAO.selectScore(score_seq);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return score;
	}
	
	//점수등록
		@RequestMapping (value="/insertScore", method=RequestMethod.POST)
		public @ResponseBody String insertScore(Score score) {
			int result = 0;
		try {
			result = sDAO.insertScore(score);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
			if (result==0) {
				return "登録失敗";
			}return "登録成功";
		}

	//팝업창에 띄워질 점수비율
		@RequestMapping (value="/selectScorePCT", method=RequestMethod.GET)
		public @ResponseBody Map<String, Integer> selectScorePCT(String lectureNum) {
			Map<String, Integer> scorePCT = null;
			try {
				scorePCT = sDAO.selectScorePCT(lectureNum);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return scorePCT;
		}
		
	//도넛차트 
		@RequestMapping (value="/insertScoreGrade", method=RequestMethod.POST)
		public @ResponseBody String insertScoreGrade(String score_seq, String score_grade) {
			int result = 0;
			try {
			result = sDAO.insertScoreGrade(score_seq, score_grade);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}	if (result==0) {
				return "登録失敗";
			}return "登録成功";
		}

		//등급배열가져오기
		@RequestMapping (value="/selectScore_grade", method=RequestMethod.POST)
		public @ResponseBody ArrayList<String> selectScore_grade(String lectureNum) {
			ArrayList<String> result = null;
			try {
			result = sDAO.selectScore_grade(lectureNum);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
			return result;
		}
		
		//isFianl바꿔주기
		@RequestMapping (value="/changeIsfinal", method=RequestMethod.POST)
		public @ResponseBody String changeIsfinal(String lectureNum) {
			int result = 0;
			try {
				System.out.println("lectureNumCC"+lectureNum);
				result = sDAO.changeIsfinal(lectureNum);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			if (result ==0) {
				return "登録失敗";
			} else {
				return "登録成功";
			}
		}
		
		// 개인의 scoreType에 따라 모든 점수를   DB에서 조회함.
				@RequestMapping (value="/arrayScore", method=RequestMethod.POST)
				public @ResponseBody ArrayList<Map<String, String>> arrayScore(String lectureNum, String scoreType) {
					ArrayList<Map<String, String>> sList = null;
					HashMap<String, String> option = new HashMap<String, String>();
					try {
						option.put("lectureNum", lectureNum);
						option.put("scoreType", scoreType);
						sList = sDAO.selectAll(option);
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
					return sList;
			}

		
//개인의 모든 점수를 DB에서 조회함.
		@RequestMapping (value="/selectStudentScore", method=RequestMethod.POST)
		public @ResponseBody ArrayList<Map<String, String>> selectStudentScore(String sreginum) {
			ArrayList<Map<String, String>> sList = null;
			try {
				sList = sDAO.selectStudentScore(sreginum);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return sList;
	}

//학생이 재학한 년도와 학기를 뽑아옴
		@RequestMapping (value="/selectSemester", method=RequestMethod.POST)
		public @ResponseBody ArrayList<Map<String, String>> selectSemester(String sreginum, Model model) {
			ArrayList<Map<String, String>> seList = null;
			try {
				seList = sDAO.selectSemester(sreginum);
//				System.out.println("sreginum "+sreginum);
				model.addAttribute("seList", seList);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return seList;
		}
//연도에 따른 성적 뽑아내기
		
		@RequestMapping (value="/selectScoreYearType", method=RequestMethod.POST)
		public @ResponseBody ArrayList<Map<String, String>> selectScoreYearType(String sreginum, String year) {
			ArrayList<Map<String, String>> result = null;
			Map<String, String> option = new HashMap<String, String>();
			option.put("sreginum", sreginum);
			option.put("year", year);
			
			System.out.println("selectScoreYearType"+option);
			try {
				result = sDAO.selectScoreYearType(option);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return result;
		}
		
//연도, 학기에 대한 성적뽑아오기	
		@RequestMapping (value="/selectScoreSemesterType", method=RequestMethod.POST)
		public @ResponseBody ArrayList<Map<String, String>> selectScoreSemesterType(String sreginum, String year, String semester) {
			ArrayList<Map<String, String>> result = null;
			Map<String, String> option =  new HashMap<String, String>();
			
			option.put("sreginum", sreginum);
			option.put("semester", semester);

			if (year!=null) {
				year =  "and sm.year ="+ year;	
		
			}
			System.out.println("학기" + semester +"학생번호 "+sreginum +"연도" +year);
			option.put("year", year);
			
			try {
				result = sDAO.selectScoreSemesterType(option);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return result;
		}

}
