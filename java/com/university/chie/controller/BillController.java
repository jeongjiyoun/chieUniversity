package com.university.chie.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.university.chie.dao.BillDAO;
import com.university.chie.vo.Bill;

@Controller
public class BillController {


	@Autowired
	BillDAO dao;

	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String registration(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		System.out.println(loginId);
		ArrayList<Map<String, String>> result = dao.selectBill(loginId);
		model.addAttribute("result", result);
		System.out.println(result);

		return "student/registration";
	}

	@RequestMapping(value = "/Billupdate", method = RequestMethod.GET)
	public String Billupdate(Bill bill, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");

		try {
			dao.Billupdate(loginId);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "Bill";
	}
	@RequestMapping(value="/scholaship", method = RequestMethod.GET)
	public String scholaship(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		ArrayList<Map<String,String>> sresult = dao.selectscholaship(loginId);
		model.addAttribute("sresult",sresult);
		System.out.println(sresult);
		
		return "student/scholaship";

	}
}
