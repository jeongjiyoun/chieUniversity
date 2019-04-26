package com.university.chie.mapper;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.RowBounds;

import com.university.chie.vo.Ass_File;
import com.university.chie.vo.Assignment;
import com.university.chie.vo.Assignment_Submit;
import com.university.chie.vo.LectureNoticeFile;
import com.university.chie.vo.Lecture_Notice;
import com.university.chie.vo.QnAAnswer;
import com.university.chie.vo.QnAQuestion;

public interface SubjectMapper {
	
	//QnA Question
	//LIST OF ALL QUESTION
	public List<HashMap<String,String>> selectAllQ(String lectureNum,RowBounds rb);
	
	public int getTotalQ(String lectureNum);
	
	//INSERT NEW QUESTION
	public int insertQ (QnAQuestion question);
	//SELECT ONE QUESTION
	public HashMap<String,String> selectQ(String qSeq);
	//UPDATE CONENTS OF QUESTION
	public int updateQ(QnAQuestion question);
	//DELETE A QUESTION
	public int deleteQ(String qSeq);
	//IF THERE IS AN ANSWER FOR QUESTION, COUNT INCREASE
	public int updateCount(String qSeq);
	//IF THE ANSWER OF THE QUESRION IS DELETED, THE COUNT DECREASE
	public int decCount(String qSeq);
	
	//QnA Answer
	
	public int insertA (QnAAnswer answer);
	public QnAAnswer selectA(String aSeq);
	public int deleteA(String qSeq);
	public int updateA(QnAAnswer answer);
	public String selectACon(String aSeq);
	
	//Assignment
	
	public int insertAssign(Assignment assign);
	public List<Assignment> selectAssignAll(String lectureNum);
	public Assignment selectAssign(String assSeq);
	public int updateAssign(Assignment assign);
	public int deleteAssign(String assSeq);
	
	
	//Assigment_Sub
	
	public int getTotalAssignSP(HashMap<String,String> assignSP);
	
	public List<HashMap<String,String>> selectAllAssignSP(HashMap<String,String> a, RowBounds rb);
	public HashMap<String,String> selectAssignSP(String aSubSeq);
	
	public int insertAssignS(Assignment_Submit assignSub);
	public int insertAssFile(Ass_File afile);
	public Assignment_Submit selectAssignS(Assignment_Submit assignSub);
	public Assignment_Submit selectAssignSA(String aSubSeq);
	public int updateAssignS(Assignment_Submit assign);
	
	public List<Ass_File> selectAssFileAll(HashMap<String,String> asFile);
	public Ass_File selectAssFile(String fileASeq);
	public int deleteAssFile(String aSubSeq);
	public int deleteAssignS(String aSubSeq);
	public int deleteAssFileF(String fileASeq);
	
	//Subject Notice
	
	public int insertNotice(Lecture_Notice notice);
	public int insertNoticeFile(LectureNoticeFile nFile);
	
	public List<Lecture_Notice> selectAllNoticeL(HashMap<String,String> noti,RowBounds rb);
	public Lecture_Notice selectNoticeL(String lnSeq);
	public List<LectureNoticeFile> selectNoticeFileL(String lnSeq);
	public LectureNoticeFile selectNoticeFileF(String fileSeq);
	
	public int getTotalNotice(HashMap<String,String> total);
	
	public int updateNoticeL(Lecture_Notice notice);
	
	public int deleteNoticeL(String lnSeq);
	public int deleteNoticeFileL(String lnSeq);
	
	public int deleteNoticeFileF(String fileSeq);

}
