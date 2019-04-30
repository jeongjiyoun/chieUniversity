package com.university.chie.controller;

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

import com.university.chie.dao.MemberDAO;
import com.university.chie.dao.ProfessorDAO;
import com.university.chie.dao.StudentDao;
import com.university.chie.util.CongnitiveService;
import com.university.chie.vo.Professor;
import com.university.chie.vo.Student;
import com.university.chie.vo.User;

@Controller
public class MemberController {

	@Autowired
	MemberDAO md;

	@Autowired
	StudentDao sdao;

	@Autowired
	ProfessorDAO pdao;

	@Autowired
	CongnitiveService cs;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "main/login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}

	@RequestMapping(value = "/faceLogin", method = RequestMethod.GET)
	public String faceLogin() {
		return "main/faceLogin";
	}

	@RequestMapping(value = "/backLogin", method = RequestMethod.GET)
	public String backLogin(Model model, HttpSession session) {
		model.addAttribute("message", "ユーザーIDとパスワードでログインお願いします");
		session.invalidate();
		return "main/login";
	}


	//password Change
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
		
	@RequestMapping(value = "/passwordChange_step2", method = RequestMethod.GET)
	public String passwordChage_step2() {
		return "student/passwordChange/passwordChange_step2";
	}

	@RequestMapping(value = "/passwordChange_step3", method = RequestMethod.GET)
	public String passwordChage_step3() {
		return "student/passwordChange/passwordChange_step3";
	}
	
	@RequestMapping(value = "/faceLogin", method = RequestMethod.POST)
	public @ResponseBody String faceLogin(String name, String strImg,
			HttpSession session, Model model) throws Throwable {
		String imgUri1 = cs.makeCaptureURL(strImg, "login");
		ArrayList<String> nameList = md.getIdByName(name);
		String resultId = null;
		boolean checked = false;

		//얼굴 인식하여 아이디 찾기
		if (nameList != null) {
			for (String loginId : nameList) {
				resultId = loginId;
				String imgUri2 = cs.makeIDURL(loginId);
				if (cs.checkStream(imgUri1, imgUri2)) {
					checked = true;
					System.out.println("sucess");
					break;
				}
				checked = true;
		}
		
		//맞는 정보 로그인시키기
			if (checked) {
				String picName =  md.getInfo(resultId).getPicName();
				session.setAttribute("loginId", resultId);
				session.setAttribute("loginName", name);
				session.setAttribute("userType", "S");
				session.setAttribute("PICNAME",picName);
				return resultId;
			}
		}
		return "Fail";
	}

	@RequestMapping(value="/getSchedule",method=RequestMethod.GET)
	public @ResponseBody ArrayList<Map<String, String>> getSchedule(HttpSession session) {
		ArrayList<Map<String, String>> result = md.getdayList();
		return result;
	}
	
	@RequestMapping(value="/getNews",method=RequestMethod.GET)
	public @ResponseBody ArrayList<Map<String, String>> getNews(HttpSession session) {
		ArrayList<Map<String, String>> result = md.getTotNotice(null);
		return result;
	}
	
	@RequestMapping(value="/UpdateMyinfo",method=RequestMethod.POST)
	public @ResponseBody String UpdateMyInfo(HttpSession session, String name, String email, String address, String tel
			,String jtel, String jmail) {
		Map<String, String> map = new HashMap<>();
		map.put("EMAIL", email);
		map.put("ADDRESS", address);
		map.put("TEL", tel);
		map.put("PREGINUM", (String) session.getAttribute("loginId"));
		map.put("FILE_NAME", name);
		map.put("JTEL", jtel);
		map.put("JMAIL", jmail);
		
		md.UpdateMyInfoP(map);

		if (name != null) {
			session.setAttribute("PICNAME", name);
		}
		return "redirect:/MyInformation";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String userId, String userPw, HttpSession session, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		String userType = null;
		map.put("userId", userId);
		map.put("userPw", userPw);
		User user = null;
		switch (userId.substring(0, 1)) {
		case "1":
			user = md.loginStudent(map);
			if (user != null) {
				userId = ((Student) user).getsRegNum();
			}
			userType = "S";
			break;
		case "2":
			user = md.loginProfessor(map);
			if (user != null) {
				userId = ((Professor) user).getpRegNum();
			}
			userType = "P";
			break;
		}
		if (user != null) {
			session.setAttribute("loginId", userId);
			session.setAttribute("loginName", user.getName());
			session.setAttribute("userType", userType);
			
			if (userType == "P") {
				String picName = ((Professor)user).getPicName();
				session.setAttribute("PICNAME", picName);
				return "redirect:/MyPage";
			} else if (userType == "S") {
				String picName = ((Student)user).getPicName();
				session.setAttribute("PICNAME", picName);
				return "redirect:/MyPage";
			}
			return "main/login";
		} else {
			model.addAttribute("message", "ログイン情報を確認してください。");
			return "main/login";
		}
	}
	
