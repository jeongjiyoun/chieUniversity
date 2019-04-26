package com.university.chie.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.university.chie.vo.Transcript;

public interface CertificateMapper {
	
	public HashMap<String, String> selectEnroll(HashMap<String,String> sInfo);
	
	public HashMap<String,String> selectAbsence(HashMap<String,String> sInfo);
	
	public HashMap<String,String> checkStatus(String sregiNum);
	
	public HashMap<String,String> selectAlumi(HashMap<String,String> sInfo);
	
	public ArrayList<Transcript> selectTranscript(String sregiNum);
	
	public HashMap<String,String> selectSInfo(String sregiNum);
	
	
	
	
}
