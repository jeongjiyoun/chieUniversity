package com.university.chie.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.university.chie.dao.SchoolInfoDAO;
import com.university.chie.util.FileService;
import com.university.chie.vo.Applicant;
import com.university.chie.vo.Major;

@Controller
public class SchoolInfoController {
	
	//private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	SchoolInfoDAO sDao;
	
	@RequestMapping(value="/major",method=RequestMethod.GET)
	public String major(String majorSeq, Model model) {
		Major major = new Major();
		try {
			major = sDao.selectMajor(majorSeq);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		model.addAttribute("Major", major);
		return "main/majorIntro";
	}
	
	@RequestMapping(value="/professorIntro",method=RequestMethod.GET)
	public String professorIntro(String majorSeq, String majorName, Model model) {
		ArrayList<Map<String, String>> mpList = new ArrayList<>();
		try {
			mpList = sDao.selectMajorProfessor(majorSeq);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		Map<String, String> major = new HashMap<>();
		major.put("majorSeq", majorSeq);
		major.put("majorName", majorName);
		model.addAttribute("Major", major);
		model.addAttribute("mpList", mpList);
		return "main/professorIntro";
	}
	
	@RequestMapping(value="/curriculum",method=RequestMethod.GET)
	public String curriculum(String majorSeq, String majorName, Model model) {
		ArrayList<Map<String, String>> mcList = new ArrayList<>();
		try {
			mcList =sDao.selectMajorCurriculum(majorSeq);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		Map<String, String> major = new HashMap<>();
		major.put("majorSeq", majorSeq);
		major.put("majorName", majorName);
		model.addAttribute("Major", major);
		model.addAttribute("mcList", mcList);
		return "main/curriculum";
	}
	
	@RequestMapping(value="/applicantCheck",method=RequestMethod.GET)
	public String applicantCheck() {
		return "main/applicantCheck";
	}

	//처음 입학원서를 쓰는 경우
	@RequestMapping(value="/writeApplicant",method=RequestMethod.GET)
	public String writeApplicant() {
		return "main/writeApplicant";
	}
	
	//file Road
	@RequestMapping(value="/upLoadPictureApply",method=RequestMethod.POST)
	public @ResponseBody String upLoadPictureApply(MultipartFile pic_name) {
		//간단하게 그림 파일 올려서 링크 되돌려받기.
		String savedfile = "";
		String filePath = "D:\\FTP\\Face\\origin\\applicant";
		
		if (!pic_name.isEmpty()) {
			savedfile = FileService.saveFile(pic_name, filePath);
		}
		
		String name = "http://172.30.1.34/FTP/Face/origin/applicant/" + savedfile;
	    return name;
}

	//임시저장된 입학원서를 불러오는 경우
	@RequestMapping(value="/checkA",method=RequestMethod.GET)
	public String checkA(String phoneNum, String password, Model model) {
		Applicant result = null;
		Map<String, String> check = new HashMap<>();
		check.put("phoneNum", phoneNum);
		check.put("password", password);
		try {
			result = sDao.checkA(check);
			model.addAttribute("Applicant", result);
			
			System.out.println("임시저장사람 : "+result);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		model.addAttribute("Applicant", result);
		if (result==null) {
			return "main/checkApplicantPW";
			
		} 
		return "main/writeApplicant";
	}
	
	@RequestMapping(value="/goCheckMajor",method=RequestMethod.GET)
	public String goCheckMajor() {
		return "main/checkMajor";
	}
	
	@RequestMapping(value="/checkApplicantPW",method=RequestMethod.GET)
	public String checkApplicantPW() {
		return "main/checkApplicantPW";
	}

	//major 리스트 뽑아오기 
	@RequestMapping(value="/majorList",method=RequestMethod.POST)
	public @ResponseBody ArrayList<Major> majorList(String categories) {
		ArrayList<Major> mList = new ArrayList<>();
		try {
			mList = sDao.majorList(categories);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return mList;
}
	
	//전공찾기
	@RequestMapping(value="/checkMajor" ,produces = "application/text; charset=utf8" ,method=RequestMethod.POST)
	public @ResponseBody String checkMajor(String majorSeq, Model model, HttpSession session) {
		String result = null;
		
		session.setAttribute("majorSeq", majorSeq);
		try {
			result = sDao.checkMajor(majorSeq);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	

	//insert하는 임시저장
	@RequestMapping(value="/temSubmit",method=RequestMethod.POST)
	public String temSubmit(String address, String birthday, String email, String majorSeq, String name,
			String password, String phoneNum, String picName, String procedding, MultipartFile requirement_file) {
		int result = 0;
		Applicant ap = new Applicant();
		ap.setAddress(address);
		ap.setBirthday(birthday);
		ap.setEmail(email);
		ap.setMajorSeq(majorSeq);
		ap.setPic_name(picName);
		ap.setName(name);
		ap.setPassword(password);
		ap.setPhoneNum(phoneNum);
		ap.setProcedding(procedding);
		
		//requirement_file Save
		String savedfile = "";
		String filePath = "D:\\FTP\\file\\applicant";
		
		if (!requirement_file.isEmpty()) {
			savedfile = FileService.saveFile(requirement_file, filePath);
		}
		
		String requirement_file1= "http://10.10.16.70/FTP/file/applicant/" + savedfile;

		ap.setRequirement_file(requirement_file1);
		System.out.println(ap);

		try {
			result = sDao.temSubmit(ap);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if (result ==0) {
			return "main/writeApplicant";
		} 
		return "main/main/home";	
	}
	//update하는 임시저장
		@RequestMapping(value="/temSubmit2",method=RequestMethod.POST)
		public String temSubmit2(String address, String birthday, String email, String majorSeq, String name,
				String password, String phoneNum, String picName, String procedding, MultipartFile requirement_file) {
			int result = 0;
			Applicant ap = new Applicant();
			ap.setAddress(address);
			ap.setBirthday(birthday);
			ap.setEmail(email);
			ap.setMajorSeq(majorSeq);
			ap.setPic_name(picName);
			ap.setName(name);
			ap.setPassword(password);
			ap.setPhoneNum(phoneNum);
			ap.setProcedding(procedding);

			//requirement_file Save
			String savedfile = "";
			String filePath = "D:\\FTP\\file\\applicant";
			
			if (!requirement_file.isEmpty()) {
				savedfile = FileService.saveFile(requirement_file, filePath);
			}
			
			String requirement_file1= "http://10.10.16.70/FTP/file/applicant/" + savedfile;

			ap.setRequirement_file(requirement_file1);
			
			try {
				result = sDao.temSubmit2(ap);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			if (result ==0) {
				return "main/writeApplicant";
			} 
			return "main/main/home";	
		}
		
		//최종제출		
		@RequestMapping(value="/fSubmit",method=RequestMethod.POST)
		public String fSubmit(String address, String birthday, String email, String majorSeq, String name,
				String password, String phoneNum, String picName, String procedding, MultipartFile requirement_file) {
			int result = 0;
			Applicant ap = new Applicant();
			ap.setAddress(address);
			ap.setBirthday(birthday);
			ap.setEmail(email);
			ap.setMajorSeq(majorSeq);
			ap.setPic_name(picName);
			ap.setName(name);
			ap.setPassword(password);
			ap.setPhoneNum(phoneNum);
			ap.setProcedding(procedding);

			//requirement_file Save
			String savedfile = "";
			String filePath = "D:\\FTP\\file\\applicant";
			
			if (!requirement_file.isEmpty()) {
				savedfile = FileService.saveFile(requirement_file, filePath);
			}
			
			String requirement_file1= "http://10.10.16.70/FTP/file/applicant/" + savedfile;

			ap.setRequirement_file(requirement_file1);
			
			try {
				result = sDao.fSubmit(ap);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			if (result ==0) {
				return "main/writeApplicant";
			} 
			return "main/main/home";	
		}
}
