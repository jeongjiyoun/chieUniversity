package com.university.chie.mapper;

import java.util.ArrayList;
import java.util.Map;

import com.university.chie.vo.Bill;


public interface BillMapper {

	public ArrayList<Map<String,String>> selectBill(String loginId) throws Exception;
	
	//총 결제금액을 조회
	public Bill selectcost(String loginId) throws Exception;
	
	//DB에 입력이 잘 된경우 지불 되었다고 갱신
	public int Billupdate(String loginId) throws Exception;
	
	//장학금 내역과 사유를 조회함
	public ArrayList<Map<String,String>> selectscholaship(String loginId) throws Exception;

}
