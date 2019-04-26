package com.university.chie.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.university.chie.dao.ApplicantDAO;
import com.university.chie.util.PageNavigator;
import com.university.chie.vo.Applicant;

@Controller
public class ApplicantController {
	
	@Autowired
	ApplicantDAO dao;
	private static final Logger logger = LoggerFactory.getLogger(ApplicantController.class);
	final int countPerPage = 5;
	final int pagePerGroup = 5;
	
	@RequestMapping(value="/Adminapplicant", method=RequestMethod.GET)
	public String Adminapplicant(
			@RequestParam(value="page", defaultValue="1") int page,
			Model model) {
		
		logger.debug("page: {}", page);
		
		String applicantseq = "1";
		
		int total=dao.countRecord(applicantseq);
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		ArrayList<Applicant> applicant = dao.selectApplicantList(applicantseq,navi.getStartRecord(),navi.getCountPerPage());
		
		System.out.println(navi+" "+applicantseq);
		System.out.println(applicant);
		 
		model.addAttribute("applicant", applicant);
		model.addAttribute("navi",navi);
		model.addAttribute("search",applicantseq);
		
		return "main/applicant";
	}
}
