package com.university.chie.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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

import com.fasterxml.jackson.databind.deser.std.DateDeserializers.CalendarDeserializer;
import com.university.chie.dao.ConsultDAO;
import com.university.chie.dao.ProfessorDAO;
import com.university.chie.util.CalendarDay;

@Controller
public class ConsultController {
	
	@Autowired
	ConsultDAO cdao;
	
	@Autowired
	CalendarDay calen;
	
	@Autowired
	ProfessorDAO pdao;
	
	//go cancel page
	@RequestMapping(value="/consultCancel", method=RequestMethod.GET)
	public String consultCancel() {
		return "consult/consultCancel";
	}
 
	//go Page
	@RequestMapping(value="/consult", method=RequestMethod.GET)
	public String consult(HttpSession session, Model model) throws ParseException {
		String type = (String) session.getAttribute("userType");
		String loginId = (String) session.getAttribute("loginId");
		Calendar cal = Calendar.getInstance();
		Date today = cal.getTime();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");

		if (type.equals("S")) {
			ArrayList<Map<String, String>> counselList = cdao.selectList(loginId,null);
			for (Map<String, String> map : counselList) {
				String atime = map.get("COUNDATE") + " " + map.get("COUNTIME");
				Date countime = df.parse(atime);
				long time = today.getTime()-countime.getTime();
				String result = Long.toString(time);
				map.put("WAITTIME", result);
			}
			
			model.addAttribute("counselList",counselList);
			return"consult/consultList";	
		} else {
			ArrayList<Map<String, String>> counselList = cdao.selectListP(loginId, null);
			for (Map<String, String> map : counselList) {
				String atime = map.get("COUNDATE") + " " + map.get("COUNTIME");
				Date countime = df.parse(atime);
				long time = today.getTime()-countime.getTime();
				String result = Long.toString(time);
				map.put("WAITTIME", result);
			}

			model.addAttribute("counselList",counselList);
			return "consult/consultListP";
		}
	}	
	
	//make counsult counsulted
	@RequestMapping(value="/counsulted", method=RequestMethod.POST)
	public @ResponseBody boolean counsulted(String counselseq, HttpSession session) {
		Map<String, String> map = new HashMap<>();
		map.put("COUNSEL_SEQ", counselseq);
		map.put("TYPE", "C");
		System.out.println(map);
		boolean k = cdao.updateCounsult(map);
		System.out.println(k);
		return true;
	}
	
	//cancel apply
	@RequestMapping(value="/applyCancel", method=RequestMethod.POST)
	public String applyCancel(String counselseq, String reason) {
		cdao.cancelApply(counselseq, reason);
		Map<String, String> map = new HashMap<>();
		map.put("COUNSEL_SEQ", counselseq);
		map.put("TYPE", "G");
		boolean k = cdao.updateCounsult(map);
		System.out.println("혹시 취소 ? : " + k);
		return"sucess";
	}
	
	//apply cancel 
	@RequestMapping(value="/newCancel", method=RequestMethod.POST)
	public String newCancel(String counselseq, String reason) {
		cdao.cancelApply(counselseq, reason);
		Map<String, String> map = new HashMap<>();
		map.put("COUNSEL_SEQ", counselseq);
		map.put("TYPE", "F");
		map.put("MEMO", reason);
		cdao.updateCounsult(map);
		return"sucess";
	}

	//go ConsultApply
	@RequestMapping(value="/consultApply", method=RequestMethod.GET)
	public String consultApply(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		ArrayList<Map<String, String>> proList = pdao.getProfessor(loginId);
		model.addAttribute("proList", proList);
		return "consult/consultApply";
	}
 
	//professor change available counsel time
	@RequestMapping(value="/counselChange", method=RequestMethod.GET)
	public String counselChange(HttpSession session, Model model) {
		String loginId = (String) session.getAttribute("loginId");
		ArrayList<Map<String, String>> dataList = pdao.getMyConsultData(loginId);
		model.addAttribute("dataList", dataList);
		return "consult/counselChange";
	}

	//insert Apply
	@RequestMapping(value="/consultApply", method=RequestMethod.POST)
	public String consultApply(String preginum,String typeNum,String coundate,String conTime, String memo,HttpSession session, Model model) throws ParseException {
		Map<String, String> consult = new HashMap<>();

		consult.put("PREGINUM", preginum);
		consult.put("SREGINUM", (String) session.getAttribute("loginId"));
		consult.put("TYPENUM", typeNum);
		SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy k:m");
		Date day = sdf1.parse(coundate+" " + conTime.substring(0, 5));
		SimpleDateFormat test0 = new SimpleDateFormat("yyyy/MM/dd k:m"); 
		String result = test0.format(day);
		
		consult.put("COUNDATE", result);
		consult.put("MEMO", memo);
		if(cdao.insertConsult(consult)) {
			return"redirect:/consult";
		} else {
			model.addAttribute("memo",consult.get("memo"));
			return "consultApply";
		}
	}

	//consultList Search
	@RequestMapping(value="/consultList", method=RequestMethod.POST)
	public @ResponseBody ArrayList<Map<String, String>> consultList(String type, HttpSession session) {
		if (type.equals("Z")) {
			type=null;
		}

		String loginId = (String) session.getAttribute("loginId");
		String usertype = (String) session.getAttribute("userType");
		if (usertype.equals("S")) {
			return cdao.selectList(loginId,type);
		} else {
			return cdao.selectListP(loginId, type);
		}
	}
	
	//apply authentification
	@RequestMapping(value="/adminCancel", method=RequestMethod.POST)	
	public @ResponseBody String adminCancel(String counselseq) {
		boolean result = cdao.adminCancel(counselseq);
		Map<String, String> map = new HashMap<>();
			map.put("COUNSEL_SEQ", counselseq);
			map.put("TYPE", "G");
		result = cdao.updateCounsult(map);
		if (result) {
			return "sucess";
		} else {
			return "false";
		}
	}

	//get video key
	@RequestMapping(value="/getKey", method=RequestMethod.POST)
	public @ResponseBody String conStart(String counselseq, Model model) {
		return cdao.getKey(counselseq);
	}
	
	//consultDetail Data
	@RequestMapping(value="/selectCon", method=RequestMethod.GET)
	public String selectCon(String counselseq, HttpSession session, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("counselseq", counselseq);
		map.put("loginId", (String) session.getAttribute("loginId"));
		String userType = (String)session.getAttribute("userType");
		switch (userType) {
		case "S":
			model.addAttribute("consult",cdao.selectCon(map));
			break;
		case "P":
			model.addAttribute("consult",cdao.selectConP(map));
			break;
		default:
			break;
		}
		return"consult/consultCont";
	}	
	
	//get Counsel time Data
	@RequestMapping(value="/dataload", method=RequestMethod.POST)
	public @ResponseBody ArrayList<String> dataload(String preginum, String coundate, Model model) {
		ArrayList<String> result = null;
		String day = null;
		try {
			day = calen.getDateDay(coundate);
			
		} catch (ParseException e) {
			//ignore
		}
		if (day != null) {
		result = cdao.getConsultTime(preginum,day);
		}
		return result;
	}
}
