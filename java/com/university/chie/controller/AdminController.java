package com.university.chie.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.university.chie.dao.AdminDAO;
import com.university.chie.vo.Admin;
import com.university.chie.vo.Applicant;

@Controller
public class AdminController {

	@Autowired
	AdminDAO dao;
	
	// 회원로그인 폼이동 액션
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin() {
		return "admin/admin";
	}
	//홈으로 가는거 임시방편 
	@RequestMapping(value = "/adminHome", method = RequestMethod.GET)
	public String adminHome() {
		return "admin/adminhome";
	}
	
	// 회원로그인 액션
	@RequestMapping(value = "/adminhome", method = RequestMethod.POST)
	public String adminhome(Admin admin, Model model, HttpSession session) {
		Admin result = dao.loginAdmin(admin);
		if (result == null) {// 로그인을 실패한경우
			model.addAttribute("Admin",admin);
			return "admin/admin";
		}
		// 로그인성공시, session에 ID값을 넣어준다.
		session.setAttribute("loginId", result.getAdminid());
		return "admin/adminhome";
	}

	//입학관리
	@RequestMapping(value = "/adminApplicant", method = RequestMethod.GET)
	public String selectApplicantAdmin(Model model) {
		ArrayList<Applicant> result = null;
		try {
			result = dao.selectApplicantAdmin();
			System.out.println("result" + result);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		model.addAttribute("aList", result);
		return "admin/applicant";
	}
	
	//홈으로 가는거 임시방편 
	@RequestMapping(value = "/aPopup", method = RequestMethod.GET)
	public String aPopup(String applicantSeq) {
		
		return "admin/adminhome";
	}
	
	@RequestMapping(value = "/pickApplicant", method = RequestMethod.GET)
	public String pickApplicant(String applicantSeq, Model model) {
		Applicant result = null;
		try {
			result = dao.pickApplicant(applicantSeq);
			model.addAttribute("Applicant", result);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if (result ==null) {
			return "admin/applicant"; 
		} 
		return "admin/applicantCont";
	}
	
	@RequestMapping(value = "/deleteApplicant", method = RequestMethod.GET)
	public String deleteApplicant(String applicantSeq, Model model) {
		try {
			int result = dao.deleteApplicant(applicantSeq);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "admin/applicantCont";
	}
}


