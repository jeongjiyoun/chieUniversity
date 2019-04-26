package com.university.chie.controller;

import java.io.IOException;


import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import com.university.chie.dao.BillDAO;
import com.university.chie.dao.PaymentDAO;
import com.university.chie.vo.Bill;



@Controller
public class PaymentController {

	@Autowired
	PaymentDAO dao;

	BillDAO Bdao;
	
	IamportClient client;

	@RequestMapping(value = "/Payment", method = RequestMethod.GET)

	public String Payment(HttpSession session, Model model) {
		Bill bill = Bdao.selectcost((String)session.getAttribute("loginId"));
		System.out.println(bill);
		model.addAttribute("Bill",bill);
		return "Payment/Payment";
	}

	@RequestMapping(value = "/finish", method = RequestMethod.POST)
	public @ResponseBody String finish(com.university.chie.vo.Payment payment, HttpSession session) {
		String loginId = (String)(session.getAttribute("loginId"));
		
		int result = dao.insertPayment(payment);
		if (result != 0) {
			int result2 = Bdao.Billupdate(loginId);
			if(result2 !=0) {
				return "success";
			}else {
				return "billアップデート失敗";
			}
		} else {
			return "paymentアップデート失敗";
		}
	}
	
	@RequestMapping(value = "/credit", method = RequestMethod.GET)
	public @ResponseBody String credit(String totrtlalcredit,Model model) {
		
		model.addAttribute("totrtlalcredit",totrtlalcredit);
		
		return "bill";
		
	}
	public void testGetToken() {
		try {
			IamportResponse<AccessToken> auth_response = client.getAuth();
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage() + " at testGetToken");
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO
				System.out.println("401 at testGetToken");
				break;
			case 500 :
				//TODO
				System.out.println("500 at testGetToken");
				break;
			}
		} catch (IOException e) {
			//서버 연결 실패
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "action", method = RequestMethod.POST)
	@ResponseBody
	public IamportResponse<Payment> action(String imp_uid) {
		String api_key = "2980095892984951";
		String api_secret = "gf0eclquievmd5d8l90N6xZYGIUhY6vflwtyRT2a8ywlDJtZTuNZ2MXIvS0tYwIk2cTU6W4euBA8k47e";
		client = new IamportClient(api_key, api_secret);
		
		testGetToken();
		IamportResponse<Payment> paymentResponse = null;
		System.out.println("imp_uid : " + imp_uid);
		
		if(imp_uid == null) {
			imp_uid = "";
		}
		
		try {
			paymentResponse = client.paymentByImpUid(imp_uid);			//TODO : 처리 로직
	
			//TODO : 처리 로직
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage() + " at action");
			e.printStackTrace();
			System.out.println(e.getHttpStatusCode());
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO : 401 Unauthorized
				System.out.println("401 at action");

			 	break;
			case 500 :
				//TODO : 서버 응답 오류
				System.out.println("500 at action");

				break;
			}
		} catch (IOException e) {
			//서버 연결 실패
			e.printStackTrace();
	}
		return paymentResponse;
	}
}
