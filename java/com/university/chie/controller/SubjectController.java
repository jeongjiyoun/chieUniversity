package com.university.chie.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.university.chie.dao.SubjectDAO;
import com.university.chie.util.HandlerFile;
import com.university.chie.util.PageNavigator;
import com.university.chie.vo.Ass_File;
import com.university.chie.vo.Assignment;
import com.university.chie.vo.Assignment_Submit;
import com.university.chie.vo.LectureNoticeFile;
import com.university.chie.vo.Lecture_Notice;
import com.university.chie.vo.QnAAnswer;
import com.university.chie.vo.QnAQuestion;

@Controller
public class SubjectController {
	private static final Logger logger = LoggerFactory.getLogger(SubjectController.class);
	final int countPerPage = 3;
	final int pagePerGroup = 3;
	
	@Autowired
	SubjectDAO dao;

	@RequestMapping(value="/subjectHome",method=RequestMethod.GET)
	public String subjectHome() {
		return "subject/subjectHome";
	}

	@RequestMapping(value="/QnA", method=RequestMethod.GET)
	public String QnA(
			@RequestParam(value="page", defaultValue="1") int page,
			Model model, HttpSession session) {
		
		//���߿� session����  lectureNum������
		String lectureNum = (String)session.getAttribute("lectureNum");
		System.out.println(lectureNum);
		logger.debug("page: {}", page);
		
		int total = dao.getTotalQ(lectureNum);
		
		//������ ����� ���� ��ü ����
				PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		List<HashMap<String,String>> qList = dao.selectAllQ(lectureNum,navi.getStartRecord(),navi.getCountPerPage());
		System.out.println(qList);
		model.addAttribute("qList",qList);
		model.addAttribute("navi", navi);
		return "subject/QnA";
	}
	

