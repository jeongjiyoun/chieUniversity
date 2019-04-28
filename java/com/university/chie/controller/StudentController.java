package com.university.chie.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.university.chie.dao.ProfessorDAO;
import com.university.chie.dao.StudentDao;
import com.university.chie.util.FileService;

@Controller

public class StudentController {

	@Autowired
	StudentDao sdao;
	
	@Autowired
	ProfessorDAO pdao;
	//학생페이지로 가는것 1
	@RequestMapping(value = "/sMyPage", method = RequestMethod.GET)
	public String sMyPage (Model model) {

		return "redirect:/myPage";
	}	
	//학생페이지로 가는것 2
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage () {
		return "student/myPage";
	}
	
	@RequestMapping(value="/MyInformation",method=RequestMethod.GET)
	public String MyInformation(HttpSession session, Model model) {
		String userType = (String) session.getAttribute("userType");
		switch (userType) {
		case "P":
			Map<String, String> map1 = pdao.getMyInfoP((String) session.getAttribute("loginId"));
			String tel1 = map1.get("TEL");
			map1.put("TEL1", tel1.substring(0,3));
			map1.put("TEL2", tel1.substring(3,7));
			map1.put("TEL3", tel1.substring(7));
			String tel2 = map1.get("JTEL");
			map1.put("TEL4", tel2.substring(0,3));
			map1.put("TEL5", tel2.substring(3,7));
			map1.put("TEL6", tel2.substring(7));
			model.addAttribute("USER", map1);
			return "professor/MyInformation";			
			
		case "S" :
			Map<String, String> map = sdao.getMyInfo((String) session.getAttribute("loginId"));
			String tel = map.get("TEL");
			map.put("TEL1", tel.substring(0,3));
			map.put("TEL2", tel.substring(3,7));
			map.put("TEL3", tel.substring(7));
			model.addAttribute("USER", map);
			return "student/MyInformation";

		default :
			return "redirect:/home";
		}
	}

	@RequestMapping(value="/courseList",method=RequestMethod.GET)
	public String courseList(Model model, HttpSession session) {
		ArrayList<Map<String, String>> subList = null;
		ArrayList<Map<String, String>> tempCourse2 = null;
		
		if (((String)session.getAttribute("userType")).equals("P")) {
			Map<String, String> map = new HashMap<>();
			map.put("preginum", (String) session.getAttribute("loginId"));
			subList = pdao.getSubjectListP(map);
			
			tempCourse2 = pdao.getSubjectListP1(map);
			System.out.println(tempCourse2);

			for (Map<String, String> map1 : subList) {
				String stime = "[";
				for (Map<String, String> map2 : tempCourse2) {
					if (map1.get("LECTURENUM").equals(map2.get("LECTURENUM"))) {
						if (!stime.equals("[")) {
							stime +="|";
						}
							stime += map2.get("STIME");
					}
				}
				stime +="]";
				map1.put("STIME", stime);
				stime = "";
			}			
			
			model.addAttribute("semesterList", pdao.getSemesterData((String) session.getAttribute("loginId")));
			model.addAttribute("subList", subList);
			return "professor/courseList";
		} else {
			
	 		subList = sdao.getSubList((String) session.getAttribute("loginId"));
			tempCourse2 = sdao.getSubList1((String) session.getAttribute("loginId"));

			for (Map<String, String> map1 : subList) {
				String stime = "[";
				for (Map<String, String> map2 : tempCourse2) {
					if (map1.get("LECTURENUM").equals(map2.get("LECTURENUM"))) {
						if (!stime.equals("[")) {
							stime +="|";
						}
							stime += map2.get("STIME");
					}
				}
				stime +="]";
				map1.put("STIME", stime);
				stime = "";
			}			
	 		
	 		model.addAttribute("subList", subList);
			System.out.println(subList);
			return "student/courseList";
		}
	}
	
	@RequestMapping(value="/goAssessment",method=RequestMethod.GET)
	public String goAssessment(String smSeq, Model model) {
			model.addAttribute("assessment",sdao.getAssessmentInfo(smSeq));
			return "student/assessment";
	}
	
