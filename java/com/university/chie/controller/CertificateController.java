package com.university.chie.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.university.chie.dao.CertificateDAO;
import com.university.chie.util.CongnitiveService;
import com.university.chie.vo.Transcript;

@Controller
public class CertificateController {

	@Autowired
	CertificateDAO dao;
	
	@Autowired
	CongnitiveService cs;
	
	@RequestMapping(value="checkStatus", method=RequestMethod.POST)
	public @ResponseBody String checkStatus(String type, HttpSession session) {
		String message=null;
		String sregiNum = (String)session.getAttribute("loginId");
		HashMap<String,String> check = dao.checkStatus(sregiNum);
		if(type.equals("100")) {
			//재학
			if(!check.get("STATUSNUM").equals("100")) {
				message = "在学中ではないので、証明書を発給するのはできません。";
			}
		} else if(type.equals("200")) {
			//휴학
			if(!check.get("STATUSNUM").equals("200")) {
				message = "休学中ではないので、証明書を発給するのはできません。";
				
			}
		} else if(type.equals("300")) {
			//졸업
			if(!check.get("STATUSNUM").equals("300")) {
				message = "卒業生ではないので、証明書を発給するのはできません。";
			}
		}
		


		return message;
	}
	
	
	@RequestMapping(value="certiPop",method=RequestMethod.GET)
	public String certiPop(String type,Model model,HttpSession session) {
		String sregiNum = (String)session.getAttribute("loginId");
		
		HashMap<String,String> sInfo = new HashMap<>();
		HashMap<String,String> cInfo = new HashMap<>();
		sInfo.put("sregiNum", sregiNum);
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat date2 = new SimpleDateFormat("yyyy年  MM月  dd日");
		String day = date.format(today);
		String day2 = date2.format(today);
		//System.out.println(day);
		if(type.equals("111")) {
			//transcript
			//학번만 갖고가서 전체성적가져오기
			sInfo = dao.selectSInfo(sregiNum);
			ArrayList<Transcript> tInfo = dao.selectTranscript(sregiNum);
			model.addAttribute("sInfo",sInfo);
			model.addAttribute("tInfo",tInfo);
			System.out.println(tInfo);
			return"certificate/transcript";
			
		} else if(type.equals("100")) {
			//재학
			sInfo.put("statusNum",type);
			cInfo = dao.selectEnroll(sInfo);
			System.out.println(cInfo);
			
		} else if(type.equals("200")) {
			//휴학
			sInfo.put("statusNum",type);
			sInfo.put("today",day);
			cInfo = dao.selectAbsence(sInfo);
			System.out.println(cInfo);
			
		} else if(type.equals("300")) {
			//졸업
			sInfo.put("statusNum",type);
			cInfo = dao.selectAlumi(sInfo);
			System.out.println(cInfo);
			
		}
		
		model.addAttribute("cInfo",cInfo);
		model.addAttribute("date",day2);
		return"certificate/certificateForm";
	}
	
	//uploadCertifi
	@RequestMapping(value = "/uploadCertifi", method = RequestMethod.GET)
	public boolean uploadCertifi (String strImg, String certificateName) throws Throwable {
		 //faceCheck
		 String imgUri1 = cs.CaptureURL(strImg, certificateName);
//		 dao.update
		return true;
	}
	
}
