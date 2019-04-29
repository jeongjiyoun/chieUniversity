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

import com.university.chie.dao.CourseRegisterDAO;
import com.university.chie.vo.LectureTime;

@Controller
public class CourseRegisterController {

	@Autowired
	CourseRegisterDAO dao;

	// check register period
	@RequestMapping(value = "checkPeriod", method = RequestMethod.GET)
	public @ResponseBody boolean checkPeriod(Model model) {
		// 마지막에 만들것

		return true;
	}

	// check register period
	@RequestMapping(value = "/schedulePop", method = RequestMethod.GET)
	public String timetable(HttpSession session, Model model) throws ParseException {
		// 마지막에 만들것
		String sregiNum = (String) session.getAttribute("loginId");

		ArrayList<HashMap<String, String>> stuList = new ArrayList<>();
		stuList = dao.TotalstuRegisInfo(sregiNum);
		// 시간표를 담을 배열
		String[][] array = new String[22][5];
		SimpleDateFormat sf = new SimpleDateFormat("HH:mm");

		for (HashMap<String, String> map : stuList) {
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
						if (map.get("NAME").length()>8) {
							array[i][0] = map.get("NAME").substring(0, 7);
						} else {
							array[i][0] = map.get("NAME");							
						}
					} else {
						if (array[i][0] == null) {
							array[i][0] = " ";
						} 
					}
				case "火":
					if (sf.parse(starttime).before(sf.parse(etime)) && sf.parse(endtime).after(sf.parse(stime))) {
						if (map.get("NAME").length()>8) {
							array[i][1] = map.get("NAME").substring(0, 7);
						} else {
							array[i][1] = map.get("NAME");							
						}
					} else {
						if (array[i][1] == null) {
							array[i][1] = " ";
						} 
					}
					break;
				case "水":
					if (sf.parse(starttime).before(sf.parse(etime)) && sf.parse(endtime).after(sf.parse(stime))) {
						if (map.get("NAME").length()>8) {
							array[i][2] = map.get("NAME").substring(0, 7);
						} else {
							array[i][2] = map.get("NAME");							
						}
					} else {
						if (array[i][2] == null) {
							array[i][2] = " ";
						} 
					}
					break;
				case "木":
					if (sf.parse(starttime).before(sf.parse(etime)) && sf.parse(endtime).after(sf.parse(stime))) {
						if (map.get("NAME").length()>8) {
							array[i][3] = map.get("NAME").substring(0, 7);
						} else {
							array[i][3] = map.get("NAME");							
						}
					} else {
						if (array[i][3] == null) {
							array[i][3] = " ";
						} 
					}
					break;
				case "金":
					if (sf.parse(starttime).before(sf.parse(etime)) && sf.parse(endtime).after(sf.parse(stime))) {
						if (map.get("NAME").length()>8) {
							array[i][4] = map.get("NAME").substring(0, 7);
						} else {
							array[i][4] = map.get("NAME");							
						}
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
/*
		for (String[] strings : array) {
			for (String string : strings) {
				System.out.print(string);
			}
			System.out.println();
		}*/

		model.addAttribute("timetable", array);
		return "student/timetable";
	}

/*	@RequestMapping(value = "/schedulePop", method = RequestMethod.GET)
	public String schedulePop(HttpSession session, Model model) {
		int semester = dao.selectSemester();
		HashMap<String, String> myInfo = new HashMap<>();
		myInfo.put("srSeq", Integer.toString(semester));
		myInfo.put("sregiNum", (String) session.getAttribute("loginId"));
		ArrayList<HashMap<String, String>> mySchedule = dao.selectMySignUp(myInfo);
		if (mySchedule != null) {
			model.addAttribute("mySchedule", mySchedule);
		}
		return "student/myTimeTable";
	}*/

	@RequestMapping(value = "/goRegipop", method = RequestMethod.GET)
	public String goRegipop(Model model,HttpSession session) {
		int semester = dao.selectSemester();
		HashMap<String,String> sInfo = new HashMap<>();
		sInfo.put("sregiNum", (String)session.getAttribute("loginId"));
		sInfo.put("srSeq", String.valueOf(semester));
		ArrayList<Integer> credits = dao.selectAllCredits(sInfo);
		System.out.println(semester);
		int creditNow = 0;
		for (Integer i : credits) {
			creditNow+=i;
			System.out.println(creditNow);
		}
		if (semester != 0) {
			model.addAttribute("semester", semester);
			model.addAttribute("credit", creditNow);
		}
		return "student/courseRegisterS";
	}

	@RequestMapping(value = "/selectMajor", method = RequestMethod.POST)
	public @ResponseBody ArrayList<HashMap<String, String>> selectMajor(String categories) {
		System.out.println(categories);
		ArrayList<HashMap<String, String>> result = dao.searchMajor(categories);
		System.out.println(result);
		return result;
	}

	@RequestMapping(value = "/typeSearch", method = RequestMethod.POST)
	public @ResponseBody ArrayList<HashMap<String, String>> typeSearch(String typeNum, String srSeq) {
		HashMap<String, String> type = new HashMap<>();
		type.put("typeNum", typeNum);
		type.put("srSeq", srSeq);
		ArrayList<HashMap<String, String>> result = dao.selectCourseType(type);
		ArrayList<HashMap<String,String>> resultT = dao.selectCourseTypeT(type);
		for (Map<String, String> map1 : result) {
			if(map1.get("REAL").equals("F")) {
				map1.put("STIME","");
			} else {
				
			String stime = "";
			for (Map<String, String> map2 : resultT) {
				if (map1.get("LECTURENUM").equals(map2.get("LECTURENUM"))) {
					if (!stime.equals("")) {
						stime +=",";
					}
						stime += map2.get("STIME");
				}
			}
			stime +="";
			map1.put("STIME", stime);
			stime = "";
			}
		}
		return result;
	}

	@RequestMapping(value = "/majorSearch", method = RequestMethod.POST)
	public @ResponseBody ArrayList<HashMap<String, String>> majorSearch(String majorSeq, String srSeq) {
		HashMap<String, String> majorInfo = new HashMap<>();
		majorInfo.put("majorSeq", majorSeq);
		majorInfo.put("srSeq", srSeq);
		ArrayList<HashMap<String, String>> result = dao.selectCourseMajor(majorInfo);
		for (HashMap<String, String> hashMap : result) {
			if (hashMap.get("REAL").equals("F")) {
				hashMap.put("STIME", "");
			}
		}
		return result;
	}

	@RequestMapping(value = "/keywordSearch", method = RequestMethod.POST)
	public @ResponseBody ArrayList<HashMap<String, String>> keywordSearch(String option, String search, String srSeq) {
		if (option == null || search == null) {
			return null;
		}
		HashMap<String, String> key = new HashMap<>();
		String option2 = null;
		if (option.equals("1")) {
			option2 = "L.LECTURENUM";
		} else if (option.equals("2")) {
			option2 = "L.NAME";
		}
		System.out.println(option2);
		key.put("option", option2);
		key.put("search", search);
		key.put("srSeq", srSeq);
		System.out.println(key);
		ArrayList<HashMap<String, String>> result = dao.selectKeyWord(key);
		for (HashMap<String, String> hashMap : result) {
			if (hashMap.get("REAL").equals("F")) {
				hashMap.put("STIME", "");
			}
		}

		return result;
	}

	@RequestMapping(value = "/registerCourse", method = RequestMethod.POST)
	public @ResponseBody String registerCourse(String lectureNum, String srSeq, HttpSession session) {
		System.out.println(lectureNum);
		String result = null;
		String sregiNum = (String) session.getAttribute("loginId");
		// check
		HashMap<String, String> check = new HashMap<>();
		check.put("sregiNum", sregiNum);
		check.put("lectureNum", lectureNum);
		if (dao.checkRegister(check) != 0) {
			result = "already registered";
			return result;
		}

		// check occupancy
		HashMap<String, String> info = dao.selectLectureInfo(lectureNum);
		System.out.println(info);
		String count1 = String.valueOf(info.get("COUNT"));
		System.out.println(count1);
		int count = Integer.parseInt(count1);
		int occupancy = Integer.parseInt(info.get("OCCUPANCY"));
		System.out.println(count);
		System.out.println(occupancy);
		if (count < occupancy) {
			info.put("sregiNum", sregiNum);
			info.put("suSeq", "");
			if (info.get("REAL").equals("F")) {
				System.out.println("F");
				return register(info);
			} else if (info.get("REAL").equals("T")) {
				System.out.println("T");
				HashMap<String, String> sInfo = new HashMap<>();
				sInfo.put("sregiNum", sregiNum);
				sInfo.put("srSeq", srSeq);
				ArrayList<HashMap<String, String>> stuList = new ArrayList<>();
				stuList = dao.stuRegisInfo(sInfo);
				if (stuList == null) {
					System.out.println("바로신청!");
					return register(info);
				} else {
					// compare time

					System.out.println(stuList);
					ArrayList<LectureTime> time = dao.lectureRealTime(lectureNum);
					System.out.println(time);
					String status = compareTime(stuList, time);
					if (status.equals("success")) {
						System.out.println("라이브신청완료");
						return register(info);
					}

					System.out.println(status);
					return status;

					// return "working";
				}
			}
		}
		return "failed";
	}

	public String register(HashMap<String, String> info) {
		if (dao.courseRegister(info) == 1) {
			System.out.println(info.get("suSeq"));
			System.out.println("신청완료!");
			return "success!";
		}
		return "failed";
	}

	public String compareTime(ArrayList<HashMap<String, String>> stuList, ArrayList<LectureTime> time) {
		for (LectureTime lt : time) {
			for (HashMap<String, String> s : stuList) {
				if (s.get("DAY").equals(lt.getDay())) {
					// starttime을 date타입으로변형
					Date ss = convertToTime(s.get("STARTTIME"));
					Date se = convertToTime(s.get("ENDTIME"));
					Date lts = convertToTime(lt.getStartTime());
					Date lte = convertToTime(lt.getEndTime());
					if (lts.getTime() - ss.getTime() > 0) {
						if (lts.getTime() - se.getTime() >= 0) {
							return "success";
						} else {
							return "time conflict";
						}
					} else if (lts.getTime() - ss.getTime() == 0) {
						return "time conflict";
					} else {
						if (lte.getTime() - ss.getTime() <= 0) {
							return "success";
						} else {

							return "time conflict";
						}
					}

				}
			} // for
		} // for

		return "success";
	}

	public Date convertToTime(String time) {
		Date result = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("hh:mm");
		try {
			result = transFormat.parse(time);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
