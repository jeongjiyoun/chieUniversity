package com.university.chie.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.university.chie.mapper.ConsultMapper;
import com.university.chie.util.Inverter;

@Repository
public class ConsultDAO {

	@Autowired
	SqlSession session;
	
	@Autowired
	Inverter in;

	//�븰�깮�씠 媛��졇�삤�뒗 �긽�떞由ъ뒪�듃
	public ArrayList<Map<String, String>> selectList(String loginId, String isCounsel){
		ConsultMapper mapper = session.getMapper(ConsultMapper.class);
		ArrayList<Map<String, String>> result = null;
		Map<String, String> map = new HashMap<String, String>();
		map.put("sreginum", loginId);
		map.put("type", isCounsel);	
		try {
			result = mapper.selectList(map);
			System.out.println(result);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//援먯닔媛� 媛��졇�삤�뒗 �긽�떞由ъ뒪�듃
	public ArrayList<Map<String, String>> selectListP(String loginId, String isCounsel){
		ConsultMapper mapper = session.getMapper(ConsultMapper.class);
		ArrayList<Map<String, String>> result = null;
		try {
			result = mapper.selectListP(loginId, isCounsel);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//�긽�떞 �벑濡�
	public boolean insertConsult(Map<String, String> consult){
		ConsultMapper mapper = session.getMapper(ConsultMapper.class);
		boolean result = false;
		try {
			result = in.invertBoolean(mapper.insertConsult(consult));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//�긽�떞 �떆媛� 媛��졇�삤湲�
	public ArrayList<String> getConsultTime(String preginum, String day) {
		ArrayList<String> result = null;
		ConsultMapper mapper = session.getMapper(ConsultMapper.class);
		try {
			result = mapper.getConsultTime(preginum, day);		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//�긽�떞 媛� �떒怨� 蹂��솕�떆
	public boolean updateCounsult(Map<String, String> map) {
		boolean result = false;
		ConsultMapper mapper = session.getMapper(ConsultMapper.class);
		System.out.println(map);
		try {
			result = in.invertBoolean(mapper.updateCounsult(map));
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//援먯닔�떂�씠 �긽�떞�떊泥� �긽�꽭蹂닿린瑜� �닃���쓣 �븣 �뜲�씠�꽣
	public Map<String, String> selectConP(Map<String, String> map){
		Map<String, String> result = null;
		ConsultMapper mapper = session.getMapper(ConsultMapper.class);
		try {
			result = mapper.selectConP(map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;		
	}
	
	public Map<String, String> selectCon(Map<String, String> map){
		Map<String, String> result = null;
		ConsultMapper mapper = session.getMapper(ConsultMapper.class);
		try {
			result = mapper.selectCon(map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;		
	}
	
	//痍⑥냼 �떊泥�
	public boolean cancelApply(String counselseq, String reason) {
		boolean result = false;
		ConsultMapper mapper = session.getMapper(ConsultMapper.class);
		try {
			result = in.invertBoolean(mapper.cancelApply(counselseq, reason));
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;		
	}

	//痍⑥냼 �듅�씤
	public boolean adminCancel(String counselseq) {
		boolean result = false;
		ConsultMapper mapper = session.getMapper(ConsultMapper.class);
		try {
			result = in.invertBoolean(mapper.adminCancel(counselseq));
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//�넻�솕�슜 �궎 媛��졇�삤湲�
	public String getKey(String counselseq) {
		String result = null;
		ConsultMapper mapper = session.getMapper(ConsultMapper.class);
		try {
			result = mapper.getKey(counselseq);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


}
