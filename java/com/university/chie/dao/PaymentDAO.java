package com.university.chie.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.university.chie.mapper.PaymentMapper;
import com.university.chie.vo.Payment;

@Repository
public class PaymentDAO {
	
	@Autowired
	SqlSession session;
		
	public int insertPayment(Payment payment) {
		int result = 0;
		PaymentMapper mapper = session.getMapper(PaymentMapper.class);
		try {
			result = mapper.insertPayment(payment);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
}
