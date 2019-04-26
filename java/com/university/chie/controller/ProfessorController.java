package com.university.chie.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.university.chie.dao.ProfessorDAO;
import com.university.chie.util.HandlerFile;

@Controller
public class ProfessorController {
	
	@Autowired
	ProfessorDAO pdao;
	
	
	@RequestMapping(value="/goPmyPage",method=RequestMethod.GET)
	public String goPmyPage() {
		return "professor/myPage";
	}
	
	@RequestMapping(value="/PcourseList",method=RequestMethod.GET)
	public String PcourseList() {
		return "professor/courseList";
	}
	
	@RequestMapping(value="/PconsultList",method=RequestMethod.GET)
	public String PconsultList() {
		return "professor/consult/consultList";
	}
	
	@RequestMapping(value="/courseMake",method=RequestMethod.GET)
	public String courseMake() {
		return "professor/courseMake";
	}
	
	@RequestMapping(value="/score",method=RequestMethod.GET)
	public String score(String lectureNum, Model model) {
		System.out.println(lectureNum);
		model.addAttribute("lectureNum", lectureNum);
		return "professor/score";
	}
	
	@RequestMapping(value="/fileWatch",method=RequestMethod.GET)
	public String fileWatch(String url, Model model) {
		model.addAttribute("url", url);
		return "professor/fileWatch";
	}
	
	@RequestMapping(value="/subjectManage",method=RequestMethod.GET)
	public String subjectManage(String courseNum, String type,HttpSession session, Model model) {
		//寃곌낵瑜� �떞�쓣 map
		Map<String, String> resultMap = null;
		Map<String, String> parameterMap = new HashMap<>();
		parameterMap.put("preginum", (String) session.getAttribute("loginId"));

		if(type.equals("T")) {
			resultMap = pdao.getSubjectManageP(courseNum);
			model.addAttribute("detail", resultMap);
			return "professor/subjectManage";
		} else {
			//�룞�쁺�긽 �삱由щ뒗 李�
			resultMap = pdao.getSubjectManageP(courseNum);
			model.addAttribute("detail", resultMap);
			return "professor/subjectManage2";
		}
	}
	
	@RequestMapping(value="/courseHome",method=RequestMethod.GET)
	public String courseHome() {
		return "professor/courseHome";
	}
	
	@RequestMapping(value="/getCourseListP", method=RequestMethod.POST)
	public @ResponseBody ArrayList<Map<String, String>> getCourseListP(String SRSEQ, HttpSession session) {
		ArrayList<Map<String, String>> result = null;
		Map<String, String> map = new HashMap<>();
		map.put("preginum", (String) session.getAttribute("loginId"));

		if (!(SRSEQ == null || SRSEQ == "")) {
			map.put("SRSEQ", SRSEQ);
		}
		result = pdao.getSubjectListP(map);
		return result;
	}
	
	@RequestMapping(value="/smFileUpload", method=RequestMethod.POST)
	public @ResponseBody boolean smFileUpload(String courseSeq,
			String title, String startdate, String enddate, String coursenum,
			String ATIME, String FILE_NAME, String ORG_NAME,
			HttpSession session) throws ParseException {

		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("TITLE", title);
		map2.put("COURSENUM", coursenum);
		String[] all = ATIME.split(":");

		int k = 0;
		if (!all[0].equals("00")) {
			k += Integer.parseInt(all[0])*60;
		}
		if (!all[1].equals("00")) {
			k += Integer.parseInt(all[1]);
		}
		ATIME = Integer.toString(k);
		map2.put("ATIME", ATIME);
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat test0 = new SimpleDateFormat("yyyy/MM/dd"); 

		Date day1 = sdf1.parse(startdate);
		startdate = test0.format(day1);

		Date day2 = sdf1.parse(enddate);
		enddate = test0.format(day2);

		map2.put("STARTDATE", startdate);
		map2.put("ENDDATE", enddate);
		map2.put("WID", (String) session.getAttribute("loginId"));
		map2.put("COURSESEQ", courseSeq);
		
		map2.put("ORG_NAME", ORG_NAME);
		map2.put("FILE_NAME", FILE_NAME);
			
		return pdao.setCourse(map2);
	}
	
	@RequestMapping(value="/smGetSrc", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, String> smGetSrc(MultipartHttpServletRequest multipartRequest) throws ParseException {
		
		String filePath = "D:\\FTP\\Video";
		ArrayList<HashMap<String, String>> fileNames = new HandlerFile(multipartRequest, filePath).getUploadFileName();
			HashMap<String, String> map2 = new HashMap<String, String>();
			HashMap<String, String>map = fileNames.get(0);
			String org_Name = map.get("org_Name");
			map2.put("ORG_NAME", org_Name);
			
			String name = "http://10.10.15.161/FTP/Video/" + map.get("name");
			map2.put("FILE_NAME", name);
			System.out.println(name);
		return map2;
	}
}
