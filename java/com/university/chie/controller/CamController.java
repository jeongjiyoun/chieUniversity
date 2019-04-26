package com.university.chie.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.university.chie.dao.StudentDao;
import com.university.chie.util.CongnitiveService;

@Controller
public class CamController {

	@Autowired
	StudentDao sdao;

	@Autowired
	CongnitiveService cs;

//watch!
	@RequestMapping(value="/watch", method=RequestMethod.GET)
	public String watch(String coursenum, Model model, HttpSession session) {
		Map<String, String> map = sdao.getMovie(coursenum);
		//get Movie
		model.addAttribute("movie",map);
		System.out.println(map);
		//get FaceId
		String loginId = (String) session.getAttribute("loginId");
		String imgUri1 = cs.makeIDURL(loginId);
		session.setAttribute("myFaceId", imgUri1);

		//set Time
	 	Date d2 = Calendar.getInstance().getTime();
	 	SimpleDateFormat f = new SimpleDateFormat("HH:mm:ss", Locale.KOREA);
	 	model.addAttribute("timestart", f.format(d2));
		return "student/watch";
	}
	
	@RequestMapping(value="/watch2", method=RequestMethod.GET)
	public String watch2(String coursenum, Model model, HttpSession session) {
		Map<String, String> map = sdao.getMovie(coursenum);
		//get Movie
		model.addAttribute("movie",map);
		//set Time
	 	Date d2 = Calendar.getInstance().getTime();
	 	SimpleDateFormat f = new SimpleDateFormat("HH:mm:ss", Locale.KOREA);
	 	model.addAttribute("timestart", f.format(d2));
		return "student/watch2";
	}

//check face
	 @RequestMapping(value ="canvasUpload", method = RequestMethod.POST)
	 public @ResponseBody String canvasUpload(String strImg, String timestart,
			 HttpSession session, String courseseq, String type) throws Throwable {

		 //faceCheck
		 String loginId = (String) session.getAttribute("loginId");
		 String imgUri1 = cs.makeCaptureURL(strImg, loginId);
		 boolean result = cs.checkIdentify(imgUri1, (String)session.getAttribute("myFaceId"));
		 if (type != null) {
			return "" + result;
		} else {
			 if (result) {
				 return insertWatch(timestart, courseseq, loginId);
			 } else {
				return "fail";			
			}
		}
	 }

//insert process(face + db)
	 public String insertWatch(String timestart, String courseseq, String loginId) throws ParseException {
		 //get Time
		 	SimpleDateFormat f = new SimpleDateFormat("HH:mm:ss", Locale.KOREA);
		 	Date d2 = Calendar.getInstance().getTime();
			Date d1 = f.parse(timestart);
			long diff = d2.getTime() - d1.getTime();
			String sec = "" + diff / 1000;		 

		 //DB process			
			Map<String, String> map = new HashMap<>();
			 map.put("SREGINUM", loginId);
			 map.put("COURSESEQ", courseseq);
			 map.put("ATIME", sec);
			 map.put("TIME_START", timestart);

			 sdao.checkpass(map);
			 
			 return d2.toString();
	 }

//only db process
	 @RequestMapping(value ="checkWatch", method = RequestMethod.POST)
	 public @ResponseBody String checkWatch(String courseseq, String timestart, HttpSession session) throws Throwable{
		 String loginId = (String) session.getAttribute("loginId");
			 return insertWatch(timestart, courseseq, loginId);
	 } 


}
