package com.university.chie.mapper;

import java.util.ArrayList;
import java.util.Map;

public interface ConsultMapper {
	
	public ArrayList<Map<String, String>> selectList(Map<String, String> map);

	public ArrayList<Map<String, String>> selectListP(String loginId, String isCounsel);

	public int insertConsult(Map<String, String> map);
	
	public int cancelApply(String counselseq, String reason);
	
	public Map<String, String> selectConP(Map<String, String> map);

	public Map<String, String> selectCon(Map<String, String> map);

	public ArrayList<String> getConsultTime(String preginum, String day);

	public int updateCounsult(Map<String, String> map);

	public int adminCancel(String counselseq);

	public String getKey(String counselseq);


}
