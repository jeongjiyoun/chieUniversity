package com.university.chie.mapper;

import java.util.ArrayList;
import java.util.Map;

import com.university.chie.vo.Professor;
import com.university.chie.vo.Student;

public interface MemberMapper {

	public Student loginStudent(Map<String, String> map);

	public Professor loginProfessor(Map<String, String> map);

	public ArrayList<String> getIdByName(String name);

	public String idFind(String email, String userName);

	public String pwFind(String sreginum, String userName);

	public int pwUpdate(String sreginum, String password);

	public Student getInfo(String resultId);

	public int pwUpdateP(String preginum, String password);

	public int UpdateMyInfoP(Map<String, String> map);

	public int UpdateMyInfoP1(Map<String, String> map);

	public ArrayList<Map<String, String>> getTotNotice(String year);

	public Map<String, String> getnewsDetail(String post);

	public ArrayList<Map<String, String>> getdayList();

}