	//Assignment
	@RequestMapping(value="/assignment", method=RequestMethod.GET)
	public String assignment(Model model,HttpSession session) {
		//���߿� session���� �� �޾Ƽ� lectureNum�ֱ�
		String lectureNum = (String)session.getAttribute("lectureNum");
		List<Assignment> assignList = dao.selectAssignAll(lectureNum);
		model.addAttribute("assignList",assignList);
		return "subject/assignMain";
	}
	
	
	//NOTICE
	@RequestMapping(value="/subjectNotice",method=RequestMethod.GET)
	public String subjectNotice(
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="search", defaultValue="") String search,
			Model model,HttpSession session) {
		logger.debug("page: {}, search: {}", page, search);
		//���߿� session���� �� �޾Ƽ� lectureNum�ֱ�
				String lectureNum=(String) session.getAttribute("lectureNum");
				System.out.println("번호:"+lectureNum);
		HashMap<String, String> t = new HashMap<>();
		t.put("lectureNum", lectureNum);
		t.put("search",search);
		int total = dao.getTotalNotice(t);
		System.out.println(total);
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		HashMap<String,String> noti = new HashMap<>();
		noti.put("lectureNum", lectureNum);
		noti.put("search",search);
		List<Lecture_Notice> nList = dao.selectAllNoticeL(noti, navi.getStartRecord(), navi.getCountPerPage());
		System.out.println(nList);
		model.addAttribute("nList",nList);
		model.addAttribute("navi",navi);
		model.addAttribute("search",search);
		return "subject/subjectNotice";
	}

	//QnA question

	@RequestMapping(value="/writeQ", method=RequestMethod.GET)
	public String writeQ() {
		return"subject/writeQ";
	}
	
	@RequestMapping(value="/submitQ", method=RequestMethod.POST)
	public String submitQ(QnAQuestion question,RedirectAttributes reatt,HttpSession session) {
		question.setSregiNum((String)session.getAttribute("loginId"));
		if(dao.insertQ(question)==0) {
			return "redirect:/QnA";
		}
		
		String qSeq = question.getqSeq();
		reatt.addAttribute("qSeq",qSeq);
		return "redirect:/showQ";
	}
	
	
	
	
	@RequestMapping(value="/showQ",method=RequestMethod.GET)
	public String showQ(HttpServletRequest request,String qSeq, Model model) {
		if(qSeq==null) {
			qSeq = request.getParameter("qSeq");
		}
		HashMap<String,String> question = dao.selectQ(qSeq);
		QnAAnswer answer =dao.selectA(qSeq);
		if(question==null) {
			return "redirect:/QnA";
		}
		model.addAttribute("question",question);
		model.addAttribute("answer",answer);
		return "subject/showQnA";
	}
	
	@RequestMapping(value="/updateQ", method=RequestMethod.POST)
	public String updateQ(String qSeq, Model model) {
		HashMap<String,String> question = dao.selectQ(qSeq);
		model.addAttribute("question", question);
		
		
		return "subject/writeQ";
	}
	
	@RequestMapping(value="/reWriteQ", method=RequestMethod.POST)
	public String reWriteQ(QnAQuestion question,RedirectAttributes reatt) {
		
		if(dao.updateQ(question)==0) {
			return "redirect:/goQnA";
		}
		
		reatt.addAttribute("qSeq",question.getqSeq());
		
		return "redirect:/showQ";
	}
	
	@RequestMapping(value="/delectQ", method=RequestMethod.POST)
	public String delectQ(String qSeq) {
		dao.deleteQ(qSeq);
		
		return "redirect:/QnA";
	}
	
	//QnA Answer
	@RequestMapping(value="/writeA", method=RequestMethod.GET)
	public String writeA(Model model, String qSeq) {
		model.addAttribute("qSeq", qSeq);
		return"subject/writeQ";
	}
		
	@RequestMapping(value="/submitA", method=RequestMethod.POST)
	public String submitA(QnAAnswer answer, RedirectAttributes reatt, String qSeq, HttpSession session) {
		String pregiNum = (String)session.getAttribute("loginId");
											//���߿� �����������
		answer.setPregiNum(pregiNum);
		answer.setqSeq(qSeq);
		try {
			System.out.println(answer);
			dao.insertA(answer);
			dao.updateCount(qSeq);
			reatt.addAttribute("qSeq",qSeq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return"redirect:/showQ";
	}
	
	
	
	@RequestMapping(value="/deleteA", method=RequestMethod.POST)
	public String deleteA(String aSeq) {
		
		String qSeq = dao.selectACon(aSeq);
		dao.deleteA(aSeq);
		dao.decCount(qSeq);
		

		return "redirect:/QnA";

	}
	
	@RequestMapping(value="/reWriteA", method=RequestMethod.POST)
	public String reWriteA(QnAAnswer answer, RedirectAttributes reatt) {
		
		if(dao.updateA(answer)==0) {
			return "redirect:/QnA";
		}
		
		reatt.addAttribute("aSeq",answer.getaSeq());
		
		return "redirect:/showQ";
	}
	
	//Assignment<USER-������>
	//���� �Խñ� �ۼ������� �̵�
	@RequestMapping(value="/writeAssign", method=RequestMethod.GET)
	public String writeAssign() {
		return "subject/assignWrite";
	}
	//�����Խñ� submit
	@RequestMapping(value="/submitAssign", method=RequestMethod.POST)
	public String submitAssign(RedirectAttributes reatt, Assignment assign,HttpSession session) {
		assign.setLectureNum((String) session.getAttribute("lectureNum"));
		dao.insertAssign(assign);
		reatt.addAttribute("assSeq",assign.getAssSeq());
		return "redirect:/showAssign";
	}
	//�����Խñ� ����
	@RequestMapping(value="/showAssign", method=RequestMethod.GET)
	public String showAssign(HttpServletRequest request, String assSeq, Model model,HttpSession session) {
		if(assSeq==null) {
			assSeq = request.getParameter("assSeq");
		}
		Assignment assign = dao.selectAssign(assSeq);
		if(assign==null) {
			return "redirect:/assignment";
		}
		model.addAttribute("assign",assign);
		System.out.println(assSeq);
		//�л��� ���ε��� ���� �÷��ð�
		
		Assignment_Submit assignStu = new Assignment_Submit();
		//���߿� ���ǿ��� �й� ��������
		assignStu.setSregiNum((String)session.getAttribute("loginId"));
		assignStu.setAssSeq(assSeq);
		assignStu = dao.selectAssignS(assignStu);
		model.addAttribute("assignStu", assignStu);
		if(assignStu!=null) {
			
			HashMap<String,String> findA = new HashMap<>();
			findA.put("aSubSeq",assignStu.getaSubSeq());
			findA.put("sregiNum",(String)session.getAttribute("loginId"));
			List<Ass_File> afList = dao.selectAssFileAll(findA);
			model.addAttribute("afList",afList);
			System.out.println(afList.toString());
		}
		
		
		return "subject/assignShow";
	}
	//���� ���������� �̵�
	@RequestMapping(value="/updateAssign",method=RequestMethod.POST)
	public String updateAssign(String assSeq, Model model) {
		Assignment assign = dao.selectAssign(assSeq);
		model.addAttribute("assign",assign);
		return "subject/assignWrite";
	}
	//���� �Խñ� ����
	@RequestMapping(value="/rewriteAssign",method=RequestMethod.POST)
	public String rewriteAssign(Assignment assign, RedirectAttributes reatt) {
		
		if(dao.updateAssign(assign)==0) {
			return "redirect:/assignment";
		}
		
		reatt.addAttribute("assSeq",assign.getAssSeq());
		
		return "redirect:/showAssign";
	}
	//���� �Խñ� ����
	@RequestMapping(value="/deleteAssign",method=RequestMethod.POST)
	public String deleteAssign(String assSeq) {
		dao.deleteAssign(assSeq);
		return "redirect:/assignment";
	}
	
	//Assignment Student(USER-P)
	//�л����� �ø� ������ �Խ���
	@RequestMapping(value="/ShowAllAssignP", method=RequestMethod.GET)
	public String ShowAllAssignP(
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="search", defaultValue="") String search,
			String assSeq,Model model) {
		System.out.println(page);
		HashMap<String, String> t = new HashMap<>();
		t.put("assSeq", assSeq);
		t.put("search", search);
		System.out.println(t);
		int total = dao.getTotalAssignSP(t);
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		List<HashMap<String,String>> spList = dao.selectAllAssignSP(t,navi.getStartRecord(), navi.getCountPerPage());
		System.out.println(spList);
		model.addAttribute("spList",spList);
		model.addAttribute("navi",navi);
		model.addAttribute("assSeq",assSeq);
		return "subject/assignList";
	}
	
	//CHECK IS NEEDED
	@RequestMapping(value="/showAssignSP", method=RequestMethod.GET)
	public String showAssignSP(String aSubSeq,Model model) {
		HashMap<String,String> assign = dao.selectAssignSP(aSubSeq);
		String sregiNum = assign.get("SREGINUM");
		System.out.println(sregiNum);
		HashMap<String,String> findA = new HashMap<>();
		findA.put("aSubSeq",aSubSeq);
		findA.put("sregiNum",sregiNum);
		List<Ass_File> aList = dao.selectAssFileAll(findA);
		model.addAttribute("assign",assign);
		model.addAttribute("aList",aList);
		return "subject/assignShowSP";
	}
	//Assignment Student(USER-STUDENT)
	
	//������ �ۼ������� �̵�
	@RequestMapping(value="/writeAssignS", method=RequestMethod.POST)
	public String writeAssignS(String assSeq, Model model) {
		model.addAttribute("assSeq",assSeq);
		return "subject/assignWriteS";
	}
	
	//�������� ��  �Խù� ���ε�
	@RequestMapping(value="/assFileUpload", method=RequestMethod.POST)
	public @ResponseBody Boolean assFileUpload(HttpSession session,MultipartHttpServletRequest multipartRequest, Ass_File fd,Assignment_Submit info) {
		String sregiNum = (String)session.getAttribute("loginId");
		info.setAssSeq(multipartRequest.getParameter("assSeq"));
		info.setSregiNum(sregiNum);
		info.setTitle(multipartRequest.getParameter("title"));
		
		info.setContents(multipartRequest.getParameter("contents"));
		
		System.out.println(info.toString());
		
		if(dao.insertAssignS(info)==0) {
			return false;
		}
		String aSubSeq = info.getaSubSeq();
		
		String filePath = "C:/test";
		ArrayList<HashMap<String, String>> fileNames = new HandlerFile(multipartRequest, filePath).getUploadFileName();
		System.out.println(fileNames);
		
		fd.setaSubSeq(aSubSeq);
		fd.setSregiNum(sregiNum);
		
		//Iterator it = fileNames.iterator();
		
		for (HashMap<String, String> map : fileNames) {
			String org_Name = map.get("org_Name");
			System.out.println(org_Name);
			String name = map.get("name");
			System.out.println(name);
			
			fd.setOrg_Name(org_Name);
			fd.setName(name);
			
			if(dao.insertAssFile(fd)==0) {
				return false;
			}
		}
	
		return true;
	}
	
	//�������� �ٿ�ε�
	@RequestMapping(value="/downloadSFile", method= RequestMethod.GET)
	public @ResponseBody byte[] downloadSFile(String fileASeq,HttpServletResponse resp) {
		Ass_File downA = dao.selectAssFile(fileASeq);
		String org_Name = downA.getOrg_Name();
		String name = downA.getName();
		String filePath = "C:/test"; 
		
		return new HandlerFile(resp, filePath, name, org_Name).getDownloadFileByte();
	}
	
	//������ ���������� �̵�
	@RequestMapping(value="/updateAssignS", method=RequestMethod.POST)
	public String updateAssignS(String aSubSeq,Model model,HttpSession session) {
		String sregiNum = (String)session.getAttribute("loginId");
		Assignment_Submit assignS = dao.selectAssignSA(aSubSeq);
		HashMap<String,String> findA = new HashMap<>();
		findA.put("aSubSeq",aSubSeq);
		findA.put("sregiNum",sregiNum);
		List<Ass_File> aList = dao.selectAssFileAll(findA);
		model.addAttribute("assignS",assignS);
		model.addAttribute("aList",aList);
		return "subject/assignRewriteS";
	}
	
	//������ ����
	@RequestMapping(value="/updateAssignSUpload",method=RequestMethod.POST)
	public @ResponseBody String updateAssignSUpload(HttpSession session,MultipartHttpServletRequest multipartRequest,Assignment_Submit assign,Ass_File aFile) {
		String result = null;
		String sregiNum = (String)session.getAttribute("loginId");
		assign.setContents(multipartRequest.getParameter("contents"));
		assign.setAssSeq(multipartRequest.getParameter("assSeq"));
		assign.setaSubSeq(multipartRequest.getParameter("aSubSeq"));
		assign.setSregiNum(sregiNum);
		if(dao.updateAssignS(assign)==0) {
			return null;
		}
		String aSubSeq = assign.getaSubSeq();
		
		String filePath = "C:/test";
		ArrayList<HashMap<String, String>> fileNames = new HandlerFile(multipartRequest, filePath).getUploadFileName();
		System.out.println(fileNames);
		
		aFile.setaSubSeq(aSubSeq);
		aFile.setSregiNum(sregiNum);
		
		//Iterator it = fileNames.iterator();
		
		for (HashMap<String, String> map : fileNames) {
			String org_Name = map.get("org_Name");
			System.out.println(org_Name);
			String name = map.get("name");
			System.out.println(name);
			
			aFile.setOrg_Name(org_Name);
			aFile.setName(name);
			
			if(dao.insertAssFile(aFile)==0) {
				return null;
			}
		}
		
		result = aFile.getaSubSeq();
		return result;
	}
	
	//����-÷������ ��������
	@RequestMapping(value="/delAssignSF", method=RequestMethod.POST)
	public @ResponseBody boolean delAssignSF(String fileASeq,HttpServletResponse resp) {
		boolean result = false;
		Ass_File a = dao.selectAssFile(fileASeq);
		System.out.println(a.toString());
		if(a!=null) {
			String filePath = "C:/test";
			String name = a.getName();
			new HandlerFile(filePath, name).deleteFileExecute();
			
			if(dao.deleteAssFileF(fileASeq)==1) {
				result=true;
			}
		}
		return result;
	}
	
	//������ü ����
	@RequestMapping(value="/deleteAssignS", method=RequestMethod.POST)
	public String deleteAssignS(String aSubSeq,HttpSession session,RedirectAttributes reatt) {
		String sregiNum = (String)session.getAttribute("loginId");
		HashMap<String,String> findA = new HashMap<>();
		findA.put("aSubSeq",aSubSeq);
		findA.put("sregiNum",sregiNum);
		List<Ass_File> aList = dao.selectAssFileAll(findA);
		if(aList!=null) {
			String filePath = "C:/test";
			for(Ass_File a :aList) {
				String name= a.getName();
				new HandlerFile(filePath, name).deleteFileExecute();
			}
			dao.deleteAssFile(aSubSeq);
		}
		Assignment_Submit assignSub = dao.selectAssignSA(aSubSeq);
		dao.deleteAssignS(aSubSeq);
		reatt.addAttribute("assSeq",assignSub.getAssSeq());
		return "redirect:/showAssign";
	}
	
	//SUBJECT NOTICE
	//���û��� �Խù� ����
	@RequestMapping(value="/showNotice",method=RequestMethod.GET)
	public String showNotice(String lnSeq,Model model,HttpServletRequest request) {
		
		Lecture_Notice notice = dao.selectNoticeL(lnSeq);
		if(notice==null) {
			return "redirect:/subjectNotice";
		}
		List<LectureNoticeFile> nFile = dao.selectNoticeFileL(lnSeq);
		
		model.addAttribute("notice",notice);
		model.addAttribute("nFileList",nFile);
		return "subject/noticeShow";
	}
	//���û��� �Խù��� ÷�� �Ǿ��ִ� ���� �ٿ�ε�
	@RequestMapping(value="/downloadNFileL", method= RequestMethod.GET)
	public @ResponseBody byte[] downloadNFileL(String fileSeq,HttpServletResponse resp) {
		LectureNoticeFile download = dao.selectNoticeFileF(fileSeq);
		String org_Name = download.getOrg_Name();
		String name = download.getName();
		String filePath = "C:/test"; 
		
		return new HandlerFile(resp, filePath, name, org_Name).getDownloadFileByte();
	}
	
	//�������� ���� ������ �̵�
	@RequestMapping(value="/writeNotice",method=RequestMethod.GET)
	public String writeNotice() {
		return "subject/noticeWrite";
	}
	
	//�������� �� ÷������ ���ε�
	@RequestMapping(value="/noticeUpload", method=RequestMethod.POST)
	public @ResponseBody String noticeUpload(HttpSession session,MultipartHttpServletRequest multipartRequest, Lecture_Notice notice,LectureNoticeFile nFile) {
		String pregiNum =(String)session.getAttribute("loginId");
		String result = null;
		notice.setContents(multipartRequest.getParameter("contents"));
		notice.setTitle(multipartRequest.getParameter("title"));
		notice.setPregiNum(pregiNum);
		notice.setLectureNum((String)session.getAttribute("lectureNum"));
		
		if(dao.insertNotice(notice)==0) {
			return null;
		}
		String lnSeq = notice.getLnSeq();
		
		String filePath = "C:/test";
		ArrayList<HashMap<String, String>> fileNames = new HandlerFile(multipartRequest, filePath).getUploadFileName();
		System.out.println(fileNames);
		
		nFile.setLnSeq(lnSeq);
		nFile.setPregiNum(pregiNum);
		
		//Iterator it = fileNames.iterator();
		
		for (HashMap<String, String> map : fileNames) {
			String org_Name = map.get("org_Name");
			System.out.println(org_Name);
			String name = map.get("name");
			System.out.println(name);
			
			nFile.setOrg_Name(org_Name);
			nFile.setName(name);
			if(dao.insertNoticeFile(nFile)==0) {
				return null;
			}
		}
		
		
		result = nFile.getLnSeq();
		System.out.println(result);
		return result;
	}
	//�������� ���� ������ �̵�
	@RequestMapping(value="/updateNotice",method=RequestMethod.POST)
	public String updateNotice(String lnSeq,Model model) {
		Lecture_Notice notice = dao.selectNoticeL(lnSeq);
		List<LectureNoticeFile> nList = dao.selectNoticeFileL(lnSeq);
		model.addAttribute("notice",notice);
		model.addAttribute("nList",nList);
		return "subject/noticeRewrite";
	}
	//�������� ����
	@RequestMapping(value="/updateNoticeUpload", method=RequestMethod.POST)
	public @ResponseBody String updateNoticeUpload(HttpSession session,MultipartHttpServletRequest multipartRequest, Lecture_Notice notice,LectureNoticeFile nFile) {
		String pregiNum =(String) session.getAttribute("loginId");
		String result = null;
		notice.setContents(multipartRequest.getParameter("contents"));
		notice.setLnSeq(multipartRequest.getParameter("lnSeq"));
		notice.setPregiNum(pregiNum);
		notice.setLectureNum((String)session.getAttribute("lectureNum"));
		
		if(dao.updateNoticeL(notice)==0) {
			return null;
		}
		String lnSeq = notice.getLnSeq();
		
		String filePath = "C:/test";
		ArrayList<HashMap<String, String>> fileNames = new HandlerFile(multipartRequest, filePath).getUploadFileName();
		System.out.println(fileNames);
		
		nFile.setLnSeq(lnSeq);
		nFile.setPregiNum(pregiNum);
		
		//Iterator it = fileNames.iterator();
		
		for (HashMap<String, String> map : fileNames) {
			String org_Name = map.get("org_Name");
			System.out.println(org_Name);
			String name = map.get("name");
			System.out.println(name);
			
			nFile.setOrg_Name(org_Name);
			nFile.setName(name);
			if(dao.insertNoticeFile(nFile)==0) {
				return null;
			}
		}
	
		result = nFile.getLnSeq();
		
		return result;
	}
	//�������׿� ÷�ε� ���� ��������
	@RequestMapping(value="/delNoticeF", method=RequestMethod.POST)
	public @ResponseBody boolean delNoticeF(String fileSeq) {
		boolean result = false;
		System.out.println(fileSeq);
		LectureNoticeFile l = dao.selectNoticeFileF(fileSeq);
		if(l!=null) {
			String filePath = "C:/test";
			String name = l.getName();
			new HandlerFile(filePath, name).deleteFileExecute();
			
			if(dao.deleteNoticeFileF(fileSeq)!=0) {
				result = true;
			}
			
		}
		
		
		return result;
	}
	//�������� �Խù� ����
	@RequestMapping(value="/deleteNotice",method=RequestMethod.POST)
	public String deleteNotice(String lnSeq,RedirectAttributes reatt) {
		List<LectureNoticeFile> lFile = dao.selectNoticeFileL(lnSeq);
		if(lFile!=null) {
			String filePath = "C:/test";
			for (LectureNoticeFile l : lFile) {
				String name = l.getName();
				new HandlerFile(filePath, name).deleteFileExecute();
			}
			dao.deleteNoticeFileL(lnSeq);
		}
		if(dao.deleteNoticeL(lnSeq)==0) {
			reatt.addAttribute("lnSeq",lnSeq);
			return "redirect:/showNotice";
		}
		
		return "redirect:/subjectNotice";
	}
}
