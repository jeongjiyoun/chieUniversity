package com.university.chie.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.university.chie.dao.ExamDAO;

@Controller
public class ExamController {
	
	@Autowired
	ExamDAO edao;
		
	@RequestMapping(value="/goexam", method=RequestMethod.GET)
	public String goexam(Model model,String examseq) {
		Map<String, String> result = edao.startExam("1");
//		Map<String, String> result = edao.startExam(examseq);
		model.addAttribute("exam",result);
		return"subject/exam/ExamMain";
	}


	@RequestMapping(value="/exam", method=RequestMethod.GET)
	public String exam(Model model, String examseq, HttpSession session) {
		Map<String, String> result = edao.getQuestion0(examseq);
		model.addAttribute("test", result);
		return"subject/exam/exam";
	}


	@RequestMapping(value="/saveAnswer", method=RequestMethod.POST)
	public @ResponseBody boolean saveAnswer(String exam_Seq2, String answer, String intime, HttpSession session) {
		boolean result = edao.saveAnswer(answer, exam_Seq2, (String) session.getAttribute("loginId"), intime);
		return result;
	}


	@RequestMapping(value="/examLast", method=RequestMethod.GET)
	public String examLast() {
		return"subject/exam/examLast";
	}
	
	@RequestMapping(value="/getQuestion", method=RequestMethod.POST)
	public @ResponseBody Map<String, String> getQuestion(String exam_Seq2, String type, HttpSession session) {
		Map<String, String> result = null;
		switch (type) {
		case "Before":
			result = edao.getQuestion2(exam_Seq2);
			break;

		case "Next":
			result = edao.getQuestion1(exam_Seq2);
			break;
		}
		return result;
	}
}
