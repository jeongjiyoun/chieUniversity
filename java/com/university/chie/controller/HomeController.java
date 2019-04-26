package com.university.chie.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.university.chie.dao.MemberDAO;
import com.university.chie.dao.StudentDao;
import com.university.chie.util.CalendarDay;

@Controller
public class HomeController {
	
	@Autowired
	StudentDao sdao;

	@Autowired
	CalendarDay calen;

	@Autowired
	MemberDAO mdao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
//	return "admin/admin";
		return "main/main/home";
//		return "main/applicantCheck";

	}
	
	@RequestMapping(value = "/goTotNotice", method = RequestMethod.GET)
	public String goTotNotice(Model model) {
		ArrayList<Map<String, String>>noticeList = mdao.getTotNotice("2019");
		ArrayList<Map<String,String>>dayList = mdao.getdayList();
		model.addAttribute("dayList", dayList);
		model.addAttribute("newList", noticeList);
		return "main/totNotice";
	}
		
	@RequestMapping(value = "/newsDetail", method = RequestMethod.GET)
	public String newsDetail(String post, Model model) {
		Map<String, String> newsDetail = mdao.getnewsDetail(post);
		model.addAttribute("newsDetail", newsDetail);
		return "main/newsDetail";
	}

	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public String news(String post, Model model) {
		ArrayList<Map<String, String>>noticeList = mdao.getTotNotice(null);
		model.addAttribute("newList", noticeList);
		return "main/news";
	}
	
	
	@RequestMapping(value="/getNews",method=RequestMethod.POST)
	public @ResponseBody ArrayList<Map<String,String>> getNews(String year) {
		 ArrayList<Map<String,String>> newsList = mdao.getTotNotice(year);
		 return newsList;
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home() {
		return "main/main/home";
	}
	
	@RequestMapping(value="/introduce",method=RequestMethod.GET)
	public String introduce() {
		return "main/introduce";
	}
	
	@RequestMapping(value="/goHome",method=RequestMethod.GET)
	public String goHome() {
		return "main/main/home";
	}
	

	@RequestMapping(value="/applyInfo",method=RequestMethod.GET)
	public String applyInfo() {
		return "main/applyInfo";
	}
	@RequestMapping(value="/applicant",method=RequestMethod.GET)
	public String applicant() {
		return "main/applicant";
	}

	@RequestMapping(value="/department",method=RequestMethod.GET)
	public String department() {
		return "main/department";
	}
	

}
