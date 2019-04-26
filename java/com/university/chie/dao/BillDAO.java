package com.university.chie.dao;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.university.chie.mapper.BillMapper;
import com.university.chie.vo.Bill;

@Repository
public class BillDAO {

	@Autowired
	SqlSession session;

	public ArrayList<Map<String,String>> selectBill(String loginId) {
		ArrayList<Map<String,String>> result = null;

		BillMapper mapper = session.getMapper(BillMapper.class);
		

		try {
			result = mapper.selectBill(loginId);
		} catch (Exception e) {
			return result; 
		}
		return result;
	}

	public Bill selectcost(String loginId) {
		Bill result = null;
		BillMapper mapper = session.getMapper(BillMapper.class);
		
		try {
			result = mapper.selectcost(loginId);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	public int Billupdate(String loginId) {
		int result = 0;
		BillMapper mapper = session.getMapper(BillMapper.class);
		
		try {
			result = mapper.Billupdate(loginId);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public ArrayList<Map<String,String>> selectscholaship(String loginId) {
		ArrayList<Map<String,String>> result = null;

		BillMapper mapper = session.getMapper(BillMapper.class);
		
		try {
			result = mapper.selectscholaship(loginId);
		} catch (Exception e) {
			return result; 
		}
		return result;
	}
}