	@RequestMapping(value="/assessProfessor",method=RequestMethod.GET)
	public String assessProfessor(String smseq, String fidelity, String fidlityReason,
			String professionality, String professionalityReason, String understanding,
			String understandingReason) {
			Map<String, String> map = new HashMap<>();
			map.put("SMSEQ", smseq);
			map.put("FIDELITY", fidelity);
			map.put("FIDLITY_REASON", fidlityReason);
			map.put("PROFESSIONALITY", professionality);
			map.put("PROFESSION_REASON", professionalityReason);
			map.put("UNDERSTANDING", understanding);
			map.put("UNDERSTANDING_REASON", understandingReason);
			System.out.println(map);
			sdao.assessProfessor(map);
			return "redirect:/MyGrade";
	}
	
	
	@RequestMapping(value="/subjectDetail",method=RequestMethod.GET)
	public String subjectDetail(String lecturenum, Model model, HttpSession session) {
			session.setAttribute("lectureNum", lecturenum);
			Map<String, String> subject = sdao.getSubjectDetail(lecturenum);
			model.addAttribute("subject",subject);
			if (((String)session.getAttribute("userType")).equals("P")) {
				ArrayList<Map<String, String>> movieList = pdao.getMovieP(lecturenum);
				model.addAttribute("movieList", movieList);
				return "professor/subjectDetail";
			} else {
				ArrayList<Map<String, String>> movieList = sdao.getMovieList(lecturenum, (String) session.getAttribute("loginId"));
				model.addAttribute("movieList", movieList);
				return "student/subjectDetail";
			}
	}

	@RequestMapping(value="/certificate",method=RequestMethod.GET)
	public String certificate(Model model,HttpServletRequest request) {
		model.addAttribute("message",request.getAttribute("message"));
		return "student/certificate";
	}


	@RequestMapping(value="/leaveOfAbsence",method=RequestMethod.GET)
	public String leaveOfAbsence(Model model, HttpSession session) {
		ArrayList<Map<String, String>>map = sdao.leaveOfAbsence((String)session.getAttribute("loginId"));
		model.addAttribute("statusList", map);
		return "student/leaveOfAbsence";
	}

	@RequestMapping(value="/statusChange",method=RequestMethod.GET)
	public String statusChange(Model model) {
		//statusList
		return "student/statusChange";
	}
	
	@RequestMapping(value="/passwordChange",method=RequestMethod.GET)
	public String passwordChange(Model model, HttpSession session) {
		String date="";
		System.out.println((String) session.getAttribute("userType"));
		switch ((String) session.getAttribute("userType")) {
		case "S":
			date = sdao.getUDATE((String) session.getAttribute("loginId"));
			break;
		case "P":
			date = pdao.getUDATEP((String) session.getAttribute("loginId"));
			break;
		default:
			break;
		}
		model.addAttribute("date", date);
		return "student/passwordChange/passwordChange";
	}

	@RequestMapping(value="/UpdateMyInfo",method=RequestMethod.POST)
	public @ResponseBody String UpdateMyInfo(HttpSession session, String name, String email, String address, String tel) {
		Map<String, String> map = new HashMap<>();
		map.put("EMAIL", email);
		map.put("ADDRESS", address);
		map.put("TEL", tel);
		map.put("SREGINUM", (String) session.getAttribute("loginId"));
		map.put("FILE_NAME", name);
		
		sdao.UpdateMyInfo(map);
		if (name != null) {
			session.setAttribute("PICNAME", name);
		}
		return "redirect:/MyInformation";
	}
	
	@RequestMapping(value="/upLoadPicture",method=RequestMethod.POST)
	public @ResponseBody String upLoadPicture(HttpSession session, MultipartFile ex_file) {
			//간단하게 그림 파일 올려서 링크 되돌려받기.
			String savedfile = "";
			String filePath = "D:\\FTP\\Face\\origin";
			
			if (!ex_file.isEmpty()) {
				savedfile = FileService.saveFile(ex_file, filePath);
			}
			
			String name = "http://10.10.16.70/FTP/Face/origin/" + savedfile;
		    return name;
	}

}