	//내 강의실 가기
	@RequestMapping(value = "/MyPage", method = RequestMethod.GET)
	public String MyPage (Model model, HttpSession session) throws ParseException {
		String userType = (String) session.getAttribute("userType");
		String loginId = (String) session.getAttribute("loginId");
		switch (userType) {
		case "S":
			ArrayList<Map<String,String>> subjectList = sdao.getSubList(loginId);
			model.addAttribute("subjectList", subjectList);
			model.addAttribute("newList", md.getTotNotice("2019"));
			
			ArrayList<Map<String,String>>stuList = sdao.getSubjectTime(loginId);
			
			String[][] array = new String[22][5];
			SimpleDateFormat sf = new SimpleDateFormat("HH:mm");

			for (Map<String, String> map : stuList) {
				Calendar cal = Calendar.getInstance();
				String base = "09:00"; // 9시부터 19시까지 수업
				String stime = map.get("STARTTIME"); // 수업시간
				String etime = map.get("ENDTIME"); // 수업시간끝
				Date baseTime = sf.parse(base);
				cal.setTime(baseTime);

				for (int i = 0; i < 22; i++) {
					base = sf.format(cal.getTime());
					String starttime = base;
					cal.add(Calendar.MINUTE, 30);
					String endtime = sf.format(cal.getTime());
					switch (map.get("DAY")) {
					case "月":
						if (sf.parse(starttime).before(sf.parse(etime)) && sf.parse(endtime).after(sf.parse(stime))) {
							array[i][0] = String.valueOf(map.get("LTSEQ"));
						} else {
							if (array[i][0] == null) {
								array[i][0] = " ";
							} 
						}
					case "火":
						if (sf.parse(starttime).before(sf.parse(etime)) && sf.parse(endtime).after(sf.parse(stime))) {
							array[i][1] = String.valueOf(map.get("LTSEQ"));
						} else {
							if (array[i][1] == null) {
								array[i][1] = " ";
							}
						}
						break;
					case "水":
						if (sf.parse(starttime).before(sf.parse(etime)) && sf.parse(endtime).after(sf.parse(stime))) {
							array[i][2] = String.valueOf(map.get("LTSEQ"));
						} else {
							if (array[i][2] == null) {
								array[i][2] = " ";
							} 
						}
						break;
					case "木":
						if (sf.parse(starttime).before(sf.parse(etime)) && sf.parse(endtime).after(sf.parse(stime))) {
								array[i][3] = String.valueOf(map.get("LTSEQ"));
							
						} else {
							if (array[i][3] == null) {
								array[i][3] = " ";
							} 
						}
						break;
					case "金":
						if (sf.parse(starttime).before(sf.parse(etime)) && sf.parse(endtime).after(sf.parse(stime))) {
							array[i][4] = String.valueOf(map.get("LTSEQ"));
						} else {
							if (array[i][4] == null) {
								array[i][4] = " ";
							} 
						}
						break;
					default:
						break;
					}
				}
			}
			model.addAttribute("timetable", array);
			return "student/myPage";
			
		case "P":
			model.addAttribute("subjectList", pdao.getSubjectList(loginId));
			model.addAttribute("newList", md.getTotNotice("2019"));

			ArrayList<Map<String,String>>proList = pdao.getSubjectTime(loginId);
			
			String[][] array1 = new String[22][5];
			SimpleDateFormat sf1 = new SimpleDateFormat("HH:mm");

			for (Map<String, String> map : proList) {
				Calendar cal = Calendar.getInstance();
				String base = "09:00"; // 9시부터 19시까지 수업
				String stime = map.get("STARTTIME"); // 수업시간
				String etime = map.get("ENDTIME"); // 수업시간끝
				Date baseTime = sf1.parse(base);
				cal.setTime(baseTime);

				for (int i = 0; i < 22; i++) {
					base = sf1.format(cal.getTime());
					String starttime = base;
					cal.add(Calendar.MINUTE, 30);
					String endtime = sf1.format(cal.getTime());
					switch (map.get("DAY")) {
					case "月":
						if (sf1.parse(starttime).before(sf1.parse(etime)) && sf1.parse(endtime).after(sf1.parse(stime))) {
							array1[i][0] = String.valueOf(map.get("LTSEQ"));
						} else {
							if (array1[i][0] == null) {
								array1[i][0] = " ";
							} 
						}
					case "火":
						if (sf1.parse(starttime).before(sf1.parse(etime)) && sf1.parse(endtime).after(sf1.parse(stime))) {
//							array1[i][1] = String.valueOf(map.get("LTSEQ"));
//						} else {
//							if (array1[i][1] == null) {
								array1[i][1] = " ";
//							}
						}
						break;
					case "水":
						if (sf1.parse(starttime).before(sf1.parse(etime)) && sf1.parse(endtime).after(sf1.parse(stime))) {
							array1[i][2] = String.valueOf(map.get("LTSEQ"));
						} else {
							if (array1[i][2] == null) {
								array1[i][2] = " ";
							} 
						}
						break;
					case "木":
						if (sf1.parse(starttime).before(sf1.parse(etime)) && sf1.parse(endtime).after(sf1.parse(stime))) {
								array1[i][3] = String.valueOf(map.get("LTSEQ"));
						} else {
							if (array1[i][3] == null) {
								array1[i][3] = " ";
							} 
						}
						break;
					case "金":
						if (sf1.parse(starttime).before(sf1.parse(etime)) && sf1.parse(endtime).after(sf1.parse(stime))) {
							array1[i][4] = String.valueOf(map.get("LTSEQ"));
						} else {
							if (array1[i][4] == null) {
								array1[i][4] = " ";
							} 
						}
						break;
					default:
						break;
					}
				}
			}
			model.addAttribute("timetable", array1);
			return "professor/myPage";

		default:
			return "home";
		}
	}

	@RequestMapping(value = "/idFind", method = RequestMethod.POST)
	public @ResponseBody String idFind(String email, String userName, Model model) {
		String result = null;
		result = md.idFind(email, userName);
		return result;
	}

	@RequestMapping(value = "/pwFind", method = RequestMethod.POST)
	public @ResponseBody String pwFind(String sreginum, String userName) {
		String result = null;
		result = md.pwFind(sreginum, userName);
		return result;
	}
	
	@RequestMapping(value = "/snameIn", method = RequestMethod.POST)
	public @ResponseBody String snameIn(HttpSession session, String userName) {
		String result = null;
		result = md.pwFind((String)session.getAttribute("loginId"), userName);
		return result;
	}
	
	@RequestMapping(value = "/pwChange", method = RequestMethod.POST)
	public @ResponseBody boolean pwChange(HttpSession session, String password) {
		String userType = (String) session.getAttribute("userType");

		switch (userType) {
		case "S":
			boolean result = false;
			String sreginum = (String)session.getAttribute("loginId");
			result = md.pwUpdate(sreginum, password);
			return result;
			
		case "P":
			boolean result1 = false;
			String preginum = (String)session.getAttribute("loginId");
			result1 = md.pwUpdateP(preginum, password);
			return result1;

		default:
			return false;
		}		
	}
	
	@RequestMapping(value = "/updatePw", method = RequestMethod.POST)
	public @ResponseBody boolean updatePw(String sreginum, String password) {
		boolean result = false;
		result = md.pwUpdate(sreginum, password);
		return result;
	}
	
	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
	public @ResponseBody boolean pwCheck(String password, HttpSession session) {
		String userType = (String) session.getAttribute("userType");

		switch (userType) {
	
			case "S":
				boolean result = false;
				String loginId = (String) session.getAttribute("loginId");		
				Map<String, String> map = new HashMap<String, String>();
				map.put("userId", loginId);
				map.put("userPw", password);
				Student k = md.loginStudent(map);
				if (k != null) {
					result = true;
				}
				return result;
	
			case "P":
				boolean result1 = false;
				String loginId1 = (String) session.getAttribute("loginId");		
				Map<String, String> map1 = new HashMap<String, String>();
				map1.put("userId", loginId1);
				map1.put("userPw", password);
				Professor k1 = md.loginProfessor(map1);
				if (k1 != null) {
					result1 = true;
				}
				return result1;
	
			default:
				return false;
		}
	}
	

}
